#!/usr/bin/env python3
"""Numbered idea log (docs/IDEAS.md). The file is the source of truth; this tool only keeps
its format consistent so ideas can be referred to by number ("look deeper into #7").

  ideas.py add --title T --source S --plain P --claim C --test X --kill K [--worth W] [--evidence E] [--tags a,b]
                                    --plain is the idea in plain English with a concrete example, written for
                                    the owner (no jargon); it is required, because the owner steers from it
  ideas.py note N "text"            append a dated line to idea N's log
  ideas.py status N STATUS "why"    open | testing | killed | parked | alive
  ideas.py list [--status S]
  ideas.py check                    validate numbering and required fields (exit 1 on error)

Statuses: open (recorded, untested) · testing · alive (survived a real test) ·
          parked (blocked on a named wall) · killed (kill line hit; reason in the log).
Killed ideas are never deleted: the reason they died is the most reusable thing in the file.
"""
from __future__ import annotations

import argparse
import datetime
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
DEFAULT = os.path.join(ROOT, "docs", "IDEAS.md")
STATUSES = ("open", "testing", "alive", "parked", "killed")
FIELDS = ("status", "source", "date", "tags", "plain english", "claim", "worth if true", "first test", "kill line", "evidence")
REQUIRED = ("status", "source", "date", "plain english", "claim", "first test", "kill line")
HEAD = re.compile(r"^## #(\d+) · (.+)$")


def _read(path):
    with open(path) as f:
        return f.read().split("\n")


def _write(path, lines):
    tmp = path + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(lines))
    os.replace(tmp, path)


def parse(path):
    """Return list of dicts: {n, title, start, end, fields{}}; start/end are line indices."""
    lines = _read(path)
    out = []
    for i, ln in enumerate(lines):
        m = HEAD.match(ln)
        if m:
            if out:
                out[-1]["end"] = i
            out.append({"n": int(m.group(1)), "title": m.group(2), "start": i, "end": len(lines), "fields": {}})
        elif out and ln.startswith("- ") and ":" in ln:
            k, v = ln[2:].split(":", 1)
            if k in FIELDS:
                out[-1]["fields"][k] = v.strip()
    return lines, out


def check(path):
    _, ideas = parse(path)
    errs = []
    for k, it in enumerate(ideas, start=1):
        if it["n"] != k:
            errs.append(f"idea #{it['n']} is at position {k}: numbers must run 1..N with no gaps")
        for f in REQUIRED:
            if not it["fields"].get(f):
                errs.append(f"#{it['n']}: missing '{f}'")
        if it["fields"].get("status", "").split(" ")[0] not in STATUSES:
            errs.append(f"#{it['n']}: bad status '{it['fields'].get('status')}'")
    return ideas, errs


def _one_line(s):
    return " ".join(str(s).split())


def add(path, a):
    lines, ideas = parse(path)
    n = (ideas[-1]["n"] + 1) if ideas else 1
    today = datetime.date.today().isoformat()
    block = [
        f"## #{n} · {_one_line(a.title)}",
        "- status: open",
        f"- source: {_one_line(a.source)}",
        f"- date: {today}",
        f"- tags: {_one_line(a.tags or '')}",
        f"- plain english: {_one_line(a.plain)}",
        f"- claim: {_one_line(a.claim)}",
        f"- worth if true: {_one_line(a.worth or '')}",
        f"- first test: {_one_line(a.test)}",
        f"- kill line: {_one_line(a.kill)}",
        f"- evidence: {_one_line(a.evidence or 'none yet')}",
        "- log:",
        "",
    ]
    while lines and lines[-1] == "":
        lines.pop()
    _write(path, lines + [""] + block)
    return n


def _find(ideas, n):
    for it in ideas:
        if it["n"] == n:
            return it
    sys.exit(f"no idea #{n}")


def note(path, n, text):
    lines, ideas = parse(path)
    it = _find(ideas, n)
    end = it["end"]
    while end > it["start"] and lines[end - 1] == "":
        end -= 1
    lines.insert(end, f"  - {datetime.date.today().isoformat()}: {_one_line(text)}")
    _write(path, lines)


def set_status(path, n, status, why):
    if status not in STATUSES:
        sys.exit(f"status must be one of {STATUSES}")
    lines, ideas = parse(path)
    it = _find(ideas, n)
    for i in range(it["start"], it["end"]):
        if lines[i].startswith("- status:"):
            lines[i] = f"- status: {status}"
            break
    _write(path, lines)
    note(path, n, f"status -> {status}: {why}")


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--file", default=DEFAULT)
    sub = p.add_subparsers(dest="cmd", required=True)
    a = sub.add_parser("add")
    for f in ("title", "source", "plain", "claim", "test", "kill"):
        a.add_argument("--" + f, required=True)
    for f in ("worth", "evidence", "tags"):
        a.add_argument("--" + f)
    nt = sub.add_parser("note")
    nt.add_argument("n", type=int)
    nt.add_argument("text")
    st = sub.add_parser("status")
    st.add_argument("n", type=int)
    st.add_argument("status")
    st.add_argument("why")
    ls = sub.add_parser("list")
    ls.add_argument("--status")
    sub.add_parser("check")
    args = p.parse_args(argv)

    if args.cmd == "add":
        print(f"added idea #{add(args.file, args)}")
    elif args.cmd == "note":
        note(args.file, args.n, args.text)
    elif args.cmd == "status":
        set_status(args.file, args.n, args.status, args.why)
    elif args.cmd == "list":
        _, ideas = parse(args.file)
        for it in ideas:
            s = it["fields"].get("status", "?")
            if args.status and s != args.status:
                continue
            print(f"#{it['n']:<3} [{s:<7}] {it['title']}")
    elif args.cmd == "check":
        ideas, errs = check(args.file)
        for e in errs:
            print("ERROR", e)
        print(f"{len(ideas)} ideas, {len(errs)} errors")
        return 1 if errs else 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
