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
| [`rh/specialists/ROSTER.md`](../rh/specialists/ROSTER.md) | persistent specialist seats, one toolkit each | 4 chartered; SP-reflection and SP-operator in session 1 |
| [`rh/board/`](../rh/board/) | Socratic seminar boards | S1 open |
| [`rh/library/`](../rh/library/README.md) | whole papers read in full, for understanding only | 17 sources listed, none read whole yet |

## The record
| file | what |
|---|---|
| [`IDEAS.md`](IDEAS.md) | **the hub of the work**: the MAIN idea log (audited entries only), plain-English first, each with test and kill line |
| `rh/experiments/<job>/IDEAS_LOCAL.md` | each agent's own unreviewed idea log; `python3 tools/hubcheck.py` lists what still awaits audit |
| [`KNOWLEDGE.md`](KNOWLEDGE.md) | equivalents of RH, what is proved, barriers B1–B11 every idea must face |
| [`DECISIONS.md`](DECISIONS.md) | open decisions with the default in use |
| [`JOURNAL.md`](JOURNAL.md) | append-only record of finished jobs |
| [`AGENT_REGISTRY.tsv`](AGENT_REGISTRY.tsv) | every agent / workflow spawned |
| [`SUBAGENT_PREAMBLE.md`](SUBAGENT_PREAMBLE.md) | rules at the top of every agent brief |

## Idea board (keep in step with `python3 tools/ideas.py list`)
| status | ideas |
|---|---|
| testing | #1 control-group lab (instrument) · #8 first-failure window · **#9 bootstrap: positivity forces the primes and their positions** (core found in an unreviewed 2026 preprint) · #14 missing-prime law |
| alive (instruments and controls) | #12 theta-power dial (a family through ζ with off-line zeros at n = 1.4) · #17 zero-surgery controls · #19 pencil lab |
| open | #4 heat-flow particles · #5 Nyman–Beurling least squares · #7 one prime at a time · #13 the dial is rigid yet loses RH · #15 one price list for missing primes · #16 two-regime visibility law |
| parked | #10 arithmetic Lorentzian geometry (round 2: a certificate exists whenever positivity holds, so it is a reformulation; the one cubic with a formula loses a factor 2) · #2 truncated Weil positivity (already in the literature) · #6 Lee–Yang in Bohr's variables (owner rule 1) |
| killed (reason kept) | **#21 mirror positivity** (seminar S1: the bridge is false; counterexample ζ(s−d)ζ(s+d); everything assumed so far is blind to the twist n ↦ n^d: barrier B11) · #11 prime jump process / curvature (structural factor 2; blind to the Beurling control; process picture already published) · #3 Li split (pure reformulation) · #18 horizon lemma (judge's counterexample: two regimes of visibility) · #20 one-gap reduction (hypothesis already contains RH) |

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
The container restarted on 2026-11-11 at about 00:09. Disk, repository, Lean and the mathlib cache survived.
Most seats turned out to be still alive and received a "continue" message; two things were restarted.
- **Seminar S1** (board `rh/board/s1.md`), turn 2: S1-socrates (moderator), S1-cubic, S1-curv, S1-parity,
  S1-mirror, and the two specialists SP-reflection and SP-operator (first sessions). Open question after
  idea #21 was killed: every hypothesis used so far is blind to the twist n ↦ n^d (barrier B11); what,
  stated on the prime side, singles out d = 0?
- **Standing seats:** K-atlas (failure atlas and the pairing job), K-theory (theory document), FH (foothold
  hunt), BG (bigger statement), FORMAL (Lean; one Lean process at a time). Each was told to save its memory
  file as it goes; before the restart several had nothing on disk.
- **Reader seats** (new, owner's instruction A17): READER-1 and READER-2 read whole papers in full and write
  digests in `rh/library/` (background knowledge only, never a direction).
- **Verification track of round 2** (run `wf_39b9c4a2-4ff`): verifiers of all three seats have finished; the
  judge (proofs and numbers only) is running.
- **Creation run 1** (run `wf_0afb126a-9cf`): restarted from the beginning after the container restart; its
  three unlaned seats had left nothing on disk. At least two hours each, no refuter, then the two-question
  screen.
- Awaiting audit: 83 ideas in agents' local logs. Next audit after seminar turn 2.
- Load: every numerical job runs under `tools/memcap.py 1`; one Lean process at a time.

## Scheduled routines
None.

## Live pages
None.

## How to work here
    python3 -m pytest tests -q        # must pass before any commit
    python3 tools/hubcheck.py         # must print 0 errors before any commit
    python3 tools/ideas.py add ...    # record an idea the moment it comes up
