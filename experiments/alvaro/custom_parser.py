import logging
import re

from lab.parser import Parser


class CommonParser(Parser):
    def add_bottom_up_pattern(self, name, regex, file="run.log", required=False, type=int):
        def search_from_bottom(content, props):
            reversed_content = "\n".join(reversed(content.splitlines()))
            match = re.search(regex, reversed_content)
            if required and not match:
                logging.error(f"Pattern {regex} not found in file {file}")
            if match:
                props[name] = type(match.group(1))
        self.add_function(search_from_bottom, file=file)

    def add_repeated_pattern(self, name, regex, file="run.log", required=False, type=int):
        def find_all_occurrences(content, props):
            matches = re.findall(regex, content)
            if required and not matches:
                logging.error(f"Pattern {regex} not found in file {file}")
            props[name] = [type(m) for m in matches]
        self.add_function(find_all_occurrences, file=file)


_SKIP_REASONS = [
    "product_too_large",
    "work_cap",
    "state_cap",
    "never_derivable",
    "goal_unreachable",
    "all_satisfy",
]


def _parse_axiom_factors(content, props):
    match = re.search(
        r"Axiom factors built: (\d+) / (\d+) group\(s\)\.",
        content,
    )
    if match:
        props["axiom_factors_built"] = int(match.group(1))
        props["axiom_factors_groups"] = int(match.group(2))
        skips_match = re.search(
            r"Axiom factors built: \d+ / \d+ group\(s\)\. Skipped:(.*)",
            content,
        )
        if skips_match:
            for reason in _SKIP_REASONS:
                m = re.search(rf"{reason}=(\d+)", skips_match.group(1))
                if m:
                    props[f"axiom_skip_{reason}"] = int(m.group(1))


def get_parser():
    parser = CommonParser()
    parser.add_bottom_up_pattern(
        "search_start_time",
        r"\[t=(.+)s, \d+ KB\] g=0, 1 evaluated, 0 expanded",
        type=float,
    )
    parser.add_bottom_up_pattern(
        "search_start_memory",
        r"\[t=.+s, (\d+) KB\] g=0, 1 evaluated, 0 expanded",
        type=int,
    )
    parser.add_pattern(
        "initial_h_value",
        r"f = (\d+) \[1 evaluated, 0 expanded, t=.+s, \d+ KB\]",
        type=int,
    )
    parser.add_bottom_up_pattern(
        "expansions_until_last_jump",
        r"Expanded until last jump: (\d+) state\(s\)\.",
        type=int,
    )
    parser.add_function(_parse_axiom_factors)
    return parser