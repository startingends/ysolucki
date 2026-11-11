<!-- local-idea-log owner=R2-judge -->
# Local idea log of R2-judge

Private working log of agent `R2-judge`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-judge/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Feasible interval of the weight at 6 (L=1): upper end is set by the even block, lower end by the odd block
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j12.log: even block [-8.81e-12, 1.824e-14], odd block [-1.250e-13, 5.94e-11]; intersection [-1.2504e-13, 1.8239e-14]
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #2 · Lead's 0.362 for the background sign change is an interpolation across two parity blocks; the odd block crosses near 0.372
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j1_J1.log: odd +0.0103/+0.0075 at 0.370 (N=30/60), -0.0039/-0.0066 at 0.375; even block 0.00106 throughout. 1/N extrapolation at 0.370 gives +0.0047 (HEURISTIC)
- log:
  - 2026-11-11: audit: not promoted: merged into main #9

## #3 · Process: typed clock stamps ran ahead of the system clock for at least three agents (me included); certify prediction order with a command-written time or a git snapshot, not typed times
- status: open
- source: R2-judge
- date: 2026-11-11
- log:
  - 2026-11-11: audit: not promoted: a process recommendation to the lead, not a mathematical idea: typed clock stamps ran ahead of the system clock for at least three agents, so prediction order should be certified with a command-written time or a git snapshot. It is recorded in rh/experiments/r2_judge/JUDGEMENT.md section 5 and passed on in rh/experiments/r2_audit/AUDIT.md ('For the lead').

## #4 · Raw eigenvalues of the three Bochner pieces depend on the normalisation (full matrix -1.569, restricted to f(x)=0: -0.052); only Gamma-normalised constants are canonical
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j3_J5.log, j5b.log
- log:
  - 2026-11-11: audit: not promoted: merged into main #11

## #5 · Two seats proved the same factor-2 lemma independently: curv Theorem C2 (lambda/2)(1+2 min pi) = cubic's 1/2 + 1/m; CD(rho,n) constant is 1/2 - 2/n + (1+2/n)/m
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: PROVED by hand in JUDGEMENT.md section 2; COMPUTED j2.log
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #6 · Suzuki 2606.09096 p.2 and p.5 (read in PDF text): Yoshida 1992 Prop. 1 = one parity block suffices; Yoshida Thm 2 = RH iff non-degeneracy on every window (the first-failure template's existence half)
- status: open
- source: R2-judge
- date: 2026-11-11
- log:
  - 2026-11-11: audit: not promoted: merged into main #22

## #7 · Observation: under refinement the worst Bakry-Emery site is not the edge box but the box at x = log 7 - L (-0.946 at L = 1)
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j15b.log: minimum at site 4 of 160 (x=-0.944) and site 9 of 320 (x=-0.941); identification with log 7 - L is HEURISTIC (two data points, zeta and Beurling alike)
- log:
  - 2026-11-11: audit: not promoted: merged into main #11

## #8 · Toy check of the negative-index count: negative eigenvalues on small windows are below 1e-8 of the top eigenvalue; any count with a coarse threshold undercounts
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j13.log vs j13b.log: (0,0),(1,0),(2,2),(1,1) at threshold 1e-8 against (2,2) at every L at threshold 1e-45
- log:
  - 2026-11-11: audit: not promoted: merged into main #22

## #9 · The global count kappa = number of distinct zeros with Re > 1/2 (seat parity Theorem 4, total count) is printed, with the same hyperbolic-pair proof, in an unrefereed Anthropic-hosted account of an agent run; it credits Bombieri 2000 with the upper-bound half for large truncations. Per-parity-block count not found there (no parity hits in the text)
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: READ: about 150 of 5400 lines of the PDF text; primary Bombieri 2000 still not opened by anyone in the project
- log:
  - 2026-11-11: audit: not promoted: merged into main #22

## #10 · Lead's e10 row L=1.25 (one positive eigenvalue, second -2.451e-47) reproduced by implementation B; in the half lattice -2.610e-47; Beurling control has 9 positive eigenvalues there
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j16_int.log, j16_half.log, j16_b.log
- log:
  - 2026-11-11: audit: not promoted: merged into main #10

