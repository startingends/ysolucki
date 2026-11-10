import os
import subprocess
import sys

import pytest

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import hubcheck  # noqa: E402
import ideas  # noqa: E402

ADD = ["add", "--title", "T", "--source", "lead", "--plain", "p", "--claim", "c", "--test", "t", "--kill", "k",
       "--wall", "W1: because", "--newinput", "i", "--prediction", "x = 3 (impostor: 7)", "--smallest", "s",
       "--novelty", "searched: q"]


@pytest.fixture
def f(tmp_path):
    p = tmp_path / "IDEAS.md"
    p.write_text("# Ideas\n\nintro text\n")
    return str(p)


def test_add_numbers_sequentially_and_keeps_intro(f):
    for _ in range(3):
        assert ideas.main(["--file", f] + ADD) == 0
    _, its = ideas.parse(f)
    assert [i["n"] for i in its] == [1, 2, 3]
    assert open(f).read().startswith("# Ideas\n\nintro text\n")
    assert ideas.check(f)[1] == []


def test_multiline_input_cannot_break_the_format(f):
    ideas.main(["--file", f, "add", "--title", "a\n## #99 · fake", "--source", "s", "--plain", "p", "--claim", "x\n- status: killed",
                "--test", "t", "--kill", "k", "--wall", "w", "--newinput", "i", "--prediction", "p", "--smallest", "s",
                "--novelty", "n"])
    _, its = ideas.parse(f)
    assert len(its) == 1 and its[0]["fields"]["status"] == "open"


def test_note_and_status_land_in_the_right_idea(f):
    ideas.main(["--file", f] + ADD)
    ideas.main(["--file", f] + ADD)
    ideas.main(["--file", f, "note", "1", "first note"])
    ideas.main(["--file", f, "status", "1", "killed", "hit kill line"])
    lines, its = ideas.parse(f)
    one = "\n".join(lines[its[0]["start"]:its[0]["end"]])
    two = "\n".join(lines[its[1]["start"]:its[1]["end"]])
    assert "first note" in one and "status -> killed: hit kill line" in one
    assert "first note" not in two and its[1]["fields"]["status"] == "open"
    assert its[0]["fields"]["status"] == "killed"
    assert ideas.check(f)[1] == []


def test_check_catches_gaps_missing_fields_bad_status(f):
    with open(f, "a") as fh:
        fh.write("\n## #2 · gap\n- status: nonsense\n- source: x\n")
    errs = ideas.check(f)[1]
    assert any("missing 'plain english'" in e for e in errs)
    assert any("numbers must run" in e for e in errs)
    assert any("missing 'claim'" in e for e in errs)
    assert any("bad status" in e for e in errs)
    assert ideas.main(["--file", f, "check"]) == 1


def test_bad_status_and_unknown_idea_are_refused(f):
    ideas.main(["--file", f] + ADD)
    with pytest.raises(SystemExit):
        ideas.main(["--file", f, "status", "1", "maybe", "x"])
    with pytest.raises(SystemExit):
        ideas.main(["--file", f, "note", "7", "x"])


def test_real_hub_is_consistent():
    assert hubcheck.main() == 0


def test_hubcheck_flags_dangling_idea_reference(tmp_path):
    for rel in hubcheck.REQUIRED:
        p = tmp_path / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text("")
    (tmp_path / "docs/AGENT_REGISTRY.tsv").write_text("\t".join(hubcheck.REG_COLS) + "\nA1\t2026-01-01\tr\tm\tf\tbogus\tx\n")
    (tmp_path / "docs/HUB.md").write_text("see #5 and PR startingends/ysolucki#3\n")
    assert hubcheck.main(str(tmp_path)) == 1


def test_memcap_kills_runaway_and_passes_normal():
    mc = os.path.join(ROOT, "tools", "memcap.py")
    ok = subprocess.run([sys.executable, mc, "2", sys.executable, "-c", "print('fine')"], capture_output=True, text=True)
    assert ok.returncode == 0 and "fine" in ok.stdout
    hog = subprocess.run([sys.executable, mc, "0.5", sys.executable, "-c", "x = bytearray(3 * 1024**3)"],
                         capture_output=True, text=True)
    assert hog.returncode != 0 and "MemoryError" in hog.stderr
    assert subprocess.run([sys.executable, mc, "abc", "true"], capture_output=True).returncode != 0


