<!-- local-idea-log owner=S1-cubic -->
# Local idea log of S1-cubic

Private working log of agent `S1-cubic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `S1-cubic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Pair obstruction (E'): a pair of boxes with no third box forces G = HDH - H >= (a_i/s_i) v_i v_i^T + (a_j/s_j) v_j v_j^T; a one-parameter convex test, no SDP
- status: open
- source: S1-cubic
- date: 2026-11-10
- plain english: A certificate lists a number for every three scales. Question: can two scales do without any third one? Answer: never, for any of the pairs tried. Example: 6 boxes on the window of half-width 1; remove all triples containing boxes 2 and 3 (neighbours in the middle): the search fails by 1.21; remove those containing boxes 0 and 5 (the two ends): fails by 1.43. The ends are not special.
- claim: PROVED (TURN1.md 3b). COMPUTED: fails for every pair (15/15, 28/28, 120/120) on zeta L=1 n=6,8,16, zeta and Beurling L=0.5 n=8. So every coupled pair needs a third box; R*=n-1 was not a statement about the window ends.
- log:
  - 2026-11-11: audit: not promoted: merged into main #10

## #2 · Direction: the mirror squares enter the Weil form with a MINUS sign. Q = pole + E_w + (theta(e^2L) - c_inf)|f|^2 - sum_p log p q_p(f), q_p = Poisson-kernel form >= (1-r)/(1+r)|f|^2
- status: open
- source: S1-cubic
- date: 2026-11-10
- plain english: The mirror test shows that each prime contributes a positive amount. But in Weil's inequality those positive amounts are SUBTRACTED: the inequality says the primes together are not too big. Example on the window of half-width 1: the primes 2, 3, 5, 7 together contribute 6.4132, and what they are subtracted from is 6.4170; the difference 0.0037 is all that is left.
- claim: PROVED identity (TURN1.md 2). The one-variable mirror theorem gives LOWER bounds on q_p; Weil positivity is an UPPER bound on sum log p q_p. On the lowest eigenvector (L=1, 24 boxes) q_p(f) = 1.964, 1.317, 1.030, 1.000 for p=2,3,5,7.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #3 · Mirror form of the fibre-extended matrix: the pole fibre completes the m=0 note of the Gamma kernel to a square. Hankel(Ntilde)(phi,alpha) = primes_H(phi) + sum_{m>=1}(int phi e^{-(2m+1/2)x})^2 + (alpha + int phi e^{-x/2})^2
- status: open
- source: S1-cubic
- date: 2026-11-10
- claim: PROVED (TURN1.md M1), COMPUTED: PSD to 5e-18 without primes with F1 on the positive side; -0.53 with F2. So with the pole included the no-prime system is mirror positive in the continuum, yet its Weil form is negative from L = 0.38.
- log:
  - 2026-11-11: audit: not promoted: merged into main #23

## #4 · Reweighting test for any mirror bridge: mirror positivity is a cone (c_p >= 0 per prime), window positivity pins the weights; the hypothesis of a bridge must break at c_2 = 1.03, at c_2 = 0 and for the no-prime system
- status: open
- source: S1-cubic
- date: 2026-11-10
- claim: COMPUTED (TURN1.md M2, M3): L=1, 48 boxes, lowest eigenvalue of Q: c_2 = 0.97: -7.8e-3; 1.00: +1.2e-3; 1.03: -2.2e-2.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #5 · OPEN: 'no two close' locality. Zeroing the distinct triples with min gap > r: n=12 r=4 harmless (margin unchanged), r=3 infeasible -0.21; n=8 r=2 already infeasible -0.17. Which triples of pairwise far scales are forced, and is it the cone certificate's sign change (rho = 1.0005 at n=12) that makes the 4 extreme ones dispensable?
- status: open
- source: S1-cubic
- date: 2026-11-10
- log:
  - 2026-11-11: TURN 2: explained. Single entries range widely over all certificates (around the cone value); the cost is paid pair by pair (end pair at 12 boxes can lose 2 of 10 thirds free, 3: -1.7e-3, 4: -0.035). Graded pair obstruction, no collective effect needed. TURN2.md 3.
  - 2026-11-11: audit: not promoted: merged into main #10

## #6 · QUESTION to self: the factor 2 has two descriptions (mine: Bakry-Emery pieces are a non-trivial decomposition of ZERO at mean field; R2-curv B3: the deficit sits in the open-path window-edge term). Same term or two? The resampling chain has no edge.
- status: open
- source: S1-cubic
- date: 2026-11-10
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #7 · Block-averaged Bakry-Emery: the factor 2 is the theta->0 end of the curve (1+3theta)/(2+2theta); average the local inequality over a block of pi-share theta
- status: open
- source: S1-cubic
- date: 2026-11-11
- plain english: The curvature test asks every scale separately and gets 1/2 where 1 is needed. Ask groups of scales instead: the answer climbs with the size of the group. Example: split the window into two halves: the test gives 0.84 for zeta, and 5/6 = 0.833 on the simplest model; quarters give 0.70; only the whole window gives 1.
- claim: PROVED on the resampling chain; COMPUTED for the Weil chain (L=1): sites 0.48-0.53, 8 blocks 0.60, quarters 0.70, two mirror halves 0.84 (mean field 5/6), one block = gap. Stable under refinement; blind to the Beurling control except at one block.
- smallest: Is rho_half >= 5/6 a theorem for the Weil chain? It is the first constant of this family that does not drift under refinement.
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #8 · One fibre FIELD: pole + slowest Gamma exponential = the single kernel e^{|x-y|/2}, the growing fundamental solution of -d^2/dx^2 + 1/4 (p, q its harmonic functions); Weil positivity <=> [[N',E],[E,E]] has one positive eigenvalue, all off-diagonal >= 0. Kac-Baker direction: every Gamma exponential e^{-(2m+1/2)|u|} is the Green function of a local operator, so the whole archimedean part could be traded for a tower of local auxiliary fields, one per trivial zero
- status: open
- source: S1-cubic
- date: 2026-11-11
- new input: Locality: after the trade the only non-local couplings left are the prime atoms.
- claim: PROVED + COMPUTED (TURN1.md 7) for m = 0. The tower for m >= 1 is NOT done.
- novelty: UNSEARCHED.
- log:
  - 2026-11-11: audit: not promoted: merged into main #23

## #9 · Odd block of Ntilde = (non-negative off-diagonal matrix) - (mirror matrix of the primes): method of images. Without primes the odd block is Metzler, so its negativity has a LINEAR certificate (Collatz-Wielandt: a positive vector x with A x <= 0); the primes destroy exactly that, through the mirror form
- status: open
- source: S1-cubic
- date: 2026-11-11
- claim: COMPUTED signs (TURN1.md 5). The Collatz-Wielandt certificate for the no-prime system at L < 0.37 not computed.
- log:
  - 2026-11-11: audit: not promoted: merged into main #28

## #10 · r-block certificates: a decomposition H = sum H_i with H_i b_j = H_j b_i and each H_i at most one positive eigenvalue; one block is the statement itself; two mirror blocks is the doubling step in Lorentzian form, with explicit member H/2 +- (l_+ l_+^T - l_- l_-^T)/s
- status: open
- source: S1-cubic
- date: 2026-11-11
- claim: PROVED (TURN2.md 1), COMPUTED (twoblock.log).
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #11 · Tilt test of the seat: for F_d the one-field form keeps its shape (tilt-blind), the fibre form counts two; Q_d(f) = 2[Q(g) - Q(tanh(dx) g)]
- status: open
- source: S1-cubic
- date: 2026-11-11
- claim: PROVED identity (also S1-mirror B90, S1-curv B99); COMPUTED forms (fd.log). My heuristic threshold from boxes was wrong and is withdrawn; boxes fail the calibration at L = 0.75 by a factor 6-8.
- log:
  - 2026-11-11: audit: not promoted: merged into main #21

## #12 · QUESTION: a certificate indexed by window size instead of sites (canonical system H(t) >= 0 / reflection coefficients; Krein-Langer index 1 for the pole) - does it see the tilt d where every site-indexed object is blind?
- status: open
- source: S1-cubic
- date: 2026-11-11
- claim: Asked to SP-operator (B115). No computation yet.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #13 · Critical vector: f = N_e^{-1} cosh(x/2) (null vector of the even Weil block at its critical pole strength t_0 = 1/(c^T N_e^{-1} c)) has one sign for zeta and vanishes at the window edge; the true pole strength sits between t_0 and the strength t* where the ground state's edge value changes sign
- status: open
- source: S1-cubic
- date: 2026-11-11
- plain english: Turn the strength of the pole like a dial. Below a first mark the form is negative; above a second mark its lowest shape dips below zero at the edge of the window. For zeta the true strength lies between the two marks, and the two marks are 0.05% apart on a 96-box grid. Example: window of half-width 1, 96 boxes: marks at 0.999891 and 1.000388; the truth is 1.
- wall: (auditor R3-AUD) Walls WJ13/WP1 for the EVEN block, the block that fails first for every control (board B95; the positive control of #33 fails there too). It does not escape WJ2 (precision): S1-cubic (board B191) found (F) exactly as sensitive to the weight of the prime 2 as positivity itself; both pin the weight to kappa = 1 in the limit. What it changes is the KIND of statement: given (F), positivity of the even block is equivalent to one test function phi with W*phi >= 0 pointwise on the window (lead's bracket, notebook N39, T90 proved): a linear one-vector certificate instead of a semidefinite one.
- new input: (auditor R3-AUD) The rank-one algebra of the pole (T88): the even block is t c c^T - N_e with c = cosh(x/2), the critical pole strength t_0 = 1/(c^T N_e^-1 c) and the vector f = N_e^-1 c; the hypothesis is a maximum-principle / Collatz-Wielandt sign property of f, which is not the even inequality in disguise (separated at fixed strength by reweighting the prime 2 at L = 0.5, board B186 item).
- claim: COMPUTED on 13 rows (TURN3.md 3): t_0 < 1 < t* on positive rows, t* < 1 < t_0 on negative rows with one positive eigenvalue of N_e; window [t_0,t*] shrinks with refinement. OPEN whether 'f has one sign' is the even inequality in disguise.
- prediction: (auditor R3-AUD) FAILS RULE 4 as recorded: no number was fixed before computing. Computed (TURN3.md 3, 13 rows): t_0 < 1 < t* on every positive row, t* < 1 < t_0 on negative rows with one positive eigenvalue of N_e; at L = 1 on 96 boxes the marks are 0.999891 and 1.000388; (F) true for zeta, false for three controls (N39). Proposed by the auditor for the next run, to be written down before computing: on the one-prime window L = 1/2 with the weight of 2 multiplied by kappa, the kappa-interval on which f > 0 contains 1 and has width within a factor 10 of FH-2's certified weight box (0.4886..0.5104 around 0.4901, i.e. 4.5%).
- smallest: One system in which the two conditions separate; or a proof that they cannot.
- first test: (auditor R3-AUD) Candidate (F) on the one-prime window (seminar open item 5): certify one sign of N_e^-1 cosh(x/2) at L = 1/2 with the foothold seat's exact matrices (rh/experiments/foothold/forcing.py.txt, checked by V-FH), then compute the kappa-interval of the weight of 2 on which it holds, in the continuum limit (grids of 24 and 48 boxes already disagree, B186).
- kill line: (auditor R3-AUD) (F) fails for zeta in the continuum on some window where zeta's even block is >= 0 (then the bracket certifies nothing for zeta), or (F) is shown equivalent to the even inequality on every window (then it is a reformulation, rule 2).
- novelty: Grep of 6 digests in rh/library only; nothing found; not searched outside.
- evidence: (auditor R3-AUD) T88 (proved), T89 (open: this candidate), T90 (proved: the bracket given (F)). With phi = 1 the archimedean constant 5.3722 cancels against 2 zeta'/zeta(1/2) and what is left is -4 sum sin(gamma L)/gamma (N39).
- log:
  - 2026-11-11: B186 item: (F) is NOT the even inequality in disguise: separated at fixed strength by reweighting the prime 2 at L = 0.5 (48 boxes kappa = 0.90: block >= 0, f changes sign; 24 boxes kappa = 1.10: f > 0, block negative). Both conditions pin kappa = 1 in the limit. The lead's Barta bracket is correct; it fails only through the negative part of f.
  - 2026-11-11: promoted to main #29 by R3-AUD

## #14 · HEURISTIC: Hadamard formula for the window form: -d(lowest eigenvalue)/dL = C x (edge amplitude of the ground state)^2; finite form = equality case of Cauchy interlacing
- status: open
- source: S1-cubic
- date: 2026-11-11
- claim: Finite form PROVED (trivial). Continuum form not derived. Check: sqrt(8.2e-30 x 158) = 3.6e-14 against S1-parity's edge minimum 2.1e-14 at L = 1.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8
