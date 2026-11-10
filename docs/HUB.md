# HUB

One entry point. Goal of the workspace: **prove the Riemann Hypothesis.**

## Status (exact)
- Proof of RH: **not achieved.** Highest level reached: L1-minus (computed evidence, single implementation,
  not yet reproduced) for ideas #8, #9, #10. Nothing proved that is new.
- Infrastructure: built and tested (journal J1).
- Understanding experiments U-1 to U-5 run by the lead (`rh/UNDERSTANDING.md`); one classical lemma re-proved.
- Round 1 seminar: finished (journal J2). Verdict: good instruments, no route to a proof. Audit of agent ideas running.

## Projects
| project | brief | live state | review ledger |
|---|---|---|---|
| Riemann Hypothesis · start with [`rh/UNDERSTANDING.md`](../rh/UNDERSTANDING.md), then [`rh/KEY_LEMMA_SHAPE.md`](../rh/KEY_LEMMA_SHAPE.md); brainstorm in [`rh/NOTEBOOK.md`](../rh/NOTEBOOK.md) | [`rh/PROJECT_BRIEF.md`](../rh/PROJECT_BRIEF.md) | [`rh/RESUME_HERE.md`](../rh/RESUME_HERE.md) | [`rh/REVIEW_LEDGER.md`](../rh/REVIEW_LEDGER.md) |

## Structures that accumulate (owner, 2026-11-10)
| file | what | state |
|---|---|---|
| [`rh/THEORY.md`](../rh/THEORY.md) | lemmas with dependencies and statuses | `python3 tools/records.py theory check` / `tree` / `frontier` |
| [`rh/ATLAS.md`](../rh/ATLAS.md) | failure atlas: where each approach breaks, what it needs, what it supplies; pairs examined | `python3 tools/records.py atlas check` / `todo` |
| [`rh/FOOTHOLDS.md`](../rh/FOOTHOLDS.md) | provable nontrivial cases with a spreading mechanism | none yet |
| [`rh/BIGGER.md`](../rh/BIGGER.md) | what RH is a shadow of; base cases | none yet |
| [`rh/specialists/ROSTER.md`](../rh/specialists/ROSTER.md) | persistent specialist seats, one toolkit each | 4 chartered, 0 sessions |
| [`rh/board/`](../rh/board/) | Socratic seminar boards | S1 open |

## The record
| file | what |
|---|---|
| [`IDEAS.md`](IDEAS.md) | **the hub of the work**: the MAIN idea log (audited entries only), plain-English first, each with test and kill line |
| `rh/experiments/<job>/IDEAS_LOCAL.md` | each agent's own unreviewed idea log; `python3 tools/hubcheck.py` lists what still awaits audit |
| [`KNOWLEDGE.md`](KNOWLEDGE.md) | equivalents of RH, what is proved, barriers B1–B10 every idea must face |
| [`DECISIONS.md`](DECISIONS.md) | open decisions with the default in use |
| [`JOURNAL.md`](JOURNAL.md) | append-only record of finished jobs |
| [`AGENT_REGISTRY.tsv`](AGENT_REGISTRY.tsv) | every agent / workflow spawned |
| [`SUBAGENT_PREAMBLE.md`](SUBAGENT_PREAMBLE.md) | rules at the top of every agent brief |

## Idea board (keep in step with `python3 tools/ideas.py list`)
| status | ideas |
|---|---|
| testing | **#21 two positivities of one kernel: primes as the mirror spectrum, zeros as the shift spectrum** (built on round-2 results; 5 of 6 blind predictions hit; the bridge is unproved) · #1 control-group lab (instrument) · #8 first-failure window · **#9 bootstrap: positivity forces the primes and their positions** (core found in an unreviewed 2026 preprint) · #14 missing-prime law |
| alive (instruments and controls) | #12 theta-power dial (a family through ζ with off-line zeros at n = 1.4) · #17 zero-surgery controls · #19 pencil lab |
| open | #4 heat-flow particles · #5 Nyman–Beurling least squares · #7 one prime at a time · #13 the dial is rigid yet loses RH · #15 one price list for missing primes · #16 two-regime visibility law |
| parked | #10 arithmetic Lorentzian geometry (round 2: a certificate exists whenever positivity holds, so it is a reformulation; the one cubic with a formula loses a factor 2) · #2 truncated Weil positivity (already in the literature) · #6 Lee–Yang in Bohr's variables (owner rule 1) |
| killed (reason kept) | #11 prime jump process / curvature (structural factor 2; blind to the Beurling control; process picture already published) · #3 Li split (pure reformulation) · #18 horizon lemma (judge's counterexample: two regimes of visibility) · #20 one-gap reduction (hypothesis already contains RH) |

