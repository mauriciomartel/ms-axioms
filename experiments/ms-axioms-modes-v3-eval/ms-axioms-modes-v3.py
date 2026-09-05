#! /usr/bin/env python

import custom_parser
import project

REPO = project.get_repo_base()
BENCHMARKS_DIR = REPO / "misc" / "tests" / "benchmarks" / "ms-axioms-suite"

ENV = project.LocalEnvironment(processes=16) 

# All 33 domains in ms-axioms-suite, flat (no subfolder prefix needed).
SUITE = [
    # Axioms in operator preconditions
    "grid-axioms",
    "miconic-axioms",
    "blocker",
    "blocks-axioms",
    "sokoban-axioms",
    "ghosh-etal-JAR-acc-cc2",
    "social-planning",
    "tpsa-horndl",
    # Axioms in goals only 
    "philosophers",
    "optical-telegraphs",
    # Compiled axioms
    "airport-adl",
    "appn-adl",
    "openstacks",
    "openstacks-opt08-adl",
    "openstacks-sat08-adl",
    "trucks",
    # Axioms + conditional effects
    "cats-horndl",
    "collab-and-comm",
    "elevator-horndl",
    "ged1-ds2nd",
    "psr-large",
    "psr-middle",
    "robot-horndl",
    "robotConj-horndl",
    "taskassign-horndl",
    "word-rooms",
    # Axioms + conditional effects
    "muddy-child",
    "muddy-children",
    "sum",
    # Axioms + conditional effects (compiled)
    "miconic-fulladl",
    # Standard regression (no axioms)
    "gripper",
    "miconic",
    "miconic-simpleadl",
]

# Stateless DFP base shared by all M&S configs.
_DFP_BASE = (
    "merge_strategy=merge_stateless("
    "merge_selector=score_based_filtering(scoring_functions=["
    "goal_relevance(),dfp(),total_order("
    "atomic_ts_order=reverse_level,"
    "product_ts_order=new_to_old,"
    "atomic_before_product=false)])),"
    "shrink_strategy=shrink_bisimulation(greedy=false),"
    "label_reduction=exact(before_shrinking=true,before_merging=false),"
    "max_states=50000,threshold_before_merge=1"
)


def _ms(axiom_factor_mode: int) -> list[str]:
    return [
        "--search",
        f"astar(merge_and_shrink({_DFP_BASE},axiom_factor_mode={axiom_factor_mode}))",
    ]


CONFIGS = [
    # Reference: no heuristic information from axioms or M&S.
    ("blind", ["--search", "astar(blind())"]),
    # Mode 0: no axiom factors at all (closest to standard non-axiom M&S).
    ("dfp-none", _ms(0)),
    # Mode 1: goal-derived axiom factors only, no BFS work-estimate cap.
    ("dfp-only-goal", _ms(1)),
    # Mode 2: goal-derived axiom factors only, with BFS work-estimate cap.
    ("dfp-only-goal-capped", _ms(2)),
    # Mode 3: all derived variables (goal + precondition/effect-condition),
    #         with BFS work-estimate cap. Current default behaviour.
    ("dfp-all-capped", _ms(3)),
]

BUILD_OPTIONS = []
DRIVER_OPTIONS = [
    "--validate",
    "--overall-time-limit", "5m",
    "--overall-memory-limit", "8G",
]

REV_NICKS = [
    ("HEAD", ""),
]

ATTRIBUTES = [
    "error",
    "coverage",
    "cost",
    "initial_h_value",
    "expansions",
    "expansions_until_last_jump",
    "search_start_time",
    "search_start_memory",
    "search_time",
    "total_time",
    "memory",
    project.EVALUATIONS_PER_TIME,
]


exp = project.FastDownwardExperiment(environment=ENV)
for config_nick, config in CONFIGS:
    for rev, rev_nick in REV_NICKS:
        algo_name = f"{rev_nick}:{config_nick}" if rev_nick else config_nick
        exp.add_algorithm(
            algo_name,
            REPO,
            rev,
            config,
            build_options=BUILD_OPTIONS,
            driver_options=DRIVER_OPTIONS,
        )

exp.add_suite(BENCHMARKS_DIR, SUITE)

exp.add_parser(exp.EXITCODE_PARSER)
exp.add_parser(exp.TRANSLATOR_PARSER)
exp.add_parser(exp.SINGLE_SEARCH_PARSER)
exp.add_parser(custom_parser.get_parser())
exp.add_parser(exp.PLANNER_PARSER)

exp.add_step("build", exp.build)
exp.add_step("start", exp.start_runs)
exp.add_step("parse", exp.parse)
exp.add_fetcher(name="fetch")

project.add_absolute_report(
    exp,
    attributes=ATTRIBUTES,
    filter=[project.add_evaluations_per_time],
)

exp.run_steps()