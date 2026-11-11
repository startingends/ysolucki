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

## The bridge (owner's rule 12)
`rh/BRIDGE.md`. **Bridge 1 (idea #27) has been built as far as it goes and does not reach the island.** Planks 1–7
confirmed (the tiny eigenvalues, their explicit vectors, their constant ≈ 2L per unit of leak, the change of
variable that removes the primes; a whole-space comparison Q ≍ D by two implementations on small windows). Then three
confirmations failed where it mattered: the impostor shares the whole ladder (plank 9), no level descends before
its failure (plank 10), no oscillation in the ratio (plank 12). Conclusion: the ladder is a property of the functional
equation; RH is decided in the bulk below the band edge c = 2π e^(2L) (Montgomery's line: window length = log of the
height), where correlations of primes enter; nothing in bridge 1 uses the Euler product. The next bridge must aim at
the bulk with an input the impostor lacks (0 ≤ Λ ≤ log, prime-power support) together with the functional equation.
No such hunch is formulated yet. Still out: the foothold seat's whole-space pencil at L = 0.65–1.0, SP-operator on
the exact identity, S1-parity's reproduction, SP-modular.

## Idea board (keep in step with `python3 tools/ideas.py list`)
| status | ideas |
|---|---|
| testing | #1 control-group lab (instrument) · #8 first-failure window · **#9 bootstrap: positivity forces the primes and their positions** (core found in an unreviewed 2026 preprint) · #14 missing-prime law |
| alive (instruments and controls) | #12 theta-power dial (a family through ζ with off-line zeros at n = 1.4) · #17 zero-surgery controls · #19 pencil lab |
| open | #4 heat-flow particles · #5 Nyman–Beurling least squares · #7 one prime at a time · #13 the dial is rigid yet loses RH · #15 one price list for missing primes · #16 two-regime visibility law |
| parked | #10 arithmetic Lorentzian geometry (round 2: a certificate exists whenever positivity holds, so it is a reformulation; the one cubic with a formula loses a factor 2) · #2 truncated Weil positivity (already in the literature) · #6 Lee–Yang in Bohr's variables (owner rule 1) |
| killed (reason kept) | **#21 mirror positivity** (seminar S1: the bridge is false; counterexample ζ(s−d)ζ(s+d); everything assumed so far is blind to the twist n ↦ n^d: barrier B11) · #11 prime jump process / curvature (structural factor 2; blind to the Beurling control; process picture already published) · #3 Li split (pure reformulation) · #18 horizon lemma (judge's counterexample: two regimes of visibility) · #20 one-gap reduction (hypothesis already contains RH) |

Round-3 audit (2026-11-11, `rh/experiments/r3_audit/AUDIT.md`): 94 local ideas decided: 6 promoted (#28–#33), 86 merged,
2 skipped. New: **#28** nodeless odd minimiser + copositivity (open) · **#29** critical vector of one sign, candidate (F)
(open) · **#30** convex body of positive solutions, zeta at its corner (open) · **#31** defect function Dfc on the
modular surface (parked: ends as Nyman–Beurling for ζ_K) · **#32** sparse-family Vaughan is zero-density, never
exclusion (parked: the S2 wall in proved form) · **#33** one family joining the positive control to the Weil blocks
(open, an instrument). And **#34 (lead): the short-family wall**, five routes, one wall (alive, used as a filter).

Round-2 audit (2026-11-11, `rh/experiments/r2_audit/AUDIT.md`): 65 agent ideas decided: 5 promoted, 56 merged,
4 skipped. New in the main log: **#22** exact negative-index theorem (alive; a dictionary) · **#23** exact inertia
relation between N and Q per parity block (alive) · **#24** certificate = lossless Bochner, the Bakry–Émery cubic
(parked) · **#25** conjecture: the least degree of a polynomial certificate diverges as the margin closes (open) ·
**#26** the dial property as infinite divisibility of the scale law of θⁿ (open; twenty minutes of unreviewed work).
**#27 (lead, 2026-11-11, open): relative positivity.** Compare the Weil form with the explicit band-limiting
defect, which has the same tiny size for free; the claim would have a constant factor of room where every other
route needs hundreds of digits. Known at the archimedean place (Connes–Consani 2006.13771 Thm 1); the paper nearest
to the case with primes (2511.22755) is being read. Blind prediction recorded in the idea.
Atlas (30 failures, 435 pairs): one pairing found where a failure's missing SIGN is supplied by another
(F22×F30, board B188): if the odd-block minimiser is one-signed, RH is the odd inequality on positive functions only,
where the prime mirror term that killed idea #21 is non-negative term by term. A restatement until one half is proved.
Still awaiting audit: the seminar's, specialists', atlas and foothold logs (after S1 closes).
Lead's blind predictions since: e22 two of three missed; the bracket of N39 is predicted on the board (B186).

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
**After any context summary or restart, read this section, `rh/NOTEBOOK.md` from N43 on, `rh/HUNCHES.md` parts F–G and
`git log -8` before launching anything.** State at 2026-11-11 (after N80).
- RUNNING (construction rounds, rules 14–15): SP-operator session 3 = the one-object seat on H-1, the local Weil
  discriminant (`rh/specialists/operator/LOCAL_DISCRIMINANT.md`); SP-modular on H-2, local parameters
  (`rh/specialists/modular/LOCAL_PARAMETERS.md`). Read `rh/CORE.md` and `rh/RATINGS.md` before anything else.
  All other seats idle and resumable by id (SP-reflection, SP-modular, SP-sieve; S1-parity, S1-mirror, S1-socrates;
  K-theory, K-atlas, FH, FORMAL; readers 1–9; verifiers V-FH, V-COPY, V-CUB).
- Bridge 1's last gap closed (plank 13, N80): κ_min warns before the impostor's failure but tracks the closest zero
  pair for zeta too; rule H11 (no uniform margin; statements must be tight along Lehmer pairs).
- Since 02:15 (structural mode): the wall named and reached by eight routes (#34; N49–N79); seminars S2 and S3 closed;
  the copy barrier proved, verified and its cores formal (T106–T114); the October architecture's binding parameter
  found (N73) and the only candidate improvement (0.8136) refuted by an adversarial verifier (N78). Theory document:
  128 entries, 9 formal, 56 checked. No route to RH.
- Creation seats: off (D10, A19). Load: numerical jobs under `tools/memcap.py 1`; one Lean process at a time.

## Scheduled routines
None.

## Live pages
None.

## How to work here
    python3 -m pytest tests -q        # must pass before any commit
    python3 tools/hubcheck.py         # must print 0 errors before any commit
    python3 tools/ideas.py add ...    # record an idea the moment it comes up
