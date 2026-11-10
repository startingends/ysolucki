# ysolucki

Research workspace for a sustained, multi-agent attack on the Riemann Hypothesis.
**Goal: a proof.** Individual ideas get killed; the goal does not.

**Start at [`docs/HUB.md`](docs/HUB.md).**

Status is always stated exactly: what is proven, what is numerically supported, what is
conjecture. The repo holds a numbered idea log, a map of known barriers every idea must
clear, reproducible numerical experiments, and a record of which ideas died and why
(so a wall becomes a signpost for the next attempt).

    pip install -r requirements.txt
    python3 -m pytest tests -q            # toolkit regression tests
    python3 tools/ideas.py list           # idea backlog
    python3 tools/hubcheck.py             # hub consistency check
