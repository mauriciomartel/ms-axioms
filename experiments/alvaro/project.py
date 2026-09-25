import subprocess
import sys
from pathlib import Path

from downward.experiment import FastDownwardExperiment
from downward.reports.absolute import AbsoluteReport
from downward.reports.scatter import ScatterPlotReport
from lab.environments import LocalEnvironment
from lab.reports import Attribute, geometric_mean

# Silence import-unused messages. Experiment scripts may use these imports.
assert FastDownwardExperiment and LocalEnvironment and ScatterPlotReport

SCRIPT = Path(sys.argv[0]).resolve()
REMOTE = False

EVALUATIONS_PER_TIME = Attribute(
    "evaluations_per_time", min_wins=False, function=geometric_mean, digits=1
)


def get_repo_base() -> Path:
    """Get base directory of the repository by searching upward for .git."""
    path = Path(SCRIPT)
    while path.parent != path:
        if (path / ".git").is_dir():
            return path
        path = path.parent
    sys.exit("repo base could not be found")


def add_evaluations_per_time(run):
    evaluations = run.get("evaluations")
    time = run.get("search_time")
    if evaluations is not None and evaluations >= 100 and time:
        run["evaluations_per_time"] = evaluations / time
    return run


def add_absolute_report(exp, *, name=None, outfile=None, **kwargs):
    report = AbsoluteReport(**kwargs)
    if name and not outfile:
        outfile = f"{name}.{report.output_format}"
    elif outfile and not name:
        name = Path(outfile).name
    elif not name and not outfile:
        name = f"{exp.name}-abs"
        outfile = f"{name}.{report.output_format}"

    if not Path(outfile).is_absolute():
        outfile = Path(exp.eval_dir) / outfile

    exp.add_report(report, name=name, outfile=outfile)
    exp.add_step(f"open-{name}", subprocess.call, ["xdg-open", str(outfile)])