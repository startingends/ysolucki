<!-- local-idea-log owner=R2-parity -->
# Local idea log of R2-parity

Private working log of agent `R2-parity`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-parity/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Exact negative-index theorem: sup_L kappa_-(Q_L) = number of distinct zeros right of the line; per parity block = number of quartets
- status: open
- source: R2-parity
- date: 2026-11-10
- tags: dictionary,W2,WJ13,B6,T29,T30,T31
- plain english: Weil's test for RH says that a certain energy is never negative, whatever test shape is used and however wide the window of scales. This theorem says exactly how the test fails if RH fails. The number of independent ways the energy can be made negative, on a wide enough window, equals the number of different zeros to the right of the line: never more, and on wide windows never fewer. Sort the test shapes into mirror-symmetric and mirror-antisymmetric ones; then each kind sees exactly one negative direction for each group of four off-line zeros (a zero and its three mirror images). Example, checked by the judge: take zeta's own zeros, remove the two lowest pairs (heights 14.13 and 21.02) and plant one group of four at height 17.578, 0.3 to the side of the line. On windows of half-width 0.5, 0.75, 1.0 and 1.25 the energy then has exactly one negative direction among symmetric shapes and one among antisymmetric ones; with two planted groups it has two and two; with the pairs merged back on the line, none. One consequence: 'at most one negative direction on every window' already says the same as RH, because off-line zeros come in fours and a single negative direction cannot be half of a pair. This is a dictionary between two ways of stating RH. It is not a step towards proving it, and its main half is already in print.
- wall: none: a dictionary (a proved counting theorem), not a route. It bears on W2 and on round 1's wall WJ13 without passing either. The seat's own barrier check: it uses only the zero side, never the Euler product (B1); it holds equally for the Davenport-Heilbronn impostor, whose quartets it counts (B2); it claims no margin (B3); and Corollary C1 is an equivalence, not a reduction (B6). What it changes: WJ13's heuristic 'each quartet costs one negative square per parity block' is now a theorem for L >= L_0, and the Krein-Langer route that round 1 proposed for it is not needed.
- new input: none as a route. As a result: an exact count where the record had an inequality and a heuristic. (1) On every window the number of negative squares of the Weil form is at most nu, the number of DISTINCT zeros with Re > 1/2, and at most nu/2 in each parity block; equality for all L >= L_0; multiplicity is invisible. (2) A proof device not found in what was read: the multiplier cos(tz)[sinc(z-a)^K + sinc(z+a)^K], which leaves the on-line part bounded and blows each off-line pair up like e^(2tb) with a rotating phase (the seat's first draft, a bare cosine shift, fails when there are infinitely many off-line zeros).
- claim: PROVED and CHECKED (seat, its checker, the round-2 judge: every step redone; rh/THEORY.md T29, T30, T31). Let nu be the number of distinct zeros with Re rho > 1/2 (nu is even; nu/2 quartets). For the Weil form Q_L on functions supported in [-L, L]: (1) kappa_-(Q_L) <= nu, and kappa_-(Q_L,even) <= nu/2, kappa_-(Q_L,odd) <= nu/2, for every L; (2) the counts are non-decreasing in L; (3) if nu is finite, all three are equalities for L >= L_0; if nu is infinite both block counts tend to infinity. Corollaries. C1: 'kappa_-(Q_L) <= 1 for every L' <=> RH (nu is even); with 2 or 3 allowed negative squares at most one quartet. C3: WJ13's per-block count is a theorem for L >= L_0. C1 last line and C4 (one parity block suffices) are KNOWN (Yoshida 1992 Prop. 1). C2: if N = primes - arch has at most one positive direction on every window, there is at most one off-line quartet; the exact relation between the signatures of N and Q is #23.
- prediction: No blind prediction by the seat for the theorem. Judge's kill test J17, written with a command-stamped time (00:27:16 UTC) before computing: on zeta's own form with zero surgery, (i) zeta (0,0) negative squares (even, odd) at every L; (ii) control, the removed pairs merged on the line: (0,0); (iii) one planted quartet: never 2 in a block, (1,1) at L = 0.75, 1.0, 1.25, guess (0,0) at L = 0.5; (iv) two quartets: never 3 in a block, (2,2) at L = 1.0, 1.25; (v) weight 3 on the quartet: same counts as (iii). Result: all HIT except the guess at L = 0.5, where the quartet is already seen as (1,1). What would have differed: any block count above the number of quartets contradicts the theorem; the on-line control (0,0) is the impostor-type contrast.
- smallest: Done on content: Corollary C1 with one spare negative square. What is owed before any ladder level (judge): open Bombieri 2000 (Rend. Lincei) and Yoshida 1992, to settle whether the per-block count with attainment is in print; and the brief's three-refuter standard for L2 (one refuter ran). The smallest NEW statement near it is the open converse T81 recorded under #23.
- worth if true: It is true (checked). Worth: it fixes the bookkeeping for every signature-type target (ideas #10, #20, #23): which counts are equivalent to RH (at most one negative square; one parity block) and which are weaker. On content it is the nearest thing in round 2 to ladder level L2; the judge awards no level while the primary sources are unread.
- first test: Done. Proof read line by line by the checker R2-parity-ref (inequalities 3b to 3d also tested in 200 random cases) and by the judge. Kill test J17 on zeta's own form with zero surgery (110 digits, integer and half lattices, L = 0.5 to 1.25) and toy test J13 (two quartets among 40 real ordinates). Next: full read of Bombieri 2000 and Yoshida 1992; surgery scan over heights, offsets and windows above L = 1.25.
- kill line: Round-1 judge's kill line for the per-block count: a one-quartet configuration whose form has fewer than two negative squares at every L up to 2; and (J17) any parity block with more negative squares than quartets. NOT met: (1,1) from L = 0.5 on, never more. Novelty kill line: Bombieri 2000 or Yoshida 1992 turn out to contain the per-block count with attainment; then this entry is only a citation.
- novelty: NOT NEW AS A WHOLE. (a) Total count: printed, with the word 'distinct' and the same hyperbolic-pair argument, as 'Theorem 1 (global signature)' in an unrefereed account of an agent research run ('How the two-thirds argument was found: two agent runs and their literature', PDF on www-cdn.anthropic.com; the judge read about 150 of about 5400 lines), which credits Bombieri 2000 with the upper-bound half for large truncations. (b) One parity block suffices: Yoshida 1992 Prop. 1, as quoted on p. 2 of Suzuki arXiv 2606.09096v3 (read by checker and judge; Yoshida's paper itself was not obtained, rh/library/yoshida-1992.md is secondary). (c) NOT FOUND: the per-block count with attainment, and the multiplier proof. Searches: seat 3 web queries (summaries only), checker 4 queries (one PDF partly read), judge 3 queries (one refused, weekly limit), plus the judge's full-text search of the agent-run document for 'parity', 'even block', 'odd block', 'even functions', 'odd functions' (no hits) and of Suzuki's paper for 'negative square', 'Pontryagin', 'monoton' (no hits). UNREAD by anyone in the project: Bombieri 2000, Yoshida 1992. Status: per-block part not found, not established as new.
- evidence: PROVED: rh/experiments/r2_parity/PROOF_parity_index.md, Theorem 4 (Steps 1 to 5) and section 5. COMPUTED (judge, rh/experiments/r2_judge/JUDGEMENT.md 2.14; j17_int.log, j17_half.log): one quartet 17.578 + 0.3i: (1,1) negative squares at L = 0.5, 0.75, 1.0, 1.25, lowest even eigenvalue -1.2e-3, -0.040, -0.097, -0.230; same counts for offsets 0.05 and 0.45 and for weight 3; two quartets (second at 27.718 + 0.3i): (2,1), (2,2), (2,2), (2,2); on-line control (0,0); zeta minus the two pairs stays positive definite (3.1e-11, 1.4e-21, 4.8e-38, 1.5e-64). Limits: finite subspaces; one implementation of the base form; one quartet position plus one second quartet; not interval-certified; the surgery test checks the theorem together with RH for the untouched zeros.
- log:
  - 2026-11-10: PROVED in PROOF_parity_index.md (Theorem 4). First draft (bare cosine shift) fails for infinitely many off-line zeros; repaired with cos(tz)[sinc(z-a)^K+sinc(z+a)^K]. Search: count attributed to Bombieri by a 2026 preprint (not opened) - known in substance. Corollaries: one spare negative square is free (kappa<=1 for all L <=> RH); one parity block suffices; N one positive direction => at most one quartet.
  - 2026-11-11: promoted to main #22 by R2-AUD
  - 2026-11-11: auditor R2-AUD replaced the 'claim' field before promotion; the agent's original text was: Proof by the cosine-shift multiplier M_t f = (f(.-t)+f(.+t))/2: leaves the on-line part bounded, blows up each off-line pair like e^{2tb} with rotating phase

## #2 · Computed feasible sets are OUTER approximations (Rayleigh-Ritz); digits of intervals are basis dependent; verify in a second lattice (half-integer)
- status: open
- source: R2-parity
- date: 2026-11-10
- log:
  - 2026-11-10: Confirmed: int40 -> half60 shrinks every interval by ~17%; all digits of #9 are outer bounds. See PROGRESS WP4.
  - 2026-11-11: audit: not promoted: merged into main #9

## #3 · Position of the first prime at L=0.5 is an interval [1.9996, 2.0085], not the point 2.000; 2 sits at the LEFT edge, best position 2.007
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED in two lattices (v3 logs). Lead's 3 grid values reproduce; the claim 'only at 2.000' does not. Question: is the true prime always at the edge of the feasible position interval (extremality, cf. N16/Q10)?
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #4 · Joint feasible set at L=1 is a simplex along equal-sign directions (t=0.17=1/6) and bulges to 1.6x box in mixed signs; no long direction
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED, 26 directions, two lattices. Heuristic: one first-order constraint sum delta_n b_n <= mu_1 active per side.
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #5 · lambda(L) is non-increasing in L (min-max, one line); zero set of lambda is a closed interval
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: PROVED given nested form domains (PROOF_first_failure Lemma 1). KNOWLEDGE 7 says no monotonicity was found in Suzuki; it is trivial.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #6 · Background (Gamma+pole, no primes) fails first in the ODD block at L in (0.37,0.38); even block stays positive to L=0.40
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: COMPUTED two lattices, N up to 120. The first prime is forced by the odd block, i.e. by N_odd <= -2<f,sinh>^2.
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #7 · Wall WP1: signature of N cannot give RH, only <= one quartet; what separates is the odd block sign
- status: open
- source: R2-parity
- date: 2026-11-10
- log:
  - 2026-11-11: audit: not promoted: merged into main #23

## #8 · Theorem U (N14 step 4 rigorous): under RH no atomic l1 perturbation of the prime side keeps positivity on all of R; uses nothing arithmetic; false on every single window
- status: open
- source: R2-parity
- date: 2026-11-10
- claim: PROVED in PROOF_uniqueness.md; UNSEARCHED, presumed folklore
- log:
  - 2026-11-11: audit: not promoted: merged into main #9
