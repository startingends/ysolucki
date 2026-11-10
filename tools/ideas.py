#!/usr/bin/env python3
"""Numbered idea log (docs/IDEAS.md). The file is the source of truth; this tool only keeps
its format consistent so ideas can be referred to by number ("look deeper into #7").

  ideas.py add --title T --source S --plain P --claim C --test X --kill K [--worth W] [--evidence E] [--tags a,b]
                                    --plain is the idea in plain English with a concrete example, written for
                                    the owner (no jargon); it is required, because the owner steers from it
  ideas.py set N FIELD "text"       set/replace one field of idea N (e.g. wall, prediction, novelty)
  ideas.py note N "text"            append a dated line to idea N's log
  ideas.py status N STATUS "why"    open | testing | killed | parked | alive
  ideas.py list [--status S]
  ideas.py check                    validate numbering and required fields (exit 1 on error)

Two kinds of log, same tool (choose with --file):
  MAIN   docs/IDEAS.md               written by the lead and the auditor only; all fields required.
  LOCAL  <job folder>/IDEAS_LOCAL.md one per agent, for that agent's own use; only --title is required,
                                     so a thought can be captured in one line the moment it comes up.
                                     Numbers are local to the file: cite as "<agent id>/#N", never as "#N".
                                     Other agents do not read it. An auditor reviews it afterwards.
  ideas.py init-local FOLDER AGENT_ID          create FOLDER/IDEAS_LOCAL.md
  ideas.py --file LOCAL add --title T [...]    capture (any other field optional)
  ideas.py promote --from LOCAL N --auditor A  copy local idea N into the main log under the next main
                                               number; refuses until every required field is filled in
                                               (the auditor fills gaps with `--file LOCAL set N FIELD ...`)
  ideas.py --file LOCAL skip N "reason"        auditor's decision not to promote, recorded in the local log

Owner rules (2026-11-10), enforced as required fields:
  wall        which wall (W1, ...) the idea attacks and why it will not hit the same wall again
  new input   what the idea brings in that the original statement of RH did not have
              (a bare "RH is equivalent to X" is rejected)
  prediction  a number stated BEFORE computing it, that would come out differently for the impostor
  novelty     the searches actually run (queries, sources, date) and what they found; recall does not count
  smallest    the smallest new statement on this route that could actually be proved
A field may honestly say "FAILS RULE: ..."; hubcheck counts those so they stay visible.

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
FIELDS = ("status", "source", "date", "tags", "plain english", "wall", "new input", "claim", "prediction",
          "smallest", "worth if true", "first test", "kill line", "novelty", "evidence")
REQUIRED = ("status", "source", "date", "plain english", "wall", "new input", "claim", "prediction", "smallest",
            "first test", "kill line", "novelty")
HEAD = re.compile(r"^## #(\d+) · (.+)$")
LOCAL_NAME = "IDEAS_LOCAL.md"
LOCAL_MARK = re.compile(r"^<!-- local-idea-log owner=(\S+) -->$")
LOCAL_REQUIRED = ("status", "date")


def local_owner(path):
    """Agent id if `path` is a local idea log (first line is the marker), else None."""
    try:
        with open(path) as f:
            m = LOCAL_MARK.match(f.readline().rstrip("\n"))
    except OSError:
        return None
    return m.group(1) if m else None


def init_local(folder, agent):
    if not re.fullmatch(r"[A-Za-z0-9_.-]+", agent):
        sys.exit("agent id may contain only letters, digits, _ . -")
    path = os.path.join(folder, LOCAL_NAME)
    if os.path.exists(path):
        sys.exit(f"{path} already exists")
    os.makedirs(folder, exist_ok=True)
    _write(path, [
        f"<!-- local-idea-log owner={agent} -->",
        f"# Local idea log of {agent}",
        "",
        f"Private working log of agent `{agent}`. **Other agents: do not read or cite this file.**",
        f"Numbers here are local: an idea is cited as `{agent}/#N`, never as `#N` (that means the main log).",
        "Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.",
        "",
    ])
    return path


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
    required = LOCAL_REQUIRED if local_owner(path) else REQUIRED
    for k, it in enumerate(ideas, start=1):
        if it["n"] != k:
            errs.append(f"idea #{it['n']} is at position {k}: numbers must run 1..N with no gaps")
        for f in required:
            if not it["fields"].get(f):
                errs.append(f"#{it['n']}: missing '{f}'")
        if it["fields"].get("status", "").split(" ")[0] not in STATUSES:
            errs.append(f"#{it['n']}: bad status '{it['fields'].get('status')}'")
    return ideas, errs


def _one_line(s):
    return " ".join(str(s).split())


ARG_OF = {"source": "source", "tags": "tags", "plain english": "plain", "wall": "wall", "new input": "newinput",
          "claim": "claim", "prediction": "prediction", "smallest": "smallest", "worth if true": "worth",
          "first test": "test", "kill line": "kill", "novelty": "novelty", "evidence": "evidence"}


def _append(path, title, fields, log=()):
    lines, ideas = parse(path)
    n = (ideas[-1]["n"] + 1) if ideas else 1
    block = [f"## #{n} · {_one_line(title)}", "- status: open"]
    for f in FIELDS[1:]:
        v = fields.get(f)
        if v:
            block.append(f"- {f}: {_one_line(v)}")
    block += ["- log:"] + [f"  - {_one_line(x)}" for x in log] + [""]
    while lines and lines[-1] == "":
        lines.pop()
    _write(path, lines + [""] + block)
    return n


def add(path, a):
    owner = local_owner(path)
    fields = {f: getattr(a, arg, None) for f, arg in ARG_OF.items()}
    fields["date"] = datetime.date.today().isoformat()
    if owner:
        fields["source"] = fields["source"] or owner
    else:
        fields["evidence"] = fields["evidence"] or "none yet"
        missing = [ARG_OF[f] for f in REQUIRED if f in ARG_OF and not fields.get(f)]
        if missing:
            sys.exit("the main log needs every field; missing: " + ", ".join("--" + m for m in missing))
    return _append(path, a.title, fields)


def _log_lines(lines, it):
    out, on = [], False
    for ln in lines[it["start"]:it["end"]]:
        if ln.startswith("- log:"):
            on = True
        elif on and ln.startswith("  - "):
            out.append(ln[4:])
    return out


def promote(main, local, n, auditor):
    owner = local_owner(local)
    if not owner:
        sys.exit(f"{local} is not a local idea log")
    if local_owner(main):
        sys.exit("promotion target must be the main log")
    lines, ideas = parse(local)
    it = _find(ideas, n)
    done = [x for x in _log_lines(lines, it) if "promoted to main #" in x]
    if done:
        sys.exit(f"{owner}/#{n} was already promoted: {done[0]}")
    f = dict(it["fields"])
    missing = [k for k in REQUIRED if k not in ("status", "date", "source") and not f.get(k)]
    if missing:
        sys.exit(f"cannot promote {owner}/#{n}; the auditor must first fill in: " + ", ".join(missing)
                 + f"   (python3 tools/ideas.py --file {local} set {n} FIELD \"...\")")
    today = datetime.date.today().isoformat()
    f["source"] = f"{f.get('source') or owner}; promoted from {owner}/#{n} by {auditor} on {today}"
    f["date"] = f.get("date") or today
    f["evidence"] = f.get("evidence") or "none yet"
    m = _append(main, it["title"], f, log=[f"(from {owner}'s local log) {x}" for x in _log_lines(lines, it)])
    if f.get("status") in STATUSES and f["status"] != "open":
        set_status(main, m, f["status"], f"status carried over from {owner}/#{n}")
    note(local, n, f"promoted to main #{m} by {auditor}")
    return m


def audit_state(path):
    """(total, awaiting) for a local log: awaiting = neither promoted nor skipped by an auditor."""
    lines, ideas = parse(path)
    waiting = [it["n"] for it in ideas
               if not any("promoted to main #" in x or x.split(": ", 1)[-1].startswith("audit: not promoted")
                          for x in _log_lines(lines, it))]
    return len(ideas), waiting


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


def set_field(path, n, field, text):
    if field not in FIELDS or field in ("status", "date"):
        sys.exit(f"field must be one of {[f for f in FIELDS if f not in ('status', 'date')]}")
    lines, ideas = parse(path)
    it = _find(ideas, n)
    new = f"- {field}: {_one_line(text)}"
    for i in range(it["start"], it["end"]):
        if lines[i].startswith(f"- {field}:"):
            lines[i] = new
            break
    else:  # field absent (idea recorded before the field existed): insert in canonical order
        order = {f: k for k, f in enumerate(FIELDS)}
        pos = it["start"] + 1
        for i in range(it["start"] + 1, it["end"]):
            if lines[i].startswith("- ") and ":" in lines[i]:
                k = lines[i][2:].split(":", 1)[0]
                if k in order and order[k] < order[field]:
                    pos = i + 1
        lines.insert(pos, new)
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
    a.add_argument("--title", required=True)
    for f in sorted(set(ARG_OF.values())):
        a.add_argument("--" + f)
    il = sub.add_parser("init-local")
    il.add_argument("folder")
    il.add_argument("agent")
    pr = sub.add_parser("promote")
    pr.add_argument("--from", dest="local", required=True)
    pr.add_argument("n", type=int)
    pr.add_argument("--auditor", required=True)
    sk = sub.add_parser("skip")
    sk.add_argument("n", type=int)
    sk.add_argument("why")
    nt = sub.add_parser("note")
    nt.add_argument("n", type=int)
    nt.add_argument("text")
    sf = sub.add_parser("set")
    sf.add_argument("n", type=int)
    sf.add_argument("field")
    sf.add_argument("text")
    st = sub.add_parser("status")
    st.add_argument("n", type=int)
    st.add_argument("status")
    st.add_argument("why")
    ls = sub.add_parser("list")
    ls.add_argument("--status")
    sub.add_parser("check")
    args = p.parse_args(argv)

    if args.cmd == "add":
        owner = local_owner(args.file)
        n = add(args.file, args)
        print(f"added idea {owner + '/' if owner else ''}#{n}")
    elif args.cmd == "init-local":
        print("created", init_local(args.folder, args.agent))
    elif args.cmd == "promote":
        m = promote(args.file, args.local, args.n, args.auditor)
        print(f"promoted {local_owner(args.local)}/#{args.n} to main #{m}")
    elif args.cmd == "skip":
        if not local_owner(args.file):
            sys.exit("skip applies to a local idea log (use --file)")
        note(args.file, args.n, f"audit: not promoted: {args.why}")
    elif args.cmd == "note":
        note(args.file, args.n, args.text)
    elif args.cmd == "set":
        set_field(args.file, args.n, args.field, args.text)
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
        fails = [(it["n"], f) for it in ideas for f, v in it["fields"].items() if v.startswith("FAILS RULE")]
        for n, f in fails:
            print(f"rule-failure on record: #{n} '{f}'")
        print(f"{len(ideas)} ideas, {len(errs)} errors, {len(fails)} recorded rule failures")
        return 1 if errs else 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
