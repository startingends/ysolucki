#!/usr/bin/env python3
"""Shared board for a Socratic seminar: agents post to it and read it WHILE they work.

  board.py --board NAME open "topic"                      create the board (lead / moderator)
  board.py --board NAME post --from ID --kind KIND [--to ID|all] [--re N] "text"
  board.py --board NAME read [--me ID] [--unread] [--since N] [--thread N]
  board.py --board NAME open-questions [--me ID]           questions with no answer yet
  board.py --board NAME close --from ID "summary"          moderator ends the seminar
  board.py --board NAME status

KIND is one of:
  question     ask for a definition, a reason, an example, a consequence (the main move of the seminar)
  answer       reply to a question (--re N required)
  claim        a statement you are prepared to be questioned on; label it PROVED / COMPUTED / HEURISTIC / CONJECTURE
  objection    a specific gap, counterexample or failed recomputation (--re N required; proofs and numbers only)
  offer        "I can compute / check / look up X for you"
  result       a number or a proof step produced in answer to a question or an offer (--re N required)
  note         anything else, short

Rules of the seminar (enforced where a program can; the rest is in claude.md):
  - A claim may be met with an objection only after someone has asked a question about it and it was answered
    (or 1 turn passed with no answer). Ask first.
  - Objections are for proofs and numbers. Nobody posts whether an IDEA is likely to work; no scores.
  - A question addressed to you must be answered (or answered "I do not know, and here is what I would need").
Messages are numbered B1, B2, ... per board, append-only, stored in rh/board/NAME.jsonl (source of truth)
and rendered to rh/board/NAME.md.
"""
from __future__ import annotations

import argparse
import datetime
import fcntl
import json
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
DIR = os.path.join(ROOT, "rh", "board")
KINDS = ("question", "answer", "claim", "objection", "offer", "result", "note", "open", "close")
NEEDS_RE = ("answer", "objection", "result")
MAXLEN = 4000


def _paths(d, name):
    if not name.replace("_", "").replace("-", "").isalnum():
        sys.exit("board name: letters, digits, _ and - only")
    return os.path.join(d, name + ".jsonl"), os.path.join(d, name + ".md"), os.path.join(d, name + ".seen.json")


def load(d, name):
    p = _paths(d, name)[0]
    if not os.path.exists(p):
        sys.exit(f"no board '{name}' (create it with: board.py --board {name} open \"topic\")")
    with open(p) as f:
        return [json.loads(ln) for ln in f if ln.strip()]


def _render(d, name, msgs):
    out = [f"# Board: {name}", "", f"Topic: {msgs[0]['text']}" if msgs else "", "",
           "Append-only. Written by `tools/board.py`; do not edit by hand.", ""]
    for m in msgs:
        head = f"**B{m['n']}** · {m['kind']} · from `{m['from']}`"
        if m.get("to") and m["to"] != "all":
            head += f" → `{m['to']}`"
        if m.get("re"):
            head += f" · re B{m['re']}"
        out += [head + f" · {m['time']}", "", m["text"], ""]
    tmp = _paths(d, name)[1] + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(out))
    os.replace(tmp, _paths(d, name)[1])


def append(d, name, msg, create=False):
    """Append one message under an exclusive lock; returns its number."""
    os.makedirs(d, exist_ok=True)
    p = _paths(d, name)[0]
    if create and os.path.exists(p):
        sys.exit(f"board '{name}' already exists")
    if not create and not os.path.exists(p):
        sys.exit(f"no board '{name}'")
    with open(p, "a+") as f:
        fcntl.flock(f, fcntl.LOCK_EX)
        f.seek(0)
        msgs = [json.loads(ln) for ln in f if ln.strip()]
        if msgs and msgs[-1]["kind"] == "close" and msg["kind"] != "close":
            sys.exit("this board is closed")
        if msg.get("re"):
            target = next((m for m in msgs if m["n"] == msg["re"]), None)
            if target is None:
                sys.exit(f"--re B{msg['re']}: no such message")
            if msg["kind"] == "answer" and target["kind"] != "question":
                sys.exit(f"an answer must reply to a question; B{msg['re']} is a {target['kind']}")
            if msg["kind"] == "objection" and target["kind"] in ("claim", "result"):
                asked = [m for m in msgs if m["kind"] == "question" and m.get("re") == target["n"]]
                if not asked:
                    sys.exit(f"ask before you object: post a question about B{target['n']} first (rule of the seminar)")
        msg["n"] = len(msgs) + 1
        msg["time"] = datetime.datetime.now().strftime("%H:%M")
        f.write(json.dumps(msg, ensure_ascii=False) + "\n")
        f.flush()
        os.fsync(f.fileno())
        msgs.append(msg)
        _render(d, name, msgs)
        fcntl.flock(f, fcntl.LOCK_UN)
    return msg["n"]