## #11 · Process: the committed snapshot 1e3f60a (22:47:54) is the only hard evidence of prediction order; it holds curv's 22:38/22:44/22:47 prediction blocks with no result sections, and cubic's P1-P7. Suggest the lead snapshot PROGRESS.md by command right after each prediction block
- status: open
- source: R2-judge
- date: 2026-11-11
- log:
  - 2026-11-11: audit: not promoted: a process recommendation to the lead, not a mathematical idea: commit 1e3f60a is the only hard evidence of prediction order in round 2; snapshot PROGRESS.md by command right after each prediction block. Same subject as R2-judge/#3; recorded in rh/experiments/r2_judge/JUDGEMENT.md section 5 and passed on in rh/experiments/r2_audit/AUDIT.md ('For the lead').

## #12 · Exact inertia relation between N = pole - Q and Q per parity block: kappa_+(N_even) = kappa_-(Q_even) + [c^T Q_e^-1 c > 1/2], kappa_+(N_odd) = kappa_-(Q_odd) - [s^T Q_o^-1 s < -1/2]
- status: open
- source: R2-judge
- date: 2026-11-11
- tags: WJ13,WP1,T32,T50,T61,T81
- plain english: Idea #10 hoped to prove RH by showing that one table of numbers (the primes' contribution minus the smooth background) has exactly one 'growing' direction. Round 1 found that this is weaker than RH. This entry says exactly how the two are related. Split test shapes into mirror-symmetric and mirror-antisymmetric ones. In each class, the number of growing directions of the table equals the number of 'negative energy' directions of Weil's test, corrected by a single yes/no switch, and one explicit number decides the switch. Example: for zeta on windows of half-width 0.5 to 1.25 the table has 1 growing direction and Weil's test has 0 negative ones. Plant one group of four zeros off the line (height 17.6, 0.3 to the side): Weil's test gets 1 + 1 negative directions and the table gets 2 + 1 = 3 growing directions, not 1. So in every case computed a single bad group of zeros IS visible in the table's count. Whether it must always be visible is open; if it must, 'one growing direction' would say the same as RH. A companion fact from the cubic seat: add two extra rows to the table for the two pole measurements, and the enlarged table has exactly 1 + (number of negative directions of Weil's test) growing directions, with no switch. All of this is bookkeeping between known statements; none of it proves anything about the zeros.
- wall: WJ13 (round-1 judge) and WP1 (seat R2-parity): 'one positive direction of N = primes - arch is weaker than RH by one quartet'. This entry does not pass the wall. It replaces the inequality behind it by an identity and reduces the wall to one open statement (THEORY T81). Not a route: finite linear algebra, valid for any system with the same kind of explicit formula, impostors and Beurling systems included (B2).
- new input: none as a route (standard tools: Haynsworth inertia additivity, the matrix determinant lemma). As a result: the two indicator terms. Round 1 and seat R2-parity had only kappa_-(Q) <= kappa_+(N) + 1. The identity says a one-quartet configuration has kappa_+(N) = 1 exactly when c^T Q_e^-1 c <= 1/2 and s^T Q_o^-1 s < -1/2 hold together, and that the fibre-extended form Ntilde of seat R2-cubic's Lemma A has kappa_+ = 1 + kappa_-(Q) with no indicator at all.
- claim: PROVED (finite-dimensional subspace, invertible blocks; Haynsworth on [[Q_e, c],[c^T, 1/2]] and [[Q_o, s],[s^T, -1/2]]; three independent derivations: judge J18, S1-parity on the seminar board, K-theory; rh/THEORY.md T32, checked). With N = pole - Q, c = cosh(x/2), s = sinh(x/2): kappa_+(N_even) = kappa_-(Q_even) + [c^T Q_e^-1 c > 1/2] and kappa_+(N_odd) = kappa_-(Q_odd) - [s^T Q_o^-1 s < -1/2]. It contains seat R2-curv's Theorem A (the case kappa_-(Q) = 0, with the hypothesis lambda_1 > 0 that the checker added) and sharpens seat R2-parity's Prop. 3(b). OPEN (T81): if kappa_+(N_L) <= 1 on every window, does RH follow? Proved so far: at most one off-line quartet follows (R2-parity's Corollary C2, T31; the count itself is #22).
- prediction: Written by a command with the system time (00:29:04 UTC) before computing (judge J18), for the surgery configurations of #22: c^T Q_e^-1 c huge and positive (> 1e3) and s^T Q_o^-1 s > 0 in every row; positive eigenvalues of N per block: zeta (1,0); on-line control (1,0); one quartet (2,1), THREE in total from L = 0.5; two quartets (3,1) at L = 0.5 and (3,2) from L = 0.75; the identity holds in every row. Stated before the run as the outcome that would differ: 'if the one-quartet row shows (1,0), the signature of N cannot see a single quartet'. Result: identity holds in 36 of 36 rows; every count HIT except two quartets at L = 0.5 (predicted (3,1), measured (2,1): there c^T Q_e^-1 c = -2.7e7, a tiny second negative eigenvalue -2.2e-8 dominates the inverse). Beurling control (2 -> 2.1), not predicted: 3 and 5 positive eigenvalues at L = 0.5 and 1, equal to 1 + kappa_-(Q).
- smallest: The open converse T81: for a system with zeta's Gamma factor, a pole and a non-negative prime side, the combination 'c^T Q_e^-1 c <= 1/2 and s^T Q_o^-1 s < -1/2 with exactly one off-line quartet' cannot hold on all large windows. Smaller and finite: exclude it for surgery configurations of zeta on one window, with certified arithmetic. The identity itself is finite linear algebra and was nominated for machine checking (S1-parity, board B92).
- worth if true: If the converse holds, idea #10's signature claim ('N has one positive direction on every window') is EQUIVALENT to RH instead of weaker by one quartet, and wall WJ13 disappears. In any case every later signature count (the Beurling controls' 3, 5, 9; surgery rows) can be read off from the Weil form with this identity instead of being recomputed and argued again.
- first test: Done: J18, 36 rows (zeta, on-line control, one and two quartets, Beurling 2 -> 2.1; L = 0.5 to 1.25; integer and half lattices; 110 digits). Next: scan the planted quartet over heights, offsets and windows above L = 1.25 for a row with c^T Q_e^-1 c <= 1/2; then the same question on a system with a genuine non-negative prime side and an off-line quartet (none is known to the project: a surgery configuration is a set of zeros, not a prime system).
- kill line: For the converse T81: one configuration with zeta's Gamma factor, non-negative prime-side weights, exactly one off-line quartet and kappa_+(N_L) = 1 on every window kills it; then 'one positive direction' is strictly weaker than RH and idea #10's target has to be the fibre-extended form. The round-1 judge's kill line in the other direction ('a one-quartet configuration keeps N at exactly one positive eigenvalue; then the signature target cannot see a single quartet') was NOT met: N has three.
- novelty: The identity is elementary and its tools are in print (Haynsworth 1968, cited from memory by the cubic checker; matrix determinant lemma). It was not searched as a statement about the Weil form by the judge. The curv checker ran one web query on the determinant / Aronszajn-Krein form of the sum rule (summaries only): nothing found. Lemma A is Weil's Hodge-index picture transcribed (seat R2-cubic: one query, only the classical function-field statement found). Status: elementary, presumably folklore; the open converse T81 is UNSEARCHED.
- evidence: rh/experiments/r2_judge/JUDGEMENT.md sections 1.4 and 2.14; j18_int.log, j18_half.log; rh/THEORY.md T32 (checked), T50, T61, T81 (open). One-quartet rows: kappa_-(Q) = (1,1), kappa_+(N) = (2,1) at L = 0.5, 0.75, 1.0, 1.25, with c^T Q_e^-1 c between 5.8e5 and 7e53. Seat S1-parity reports 0 failures of the identity in 20000 random cases. Limits: finite subspaces; one implementation of the base form; one quartet position plus one second quartet; not interval-certified.
- log:
  - 2026-11-11: promoted to main #23 by R2-AUD
  - 2026-11-11: auditor R2-AUD replaced the 'plain english' field before promotion; the agent's original text was: The count of growing directions of primes-minus-Gamma equals the count of negative directions of the Weil form plus one or minus one, and two explicit numbers decide which. Example: zeta's form on the window of half-width 1 with one quartet of zeros moved off the line at height 17.6 has 1 + 1 negative directions and its N has 2 + 1 = 3 growing directions, not 1.
  - 2026-11-11: auditor R2-AUD replaced the 'claim' field before promotion; the agent's original text was: PROVED (Haynsworth, two lines, finite-dimensional invertible blocks); COMPUTED: holds in 36 rows (zeta, surgery with one and two quartets, Beurling), j18_int.log, j18_half.log. Refines seat parity's Prop. 3(b); contains seat curv's Theorem A as the case kappa_-(Q) = 0

## #13 · Surgery on zeta's own form (remove real pairs, add quartets; rank-4 change in closed form on the prime-side matrix) is a cheap exact control: one quartet at 17.578 + 0.3i is seen as (1,1) negative squares already at L = 0.5
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j17_int.log, j17_half.log: never more negative squares per block than quartets; zeta minus two real pairs stays positive definite (4.8e-38 at L = 1)
- log:
  - 2026-11-11: audit: not promoted: merged into main #17
