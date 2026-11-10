import os
import sys

import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
import records  # noqa: E402


@pytest.fixture
def th(tmp_path):
    p = tmp_path / "THEORY.md"
    p.write_text("# Theory\n\nintro\n")
    return str(p)


@pytest.fixture
def at(tmp_path):
    p = tmp_path / "ATLAS.md"
    p.write_text("# Atlas\n")
    return str(p)


def T(th, *a):
    return records.main(["theory", "--file", th] + list(a))


def A(at, *a):
    return records.main(["atlas", "--file", at] + list(a))


def test_theory_statuses_follow_dependencies(th, capsys):
    T(th, "add", "--name", "base", "--statement", "s1", "--proof", "p1.md")
    T(th, "add", "--name", "uses base", "--statement", "s2", "--depends", "T1", "--proof", "p2.md")
    T(th, "add", "--name", "target", "--statement", "s3", "--depends", "T2")
    items, errs = records.check("theory", th)
    assert errs == [] and [i["f"]["status"] for i in items] == ["proved", "proved", "open"]
    with pytest.raises(SystemExit) as e:                       # cannot be checked on an unchecked base
        T(th, "status", "T2", "checked", "verifier V")
    assert "refused" in str(e.value)
    assert records.parse("theory", th)[1][1]["f"]["status"] == "proved"      # rolled back
    T(th, "set", "T1", "checked by", "V")
    T(th, "status", "T1", "checked", "line by line")
    T(th, "set", "T2", "checked by", "V")
    assert T(th, "status", "T2", "checked", "ok") == 0
    capsys.readouterr()
    T(th, "frontier")
    assert "T3 target" in capsys.readouterr().out               # open, and everything under it is established
    T(th, "tree")
    out = capsys.readouterr().out
    assert out.index("T3 [open]") < out.index("  T2 [checked]") < out.index("    T1 [checked]")
    assert open(th).read().startswith("# Theory\n\nintro\n")


def test_theory_check_catches_bad_structure(th):
    T(th, "add", "--name", "a", "--statement", "s", "--depends", "T2")
    T(th, "add", "--name", "b", "--statement", "s", "--depends", "T1")
    errs = records.check("theory", th)[1]
    assert any("cycle" in e for e in errs)
    T(th, "set", "T2", "depends", "T9")
    assert any("does not exist" in e for e in records.check("theory", th)[1])
    for bad in (["status", "T1", "formal", "x"], ["status", "T1", "known", "x"], ["status", "T1", "nonsense", "x"],
                ["set", "T1", "status", "checked"], ["add", "--name", "no statement"]):
        with pytest.raises(SystemExit):
            T(th, *bad)


def test_atlas_pairs(at, capsys):
    for n in ("one", "two", "three"):
        A(at, "add", "--name", n, "--approach", "a", "--breaks", "b", "--needs", "x", "--supplies", "y", "--source", "s")
    A(at, "todo")
    assert capsys.readouterr().out.count(" x ") == 3
    A(at, "pair", "F3", "F1", "maybe", "what kills 3 is what 1 lacked")
    with pytest.raises(SystemExit):
        A(at, "pair", "F1", "F3", "no", "again")               # same pair, either order
    with pytest.raises(SystemExit):
        A(at, "pair", "F1", "F9", "no", "unknown")
    A(at, "todo")
    out = capsys.readouterr().out
    assert out.count(" x ") == 2 and "F1 x F3" not in out
    assert A(at, "check") == 0 and "1 of 3 pairs examined" in capsys.readouterr().out
    A(at, "add", "--name", "four", "--approach", "a", "--breaks", "b", "--needs", "x", "--supplies", "y", "--source", "s")
    assert len(records.parse("atlas", at)[1]) == 4 and "- F1 x F3 [maybe]" in open(at).read()   # pairs survive an add
    with pytest.raises(SystemExit):
        A(at, "add", "--name", "incomplete", "--approach", "a")
