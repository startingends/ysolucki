# r2_curv PROGRESS (seat "curv", agent R2-curv)

## 22:38 UTC  PREDICTIONS, written before any computation (owner rule 4)
Setup: N = primes - arch compressed to M disjoint boxes of width d = 2L/M (exact Galerkin compression, so
off-diagonal entries are >= 0 exactly). u = Perron vector, lambda_1 top eigenvalue, generator
q(i,j) = N_ij u_j/u_i, stationary measure u^2.

P1 (gap). The lead predicted gap/lambda_1 - 1 in (0, 1e-6) at L = 1, M = 40.  I predict a MISS of that:
   gap/lambda_1 - 1 = -mu_2(N_box)/lambda_1 in (1e-4, 1e-2) at L = 1, M = 40, because boxes approximate the
   smooth near-null vectors of Q only to O(d) and the compression error of a Rayleigh quotient is O(d^2 log(1/d)).
   It must be > 0 (Cauchy interlacing: mu_2(box) <= mu_2(continuum) = -2e-23). It should shrink roughly like M^-2.
P2 (Bakry-Emery). rho_BE/lambda_1 in (0.05, 0.6) at L = 1, M = 40; i.e. positive but lossy, NOT close to 1.
   Reason: the process is close to independent resampling, whose BE constant is about gap/2.
   The worst site is at the boundary of the window.
P3 (Ollivier, nearest sites, distance |i-j| d, idleness 0, generator form kappa = lim (1 - W1(m_x^t,m_y^t)/d(x,y))/t):
   kappa_min/lambda_1 in (0.3, 1.2), positive in the bulk; could exceed BE.
P4 (controls).
   - impostor (DH, its own Gamma factor alpha=3/2, no pole): no process. Fraction of negative off-diagonal
     entries of N_box at L = 1, M = 40: between 5% and 40% (lower than the lead's 30% of couplings because the
     smooth positive w-background covers the small negative atoms).
   - Beurling shift 2 -> 2.1 (zeta Gamma factor): the process exists (all rates >= 0), and curvature does NOT see
     the failure of RH: rho_BE(Beurling)/rho_BE(zeta) in (0.8, 1.25) at L = 1. And N_Beurling has exactly ONE
     positive eigenvalue at L = 0.5 (the RH failure sits in the block inequality, not in the signature); at
     L = 1.0 I guess 2 positive eigenvalues.
   - dial theta^n: n = 1.4: negative coupling at m = 3 ((2/3)(n-1)(n-2) log 3 = -0.176), so negative rates:
     fraction of negative off-diagonal box entries in (0, 10%) (only near |x-y| = log 3, and only if the atom
     beats the w background W_k ~ 1/(2k): at k ~ 22, W ~ 0.02, atom -0.176/sqrt(3)*overlap ~ -0.1: yes negative).
     n = 2: all couplings >= 0, process exists.
P5 (block inequalities in process form). Even block: 2<cosh, N_even^-1 cosh> >= 1 with equality margin tiny:
   the value 2<cosh,N^-1 cosh> - 1 at L = 1, M = 40 is positive and below 1e-2. Beurling: negative at L=0.5.

