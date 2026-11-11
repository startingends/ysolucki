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
    "rh/UNDERSTANDING.md", "rh/NOTEBOOK.md", "rh/THEORY.md", "rh/ATLAS.md", "rh/FOOTHOLDS.md", "rh/BIGGER.md",
    "rh/specialists/ROSTER.md", "rh/library/README.md",
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
    # agents' local idea logs: lenient format check, and a count of what still awaits an auditor
    waiting_total = local_total = 0
    for d, _, files in os.walk(root):
        if "/.git" in d or ideas_mod.LOCAL_NAME not in files:
            continue
        lp = os.path.join(d, ideas_mod.LOCAL_NAME)
        rel = os.path.relpath(lp, root)
        owner = ideas_mod.local_owner(lp)
        if not owner:
            errs.append(f"{rel}: missing the local-idea-log marker on line 1")
            continue
        errs += [f"{rel}: {e}" for e in ideas_mod.check(lp)[1]]
        total, waiting = ideas_mod.audit_state(lp)
        local_total += total
        waiting_total += len(waiting)
        if waiting:
            print(f"awaiting audit: {rel}: {owner}/#" + f", {owner}/#".join(str(n) for n in waiting))
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
    # seminar boards: every board must load, and an open board is reported so it is not forgotten
    bdir = os.path.join(root, "rh", "board")
    if os.path.isdir(bdir):
        import json
        for fn in sorted(os.listdir(bdir)):
            if fn.endswith(".jsonl"):
                try:
                    with open(os.path.join(bdir, fn)) as fh:
                        msgs = [json.loads(ln) for ln in fh if ln.strip()]
                except ValueError:
                    errs.append(f"rh/board/{fn}: not valid JSON lines")
                    continue
                if msgs and msgs[-1].get("kind") != "close":
                    print(f"open seminar board: {fn[:-6]} ({len(msgs)} messages)")
    # theory document and failure atlas: structural checks
    import records as records_mod
    for kind in ("theory", "atlas"):
        rp = os.path.join(root, records_mod.SPEC[kind]["file"])
        if os.path.exists(rp) and os.path.getsize(rp):
            items, e = records_mod.check(kind, rp)
            errs += [f"{records_mod.SPEC[kind]['file']}: {x}" for x in e]
            if kind == "theory":
                est = sum(1 for it in items if it["f"].get("status") in records_mod.ESTABLISHED)
                print(f"theory: {len(items)} lemmas, {est} established (checked, formal or known), "
                      f"{sum(1 for it in items if it['f'].get('status') == 'formal')} formal")
            else:
                n = len(items)
                print(f"atlas: {n} failures, {len(records_mod.pairs(records_mod.read(rp)))} of {n * (n - 1) // 2} pairs examined")
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
    print(f"hubcheck: {len(nums)} ideas in the main log, {local_total} in agents' local logs "
          f"({waiting_total} awaiting audit), {len(errs)} errors")
    return 1 if errs else 0


if __name__ == "__main__":
    sys.exit(main())
