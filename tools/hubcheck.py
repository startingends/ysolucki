#!/usr/bin/env python3
"""Consistency check for the hub. Exit 1 if anything is off. Run before every commit.

Checks: required files exist · IDEAS.md numbering/fields · AGENT_REGISTRY.tsv is well-formed ·
every '#N' idea reference in HUB / JOURNAL / DECISIONS / RESUME_HERE points at a real idea ·
no file >= 10 MB and nothing under */data/ is tracked by git.
"""
from __future__ import annotations

import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ideas as ideas_mod  # noqa: E402

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
REQUIRED = [
    "docs/HUB.md", "docs/JOURNAL.md", "docs/KNOWLEDGE.md", "docs/IDEAS.md", "docs/DECISIONS.md",
    "docs/AGENT_REGISTRY.tsv", "docs/SUBAGENT_PREAMBLE.md",
    "rh/PROJECT_BRIEF.md", "rh/RESUME_HERE.md", "rh/REVIEW_LEDGER.md", "rh/BRIEF_PROPOSALS.md",
    "rh/UNDERSTANDING.md", "rh/NOTEBOOK.md",
]
REG_COLS = ["id", "date", "role", "model", "folder", "status", "result"]
REG_STATUS = {"running", "done", "failed", "cancelled"}


def main(root=ROOT):
    errs = []
    for f in REQUIRED:
        if not os.path.exists(os.path.join(root, f)):
            errs.append(f"missing {f}")
    ideas_path = os.path.join(root, "docs/IDEAS.md")
    nums = set()
    if os.path.exists(ideas_path):
        its, e = ideas_mod.check(ideas_path)
        errs += e
        nums = {it["n"] for it in its}
    reg = os.path.join(root, "docs/AGENT_REGISTRY.tsv")
    if os.path.exists(reg):
        with open(reg) as f:
            rows = [ln.rstrip("\n").split("\t") for ln in f if ln.strip()]
        if not rows or rows[0] != REG_COLS:
            errs.append(f"AGENT_REGISTRY.tsv header must be {REG_COLS}")
        seen = set()
        for r in rows[1:]:
            if len(r) != len(REG_COLS):
                errs.append(f"registry row has {len(r)} columns, want {len(REG_COLS)}: {r[:2]}")
                continue
            if r[0] in seen:
                errs.append(f"registry id repeated: {r[0]}")
            seen.add(r[0])
            if r[5] not in REG_STATUS:
                errs.append(f"registry {r[0]}: bad status '{r[5]}'")
    for f in ("docs/HUB.md", "docs/JOURNAL.md", "docs/DECISIONS.md", "rh/RESUME_HERE.md"):
        p = os.path.join(root, f)
        if os.path.exists(p):
            with open(p) as fh:
                for n in re.findall(r"(?<![\w/#&])#(\d+)\b", fh.read()):
                    if int(n) not in nums:
                        errs.append(f"{f} refers to idea #{n}, which is not in IDEAS.md")
    try:
        tracked = subprocess.run(["git", "ls-files"], cwd=root, capture_output=True, text=True).stdout.split("\n")
        for t in filter(None, tracked):
            if "/data/" in "/" + t:
                errs.append(f"tracked file under data/: {t}")
            p = os.path.join(root, t)
            if os.path.exists(p) and os.path.getsize(p) >= 10 * 1024 * 1024:
                errs.append(f"tracked file >= 10 MB: {t}")
    except OSError:
        pass
    for e in errs:
        print("ERROR", e)
    print(f"hubcheck: {len(nums)} ideas, {len(errs)} errors")
    return 1 if errs else 0


if __name__ == "__main__":
    sys.exit(main())
