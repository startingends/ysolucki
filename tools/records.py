#!/usr/bin/env python3
"""Two growing structures, one small tool.

THEORY  (rh/THEORY.md)  the theory document: lemmas with dependencies, each with a status.
  records.py theory add --name N --statement S [--depends T1,T3] [--proof PATH] [--source WHO] [--routes "#21,..."]
  records.py theory set T7 FIELD "text"         fields: statement, status, depends, proof, checked by, formal, routes, note
  records.py theory status T7 STATUS "why"
  records.py theory check                        numbering, statuses, dependency graph (exit 1 on error)
  records.py theory tree                         the structure, indented by dependency
  records.py theory frontier                     open lemmas whose dependencies are all established
 Statuses:  open      stated, no accepted proof
            proved    a full written proof exists (file named in `proof`), not yet independently checked
            checked   an independent verifier went through the proof line by line (named in `checked by`)
            formal    machine-checked (file named in `formal`)
            known     in the literature (citation in `source`), not reproved here
            refuted   false; the counterexample is in `note`
 A lemma is ESTABLISHED if checked, formal or known. `checked` and `formal` are refused while any dependency
 is not established. Owner rule: a lemma that a live route depends on must become `formal` (or `known`).

ATLAS   (rh/ATLAS.md)   the failure atlas: one entry per dead approach, separate from the idea log.
  records.py atlas add --name N --approach A --breaks B --needs X --supplies Y --source S
        breaks    the exact step that fails, stated as mathematics
        needs     what would have to be true for it not to break
        supplies  what the approach DOES deliver unconditionally (this is what another failure may be missing)
  records.py atlas pair F3 F8 VERDICT "reasoning"     VERDICT: no | maybe | yes   (does what kills one supply
                                                       what the other was missing? the Wiles move, deliberately)
  records.py atlas todo                               pairs not yet examined
  records.py atlas check
"""
from __future__ import annotations

import argparse
import datetime
import itertools
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
SPEC = {
    "theory": {"file": "rh/THEORY.md", "pre": "T",
               "fields": ("statement", "status", "depends", "proof", "checked by", "formal", "source", "routes", "note"),
               "required": ("statement", "status")},
    "atlas": {"file": "rh/ATLAS.md", "pre": "F",
              "fields": ("approach", "breaks", "needs", "supplies", "source", "note"),
              "required": ("approach", "breaks", "needs", "supplies", "source")},
}
STATUSES = ("open", "proved", "checked", "formal", "known", "refuted")
ESTABLISHED = ("checked", "formal", "known")
PAIR = re.compile(r"^- F(\d+) x F(\d+) \[(no|maybe|yes)\] (.*)$")


def one(s):
    return " ".join(str(s).split())


def read(path):
    with open(path) as f:
        return f.read().split("\n")


def write(path, lines):
    tmp = path + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(lines))
    os.replace(tmp, path)


def parse(kind, path):
    sp = SPEC[kind]
    head = re.compile(r"^## " + sp["pre"] + r"(\d+) · (.+)$")
    lines, out = read(path), []
    for i, ln in enumerate(lines):
        m = head.match(ln)
        if m:
            if out:
                out[-1]["end"] = i
            out.append({"n": int(m.group(1)), "name": m.group(2), "start": i, "end": len(lines), "f": {}})
        elif ln.startswith("## "):
            if out and out[-1]["end"] == len(lines):
                out[-1]["end"] = i
        elif out and out[-1]["end"] == len(lines) and ln.startswith("- ") and ":" in ln:
            k, v = ln[2:].split(":", 1)
            if k in sp["fields"]:
                out[-1]["f"][k] = v.strip()
    return lines, out


def deps(it):
    return [int(x) for x in re.findall(r"T(\d+)", it["f"].get("depends", ""))]


