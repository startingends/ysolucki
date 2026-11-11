import os
import subprocess
import sys

import pytest

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import board  # noqa: E402


def run(d, *args):
    return board.main(["--board", "t", "--dir", str(d)] + list(args))


def test_open_post_read_thread(tmp_path, capsys):
    run(tmp_path, "open", "what is the object?")
    run(tmp_path, "post", "--from", "A", "--kind", "claim", "X is a Gram matrix. PROVED")
    run(tmp_path, "post", "--from", "S", "--kind", "question", "--to", "A", "--re", "2", "Gram matrix of which vectors?")
    capsys.readouterr()
    run(tmp_path, "read", "--me", "A", "--unread")
    out = capsys.readouterr().out
    assert "B2 [claim] A" in out and "B3 [question] S -> A (re B2)" in out
    assert "QUESTIONS ADDRESSED TO YOU, UNANSWERED: B3" in out
    run(tmp_path, "read", "--me", "A", "--unread")
    assert "B3 [question]" not in capsys.readouterr().out.split("QUESTIONS")[0]      # nothing new the second time
    run(tmp_path, "post", "--from", "A", "--kind", "answer", "--re", "3", "of the vectors v_p")
    run(tmp_path, "open-questions")
    assert capsys.readouterr().out.strip().endswith("") and board.open_questions(board.load(str(tmp_path), "t")) == []
    md = open(os.path.join(tmp_path, "t.md")).read()
    assert "**B4** · answer · from `A` · re B3" in md and "Topic: what is the object?" in md


def test_ask_before_you_object(tmp_path):
    run(tmp_path, "open", "topic")
    run(tmp_path, "post", "--from", "A", "--kind", "claim", "lemma L holds")
    with pytest.raises(SystemExit) as e:
        run(tmp_path, "post", "--from", "B", "--kind", "objection", "--re", "2", "line 3 is wrong")
    assert "ask before you object" in str(e.value)
    run(tmp_path, "post", "--from", "B", "--kind", "question", "--re", "2", "why does line 3 follow?")
    assert run(tmp_path, "post", "--from", "B", "--kind", "objection", "--re", "2", "line 3 fails for n = 4") == 0


def test_format_rules(tmp_path):
    run(tmp_path, "open", "topic")
    run(tmp_path, "post", "--from", "A", "--kind", "note", "hello")
    for bad in (["post", "--from", "B", "--kind", "answer", "no target"],                 # needs --re
                ["post", "--from", "B", "--kind", "answer", "--re", "2", "x"],            # answer to a non-question
                ["post", "--from", "B", "--kind", "question", "--re", "99", "x"],         # unknown target
                ["post", "--from", "B", "--kind", "note", "x" * 5000],                    # too long
                ["post", "--from", "B", "--kind", "note", "   "],                         # empty
                ["open", "again"]):                                                       # already exists
        with pytest.raises(SystemExit):
            run(tmp_path, *bad)
    assert len(board.load(str(tmp_path), "t")) == 2


def test_close_stops_posting(tmp_path, capsys):
    run(tmp_path, "open", "topic")
    run(tmp_path, "close", "--from", "S", "we stop here")
    with pytest.raises(SystemExit):
        run(tmp_path, "post", "--from", "A", "--kind", "note", "late")
    run(tmp_path, "read")
    assert "THE BOARD IS CLOSED" in capsys.readouterr().out


def test_concurrent_posts_get_distinct_numbers(tmp_path):
    run(tmp_path, "open", "topic")
    tool = os.path.join(ROOT, "tools", "board.py")
    procs = [subprocess.Popen([sys.executable, tool, "--board", "t", "--dir", str(tmp_path), "post", "--from", f"A{i}",
                               "--kind", "note", f"message {i}"], stdout=subprocess.DEVNULL) for i in range(12)]
    assert all(p.wait() == 0 for p in procs)
    msgs = board.load(str(tmp_path), "t")
    assert [m["n"] for m in msgs] == list(range(1, 14))
    assert {m["text"] for m in msgs[1:]} == {f"message {i}" for i in range(12)}