def test_owner_rule_fields_are_required_and_settable(f):
    with open(f, "a") as fh:  # an idea in the old format, before the owner's rules
        fh.write("\n## #1 · old\n- status: open\n- source: x\n- date: 2026-01-01\n- plain english: p\n- claim: c\n"
                 "- first test: t\n- kill line: k\n- evidence: e\n- log:\n")
    errs = ideas.check(f)[1]
    for field in ("wall", "new input", "prediction", "smallest", "novelty"):
        assert any(f"missing '{field}'" in e for e in errs)
        ideas.main(["--file", f, "set", "1", field, "FAILS RULE: none" if field == "wall" else "v"])
    assert ideas.check(f)[1] == []
    lines, its = ideas.parse(f)
    body = [ln.split(":")[0] for ln in lines[its[0]["start"] + 1:its[0]["end"]] if ln.startswith("- ")]
    assert body.index("- wall") < body.index("- claim") < body.index("- prediction") < body.index("- novelty") < body.index("- evidence")
    ideas.main(["--file", f, "set", "1", "wall", "W1: replaced"])  # replace, not duplicate
    assert open(f).read().count("- wall:") == 1 and "W1: replaced" in open(f).read()
    with pytest.raises(SystemExit):
        ideas.main(["--file", f, "set", "1", "status", "alive"])


def test_local_log_is_frictionless_and_separate(tmp_path, f):
    folder = str(tmp_path / "job")
    ideas.main(["init-local", folder, "R9-X"])
    lp = os.path.join(folder, ideas.LOCAL_NAME)
    assert ideas.local_owner(lp) == "R9-X" and ideas.local_owner(f) is None
    assert ideas.main(["--file", lp, "add", "--title", "half a thought"]) == 0       # title alone is enough
    assert ideas.main(["--file", lp, "add", "--title", "second", "--claim", "c"]) == 0
    assert ideas.check(lp)[1] == []
    assert "do not read or cite" in open(lp).read()
    with pytest.raises(SystemExit):                                                   # the main log stays strict
        ideas.main(["--file", f, "add", "--title", "half a thought"])
    with pytest.raises(SystemExit):
        ideas.main(["init-local", folder, "R9-X"])                                    # never overwrite
    with pytest.raises(SystemExit):
        ideas.main(["init-local", str(tmp_path / "j2"), "bad id"])


def test_promotion_needs_every_field_then_copies_and_marks(tmp_path, f):
    folder = str(tmp_path / "job")
    ideas.main(["init-local", folder, "R9-X"])
    lp = os.path.join(folder, ideas.LOCAL_NAME)
    ideas.main(["--file", lp, "add", "--title", "raw", "--claim", "c"])
    ideas.main(["--file", lp, "note", "1", "tried it, looked promising"])
    ideas.main(["--file", f] + ADD)                                                   # main already has #1
    with pytest.raises(SystemExit) as e:
        ideas.main(["--file", f, "promote", "--from", lp, "1", "--auditor", "AUD"])
    assert "plain english" in str(e.value) and "novelty" in str(e.value)
    assert len(ideas.parse(f)[1]) == 1                                                # nothing was written
    for field in ("plain english", "wall", "new input", "prediction", "smallest", "first test", "kill line", "novelty"):
        ideas.main(["--file", lp, "set", "1", field, "v"])
    assert ideas.audit_state(lp) == (1, [1])
    ideas.main(["--file", f, "promote", "--from", lp, "1", "--auditor", "AUD"])
    _, its = ideas.parse(f)
    assert [i["n"] for i in its] == [1, 2] and its[1]["title"] == "raw"
    assert "promoted from R9-X/#1 by AUD" in its[1]["fields"]["source"]
    assert "tried it, looked promising" in open(f).read()
    assert ideas.check(f)[1] == [] and ideas.audit_state(lp) == (1, [])
    assert "promoted to main #2 by AUD" in open(lp).read()
    with pytest.raises(SystemExit):                                                   # no double promotion
        ideas.main(["--file", f, "promote", "--from", lp, "1", "--auditor", "AUD"])
    with pytest.raises(SystemExit):                                                   # main -> main is refused
        ideas.main(["--file", f, "promote", "--from", f, "1", "--auditor", "AUD"])


def test_skip_records_the_auditors_decision(tmp_path):
    folder = str(tmp_path / "job")
    ideas.main(["init-local", folder, "R9-X"])
    lp = os.path.join(folder, ideas.LOCAL_NAME)
    ideas.main(["--file", lp, "add", "--title", "a"])
    ideas.main(["--file", lp, "add", "--title", "b"])
    ideas.main(["--file", lp, "skip", "1", "restates main #2"])
    assert ideas.audit_state(lp) == (2, [2])
    assert "audit: not promoted: restates main #2" in open(lp).read()


def test_hubcheck_reports_local_logs(tmp_path, capsys):
    for rel in hubcheck.REQUIRED:
        q = tmp_path / rel
        q.parent.mkdir(parents=True, exist_ok=True)
        q.write_text("")
    (tmp_path / "docs/AGENT_REGISTRY.tsv").write_text("\t".join(hubcheck.REG_COLS) + "\n")
    ideas.main(["init-local", str(tmp_path / "rh/experiments/j"), "R9-X"])
    ideas.main(["--file", str(tmp_path / "rh/experiments/j" / ideas.LOCAL_NAME), "add", "--title", "a"])
    assert hubcheck.main(str(tmp_path)) == 0
    out = capsys.readouterr().out
    assert "awaiting audit" in out and "R9-X/#1" in out and "1 in agents' local logs (1 awaiting audit)" in out
