<!-- local-idea-log owner=R2-curv -->
# Local idea log of R2-curv

Private working log of agent `R2-curv`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-curv/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Parity-block form of the ground-state transform: two rank-one-modified Poincare inequalities
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (PROOF_bochner_parity.md Thm A). Even: N_e <= 2cc^T iff one positive eigenvalue and 2c^T N^-1 c >= 1. Odd: N_o <= -2ss^T iff N_o<0 and int_0^inf e^{lambda_1 t} E[sigma(X_0)sigma(X_t)]dt <= 1/2, sigma = sinh(x/2)/u. COMPUTED zeta L=1: both sum rules saturate as boxes refine (5.6e-4,1.6e-4,5.0e-5 even; 3.2e-2,1.1e-2,3.2e-3 odd). This is a reformulation (rule 2); its use is to say exactly what a process argument must prove.
  - 2026-11-11: audit: not promoted: merged into main #23

## #2 · Bochner formula for the Doob-transformed prime jump process: Gamma_2 = SOS over multiplicative parallelograms + discrete (-Hess log u) term
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED Thm B (B2 path form, B3 parallelogram form with an extra OPEN-PATH term I first missed: when x+b is outside the window the parallelogram does not close). Verified to 3e-14 on the box lattice. At the centre: SOS >= 0, Hessian part min eig -0.034, open-path part min eig -1.57: the deficit is a window-edge effect. Full-line case (curvature 0, squares of double differences) is KNOWN in substance (Spener-Weber-Zacher, CD(0,inf) for fractional Laplacian; search summaries only).
  - 2026-11-11: audit: not promoted: merged into main #11

## #3 · Two-step kernel K*K carries Lambda*Lambda: Selberg's identity inside Gamma_2
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (B4), verified numerically for n<=7: prime*prime two-step atoms at log n carry (Lambda*Lambda)(n) = Lambda_2(n) - Lambda(n) log n. Two-step rates out of the centre at L=1: arch*arch 19.3, arch*prime 11.4, prime*prime 1.9. Not yet used for anything.
  - 2026-11-11: audit: not promoted: merged into main #11

## #4 · Reflection positivity: prime atoms are RP on the multiplicative lattice a,b>=2 (Gram identity), NOT on the continuum; Hankel form = N_even - N_odd
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED Thm D. D1: [Lambda(ab)/sqrt(ab)]_{a,b>=2} = sum_p log p v_p v_p^T (rank 17 for a,b<=60, COMPUTED). Fails with a=1 allowed, fails on the continuum (witness gives -log p/sqrt p). Arch kernel RP for x->-x. COMPUTED: Hankel form of arch PSD; with zeta atoms 9 of 20 (19 of 40) negative eigenvalues, min -1.12 (-1.21); Beurling the same. Reflection MISMATCH: primes reflect one valuation at a time, Gamma reflects all at once. Beurling has the same structure so this does not use the integers.
  - 2026-11-11: audit: not promoted: merged into main #21

## #5 · Prediction: Bakry-Emery is lossy by ~factor 2 (resampling chain has rho = gap/2), cannot reach lambda_1
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: HIT. COMPUTED zeta L=1: rho_BE/lambda_1 = 0.542, 0.496, 0.463, 0.441 (M=20,40,80,160; worst site at the edge), centre 0.551, 0.522, 0.506, 0.496 -> 1/2. PROVED Thm C2: resampling chain has rho_BE = (lambda/2)(1+2 min pi). Beurling: 0.499 vs zeta 0.496 at L=1 (blind) although Beurling's gap is 0.914 lambda_1. Dobrushin 0.43->0.29, Euclidean Ollivier min -> -infinity (prime jumps cut by the window edge). KILLED as a route to gap >= lambda_1: wrong by a fixed factor and blind to the control.
  - 2026-11-11: audit: not promoted: merged into main #11