def check(kind, path):
    sp = SPEC[kind]
    lines, items = parse(kind, path)
    errs = []
    by = {it["n"]: it for it in items}
    for k, it in enumerate(items, 1):
        tag = f"{sp['pre']}{it['n']}"
        if it["n"] != k:
            errs.append(f"{tag} is at position {k}: numbers must run 1..N")
        for f in sp["required"]:
            if not it["f"].get(f):
                errs.append(f"{tag}: missing '{f}'")
    if kind == "theory":
        for it in items:
            tag, st = f"T{it['n']}", it["f"].get("status", "")
            if st not in STATUSES:
                errs.append(f"{tag}: bad status '{st}'")
            for d in deps(it):
                if d not in by:
                    errs.append(f"{tag}: depends on T{d}, which does not exist")
                elif st in ("checked", "formal") and by[d]["f"].get("status") not in ESTABLISHED:
                    errs.append(f"{tag} is '{st}' but its dependency T{d} is only '{by[d]['f'].get('status')}'")
            if st in ("proved", "checked") and not it["f"].get("proof"):
                errs.append(f"{tag}: status '{st}' needs a proof file")
            if st == "checked" and not it["f"].get("checked by"):
                errs.append(f"{tag}: 'checked' needs 'checked by'")
            if st == "formal" and not it["f"].get("formal"):
                errs.append(f"{tag}: 'formal' needs the machine-checked file in 'formal'")
            if st == "known" and not it["f"].get("source"):
                errs.append(f"{tag}: 'known' needs a citation in 'source'")
        seen, stack = set(), set()

        def visit(n):
            if n in stack:
                errs.append(f"dependency cycle through T{n}")
                return
            if n in seen or n not in by:
                return
            stack.add(n)
            for d in deps(by[n]):
                visit(d)
            stack.discard(n)
            seen.add(n)
        for it in items:
            visit(it["n"])
    else:
        for a, b, _, _ in pairs(lines):
            if a not in by or b not in by:
                errs.append(f"pair F{a} x F{b}: unknown entry")
    return items, errs


def pairs(lines):
    return [(int(m.group(1)), int(m.group(2)), m.group(3), m.group(4)) for m in map(PAIR.match, lines) if m]


def add(kind, path, name, fields):
    sp = SPEC[kind]
    lines, items = parse(kind, path)
    n = items[-1]["n"] + 1 if items else 1
    block = [f"## {sp['pre']}{n} · {one(name)}"] + [f"- {f}: {one(fields[f])}" for f in sp["fields"] if fields.get(f)] + [""]
    pos = items[-1]["end"] if items else len(lines)
    while pos > 0 and lines[pos - 1] == "":
        pos -= 1
    write(path, lines[:pos] + [""] + block + lines[pos:])
    return n


def setf(kind, path, n, field, text):
    sp = SPEC[kind]
    if field not in sp["fields"]:
        sys.exit(f"field must be one of {sp['fields']}")
    lines, items = parse(kind, path)
    it = next((x for x in items if x["n"] == n), None) or sys.exit(f"no {sp['pre']}{n}")
    new = f"- {field}: {one(text)}"
    for i in range(it["start"], it["end"]):
        if lines[i].startswith(f"- {field}:"):
            lines[i] = new
            break
    else:
        end = it["end"]
        while end > it["start"] + 1 and lines[end - 1] == "":
            end -= 1
        lines.insert(end, new)
    write(path, lines)


