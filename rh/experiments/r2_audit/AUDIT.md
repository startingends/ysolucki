# Round 2 idea audit (auditor R2-AUD, 2026-11-11)

Scope: the eight round-2 local idea logs (seats parity, cubic, curv and their checkers; the free seat; the judge).
65 local entries, every one decided.
Result: **5 promoted** (main #22-#26), **56 merged** as dated notes into main entries, **4 skipped**.
Main log before: 21 ideas. After: 26 ideas, `ideas.py check` 0 errors, `hubcheck.py` 0 errors. No line of the main
log was removed or changed outside the tool; ideas #1-#21 received log notes only (their fields and statuses are
untouched). Nothing was committed by me. Logs under `rh/experiments/s1_seminar/` and `rh/specialists/` were not opened.

Decisions: **P** promoted · **M** merged into a main idea (a dated note on that idea; local entry closed with
"merged into main #K") · **S** skipped (reason in the local log).

Sources used for facts: `rh/experiments/r2_judge/JUDGEMENT.md` (authoritative for proofs and numbers), the seats'
and checkers' PROGRESS.md and PROOF files, `rh/THEORY.md` (T26-T81: the theory keeper has already entered every
round-2 lemma with its status), `docs/JOURNAL.md` J4 and the digests in `rh/library/`. I re-judged nothing.

Why only five promotions. Round 2's proved lemmas already have a home with statuses in `rh/THEORY.md`, so the main
idea log needs the ideas and the pointers, not the lemmas. Most round-2 entries are results that test ideas #8 to
#11 and #21, or corrections to them, or attempts that died; those are merged into the idea they test, with the
reason stated as mathematics. An entry got its own number only if a later run would refer to it by itself.

## Every local entry

