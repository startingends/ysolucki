# RESUME HERE: live state for a fresh session

_Last updated: 2026-11-10 (after J1, infrastructure)._

## Where we are
- Infra is built and tested. No research round has run yet.
- Five seed ideas are recorded (#1 to #5), all `open`, none tested.

## Next steps, in order
1. Run the round-1 seminar (lanes A–D in `PROJECT_BRIEF.md`): proposers → critics → judge.
   Each proposer gets `docs/SUBAGENT_PREAMBLE.md` + its lane + its own folder `rh/experiments/r1_<lane>/`.
2. Lead copies every agent idea into `docs/IDEAS.md` (numbered, plain English first), registers agents in
   `docs/AGENT_REGISTRY.tsv`, writes one journal entry.
3. Explain the most interesting ideas to the owner in plain English with an example; log any owner reply
   under the idea (`ideas.py note N "owner: ..."`).
4. Run the first tests named by the judge; update statuses; write any wall as an exact statement.
5. Round 2 starts from the idea log.

## Setup for a fresh container
    pip install -r requirements.txt
    python3 -m pytest tests -q && python3 tools/hubcheck.py
`rh/data/` is gitignored; `tools/rhlib.zeros(n)` rebuilds its cache on demand (1000 zeros: seconds).

## Open questions for the owner
See `docs/DECISIONS.md` (D1–D6, all running on defaults).
