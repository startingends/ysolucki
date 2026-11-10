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