| local entry | title (short) | decision | main # | reason (one line) |
|---|---|---|---|---|
| R2-parity/#1 | Exact negative-index theorem (Theorem 4, corollaries) | **P** | **#22** alive | Proved and checked (seat, checker, judge; kill test J17 not met). A dictionary, not a route. Total count in print in substance; per-block count not found; Bombieri 2000 and Yoshida 1992 unread |
| R2-parity/#2 | Computed feasible sets are outer approximations | M | #9 | Proved, trivial; every interval of #9 is an outer bound and shrinks about 17% between bases; wall WP4 |
| R2-parity/#3 | Position of the first prime is an interval, 2 at its left edge | M | #9 | Judge: interval inside (1.9996, 2.0080); the seat's right end 2.0085 not reproduced; most room near 2.0075; edge question kept |
| R2-parity/#4 | Joint feasible set at L = 1 is a simplex, bulge 1.6 | M | #9 | Computed in two lattices, 8 of 26 patterns reproduced by the checker; answers #9's open caveat (no long direction) |
| R2-parity/#5 | lambda(L) non-increasing; first-failure template | M | #8 | Proved; existence half in print (Suzuki p. 2 and after Thm 1.3; Yoshida 1992 Thm 2); corrects #8's novelty field; walls WP2, T40, T41 named |
| R2-parity/#6 | Background without primes fails first in the odd block | M | #9 | Reproduced: sign change in (0.370, 0.375), odd block; even block positive to 0.40; corrects the lead's 0.362 |
| R2-parity/#7 | Wall WP1: the signature of N cannot give RH | M | #23 | Judge: a gap, not a theorem (no one-quartet configuration with one positive direction exhibited); its exact form is the open converse T81 |
| R2-parity/#8 | Theorem U: under RH no atomic perturbation keeps positivity on all of R | M | #9 | Proved conditional on RH; uses nothing arithmetic; false on single windows; presumed folklore; makes #9's wall precise |
| R2-parity-ref/#1 | Position scan: even/odd crossing, kink near 2.0076 | M | #9 | Computed detail of the position interval; the third active constraint is not identified |
| R2-parity-ref/#2 | Exact feasible end points by generalised eigenvalues | M | #9 | Tool (linear algebra); gives [-1.2504e-13, +1.8239e-14] for the weight at 6 and a one-vector certificate of infeasibility |
| R2-parity-ref/#3 | One-line proof that Theorem U fails on a single window | M | #9 | Closes the gap the judge found in Theorem U's scope item (T44) |
| R2-parity-ref/#4 | Monotonicity of lambda(L) needs no domain assumption | M | #8 | Immediate from Suzuki Cor. 1.2 (read); part of the template note |
| R2-parity-ref/#5 | "One parity block suffices" is Yoshida 1992 Prop. 1 | M | #22 | Citation (via Suzuki p. 2, read by checker and judge); the seat had it as not found |
| R2-cubic/#1 | Fibre classes: Ntilde has one positive eigenvalue iff window positivity | M | #23 | Proved, known (Schur-complement inertia; Weil's Hodge-index picture); it is the indicator-free companion of #23's identity |
| R2-cubic/#2 | Trickle-down with negative diagonal (Lemma B) | M | #10 | Proved and IN PRINT: Braenden-Leake 2304.13203 Lemma 2.8 at degree 3 |
| R2-cubic/#3 | Cone certificate / vacuity (Lemma C) | M | #10 | Proved, not found in print; it is the result that parked #10 and is already #10's status reason and THEORY T52, so it is merged there with the judge's verdict rather than given a number |
| R2-cubic/#4 | Rigidity: null vectors are lineality directions (Lemmas D, E) | M | #10 | Proved, elementary; D3 is Braenden-Huh Lemma 2.15; the "6e-30" sentence is an extrapolation (judge) |
| R2-cubic/#5 | Product cubic <f^2, N f> | M | #24 | Killed by the seat: slices have 11 positive eigenvalues of 12 (they contain diag(N e_k) >= 0) |
| R2-cubic/#6 | Certificate with T >= 0 on distinct triples | M | #10 | Exists for zeta and equally for a positive-window Beurling control: no discrimination |
| R2-cubic/#7 | Certificate = Bochner; the Bakry-Emery cubic (Theorem F) | **P** | **#24** parked | Proved and checked; "still only ours" (J4). Ideas #10 and #11 are one mechanism; the canonical cubic loses a factor 2 and is blind to the control |
| R2-cubic/#8 | Locality radius R* | M | #10 | Computed R* = n-1 (maximally non-local), but the infeasibility slack shrinks with refinement; proved only at radius 0 |
| R2-cubic/#9 | Mean-field-exact family Theta_t | M | #24 | No t works (best -0.018 at t = 0.014 on a fine grid; the seat's 0.05 was a grid artefact); same for the control |
| R2-cubic/#10 | Conjecture: least chain-degree d* diverges as the margin closes | **P** | **#25** open | The one live proposal of the seat: not found in the record, and precise enough to compute (degree 1 fails, degree 2 exists) |
| R2-cubic/#11 | Dimension-corrected CD(rho, n) | M | #24 | Killed; exact constant 1/2 - 2/n + (1 + 2/n)/m (judge); the title's bound is wrong as written |
| R2-cubic/#12 | Function-field reading: triple intersection on C x C x C | S | - | Not precise enough to compute: no object named on the number-field side; "not developed" (seat) |
| R2-cubic-ref/#1 | Lemma B is Braenden-Leake Lemma 2.8 | M | #10 | Citation; its ancestor is a Bochner-method proof of Alexandrov-Fenchel |
| R2-cubic-ref/#2 | Robust test for a cubic certificate (margin on the complement of a) | M | #10 | Tool; replaces the seat's 1e-12 evidence by margins 1.19e-3, 4.6e-4, 2.6e-4 (used in #25) |
| R2-cubic-ref/#3 | Locality slack shrinks with n | M | #10 | Qualifies R2-cubic/#8: persistence for fine boxes is not settled |
| R2-cubic-ref/#4 | 1/2 + 1/m on the resampling chain is a two-line proof | M | #24 | Proof of the factor 2 for the model; also gives the CD(rho, n) constant |
| R2-cubic-ref/#5 | Validator of box builders by a sum over 20000 zeros | M | #2 | Reusable laboratory tool (2 seconds); closed a validation gap of seat cubic |
| R2-curv/#1 | Parity-block ground-state identity (Theorem A) | M | #23 | Gap (needs lambda_1 > 0, false for L <= 0.10); repaired, it is the case kappa_-(Q) = 0 of #23; a reformulation |
| R2-curv/#2 | Bochner formula for the prime jump process (Theorem B) | M | #11 | Proved; the conclusion "deficit at the window edge" is refuted by the judge's numbers |
| R2-curv/#3 | Selberg's identity inside Gamma_2 (B4) | M | #11 | Proved, trivial, not used for anything |
| R2-curv/#4 | Reflection positivity on integers >= 2 (Theorem D) | M | #21 | Proved, two lines; it is the source of #21's first input; the "two reflections" reading was corrected |
| R2-curv/#5 | Bakry-Emery is lossy by about a factor 2 | M | #11 | Prediction hit; proved for the resampling model only; for the prime chain the constant is computed and is not 1/2 |
| R2-curv/#6 | Calibrated Bakry-Emery | M | #11 | 0.792 against 0.769 for the control: blind; the general calibration is equivalent to the gap (reformulation) |
| R2-curv/#7 | Per-site negative index of Gamma_2 - lambda_1 Gamma | M | #11 | Seat's own kill line met at 160 boxes (4 of 160 sites; control 0 of 160) |
| R2-curv/#8 | Exact calibration as a certificate | M | #11 | Full rank, no visible formula in the one normalisation tried; checked by nobody |
| R2-curv-ref/#1 | Sum-rule margin is a determinant ratio | M | #23 | Proved, known (matrix determinant lemma); the "sum rule" is the lowest Weil eigenvalue in disguise |
| R2-curv-ref/#2 | Open-path term raises the Bakry-Emery constant | M | #11 | Refutes wall W-curv-5 as worded (0.5222 with the edge term, 0.2405 without) |
| R2-curv-ref/#3 | Per-site index dies under refinement | M | #11 | The numbers that meet R2-curv/#7's kill line |
| R2-curv-ref/#4 | One common reflection on the integer lattice | M | #21 | Proved (termwise); already #21's input (1); the open "largest set S" question is recorded there |
| R2-curv-ref/#5 | Theorem C is Schmuckenschlaeger 1998 | M | #11 | Citation (checker read about 60 lines; judge did not open it) |
| R2-curv-ref/#6 | Centre value does not tend to 1/2; infinite activity | M | #11 | 0.5513 ... 0.4908 at 20 to 320 boxes, still falling; total rate grows by log 2 per doubling |
| R2-curv-ref/#7 | Theorem A needs lambda_1 > 0 | M | #23 | The gap and its repair (counterexample at L = 0.10) |
| R2-curv-ref/#8 | Impostor and dial controls reproduced | M | #11 | 5.51% and 14.62% negative box couplings; #11's prediction (iii) missed on the number |
| R2-curv-ref/#9 | Exact calibration exists iff gap >= rho | M | #11 | Converse missing from the seat's file; proved by the checker (T66) |
| R2-curv-ref/#10 | Ollivier and Dobrushin numbers reproduced | M | #11 | Reproduced by a closed formula (not by the judge); Ollivier diverges under refinement |
| R2-free/#1 | Dial property = infinite divisibility; the set M | **P** | **#26** open | Not found in the record (unsearched), precise and computed: couplings all >= 0 only at n = 1, 2, 8 up to 14. Twenty minutes of work, no checker |
| R2-free/#2 | Wallach set of theta (all coefficients >= 0) | M | #26 | Same object, weaker condition (S contains M); passes both tests and is kept in full inside #26 |
| R2-free/#3 | Three-window determinant detector | M | #1 | Killed by logic: implied by positivity of the big window, so it can neither detect earlier nor imply more |
| R2-free/#4 | Hadamard infinite divisibility of the zero-side kernel | S | - | Killed on a heuristic before anything was defined or computed; no parent idea |
| R2-judge/#1 | Weight at 6: upper end from the even block, lower from the odd | M | #9 | Computed (J12): [-1.2504e-13, +1.8239e-14] |
| R2-judge/#2 | The lead's 0.362 interpolates across two parity blocks | M | #9 | Correction; the odd block crosses near 0.372 |
| R2-judge/#3 | Process: typed clock stamps ran ahead of the system clock | S | - | Process recommendation, not a mathematical idea; passed to the lead below |
| R2-judge/#4 | Raw Bochner eigenvalues depend on the normalisation | M | #11 | Only Gamma-normalised constants mean anything (-1.569 becomes -0.052) |
| R2-judge/#5 | Two seats proved the same factor-2 lemma; CD(rho, n) constant | M | #24 | Cross-check and the corrected constant |
| R2-judge/#6 | Suzuki p. 2 and p. 5: Yoshida Prop. 1 and Thm 2 | M | #22 | Citations; the Thm 2 half is also written into the note on #8 |
| R2-judge/#7 | Worst Bakry-Emery site is near x = log 7 - L, not the edge | M | #11 | Computed at 160 and 320 boxes; the identification is heuristic |
| R2-judge/#8 | Toy count: a coarse threshold undercounts negative squares | M | #22 | Caution for anyone recounting (1e-8 against 1e-45) |
| R2-judge/#9 | The global count is printed in an unrefereed agent-run account | M | #22 | The novelty finding: total count known in substance (credits Bombieri 2000); per-block count not found |
| R2-judge/#10 | e10 row L = 1.25 reproduced; Beurling has 9 positive eigenvalues | M | #10 | Reproduction by a second and third implementation |
| R2-judge/#11 | Process: one commit is the only hard evidence of prediction order | S | - | Process recommendation; same subject as R2-judge/#3 |
| R2-judge/#12 | Exact inertia relation between N and Q per parity block | **P** | **#23** alive | Proved (three independent derivations), 36 of 36 rows; replaces WJ13's inequality; one open converse (T81) |
| R2-judge/#13 | Surgery on zeta's own form as a cheap exact control | M | #17 | A second, exact form of the #17 instrument; both of #17's kill lines not met |

