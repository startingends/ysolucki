# LEMMA T115, written out (SP-sieve, session 4, 2026-11-11)
No source was read for this file (Titchmarsh section 14.2, the model, is not open). The proof below is self-contained except for two
standard theorems from complex analysis, stated exactly (KNOWN, textbook statements). Labels: PROVED / KNOWN.

## Statement
LEMMA. Let 1/2 <= s0 < 1 and suppose zeta(s) != 0 for Re s > s0. Fix delta in (0, 1 - s0) and kappa > 0. Then there are B, t1 (depending
on s0, delta, kappa) with
   |log zeta(sigma + it)| <= B (log t)^(a*)   for sigma >= s0 + delta, t >= t1,   with the explicit a* < 1 of (5),
(kappa enters only in the pointwise form below). Hence for every eps > 0: zeta(s)^(+1) and zeta(s)^(-1) are O_(s0,delta,eps)(t^eps) uniformly in Re s >= s0 + delta, t >= 2.
Sharper, pointwise in sigma: log zeta(sigma + it) << (log t)^((1 - sigma)/(1 - s0) + kappa) for s0 < sigma < 1 (any kappa > 0). At s0 = 1/2 this
is Titchmarsh's (log t)^(2 - 2 sigma + eps). So the true growth is exp(O((log t)^a)), a < 1, which is stronger than t^eps.

## Tools (KNOWN, standard statements)
(BC) Borel-Caratheodory. f holomorphic on |z - z0| <= R, A := max_{|z-z0|=R} Re f >= 0. For |z - z0| <= r < R:
     |f(z)| <= (2r/(R - r)) A + ((R + r)/(R - r)) |f(z0)|.
(H3) Hadamard three circles. f holomorphic on r1 <= |z - z1| <= r3, M_j := max_{|z-z1|=r_j} |f|. For r1 < r2 < r3:
     M2 <= M1^(1-a) M3^a,  a = log(r2/r1)/log(r3/r1).

## Proof
(0) The branch. Omega := {Re s > s0, Im s > 0} u {Re s > 1} is simply connected and contains no zero (hypothesis) and no pole (s = 1 is not in
    it). So log zeta is holomorphic on Omega, equal to sum Lambda(n) n^(-s)/log n for Re s > 1. Every disc below lies in Im s >= 8, inside Omega.
    [HYPOTHESIS USED HERE AND ONLY HERE.]
(1) Upper bound, unconditional. For Re s > 0: zeta(s) = 1/(s - 1) + 1 - s int_1^inf {x} x^(-s-1) dx (partial summation; |int| <= 1/sigma). For
    1/2 <= sigma <= 3, t >= 8: |zeta(s)| <= 1/t + 1 + 2|s| <= 2 + 2(t + 3) <= 3t. For sigma >= 2: |zeta| <= zeta(2) < 1.65. So |zeta(s)| <= 3t on
    sigma >= 1/2, t >= 8. Also |log zeta(2 + it)| <= log zeta(2) < 0.5, and |log zeta(s)| <= log zeta(sigma) <= log(1 + 1/(sigma - 1)) for sigma > 1.
(2) Polynomial bound by (BC). Fix d in (0, 1 - s0). Centre z0 = 2 + it, R = 2 - s0 - d/2, r = 2 - s0 - d (so R - r = d/2, 2r <= 3, R + r <= 3
    since s0 >= 1/2). The disc |z - z0| <= R has real parts >= s0 + d/2 > s0 and heights in [t - 2, t + 2]; for t >= 10 these are >= 8, so by (1)
    A = max Re log zeta = max log|zeta| <= log(3(t + 2)) <= log(4t). (BC) gives, for |s - z0| <= r, in particular for s = sigma + it with
    s0 + d <= sigma <= 2:
       |log zeta(sigma + it)| <= (6/d) log(4t) + 3/d      (t >= 10).                                                  (3)
    This alone gives zeta^(+-1) << t^(6/d): polynomial, not yet t^eps.
