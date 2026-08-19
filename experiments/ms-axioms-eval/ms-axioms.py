#! /usr/bin/env python

import os

import custom_parser
import project

REPO = project.get_repo_base()
BENCHMARKS_DIR = os.environ["DOWNWARD_BENCHMARKS"]

ENV = project.LocalEnvironment(processes=4)  # Adjust to your CPU count

# Non-skipped domains from manual testing
SUITE = [
    # pddl-axioms: Phase 2 (axioms in operator preconditions)
    "pddl-axioms/grid-axioms",
    "pddl-axioms/miconic-axioms",
    "pddl-axioms/blocker",
    "pddl-axioms/blocks-axioms",
    "pddl-axioms/sokoban-axioms",
    "pddl-axioms/ghosh-etal-JAR-acc-cc2",
    "pddl-axioms/social-planning",
    "pddl-axioms/tpsa-horndl",
    # pddl-axioms: Phase 1 (axioms in goals only)
    "pddl-axioms/philosophers",
    "pddl-axioms/optical-telegraphs",
    # pddl-axioms: compiled axioms
    "pddl-axioms/airport-adl",
    "pddl-axioms/appn-adl",
    "pddl-axioms/openstacks",
    "pddl-axioms/openstacks-opt08-adl",
    "pddl-axioms/openstacks-sat08-adl",
    "pddl-axioms/trucks",
    # pddl-axioms-conditional-effects: Phase 2
    "pddl-axioms-conditional-effects/cats-horndl",
    "pddl-axioms-conditional-effects/collab-and-comm",
    "pddl-axioms-conditional-effects/elevator-horndl",
    "pddl-axioms-conditional-effects/ged1-ds2nd",
    "pddl-axioms-conditional-effects/psr-large",
    "pddl-axioms-conditional-effects/psr-middle",
    "pddl-axioms-conditional-effects/robot-horndl",
    "pddl-axioms-conditional-effects/robotConj-horndl",
    "pddl-axioms-conditional-effects/taskassign-horndl",
    "pddl-axioms-conditional-effects/word-rooms",
    # pddl-axioms-conditional-effects: Phase 1
    "pddl-axioms-conditional-effects/muddy-child",
    "pddl-axioms-conditional-effects/muddy-children",
    "pddl-axioms-conditional-effects/sum",
    # pddl-axioms-conditional-effects: compiled axioms
    "pddl-axioms-conditional-effects/miconic-fulladl",
    # Standard regression (no axioms)
    "gripper",
    "miconic",
    "miconic-simpleadl",
]

CONFIGS = [
    ("blind", ["--search", "astar(blind())"]),
    (
        "sccs",
        [
            "--search",
            "astar(merge_and_shrink("
            "merge_strategy=merge_sccs("
            "order_of_sccs=topological,"
            "merge_selector=score_based_filtering(scoring_functions=["
            "goal_relevance(),dfp(),total_order("
            "atomic_ts_order=reverse_level,"
            "product_ts_order=new_to_old,"
            "atomic_before_product=false)])),"
            "shrink_strategy=shrink_bisimulation(greedy=false),"
            "label_reduction=exact(before_shrinking=true,before_merging=false),"
            "max_states=50000,threshold_before_merge=1))",
        ],
    ),
    (
        "dfp",
        [
            "--search",
            "astar(merge_and_shrink("
            "merge_strategy=merge_stateless("
            "merge_selector=score_based_filtering(scoring_functions=["
            "goal_relevance(),dfp(),total_order("
            "atomic_ts_order=reverse_level,"
            "product_ts_order=new_to_old,"
            "atomic_before_product=false)])),"
            "shrink_strategy=shrink_bisimulation(greedy=false),"
            "label_reduction=exact(before_shrinking=true,before_merging=false),"
            "max_states=50000,threshold_before_merge=1))",
        ],
    ),
    (
        "miasm",
        [
            "--search",
            "astar(merge_and_shrink("
            "merge_strategy=merge_stateless("
            "merge_selector=score_based_filtering(scoring_functions=["
            "goal_relevance(),"
            "sf_miasm(shrink_strategy=shrink_bisimulation(greedy=false),"
            "max_states=50000,threshold_before_merge=1),"
            "total_order(atomic_ts_order=reverse_level,"
            "product_ts_order=new_to_old,"
            "atomic_before_product=false)])),"
            "shrink_strategy=shrink_bisimulation(greedy=false),"
            "label_reduction=exact(before_shrinking=true,before_merging=false),"
            "max_states=50000,threshold_before_merge=1))",
        ],
    ),
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
    "search_start_time",
    "search_start_memory",
    "search_time",
    "total_time",
    "expansions",
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