One further note was written that closes no local entry: a pointer on #12 (the dial) to #26.

## Rule failures recorded (new main entries only)

"FAILS RULE" written into a field, as the owner's rules allow:
- **#25** wall (it measures a wall, it does not pass one) and prediction (no number for d* as a function of the
  margin was stated before computing).
- **#26** wall (attacks no wall; it sharpens a control).

Not labelled as failures, but weaker than the rules ask (stated in the fields):
- **#22** and **#23** are results, not routes: their wall and new-input fields say "none: a dictionary" / "none as a
  route", following the form used for the round-1 instruments (#12, #17). Both are recorded as alive. If the lead reads
  "none as a route" as a rule failure, they cannot be alive under PROJECT_BRIEF and should be set to open.
- **#24** prediction: the seat's predictions P8, P9 have no snapshot separating them from their results (judge,
  section 5). No kill line was fixed by the seat before computing; the field says so and quotes the parents' lines.
- **#26** kill line: none was fixed by the seat; the one in the field is proposed by me from the seat's predictions
  and is marked "for the lead to confirm". Novelty is UNSEARCHED. One sentence in its evidence field is my own remark
  (the n = 8 member has its zeros off its centre line), marked as checked by nobody.
- **#25** novelty is UNSEARCHED for the conjecture itself; the "smallest" field quotes the seat, which did not name
  the solvable model.