## 22:44 UTC  PREDICTION for the calibrated Bakry-Emery constant (new object, R2-curv/#6)
Definition: rho*(c, c') = largest rho such that at EVERY site x the quadratic form
   Gamma_2(f)(x) - rho Gamma(f)(x) - c L[(f - pi f)^2](x) - c' L[Gamma(f)](x)  >= 0  for all f.
Since the last two terms integrate to zero against pi, rho* <= gap always (PROVED, one line), and rho*(0,0) = rho_BE.
For the resampling chain rho*(lambda/4, 0) = lambda = gap exactly (PROVED below), where rho_BE = lambda/2.
Prediction (zeta, L = 1, M = 40): sup over (c, c') of rho*/lambda_1 lies in (0.60, 0.95); my point guess 0.8.
Control (Beurling 2 -> 2.1, L = 1, M = 40): necessarily <= gap/lambda_1 = 0.914; I predict rho*_B/lambda_1(B) in (0.55, 0.9)
and, the interesting question, rho*_zeta/lambda_1 - rho*_B/lambda_1(B) > 0.03 (the calibrated curvature SEES the shift,
unlike plain BE where the two agree to 0.5%). If the difference is below 0.01 the calibrated tool is as blind as BE.

## 22:47 UTC  PREDICTION for the Hankel (reflection) form  H = (N_even - N_odd)/2 folded onto (0, L]
H has kernel K(x+y), x, y > 0.  Arch part alone: positive semidefinite (w completely monotone) -> min eigenvalue >= 0
up to rounding.  With the prime atoms (zeta, L = 1, M = 40): INDEFINITE, most negative eigenvalue in (-0.8, -0.2)
(witness: antisymmetric pair of bumps at x0 and log p - x0 gives about -log p / sqrt p = -0.49 for p = 2, -0.63 for 3).
Control: Beurling should look the same (indefinite, same size): this test does not separate.

## 22:40-22:50 UTC  RESULTS (all COMPUTED, double precision on mpmath-quadrature matrices; scripts proc.py.txt,
## check.py.txt, check2.py.txt, calib.py.txt, hankel.py.txt; logs run_zeta.log, run_zeta_M160.log, run_controls.log,
## check.log, check2.log, calib.log).  Command: python3 tools/memcap.py 3 python3 proc.py.txt <L> <M> <kind>; each run < 1 min.

BUG FOUND AND FIXED FIRST: the first run used 1 - exp(-2u) in w(u); cancellation near u = 0 made lambda_1 non-monotone
in M and made the box Weil form slightly NEGATIVE at L = 0.75 (-1.9e-3), which is impossible for a Galerkin compression
of a non-negative form. Replaced by expm1; lambda_1 is now monotone (4.30281, 4.30309, 4.30431, 4.30524 for M = 20, 40,
80, 160 at L = 1) and the form is positive in every run. Buggy log kept as run_zeta_BUGGY_cancellation.log.

| zeta | L=0.5 M=40 | L=0.75 M=40 | L=1 M=20 | L=1 M=40 | L=1 M=80 | L=1 M=160 |
|---|---|---|---|---|---|---|
| lambda_1 | 1.98537 | 3.09803 | 4.30281 | 4.30309 | 4.30431 | 4.30524 |
| # positive eigenvalues of N | 1 | 1 | 1 | 1 | 1 | 1 |
| gap/lambda_1 - 1 | 1.4e-2 | 5.3e-3 | 1.0e-2 | 3.4e-3 | 9.7e-4 | 2.7e-4 |
| Bakry-Emery rho/lambda_1 (worst site) | 0.681 | 0.566 | 0.542 | 0.496 | 0.463 | 0.441 |
| Bakry-Emery rho/lambda_1 (centre site) | 0.734 | 0.626 | 0.551 | 0.522 | 0.506 | 0.496 |
| Ollivier (Lin-Lu-Yau), nearest sites, Euclidean metric: min/lambda_1 | -0.86 | -1.07 | -0.14 | -3.50 | -6.21 | -10.2 |
| same, centre pair | 0.62 | 0.61 | 0.37 | 0.36 | 0.37 | 0.37 |
| Dobrushin (Ollivier, discrete metric), min over all pairs /lambda_1 | 0.668 | 0.538 | 0.603 | 0.430 | 0.334 | 0.289 |
| 2<cosh,N^-1 cosh> - 1 (even sum rule, >= 0) | 1.7e-3 | 7.8e-4 | 1.7e-3 | 5.6e-4 | 1.6e-4 | 5.0e-5 |
| 1 - 2<sinh,(-N)^-1 sinh> (odd sum rule, >= 0) | 0.30 | 0.076 | 0.098 | 0.032 | 0.011 | 0.0032 |
Other facts: total jump rate is the same at every site (spread 3e-14; Theorem B1). The ground state is nearly flat:
min(u)/max(u) = 0.64, 0.78, 0.85 at L = 0.5, 0.75, 1.0.

Controls (M = 40):
| | # pos. eig. of N | gap/lambda_1 | BE rho/lambda_1 | Dobrushin/lambda_1 | negative off-diagonal entries |
|---|---|---|---|---|---|
| zeta L=0.5 | 1 | 1.014 | 0.681 | 0.668 | 0 |
| Beurling (2 -> 2.1) L=0.5 | 3 | 0.982 | 0.686 | 0.683 | 0 |
| zeta L=1 | 1 | 1.003 | 0.496 | 0.430 | 0 |
| Beurling L=1 | 5 | 0.914 | 0.499 | 0.472 | 0 |
| impostor (DH) L=1 | 0 (no pole) | - | formal value -1.80 (negative) | - | 5.5% (min entry -0.52) |
| dial n=1.4, L=1 | 1 | 1.003 (formal) | not defined (Gamma not positive) | - | 14.6% (min entry -0.27) |
| dial n=2, L=1 | 1 | 1.003 | 0.453 | 0.461 | 0 |
| dial n=1 (must reproduce zeta) | 1 | 1.003 | 0.496 | 0.430 | 0 |
Dial embedding used: alpha = n/2 in w, atoms at (1/2) log m with weight (c_m/2) m^{-n/4}, c_m = log-derivative coefficients
of sum r_n(m) m^{-s}/(2n); the constant term and the pole were NOT adapted for n != 1 (they do not affect signs, rates or
curvature; they do affect lambda_1 by a constant shift of the diagonal, which cancels in L). n = 1 reproduces zeta to all digits.

Scoring the predictions:
- P1 HIT (3.4e-3 in (1e-4, 1e-2)); the lead's (0, 1e-6) MISS. Reason: boxes approximate the near-null vectors to O(d);
  the defect decays like M^-1.7. The true margin (2e-23) is invisible in a box basis.
- P2 HIT (0.496 in (0.05, 0.6)), worst site at the window edge HIT. The lead's 0.2 < rho/lambda_1 <= 1 also HIT.
  But rho/lambda_1 falls with refinement (0.54, 0.50, 0.46, 0.44 at the worst site; 0.55, 0.52, 0.51, 0.50 at the centre):
  the centre value tends to 1/2 = the resampling value of Theorem C2.
- P3 MISS. Euclidean-metric Ollivier curvature is positive at the centre (0.37 lambda_1) but its minimum is negative and
  DIVERGES with refinement (-0.14, -3.5, -6.2, -10.2). Reason (HEURISTIC, consistent with where the minima sit, e.g.
  x = 0.944 = log 7 - 1 at M = 160): at a point x with x +- log n on the window edge, x has a prime jump that its neighbour
  lacks; the unmatched mass (rate about Lambda(n)/sqrt n) must travel a distance of order 1 while d(x,y) -> 0.
- P4: impostor HIT (5.5% in 5-40%). Beurling curvature-blindness HIT (ratio of rho/lambda_1: 1.007 at L = 0.5, 1.005 at
  L = 1). Beurling eigenvalue counts MISS (predicted 1 at L = 0.5, got 3; predicted 2 at L = 1, got 5). Dial n = 1.4 MISS
  (14.6%, predicted < 10%: c_6, c_8, c_11 are negative too, not only c_3).
- P5 HIT (5.6e-4 > 0 and < 1e-2); Beurling at L = 0.5: the sum-rule form is not applicable (3 positive eigenvalues).
- Calibrated BE (predicted 22:44): zeta L = 1: plain 0.496 -> one-parameter 0.752 -> two-parameter 0.792 (HIT, guess was 0.8).
  The resampling-exact choice c = lambda_1/4 alone gives 0.455 (worse than plain). Beurling L = 1: 0.769. Difference 0.023:
  between my "sees it" (> 0.03) and "blind" (< 0.01) lines: MISS, and relative to each chain's own gap the order is reversed
  (zeta 0.790 of its gap, Beurling 0.842). L = 0.5: zeta 0.859, Beurling 0.839. So the calibrated constant is not a detector either.
- Hankel form (predicted 22:47): arch part positive semidefinite HIT; with primes indefinite HIT; size MISS (-1.12, not in
  (-0.8, -0.2)): half of all eigenvalues are negative (9 of 20, 19 of 40), the atoms act like reflections. Beurling same: HIT.

What the Bakry-Emery minimiser looks like (check.log): at the centre site it is 90% (Gamma-cosine 0.903), at the edge 93%,
the function "1 off the site, 0 on it" smoothed into a cusp; its neighbours in the generalised spectrum are ABOVE lambda_1
at the centre (second generalised eigenvalue 4.67 = 1.09 lambda_1): Gamma_2 - lambda_1 Gamma has exactly ONE negative direction
at the centre site (two at the edge: 4.12 < 4.30). So the worst "triple of scales" is not arithmetic: it is (x, x, far).
Decomposition by Theorem B3 at the centre (check2.log): sum of squares >= 0; Hessian part min eigenvalue -0.034; open-path
(window edge) part min eigenvalue -1.57. Two-step rates out of the centre: arch*arch 19.3, arch*prime 11.4, prime*prime 1.9.

## CONCLUSIONS
1. (COMPUTED + PROVED Theorem C) Pointwise Bakry-Emery cannot prove gap >= lambda_1: it is capped near gap/2 (0.44-0.50
   here, exactly 1/2 for the resampling chain), and it is blind to the Beurling control. Dobrushin and Euclidean Ollivier
   are worse. The lead's kill line (rho <= 0) is NOT hit, but the tool is dead for a stronger reason: wrong by a fixed factor
   where zero margin is needed. A two-parameter L-exact calibration lifts it to 0.79 lambda_1, still not sharp, still blind.
2. (PROVED Theorem A) What RH says about the process is not "gap >= lambda_1" but gap >= lambda_1 plus two scalar sum rules
   (one per parity), each saturated in the limit; the odd one is a Green-Kubo-type integral
   int_0^inf e^{lambda_1 t} E[sigma(X_0) sigma(X_t)] dt <= 1/2 for sigma = sinh(x/2)/u(x).
3. (PROVED Theorem B) Gamma_2 = squares over parallelograms (multiplicative ones for the primes) + a discrete Hessian of log u
   + window-edge terms; the deficit is in the edge terms.
4. (PROVED Theorem D) Reflection positivity holds for the primes one valuation at a time and for the Gamma kernel for the
   total inversion a -> 1/a, and each fails for the other's reflection. Infrared-bound arguments need one common reflection.

## WALLS
- W-curv-1: no pointwise curvature notion tried is within a factor 0.8 of lambda_1, and all are equal (to 2%) for the
  Beurling system whose gap is 9% smaller. Exact statement not available: a local (per-site) inequality, linear in the
  two-step rates, that holds for zeta's process with constant exactly lambda_1.
- W-curv-2: the fully general calibrated criterion (Gamma_2 >= rho Gamma + L F_f, F_f any quadratic) is EQUIVALENT to
  gap >= rho (solve a matrix Poisson equation), so it is a reformulation; content requires a restricted family of F,
  and no restricted family that is sharp for zeta is known.
- W-curv-3: reflection mismatch (Theorem D): primes reflect coordinatewise, Gamma reflects totally.

## LITERATURE (rule 5; 6 web searches, 1 page fetch; only search summaries and one abstract summary read, no paper in full)
- Query "Weil explicit formula positivity Dirichlet form / Markov process / jump process / ground state / spectral gap":
  FOUND a Zenodo preprint, Guo Chen, "A Dirichlet-Form Rewriting of the Weil Explicit Formula and an Unconditional
  Hilbert-Polya Candidate" (May 2026, unrefereed, version v548; companion record claims an unconditional proof; treat as
  unverified). Abstract summary read via fetch: after a scalar shift the Weil form on an interval is a closed symmetric
  Dirichlet form = pure-jump archimedean energy with explicit Levy measure + finite arithmetic part; unique positive even
  ground state. So the Dirichlet-form reading and the positive ground state are NOT new (Theorem E is in substance there).
  Not mentioned in the abstract: Doob transform, spectral gap, Poincare inequality, Bakry-Emery, curvature, parity sum rules.
  Also found: Burnol, "The explicit formula and a propagator" (math/9809119) and math/9810169 (probabilistic reading of Weil
  positivity; Lagarias survey mentions a Brownian-motion equivalent). Not read.
- Query "Bakry-Emery OR Ollivier-Ricci curvature primes Riemann hypothesis Weil positivity jump process": nothing relevant
  found (aggregator pages and unvetted claimed proofs only).
- Query "Bakry-Emery Doob h-transform ground state jump process Bochner non-local": found Caputo-Dai Pra-Posta Bochner
  method for jump processes, Erbar-Fathi, entropic curvature (arXiv 2312.09686); nothing on ground-state transforms of
  convolution forms. Not read.
- Query "Gamma_2 Levy process second difference CD(0,inf)": Spener-Weber-Zacher (arXiv 1903.00517, 1903.00521): the fractional
  Laplacian satisfies CD(0, inf) and no finite dimension; Fontes (arXiv 2602.19192, unrefereed) CD(1, inf) for the Cauchy
  process on the torus. So the full-line statement in Theorem B3 (Gamma_2 = squares of double differences, curvature 0)
  is KNOWN in substance. The windowed/transformed formula with the Hessian and open-path terms: not found in summaries.
- Queries "multiplicative Hankel / Helson matrix von Mangoldt positive semidefinite" and "Weil explicit formula reflection
  positivity / infrared bound / Gaussian domination": Helson matrices exist as a subject (arXiv 1709.06326); nothing on
  [Lambda(ab)] or on reflection positivity of the explicit formula found. D1 is a two-line identity; "not found" only.

## 22:51 UTC  PREDICTION: pointwise signature of Gamma_2 - lambda_1 Gamma (number of negative directions per site)
For the resampling chain Gamma_2 - lambda Gamma = (lambda^2/4)(Var f - (f(x) - pi f)^2): exactly ONE negative direction
at every site (PROVED from C1). Prediction for zeta, L = 1, M = 40 and 80: exactly one negative direction at >= 60% of
the sites (the interior), two or more only near the edge. Control, Beurling: I predict the SAME counts at >= 80% of the
sites (this local signature is blind too), even though the integrated form sum_x pi_x (Gamma_2 - lambda_1 Gamma)_x has
4 negative directions for Beurling and 0 for zeta.

## 22:52 UTC  RESULT: pointwise signature (sig.log)
zeta L=1: M=40: one negative direction at 38 of 40 sites (two at the 2 edge sites); M=80: one at 50 of 80, two in clusters
near x = +-(L - log n) (e.g. sites 25-27 = -0.36..-0.31, 33-35 = -0.16..-0.11) and at the edges (up to 4).
Beurling L=1: M=40: one at 32 of 40; M=80: one at 24 of 80. Counts agree at 34 of 40 and 50 of 80 sites.
First prediction (>= 60% one-direction sites for zeta): HIT at M=40 (95%), barely at M=80 (62.5%), and falling with refinement.
Second prediction (Beurling agrees at >= 80% of sites, i.e. blind): MISS at M=80 (62.5%). So this integer does see the shift,
but it is not refinement-stable for zeta, so no clean statement yet. Integrated forms: zeta 0 negative directions
(min eig +1.5e-3, +2.2e-4), Beurling 4 (min eig -3.8e-2, -2.3e-2), as they must be.

## 22:53 UTC  PREDICTION (R2-curv/#8): exact calibration C_y with P_x = Dbar for all x, normalised sum_y pi_y C_y = 0,
zeta L = 1, M = 40: numerical rank of C_y (singular values above 1e-6 of the largest) at most 4 at the centre site; and the
top singular vector of C_centre has Gamma-free overlap > 0.8 with span{1 - delta_centre}. Control: for the resampling chain
C_y = -(lambda/4) * (centred delta_y)(centred delta_y)^T + const, rank 1 (from Theorem C3). If the rank is > 10 the
"calibration has a formula" hope is weak.

## 22:54 UTC  RESULT (exactcal.log): exact calibration for zeta, L = 1, M = 40
Solved sum_y L_xy C_y = D_x - Dbar exactly (residual 2e-15). CORRECTION to my prediction text: for the resampling chain the
sign is PLUS: C_y = +(lambda/4) (centred delta_y)(centred delta_y)^T (Theorem C3); I wrote minus.
Rank prediction MISS: C_y has full numerical rank (39 above 1e-6, 36 above 1e-2); singular values / largest at the centre:
1, 0.41, 0.25, 0.16, 0.15, 0.14, 0.12, 0.11 (slow decay). Top-vector prediction HIT: overlap with centred delta_y is 0.955
(centre), 0.947, 0.934 (edge), and the top eigenvalue is +0.53 = 0.495 * (lambda_1/4): the leading part of the exact
calibration is HALF the resampling calibration, the rest is a slowly decaying full-rank tail. With this normalisation
(P_x = Dbar at every site, which is one choice among many) there is no visible low-rank formula.

## FILES
PROOF_bochner_parity.md (Theorems A-E with proofs), proc.py.txt (process, gap, Bakry-Emery, Ollivier, Dobrushin, controls),
check.py.txt / check2.py.txt (Theorem B verification, minimiser, two-step split), calib.py.txt (calibrated constant),
hankel.py.txt (reflection form), sig.py.txt (pointwise signature), exactcal.py.txt (exact calibration), *.log, IDEAS_LOCAL.md.