## #6 · Calibrated Bakry-Emery: Gamma_2 >= rho Gamma + L(F_f) pointwise, F_f = c (f - pi f)^2 + c' Gamma(f); exact (rho = gap) for the resampling chain with c = rho/4, where plain BE gives gap/2
- status: open
- source: R2-curv
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED (calib.log): zeta L=1 M=40: plain 0.496 -> best c alone 0.752 -> (c,c') optimum 0.792 lambda_1; Beurling 0.769; L=0.5: 0.859 vs 0.839. Prediction 0.6-0.95 HIT; 'sees Beurling by > 0.03' MISS (0.023). Fully general calibration is equivalent to the gap (matrix Poisson equation): reformulation. Next: compute the EXACT calibration C_y for zeta numerically and look at its shape (certificate first, formula second).
  - 2026-11-11: audit: not promoted: merged into main #11

## #7 · Pointwise signature: Gamma_2 - lambda_1 Gamma has exactly one negative direction per site (resampling: proved; zeta: 38 of 40 sites, 50 of 80; Beurling: 32 of 40, 24 of 80)
- status: open
- source: R2-curv
- date: 2026-11-10
- plain english: At each position of the walk, ask in how many independent ways a test function can make the local curvature expression negative. For the fresh-pick shuffle the answer is exactly one at every position. For the prime walk on the window of half-width 1 cut into 40 boxes it is one at 38 boxes and two at the 2 edge boxes; with the prime 2 moved to 2.1 it is one at 32 boxes and two at 8.
- wall: W-curv-1 (no sharp local inequality)
- new input: A per-site integer (negative index of a local quadratic form built from two-step rates) that differs between zeta and a Beurling shift
- claim: For zeta the per-site negative index of Gamma_2 - lambda_1 Gamma is 1 away from the points x = +-(L - log n); for a Beurling shift it is 2 on whole bands.
- prediction: Predicted (22:51) agreement of zeta and Beurling counts at >= 80% of sites (blind): MISS, 34 of 40 and 50 of 80. But the zeta counts are not stable under refinement (two-direction clusters appear at M=80 near x = L - log n), so this is not yet a clean statement.
- smallest: Prove the count is exactly one at the centre site for the archimedean process alone on a window
- kill line: If at M=160 and 320 the fraction of one-direction sites for zeta keeps falling toward Beurling's, drop it
- novelty: UNSEARCHED
- log:
  - 2026-11-11: audit: not promoted: merged into main #11

## #8 · Exact calibration as a certificate: solve the matrix Poisson equation sum_y L_xy C_y = D_x - Dbar and read the shape of C_y for zeta
- status: open
- source: R2-curv
- date: 2026-11-10
- plain english: Curvature tests look at one position at a time and lose a factor of two. One can repair the loss by adding a correction that cancels on average. The correction that repairs it completely always exists once the mixing bound is true; the plan is to compute it for the prime walk and see whether it has a formula.
- wall: W-curv-2
- claim: For zeta's process the exact calibration C_y (a matrix per site) exists iff gap >= lambda_1; conjecture: it is low-rank and built from cosh(x/2)/u and sinh(x/2)/u, the two observables of the saturated sum rules.
- prediction: NOT COMPUTED. Guess before computing: numerical rank of C_y (singular values above 1e-6 of the largest) at most 4 at L=1, M=40; for Beurling the same equation is solvable but D-bar is not PSD.
- smallest: Closed form of the exact calibration for the resampling chain plus one rank-one perturbation
- kill line: C_y of full rank with no visible structure at M=40 and M=80
- novelty: UNSEARCHED
- log:
  - 2026-11-10: COMPUTED (exactcal.log) zeta L=1 M=40 with the choice P_x = Dbar: C_y full rank (36 of 39 singular values above 1e-2; decay 1, 0.41, 0.25, 0.16, ...): rank prediction (<=4) MISS. Top vector = centred delta_y to 0.955 and top eigenvalue = 0.495 * lambda_1/4: leading part is half the resampling calibration. Sign in my prediction text was wrong (resampling C_y = +lambda/4 ...). Kill line (full rank, no structure) is hit for THIS normalisation; other choices of P_x untested.
  - 2026-11-11: audit: not promoted: merged into main #11