- Not interval-certified: every computed number in #22-#26. One implementation only: the base form under the surgery
  rows of #22, #23; everything in #26. Reproduced by the checker but not by the judge: the semidefinite-programming
  results behind #25 and the notes on #10.

Statuses. #22 and #23: alive (proved, checked, kill tests not met). #24: **parked**, where the seat's local status was
alive; the identity is proved but as a certificate the canonical cubic is dead, and its parents are #10 (parked) and
#11 (killed). #25, #26: open. The judge of round 2 ranks no ideas, so no status comes from the judge.

## Inconsistencies found in the sources (not changed, only reported)

- Several local titles state what the judge later corrected; the notes use the judge's values: R2-parity/#3
  ("[1.9996, 2.0085]": the right end is below 2.0080), R2-cubic/#11 ("(n-4)/(2(n-1)) < 1/2": true only as m grows),
  R2-cubic/#9's log ("best t = 0.05"), R2-curv/#2's log ("the deficit is a window-edge effect"), R2-curv/#5's log
  ("centre -> 1/2"), R2-parity/#7 ("cannot": a gap).
- The title of #24 was carried verbatim and still contains the seat's guess "(non-symmetric?)", which missed. The
  claim field says so. The tool has no command to change a title.
- R2-free: the run with m up to 1200 that removes the "spurious continuum" in M is described in its PROGRESS.md but
  has no log file; the folder's `mul_sq.log` stops at m = 150. The seat's PROGRESS.md ends with two registered and
  uncomputed predictions (P3, P4).