(4) Interpolation by (H3). Fix eta in (0, 1/2] and sigma1 >= 3; centre z1 = sigma1 + it; r1 = sigma1 - 1 - eta, r3 = sigma1 - s0 - delta/2,
    r2 = sigma1 - sigma for s0 + delta <= sigma <= 1 + eta (so r1 <= r2 < r3). On |z - z1| = r1 all real parts are >= 1 + eta:
    M1 <= log(1 + 1/eta). On |z - z1| = r3 real parts are >= s0 + delta/2 and heights in [t - sigma1, t + sigma1]; for t >= sigma1 + 10 apply (3)
    with d = delta/2 (points with real part >= 2 have |log zeta| < 0.5): M3 <= (12/delta) log(8t) + 6/delta. For t large M1 <= M3, and
    a(sigma) = log(r2/r1)/log(r3/r1) decreases in sigma, so for every sigma >= s0 + delta (for sigma > 1 + eta use (1) directly):
       |log zeta(sigma + it)| <= log(1 + 1/eta)^(1 - a*) ((12/delta) log(8t) + 6/delta)^(a*),                          (5)
       a* := log((sigma1 - s0 - delta)/(sigma1 - 1 - eta)) / log((sigma1 - s0 - delta/2)/(sigma1 - 1 - eta)) < 1.
    So B = 2 log(1 + 1/eta)^(1 - a*) (18/delta)^(a*) and t1 = sigma1 + 10 work (log(8t) <= 2 log t and 6/delta <= (6/delta) log(8t) for t >= 8).
    The exponent: a* < 1 for every finite sigma1 (numerator < denominator); as sigma1 -> infinity, a* -> (1 + eta - s0 - delta)/(1 + eta - s0 - delta/2),
    and for a fixed sigma (in place of s0 + delta) a(sigma) -> (1 + eta - sigma)/(1 + eta - s0 - delta/2) -> (1 - sigma)/(1 - s0) as eta, delta -> 0:
    the pointwise exponent stated above. [Constants grow as kappa, delta, eta -> 0; nothing is uniform in delta -> 0.]
(6) From (5): |zeta(s)|^(+-1) <= exp(B (2 log t)^(a*)) = t^(B 2^(a*) (log t)^(a* - 1)) <= C_eps t^eps, since a* < 1. For 2 <= t <= t1 the set
    {s0 + delta <= sigma <= 2, 2 <= t <= t1} is compact, zeta is continuous and non-zero on it (hypothesis; no pole since t >= 2), so |zeta|^(+-1)
    is bounded there; for sigma >= 2, |zeta|^(+-1) <= zeta(2). Negative t by zeta(conj s) = conj zeta(s). []

## Which parts need which hypothesis
- (1), (BC), (H3), and the bound on the circle r1: unconditional.
- Holomorphy of log zeta on the discs: the zero-free hypothesis, and it is needed for BOTH signs: the +1 bound comes from bounding |log zeta|,
  i.e. from the same holomorphic logarithm. Unconditionally one only has zeta << t^(mu(sigma) + eps) with mu convex (mu = 0 for sigma >= 1);
  the lemma says mu(sigma) = 0 for sigma > s0 (Lindelof right of s0). Convexity then gives mu(sigma) <= (s0 - sigma)/(2 s0) for 0 <= sigma <= s0.
- The -1 bound genuinely needs the hypothesis (a zero at rho with Re rho > s0 makes 1/zeta unbounded near it).
- Euler product: used only through log zeta = sum Lambda/log n for sigma > 1 (M1) and log zeta(2+it) bounded. The same proof works for any
  Dirichlet series with |F| <= t^A on sigma >= 1/2 and |log F| bounded on sigma >= 1 + eta (e.g. 1/f_DH right of its zeros): impostor-blind.

## T117's Perron direction with this lemma: YES, it goes through
M_N(1/2 + it) log N = (1/2 pi i) int_(c) N^w dw/(w^2 zeta(1/2 + it + w)), c > 1/2 (absolute convergence; (1/2 pi i) int y^w w^(-2) dw = log y for
y >= 1, 0 for y < 1). 1/zeta is holomorphic on Re s > s0 (zeros excluded by hypothesis, the pole becomes a zero). Shift to Re w = s0 - 1/2 + delta
(> 0, so w = 0 is not crossed). By the lemma, |1/zeta(1/2 + it + w)| <= C (|t| + |Im w| + 2)^eps on the new line, so the horizontal connectors
vanish (integrand << |Im w|^(-2+eps)) and
   |M_N(1/2 + it)| log N <= C N^(s0 - 1/2 + delta) int (|t| + |v| + 2)^eps / ((s0 - 1/2 + delta)^2 + v^2) dv << N^(s0 - 1/2 + delta) (|t| + 2)^eps.
Hence I_N(0, T0) <= max_{t<=T0} |M_N|^2 int_0^T0 |zeta(1/2+it)|^2 dt << N^(2 s0 - 1 + 2 delta), constants depending on s0, delta, eps, T0.
Everything used is the lemma's -1 power on the single line Re s = s0 + delta. T115 can be marked PROVED from this file; T117 then rests on
T115 (here) and T116 (Bettin-Gonek, read in full by READER-8).