Round-1 audit: 33 agent ideas decided: 9 promoted (#12–#20), 20 merged into existing ideas as notes,
4 skipped (`rh/experiments/r1_audit/AUDIT.md`). `python3 tools/ideas.py check` lists 18 recorded rule failures.
Blind predictions by the lead so far (rule 4): 13 made, 10 hit, 3 missed on size; two hits had a wrong reason.

## Walls hit so far
- **W1 (convergence wall).** Every known family of approximants with all zeros real by construction converges
  to ξ only if RH-type information is supplied. Stated exactly in `rh/UNDERSTANDING.md` (U-4).
- **W2 (density wall).** At a first-failure window the zero-side sum Σ_ρ ψ̂(ρ) e^(−(ρ−1/2)x) vanishes on an
  interval, but this does not force ψ̂(ρ) = 0: the zeros are infinitely dense, so their exponentials are
  over-complete on every finite interval. A uniqueness argument on the zero side cannot close idea #8; the
  contradiction has to come from the prime side. Stated in `rh/KEY_LEMMA_SHAPE.md`.

- **WJ1–WJ13 (round-1 judge).** Thirteen walls stated exactly in `rh/experiments/r1_judge/verdict.json` and
  `JUDGEMENT.md`. The ones that bear on the live ideas: WJ1 (below its detection window nothing computed
  separates an impostor from ζ), WJ2 (any estimate must be accurate to exp(−4π e^(2L))), WJ13 (one positive
  eigenvalue is weaker than RH by one quartet).

## Literature access
Verified 2026-11-10: web search works and arXiv full text can be fetched (partly; long papers are truncated).
Papers checked so far are listed with what was read in `docs/KNOWLEDGE.md` section 7.

## Running jobs
**After any context summary or restart, read this section and `git log -5` before launching anything.**
- **Creation run 1** (workflow `rh-creation-1`, run `wf_0afb126a-9cf`, started 23:20): three seats with no
  lane, at least two hours each, no refuter (C1-blank: blank page / C1-inside: inside the project's
  understanding / C1-data: the raw numbers); then a screen that asks only "is it new" and "is it precise
  enough to compute". Folders `rh/experiments/c1_*`.
- **Round-2 verification track** (same run id as the old round 2, `wf_39b9c4a2-4ff`, resumed 23:30 as
  `rh-round2-verification`): the three finished seats cubic, curv, parity are kept; verifiers check their
  PROOFS and NUMBERS only (60 to 90 minutes); a judge reports which statements are proved and which numbers
  reproduced, with no ranking of ideas. The old round-2 free seat was withdrawn (it had a refuter and a
  0-10 judge waiting, which the owner's split forbids); its partial files are in `rh/experiments/r2_free`.
- **Socratic seminar S1** (board `rh/board/s1.md`, opened 23:50): five long-lived participants that are woken
  turn by turn with their memory intact: S1-socrates (moderator, asks only), S1-cubic, S1-curv, S1-parity
  (each speaks for a finished round-2 seat and answers its checker), S1-mirror (develops idea #21: proof of
  the criterion, the two-prime model). The lead runs the turns (wake each participant when the board has
  something for it) and closes the board with a summary. Folders `rh/experiments/s1_seminar/*`.
- **Standing seats** (persistent; each has a MEMORY.md in its folder; launched 00:05): K-theory (builds
  `rh/THEORY.md`), K-atlas (builds `rh/ATLAS.md` and runs the pairing job), FH (foothold hunt,
  `rh/FOOTHOLDS.md`), BG (bigger statement, `rh/BIGGER.md`). Specialists SP-reflection and SP-operator are
  chartered in `rh/specialists/ROSTER.md` and NOT yet started: they join seminar S1 at its second turn.
- **Formal checking is blocked** (decision D8): no proof assistant installed; installing Lean was refused
  by the permission classifier. No lemma is marked `formal`.
- Awaiting audit: ideas in the local logs of r2_cubic, r2_curv, r2_parity (and the creation seats when
  they finish). The auditor's test for created ideas is the two questions, not likelihood.

## Scheduled routines
None.

## Live pages
None.

## How to work here
    python3 -m pytest tests -q        # must pass before any commit
    python3 tools/hubcheck.py         # must print 0 errors before any commit
    python3 tools/ideas.py add ...    # record an idea the moment it comes up