- Fields of older main ideas that the new notes contradict and that I did not edit (auditor writes notes only):
  #8 novelty ("no first-failure argument found", "no monotonicity found"); #17 kill line (both lines now answered);
  #10's log line "the sign condition picks out exactly the two members with Hecke operators" (n = 8, if confirmed).
- `docs/AGENT_REGISTRY.tsv` still lists R2-cubic-ref, R2-parity-ref and R2-judge as running.
- Where I replaced an agent's field before promotion (plain english of R2-judge/#12 and R2-free/#1; claim of
  R2-parity/#1 and R2-judge/#12; novelty of R2-cubic/#7), the agent's original text is preserved as a note in its
  local log.

## What the owner should hear about

None of the following is a proof of the Riemann Hypothesis or a step that brings one nearer in a way anyone can
measure. Two are exact bookkeeping, one is a proved identity that closed two of our ideas at once, two are
questions that are now sharp enough to compute.

1. **#22: an exact count of how Weil's test would fail.** RH is the same as saying a certain energy is never
   negative. This theorem says that if RH were false, the number of independent ways to make the energy negative
   would equal the number of zeros off the line, counted in groups of four, one "symmetric" and one "antisymmetric"
   way per group. Example: the judge took zeta's zeros, moved two pairs off the line as one group of four at height
   17.6, and found exactly one negative direction of each kind on four different windows; with two groups, two of
   each. What it is not: it is a dictionary between two ways of saying RH, it works just as well for the known
   impostor, and its main half is already in print; only the split into the two kinds was not found in what we read,
   and two older papers that might contain it (Bombieri 2000, Yoshida 1992) are still unread.

2. **#23: the exact link between idea #10's target and RH, with one open question.** Idea #10 wanted to show that
   the table "primes minus smooth background" has exactly one growing direction; round 1 showed this could be weaker
   than RH. Now there is an exact formula connecting that count to Weil's test, with one yes/no switch per kind of
   test shape. Example: with one group of four zeros planted off the line the table has three growing directions,
   not one, on every window tried, so the bad zeros were visible every time. What it is not: a proof that they are
   always visible. That statement is open, has a number (T81 in the theory file), and if true would make "one
   growing direction" the same as RH.

3. **#24: ideas #10 and #11 were the same idea, and it loses exactly a factor of two.** Idea #10 looked for a table
   of "triple meeting numbers" of three scales; idea #11 looked for a "curvature" of the prime random walk. The seat
   proved these are one and the same table. Example: for the scales 0, log 2, log 3 the number is built from how
   strongly two of them are each tied to the third; on the simplest model, where every scale pulls equally on every
   other, the test built from this table certifies a speed of 1/2 where the truth is 1, and for zeta it gives 0.48
   to 0.65 where 1 is needed, the same as for a deliberately broken system (the prime 2 moved to 2.1). What it is
   not: a way forward. It is a clean reason why two of our routes stopped, so nobody rebuilds them.

4. **#25: a ladder of certificates, and a guess about why none can reach RH.** A certificate with a simple formula
   fails (item 3), while some certificate always exists whenever the answer is yes, which makes bare existence
   worthless. In between, certificates can be graded by how many steps of the walk they use. Example: for zeta on
   the window of half-width 1 with 12 boxes, one step fails by 0.014 and two steps succeed with margin 0.00046; with
   finer boxes, where there is less room, the margin shrinks. The guess: the number of steps needed grows without
   limit as the room closes, and RH has no room at all. What it is not: tested. Nobody has yet measured the number
   of steps on a family where the room is dialled to zero; either answer would be about this method, not about the
   zeros.

