#!/usr/bin/env python3
"""Generate .sas files for all axiom benchmark domains.

Run from the Fast Downward repo root (where fast-downward.py lives):

    python3 misc/tests/generate_sas.py

If interrupted, re-run — already-generated .sas files are skipped.
Use --force to regenerate everything from scratch.
"""

import argparse
import subprocess
import sys
from pathlib import Path


def find_domain(problem: Path) -> Path | None:
    """Return the domain file for a problem using all three naming conventions."""
    d = problem.parent
    stem = problem.stem

    # Convention 1: shared domain.pddl
    if (d / "domain.pddl").is_file():
        return d / "domain.pddl"

    # Convention 2: per-instance prefix — domain-<stem>.pddl  (horndl compiled)
    candidate = d / f"domain-{stem}.pddl"
    if candidate.is_file():
        return candidate

    # Convention 3: per-instance suffix — <stem>-domain.pddl
    candidate = d / f"{stem}-domain.pddl"
    if candidate.is_file():
        return candidate

    return None


def collect_pairs(bench_root: Path) -> list[tuple[Path, Path]]:
    """Collect (domain, problem) pairs from both axiom benchmark folders."""
    pairs = []
    for folder_name in ("pddl-axioms", "pddl-axioms-conditional-effects"):
        folder = bench_root / folder_name
        if not folder.is_dir():
            print(f"[WARN] Benchmark folder not found: {folder}", file=sys.stderr)
            continue

        for problem in sorted(folder.rglob("*.pddl")):
            if "domain" in problem.stem:
                continue  # skip domain files themselves

            domain = find_domain(problem)
            if domain is None:
                print(f"[WARN] No domain file found for: {problem}", file=sys.stderr)
                continue

            pairs.append((domain, problem))

    return pairs


def translate(domain: Path, problem: Path, fd_root: Path, force: bool) -> bool:
    """Run FD translator to produce a .sas file next to the problem.

    Returns True on success, False on failure.
    """
    sas_file = problem.with_suffix(".sas")

    if not force and sas_file.is_file():
        print(f"  skip  {sas_file.relative_to(fd_root)}")
        return True

    print(f"  translate  {problem.relative_to(fd_root)} ...", end="", flush=True)

    try:
        result = subprocess.run(
            [
                sys.executable,
                str(fd_root / "fast-downward.py"),
                "--sas-file", str(sas_file),
                str(domain),
                str(problem),
            ],
            capture_output=True,
            text=True,
            timeout=300,
        )
    except subprocess.TimeoutExpired:
        print(" TIMEOUT")
        return False
    except Exception as exc:
        print(f" ERROR ({exc})")
        return False

    if result.returncode == 0 or sas_file.is_file():
        size = sas_file.stat().st_size if sas_file.is_file() else 0
        print(f" ok ({size // 1024} KB)")
        return True
    else:
        print(f" FAILED (exit {result.returncode})")
        # Print last few lines of stderr to help diagnose
        for line in result.stderr.strip().splitlines()[-5:]:
            print(f"    {line}")
        return False


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument(
        "--bench",
        default="misc/tests/benchmarks",
        help="Path to the benchmarks folder (default: misc/tests/benchmarks)",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Regenerate .sas files even if they already exist",
    )
    args = parser.parse_args()

    fd_root = Path(__file__).resolve().parents[2]  # repo root
    bench_root = (fd_root / args.bench).resolve()

    if not (fd_root / "fast-downward.py").is_file():
        sys.exit(f"fast-downward.py not found in {fd_root} — run from the repo root.")

    pairs = collect_pairs(bench_root)
    if not pairs:
        sys.exit("No problem files found. Check that the benchmark folders exist.")

    print(f"Found {len(pairs)} problem files under {bench_root.relative_to(fd_root)}\n")

    failures = []
    for i, (domain, problem) in enumerate(pairs, 1):
        print(f"[{i:3}/{len(pairs)}]", end=" ")
        ok = translate(domain, problem, fd_root, force=args.force)
        if not ok:
            failures.append(problem)

    print(f"\nDone. {len(pairs) - len(failures)}/{len(pairs)} succeeded.")
    if failures:
        print(f"\nFailed ({len(failures)}):")
        for p in failures:
            print(f"  {p.relative_to(fd_root)}")
        sys.exit(1)


if __name__ == "__main__":
    main()
