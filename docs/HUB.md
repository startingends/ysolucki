# HUB

One entry point. Goal of the workspace: **prove the Riemann Hypothesis.**

## Status (exact)
- Proof of RH: **not achieved.** No result above level L0 yet (ladder in `rh/PROJECT_BRIEF.md`).
- Infrastructure: built and tested (journal J1).
- Understanding experiments U-1 to U-5 run by the lead (`rh/UNDERSTANDING.md`); one classical lemma re-proved.
- Round 1 seminar: running (see AGENT_REGISTRY).

## Projects
| project | brief | live state | review ledger |
|---|---|---|---|
| Riemann Hypothesis · start with [`rh/UNDERSTANDING.md`](../rh/UNDERSTANDING.md), then [`rh/KEY_LEMMA_SHAPE.md`](../rh/KEY_LEMMA_SHAPE.md); brainstorm in [`rh/NOTEBOOK.md`](../rh/NOTEBOOK.md) | [`rh/PROJECT_BRIEF.md`](../rh/PROJECT_BRIEF.md) | [`rh/RESUME_HERE.md`](../rh/RESUME_HERE.md) | [`rh/REVIEW_LEDGER.md`](../rh/REVIEW_LEDGER.md) |

## The record
| file | what |
|---|---|
| [`IDEAS.md`](IDEAS.md) | **the hub of the work**: numbered ideas, plain-English first, each with test and kill line |
| [`KNOWLEDGE.md`](KNOWLEDGE.md) | equivalents of RH, what is proved, barriers B1–B10 every idea must face |
| [`DECISIONS.md`](DECISIONS.md) | open decisions with the default in use |
| [`JOURNAL.md`](JOURNAL.md) | append-only record of finished jobs |
| [`AGENT_REGISTRY.tsv`](AGENT_REGISTRY.tsv) | every agent / workflow spawned |
| [`SUBAGENT_PREAMBLE.md`](SUBAGENT_PREAMBLE.md) | rules at the top of every agent brief |

## Idea board (keep in step with `python3 tools/ideas.py list`)
| status | ideas |
|---|---|
| open | #4 heat-flow particles · #5 Nyman–Beurling least squares · #7 one prime at a time · **#8 first-failure window** (designed to the key-lemma shape; blind prediction on record) |
| testing | #1 control-group lab (instrument) |
| alive | none |
| parked | #2 truncated Weil positivity (already in the literature; kept as laboratory) · #6 Lee–Yang in Bohr's variables (owner rule 1: a look-alike family with no escape from W1) |
| killed | #3 Li split (pure reformulation, and blind as evidence) |

Audit against the owner's six rules (2026-11-10): 10 rule failures are recorded in ideas #2 to #7
(`python3 tools/ideas.py check` lists them). Only #8 passes all six as written.

## Walls hit so far
- **W1 (convergence wall).** Every known family of approximants with all zeros real by construction converges
  to ξ only if RH-type information is supplied. Stated exactly in `rh/UNDERSTANDING.md` (U-4).
- **W2 (density wall).** At a first-failure window the zero-side sum Σ_ρ ψ̂(ρ) e^(−(ρ−1/2)x) vanishes on an
  interval, but this does not force ψ̂(ρ) = 0: the zeros are infinitely dense, so their exponentials are
  over-complete on every finite interval. A uniqueness argument on the zero side cannot close idea #8; the
  contradiction has to come from the prime side. Stated in `rh/KEY_LEMMA_SHAPE.md`.

## Literature access
Verified 2026-11-10: web search works and arXiv full text can be fetched (partly; long papers are truncated).
Papers checked so far are listed with what was read in `docs/KNOWLEDGE.md` section 7.

## Running jobs
None.

## Scheduled routines
None.

## Live pages
None.

## How to work here
    python3 -m pytest tests -q        # must pass before any commit
    python3 tools/hubcheck.py         # must print 0 errors before any commit
    python3 tools/ideas.py add ...    # record an idea the moment it comes up