def open_questions(msgs, me=None):
    answered = {m["re"] for m in msgs if m["kind"] in ("answer", "result") and m.get("re")}
    qs = [m for m in msgs if m["kind"] == "question" and m["n"] not in answered]
    if me:
        qs = [m for m in qs if m.get("to") in (me, "all", None) and m["from"] != me]
    return qs


def _seen(d, name):
    p = _paths(d, name)[2]
    if os.path.exists(p):
        with open(p) as f:
            return json.load(f)
    return {}


def _mark(d, name, me, n):
    s = _seen(d, name)
    s[me] = max(n, s.get(me, 0))
    tmp = _paths(d, name)[2] + ".tmp"
    with open(tmp, "w") as f:
        json.dump(s, f)
    os.replace(tmp, _paths(d, name)[2])


def _show(m):
    to = f" -> {m['to']}" if m.get("to") and m["to"] != "all" else ""
    re_ = f" (re B{m['re']})" if m.get("re") else ""
    return f"B{m['n']} [{m['kind']}] {m['from']}{to}{re_} {m['time']}\n    {m['text']}"


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--board", required=True)
    p.add_argument("--dir", default=DIR, help=argparse.SUPPRESS)
    sub = p.add_subparsers(dest="cmd", required=True)
    o = sub.add_parser("open"); o.add_argument("text"); o.add_argument("--from", dest="frm", default="lead")
    po = sub.add_parser("post")
    po.add_argument("--from", dest="frm", required=True); po.add_argument("--kind", required=True, choices=KINDS[:7])
    po.add_argument("--to", default="all"); po.add_argument("--re", type=int); po.add_argument("text")
    r = sub.add_parser("read")
    r.add_argument("--me"); r.add_argument("--unread", action="store_true")
    r.add_argument("--since", type=int, default=0); r.add_argument("--thread", type=int)
    q = sub.add_parser("open-questions"); q.add_argument("--me")
    c = sub.add_parser("close"); c.add_argument("--from", dest="frm", required=True); c.add_argument("text")
    sub.add_parser("status")
    a = p.parse_args(argv)
    d = a.dir

    if a.cmd == "open":
        append(d, a.board, {"kind": "open", "from": a.frm, "to": "all", "text": " ".join(a.text.split())}, create=True)
        print(f"board '{a.board}' opened")
    elif a.cmd == "post":
        text = a.text.strip()
        if not text:
            sys.exit("empty message")
        if len(text) > MAXLEN:
            sys.exit(f"message too long ({len(text)} > {MAXLEN} characters): put the detail in a file and cite its path")
        if a.kind in NEEDS_RE and not a.re:
            sys.exit(f"a {a.kind} needs --re N (the message it replies to)")
        n = append(d, a.board, {"kind": a.kind, "from": a.frm, "to": a.to, "re": a.re, "text": text})
        print(f"posted B{n}")
    elif a.cmd == "close":
        append(d, a.board, {"kind": "close", "from": a.frm, "to": "all", "text": a.text.strip()})
        print("board closed")
    else:
        msgs = load(d, a.board)
        if a.cmd == "read":
            since = a.since
            if a.unread:
                if not a.me:
                    sys.exit("--unread needs --me ID")
                since = max(since, _seen(d, a.board).get(a.me, 0))
            sel = [m for m in msgs if m["n"] > since]
            if a.thread:
                ids = {a.thread}
                for m in msgs:
                    if m.get("re") in ids:
                        ids.add(m["n"])
                sel = [m for m in msgs if m["n"] in ids]
            for m in sel:
                print(_show(m))
            if a.me:
                mine = open_questions(msgs, a.me)
                mine = [m for m in mine if m.get("to") == a.me]
                if mine:
                    print("\nQUESTIONS ADDRESSED TO YOU, UNANSWERED: " + ", ".join(f"B{m['n']}" for m in mine))
                if msgs:
                    _mark(d, a.board, a.me, msgs[-1]["n"])
            if msgs and msgs[-1]["kind"] == "close":
                print("\nTHE BOARD IS CLOSED.")
        elif a.cmd == "open-questions":
            for m in open_questions(msgs, a.me):
                print(_show(m))
        elif a.cmd == "status":
            kinds = {}
            for m in msgs:
                kinds[m["kind"]] = kinds.get(m["kind"], 0) + 1
            who = sorted({m["from"] for m in msgs})
            print(f"{len(msgs)} messages; {kinds}; participants {who}; open questions {len(open_questions(msgs))}; "
                  f"{'CLOSED' if msgs and msgs[-1]['kind'] == 'close' else 'open'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
