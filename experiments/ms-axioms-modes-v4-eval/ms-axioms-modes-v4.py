#! /usr/bin/env python

import custom_parser
import project

REPO = project.get_repo_base()
BENCHMARKS_DIR = REPO / "misc" / "tests" / "benchmarks" / "ms-axioms-suite"

ENV = project.LocalEnvironment(processes=16)

SUITE = [
    "grid-axioms",
    "baba-is-axioms",
    "blocker",
    "blocks-axioms",
    "sokoban-axioms",
    "ghosh-etal-JAR-acc-cc2",
    "social-planning",
    "tpsa-horndl",
    "philosophers",
    "optical-telegraphs",
    "airport-adl",
    "appn-adl",
    "openstacks",
    "openstacks-opt08-adl",
    "openstacks-sat08-adl",
    "trucks",
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
    "muddy-child",
    "muddy-children",
    "sum",
    "miconic-fulladl",
    "gripper",
    "miconic",
    "miconic-simpleadl",
]

_DFP_FIXED = (
    "merge_strategy=merge_stateless("
    "merge_selector=score_based_filtering(scoring_functions=["
    "goal_relevance(),dfp(),total_order("
    "atomic_ts_order=reverse_level,"
    "product_ts_order=new_to_old,"
    "atomic_before_product=false)])),"
    "shrink_strategy=shrink_bisimulation(greedy=false),"
    "label_reduction=exact(before_shrinking=true,before_merging=false),"
    "threshold_before_merge=1"
)


def _ms(axiom_factor_mode: int, max_states=50000) -> list[str]:
    base = f"{_DFP_FIXED},max_states={max_states}"
    return [
        "--search",
        f"astar(merge_and_shrink({base},axiom_factor_mode={axiom_factor_mode}))",
    ]


_EXTRA_MAX_STATES = [1000, 5000, 10000, "infinity"]
_EXTRA_MAX_STATES_NICKS = ["1k", "5k", "10k", "inf"]

CONFIGS = (
    # Reference
    [("blind", ["--search", "astar(blind())"])]
    # Original five configs at 50k
    + [
        ("dfp-none",             _ms(0)),
        ("dfp-only-goal",        _ms(1)),
        ("dfp-only-goal-capped", _ms(2)),
        ("dfp-all-capped",       _ms(3)),
    ]
    # Extra max_states sweep for none and all_capped only
    + [
        (f"dfp-none-{nick}", _ms(0, ms))
        for ms, nick in zip(_EXTRA_MAX_STATES, _EXTRA_MAX_STATES_NICKS)
    ]
    + [
        (f"dfp-all-capped-{nick}", _ms(3, ms))
        for ms, nick in zip(_EXTRA_MAX_STATES, _EXTRA_MAX_STATES_NICKS)
    ]
)

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
    "axiom_factors_built",
    "axiom_factors_groups",
    "axiom_skip_product_too_large",
    "axiom_skip_work_cap",
    "axiom_skip_state_cap",
    "axiom_skip_never_derivable",
    "axiom_skip_goal_unreachable",
    "axiom_skip_all_satisfy",
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