def num(tag, pre):
    m = re.fullmatch(pre + r"(\d+)", tag)
    return int(m.group(1)) if m else sys.exit(f"expected {pre}<number>, got {tag}")


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("kind", choices=("theory", "atlas"))
    p.add_argument("--file")
    sub = p.add_subparsers(dest="cmd", required=True)
    a = sub.add_parser("add")
    a.add_argument("--name", required=True)
    for f in ("statement", "depends", "proof", "source", "routes", "approach", "breaks", "needs", "supplies", "note"):
        a.add_argument("--" + f)
    s = sub.add_parser("set"); s.add_argument("tag"); s.add_argument("field"); s.add_argument("text")
    st = sub.add_parser("status"); st.add_argument("tag"); st.add_argument("status"); st.add_argument("why")
    pr = sub.add_parser("pair"); pr.add_argument("a"); pr.add_argument("b"); pr.add_argument("verdict", choices=("no", "maybe", "yes")); pr.add_argument("why")
    for c in ("check", "tree", "frontier", "todo", "list"):
        sub.add_parser(c)
    args = p.parse_args(argv)
    kind, sp = args.kind, SPEC[args.kind]
    path = args.file or os.path.join(ROOT, sp["file"])

    if args.cmd == "add":
        f = {k: getattr(args, k, None) for k in sp["fields"] if hasattr(args, k)}
        if kind == "theory":
            f["status"] = "proved" if f.get("proof") else "open"
        missing = [k for k in sp["required"] if not f.get(k)]
        if missing:
            sys.exit("missing: " + ", ".join("--" + m for m in missing))
        print(f"added {sp['pre']}{add(kind, path, args.name, f)}")
    elif args.cmd == "set":
        if args.field == "status":
            sys.exit("use the status command")
        setf(kind, path, num(args.tag, sp["pre"]), args.field, args.text)
    elif args.cmd == "status":
        if kind != "theory" or args.status not in STATUSES:
            sys.exit(f"theory statuses: {STATUSES}")
        n = num(args.tag, "T")
        before = read(path)
        setf(kind, path, n, "status", args.status)
        errs = [e for e in check(kind, path)[1] if e.startswith(f"T{n}")]
        if errs:
            write(path, before)
            sys.exit("refused: " + "; ".join(errs))
        lines, items = parse(kind, path)
        it = next(x for x in items if x["n"] == n)
        old = it["f"].get("note", "")
        setf(kind, path, n, "note", (old + " | " if old else "") + f"{datetime.date.today().isoformat()} -> {args.status}: {one(args.why)}")
    elif args.cmd == "pair":
        if kind != "atlas":
            sys.exit("pair applies to the atlas")
        x, y = sorted((num(args.a, "F"), num(args.b, "F")))
        lines, items = parse(kind, path)
        if x == y or not {x, y} <= {it["n"] for it in items}:
            sys.exit("need two different existing entries")
        if any((a, b) == (x, y) for a, b, _, _ in pairs(lines)):
            sys.exit(f"F{x} x F{y} was already examined")
        if "## Pairs examined" not in lines:
            lines += ["", "## Pairs examined", ""]
        lines.append(f"- F{x} x F{y} [{args.verdict}] {datetime.date.today().isoformat()} {one(args.why)}")
        write(path, lines)
    else:
        items, errs = check(kind, path)
        by = {it["n"]: it for it in items}
        if args.cmd == "check":
            for e in errs:
                print("ERROR", e)
            extra = ""
            if kind == "theory":
                c = {s: sum(1 for it in items if it["f"].get("status") == s) for s in STATUSES}
                extra = " " + ", ".join(f"{v} {k}" for k, v in c.items() if v)
            else:
                done = len(pairs(read(path)))
                extra = f" {done} of {len(items) * (len(items) - 1) // 2} pairs examined"
            print(f"{kind}: {len(items)} entries, {len(errs)} errors;{extra}")
            return 1 if errs else 0
        if args.cmd == "list":
            for it in items:
                print(f"{sp['pre']}{it['n']:<3} [{it['f'].get('status', '-'):<7}] {it['name']}")
        elif args.cmd == "frontier":
            for it in items:
                if it["f"].get("status") == "open" and all(by[d]["f"].get("status") in ESTABLISHED for d in deps(it) if d in by):
                    print(f"T{it['n']} {it['name']}   (depends on: {it['f'].get('depends', 'nothing')})")
        elif args.cmd == "tree":
            used = {d for it in items for d in deps(it)}

            def show(n, depth, path_):
                it = by[n]
                print("  " * depth + f"T{n} [{it['f'].get('status')}] {it['name']}")
                for d in deps(it):
                    if d in by and d not in path_:
                        show(d, depth + 1, path_ | {n})
            for it in items:
                if it["n"] not in used:
                    show(it["n"], 0, set())
        elif args.cmd == "todo":
            done = {(a, b) for a, b, _, _ in pairs(read(path))}
            for x, y in itertools.combinations(sorted(by), 2):
                if (x, y) not in done:
                    print(f"F{x} x F{y}   {by[x]['name']}  |  {by[y]['name']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
