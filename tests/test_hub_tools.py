import os
import subprocess
import sys

import pytest

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, os.path.join(ROOT, "tools"))
import hubcheck  # noqa: E402
import ideas  # noqa: E402

ADD = ["add", "--title", "T", "--source", "lead", "--plain", "p", "--claim", "c", "--test", "t", "--kill", "k"]


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
                "--test", "t", "--kill", "k"])
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