5. **#26: at which settings of the dial the "prime-like" sign survives.** The dial (#12) turns zeta into
   neighbouring functions by a knob n, "sums of n squares". Idea #10 rested on certain numbers all being positive;
   this entry asks at which settings that holds. Example: at n = 1.4 one of those numbers is -0.16, so it fails;
   in twenty minutes of exact computation the only settings up to 14 where it held were n = 1, 2 and 8, and at
   n = 8 the zeros are not on the centre line. What it is not: reviewed. One program, no checker, no literature
   search, and the seat was withdrawn before it finished; it is a fact about the impostor family, and it is one more
   warning that this positivity alone cannot place zeros.

## For the lead

1. **Lemma C has no number of its own.** "A certificate exists whenever the conclusion holds" (R2-cubic/#3) is merged
   into #10, whose parked status already rests on it and where THEORY T52 points. If the owner should be able to
   say "look at the vacuity lemma" by number, one `promote` of R2-cubic/#3 does it (the tool allows promoting an
   entry that carries a merge note); its fields would have to be filled first.
2. **#22 is the item nearest to a ladder level and is blocked on reading.** Bombieri 2000 (Rend. Lincei) and
   Yoshida 1992 are still unopened; `rh/library/yoshida-1992.md` says a person with a browser can very probably
   fetch Yoshida. The brief's three-refuter standard for L2 has not been run (one refuter).
3. **#26 rests on twenty minutes of unreviewed work**, and its most quotable sentence (n = 8 passes the sign test and
   has zeros off its centre line) combines the seat's computation with my own unchecked remark. A second
   implementation and a search should come before anyone leans on it; the kill line needs the lead's confirmation.
4. **Stale fields in older ideas** (see "Inconsistencies"): #8 novelty, #17 kill line, #10's "two members with Hecke
   operators". I added notes; the fields are the lead's to change.
5. **Statuses that are the lead's call:** #22, #23 alive with "none: dictionary" fields; #24 parked against the
   seat's alive.
6. **Process, from the judge (skipped entries R2-judge/#3 and #11):** typed clock times ran ahead of the system clock
   for at least three agents, and commit 1e3f60a is the only hard evidence of prediction order in round 2. The
   judge's suggestion: have each seat stamp its prediction block with a command-written time, and snapshot
   PROGRESS.md by command (or commit) right after each prediction block.
7. `docs/HUB.md`'s idea board has no #22-#26, and the walls named by the round-2 seats (WP1-WP4, W-curv-1 to 3)
   exist only in the seats' files and in the notes written by this audit. W-curv-5 should not be carried (judge).

## Could not decide

- Whether R2-free/#2 (the Wallach set of theta) deserves a main number of its own. It passes both of the owner's
  tests for a proposal. I kept it inside #26 because it is the same object and the weaker of two nested conditions,
  and because two main entries from one twenty-minute unreviewed run seemed out of proportion. One `promote` splits
  it out.
- Whether "new as far as the record can tell" holds for #25 and #26 in any stronger sense than "nobody searched".
  For both, the record contains no search for the idea itself. They are promoted on the owner's test as worded;
  their novelty fields say UNSEARCHED.

## Left open

- `tools/hubcheck.py`: 0 errors; 53 ideas still awaiting audit, none in this audit's scope: `s1_seminar` (curv 6,
  parity 11, cubic 12, mirror 4), `specialists` (operator 6, reflection 4), `k_atlas` 7, `foothold` 3. Every one of
  the eight round-2 logs is at 0 awaiting.

## How it was done (reproducible, do not re-run)

`audit_lib.py.txt`, `stage1_promote.py.txt`, `stage2_merge.py.txt`, `stage3_skip.py.txt` in this folder drive
`tools/ideas.py` with argument lists. Each stage ran once (marker files `.done_stage*`; notes and promotions are not
idempotent). `main_numbers.json` holds the main numbers returned by the tool. `PROGRESS.md` has the plan, fixed
before the first write, and one line per tool decision.
