# LEVEL: deciding item 6 of my s3 B12 (SP-reflection, 2026-11-11)
Labels: PROVED / KNOWN (what was read; "from memory" = unread) / COMPUTED / HEURISTIC / CONJECTURE / RISK.

## 0. Predictions, written BEFORE any computation (time of writing: before running eps_check.py.txt)
While re-deriving on paper (section 1) I found that the vector typed in B12, g = F B with F = (s-1) zeta(s)/s and B the smoothed Moebius
polynomial, cannot have defect -> 0 even when there are no zeros right of theta: the Poisson extremal of Q(g)/|g(s0)|^2 is g = CONSTANT,
and F B -> (s-1)/s (not constant; it has a zero at s = 1 inside Re s > theta). So I predict, for zeta, theta = 0.9, X = 1e4, Y = 10:
 P1 (B12 vector as typed): eps_A = eps_inf + O(1e-2), where eps_inf := P-mean of |(s-1)/s|^2 / |(s0-1)/s0|^2 - 1 is an elementary
    number; my estimate before computing it: eps_inf in [0.05, 0.15].
 P2 (corrected vector g = zeta(s) Btilde(s), Btilde = B - B(1) 2^(1-s), so Btilde(1) = 0; extremal = Moebius exactly): eps_B in [3e-4, 3e-2]
    at Y = 10 (scale X^(c(1 - 2theta)), c in [1/2, 1], from the smooth cutoff), and eps_B(Y = 0.9) within a factor 3 of eps_B(Y = 10).
 P3: eps_B < 4 delta/Y holds at Y = 10 only for delta > eps_B * 2.5; i.e. at these parameters the certificate excludes zeros with
    Re >= 0.9 + delta, |Im| <= 10, for delta of order 1e-3 to 1e-1, nothing stronger than what is known (the 7/8 theorem, and the
    verification of RH to height 3e12, make the box trivially empty).

## 0b. First run (eps_check.log): P1 HIT (eps_A = 0.1137/0.1143 against eps_inf = 0.1134 at Y = 10). eps_B NOT resolved by the
tan-quadrature: 2.8e-4 / 7.8e-4 (Y = 10) and NEGATIVE -5.1e-4 / -2.3e-4 (Y = 0.9), impossible for a defect: quadrature error ~1e-3.
Second run uses the variance form eps = P-mean |g - g(s0)|^2/|g(s0)|^2 (exact for g in H^2: P-mean of g = g(s0)), a uniform t-grid of
step 0.02 on [0, 300] (real coefficients: g(theta - it) = conj g(theta + it)) and a sampled tail. Prediction for it (written before):
eps_B in [1e-5, 1e-3] at both Y, i.e. below the first run's noise; eps_B(Y = 10) >= eps_B(Y = 0.9).

## 1. The scaling, re-derived with every constant
Notation. theta in (1/2, 1); Pi = {Re s > theta}; Y > 0; s0 = theta + Y (real); P(t) = (1/pi) Y/(Y^2 + t^2), the Poisson probability density
of Pi at s0 on the line Re s = theta. For g holomorphic in Pi of bounded type with int |g|^2 P dt finite, write Q(g) = int |g(theta+it)|^2 P(t) dt.
(1.1) PROVED (sub-mean-value / inner-outer). Let g = I O be the inner-outer factorisation in Pi (I = Blaschke product over the zeros of g in
Pi times a singular inner factor S, |S| <= 1). Since |O|^2 P-integrable and O outer, int |O|^2 P >= |O(s0)|^2 (Jensen for the outer O,
or Cauchy-Schwarz on P-mean of O = O(s0)). Hence
      Q(g) >= |O(s0)|^2 = |g(s0)|^2 / |I(s0)|^2 >= |g(s0)|^2 / |B_g(s0)|^2,     B_g(s0) = prod_{rho: g(rho)=0, Re rho > theta} (s0 - rho)/(s0 + conj(rho) - 2 theta).
Equality in the first step iff O is constant; so the EXTREMAL vector is g = constant.
(1.2) THE CORRECT VECTOR. g_B := zeta(s) B(s), B a Dirichlet polynomial with B(1) = 0 (removes the pole at s = 1, which lies in Pi), B(s0) != 0.
The zeros of g_B in Pi contain the zeros of zeta in Pi, so |B_g(s0)| <= prod over zeros of zeta (same formula). Define
      eps(B) := Q(g_B)/|g_B(s0)|^2 - 1 = P-mean |g_B - g_B(s0)|^2 / |g_B(s0)|^2  (>= 0; the second form because P-mean of g_B = g_B(s0)).
Then  1 + eps(B) >= prod over zeros rho of zeta with Re rho > theta of |s0 + conj(rho) - 2theta|^2/|s0 - rho|^2.        (PROVED)
The extremal g = const corresponds to B = c/zeta: the Moebius vector is the extremal for EVERY Y (and B(1) = 0 is automatic for 1/zeta).
CORRECTION to B12: there I typed g = F B with F = (s-1) zeta(s)/s. The inequality (1.2) still holds for it, but F B -> (s-1)/s when B -> 1/zeta,
which is not constant (it vanishes at s = 1, inside Pi), so its defect cannot go to 0: it tends to eps_inf(theta, Y) = P-mean|(s-1)/s|^2/|(s0-1)/s0|^2 - 1
> 0. COMPUTED: eps_inf = 0.1134 at theta = 0.9, Y = 10 (1.5625 at Y = 0.9), matched by the B12 vector at X = 1e4 (0.1137). The vector of B12 was wrong.
(1.3) THE BOX. A zero rho = theta + d + i gamma, 0 < d <= 1 - theta < Y, |gamma| <= Y: |s0 + conj(rho) - 2theta|^2/|s0 - rho|^2 = 1 + 4dY/((Y-d)^2 + gamma^2)
>= 1 + 4dY/(2Y^2) = 1 + 2d/Y, and its conjugate gives the same factor. So, PROVED:
      eps(B) < (1 + 2 delta/Y)^2 - 1   (in particular eps(B) < 4 delta/Y)   ==>   zeta(s) != 0 for Re s >= theta + delta, |Im s| <= Y.
(The threshold is 4 delta/Y, not the 2 delta/Y of B12: the conjugate zero doubles it.)
(1.4) FROM THE BOX TO A_1 (KNOWN technique, from memory; constants not optimised). Suppose zeta != 0 on R = {Re s >= theta + delta, |t| <= Y + 1}.
By Borel-Caratheodory applied to log zeta on discs inside R (Titchmarsh ch. 14, from memory), |log zeta(s)| <= C(delta) log(Y + 2) for
Re s >= theta + 2delta, |t| <= Y, hence |1/zeta(s)| <= (Y + 2)^(C(delta)) there. For W in C_c^inf(0, inf), What(s) = int W(x) x^(s-1) dx is entire
with |What(sigma + it)| <= C_A(W)(1 + |t|)^(-A) uniformly for sigma in [0, 2]. Then A_1 = sum mu(n) W(n/D) = (1/2pi i) int_{(c)} What(s) D^s ds/zeta(s),
c = 1 + 1/log D; move the segment |t| <= Y to Re s = theta + 2delta, keep |t| > Y on Re s = c (|1/zeta| <= log D there):
      |A_1| <= C_W(delta) [ D^(theta + 2delta) (Y + 2)^(C(delta)) + D log D * Y^(-A) * (Y + 2)^(C(delta)) ].
With Y = D^eta: A_1 << D^(theta + 2delta + eta C(delta)) + D^(1 - eta(A - C(delta)) + eps), for every eta > 0 and every A. So a certificate
eps(B) < 4 delta D^(-eta) at a fixed (theta, delta) and some small eta gives A_1 << D^(theta + 3 delta).
(1.5) WHAT X MUST BE (HEURISTIC, now checked numerically). If B = B_X is a smoothed Moebius polynomial of length X and zeta behaves on
Re s = theta as it does under RH, then zeta B_X - 1 ~ zeta (B_X - 1/zeta) has mean square about c(theta) X^(1 - 2theta), essentially INDEPENDENT of t
(COMPUTED: mean |zeta B - 1|^2 = 1.08e-3 on [0, 300] and 1.18e-3 on log-uniform samples in [300, 9500], theta = 0.9, X = 1e4). For large Y, eps ~
that mean, so eps < 4 delta/Y needs X^(2theta - 1) >~ Y/delta: X >= (Y/delta)^(1/(2theta - 1)) > Y, a mollifier longer than the height. This part of
B12 stands.

## 2. The check (predictions in sections 0 and 0b)
COMPUTED (eps_check.log, eps_check2.log; mpmath zeta at 15 digits, X = 1e4, w = 1 on [1, X^(1/2)] with cos^2 roll-off to X, B(1) = -2.13e-5
corrected by -2B(1) on the coefficient of 2^(-s)). One implementation; quadrature: uniform step 0.02 on [0, 300] plus a 300-point sampled tail.
   B12 vector (F B), Y = 10:  eps_A = 0.1137 (N = 1500), 0.1143 (N = 3000) against eps_inf = 0.1134.          P1: HIT.
   corrected vector, Y = 10:  eps_B = 4.72e-4  ==> box Re >= 0.9 + 1.2e-3, |Im| <= 10 free.
   corrected vector, Y = 0.9: eps_B = 5.07e-5  ==> box Re >= 0.9 + 1.1e-5, |Im| <= 0.9 free.                      P2: HIT (in [1e-5, 1e-3]).
   The first quadrature (tan substitution) gave eps_B of either sign at the 1e-3 level: unresolved there, as recorded in 0b.
   P3: HIT; the certified boxes are trivially known (no zeros right of 7/8; RH verified far beyond height 10).
So the SCALING holds (threshold 4 delta/Y; mollifier length (Y/delta)^(1/(2theta - 1))); the VECTOR in B12 was wrong and is corrected above.

## 3. Item 6 decided: the 7/8 theorem gives NO new correlation statement
What the 7/8 theorem implies, precisely (PROVED, standard): if zeta != 0 for Re s > 7/8, then for theta > 7/8 + 2 eps0 and the smoothed Moebius
B_X (corrected so B(1) = 0), 1/zeta(s) - B_X(s) = (1/2 pi i) int (1/zeta(s+z)) (1 - w-transform) X^z dz << X^(-(theta - 7/8 - eps0)) (1 + |t|)^eps on Re s = theta
(contour shift into the zero-free region, |1/zeta| << t^eps there by Borel-Caratheodory), hence
      eps_theta(B_X) = P-mean |zeta (B_X - 1/zeta)|^2 / |g(s0)|^2 << Y^(1 - theta + eps) X^(-2(theta - 7/8) + eps)   ->  0.
That is a mollified MEAN VALUE off the line, and it is deduced from a POINTWISE approximation of 1/zeta in the zero-free region: the classical
use of a zero-free region, not a new theorem. My B12 RISK read this mean value as "correlations of c_n = sum_{d|n, d<=X} mu(d) at level of
distribution 1/(2theta)". That reading is NOT valid as stated, for three reasons (PROVED or checked by hand):
 (i) on Re s = theta < 1 the series sum c_n n^(-s) does not converge (|c_n| is not summable against n^(-theta)); zeta B is a continuation, and in
     the approximate functional equation zeta = sum_{n <= t} n^(-s) + chi(s) sum_{n <= t/2pi} n^(s-1) the DUAL sum (|chi| ~ t^(1/2 - theta)) enters,
     so the mean square is not a Parseval sum of correlations of one sequence c_n;
 (ii) the t-average with weight P pairs n with m only when |log(m/n)| <~ 1/Y, i.e. it is a SHIFT-averaged (h <~ n/Y) correlation, an
     average over shifts, not an equidistribution statement in arithmetic progressions to large moduli; h-averaged problems (Barban-
     Davenport-Halberstam type) are not level-of-distribution problems in the Bombieri-Vinogradov / BFI sense;
 (iii) with B(1) = 0 the leading main terms of the h-averaged correlations cancel identically (sum_{d,e} mu(d) mu(e)/(de) = B(1)^2 = 0), so what is
     left is a lower-order term whose size is again governed by 1/zeta near the line: the "correlation" form is the same statement.
So "level 1/(2theta)" was an exponent analogy (log X/log N with N = XY), not a theorem shape. DECISION: item 6 was a packaging error, not a new
consequence of the 7/8 theorem. What survives of B12: the exact graded criterion (no built-in 3/4; a mollified mean value off the line with
defect O(1/Y), mollifier length (Y/delta)^(1/(2theta - 1))), which is KNOWN in type (section 4) and, by its own exactness, equivalent at each
finite level to the zero-free box it certifies.

## 4. Search (rule 5): what is known
Queries (2026-11-11): (a) "Lichtman 2022 66/107 level of distribution primes arithmetic progressions well-factorable weights";
(b) "Barban-Vehov weights truncated Mobius divisor sum ... arithmetic progressions large moduli level of distribution beyond 1/2 Graham
Motohashi"; (c) "Beurling 1955 closure problem Riemann zeta L^p zero-free half-plane ... Bercovici Foias". Search summaries only; no paper read.
- (a) Levels beyond 1/2 for PRIMES exist only with (triply) well-factorable weights: Bombieri-Friedlander-Iwaniec 4/7 (from memory), Maynard
  3/5 (arXiv 2006.07088), Lichtman 66/107 (arXiv 2309.08522), Pascadi 5/8 (arXiv 2505.00653, removing the Selberg-eigenvalue dependence).
  They concern primes (Lambda) against well-factorable weights, not the Moebius-truncated divisor sums themselves.
- (b) For the Barban-Vehov weights sum_{d|n, d<=z} mu(d) the literature found is about their MEAN SQUARE (Barban-Vehov; Motohashi; Graham's
  asymptotic; explicit versions by Haye Betah and Berkane; an L^2 bound by Ramare and Zuniga-Alterman; Granville-Koukoulopoulos-Maynard on
  smoothing exponents). No level-of-distribution result beyond 1/2 for these weights in large moduli was found (not found in what was read).
- (c) The graded criterion is classical: Nyman (p = 2, 1950), BEURLING 1955 (zero-free in Re s > 1/p <=> the Nyman-Beurling span is dense in
  L^p(0,1), 1 < p <= 2), Bercovici-Foias 1984 (p = 1; the L^2 closure described through Mellin transforms divided by zeta), de Roton (L^2 for
  the Selberg class), Dimitrov-Oliveira (arXiv 1608.07887: Dirichlet L-functions, p in (1, 2]). So my Hilbert-space version at abscissa theta
  (weighted H^2 with the Poisson weight) is a variant of Beurling's L^p criterion. One consequence worth recording (KNOWN by Beurling's
  theorem, as summarised): the 7/8 theorem is EQUIVALENT to the density of the Nyman-Beurling span in L^(8/7)(0,1), and "below 3/4" is
  density in L^p for some p > 4/3.

## 5. Status of my B12 after this file
(a) of B12: form and vector CORRECTED (g = zeta B with B(1) = 0; threshold 4 delta/Y). (b): the requirement (mollifier longer than the height,
defect O(1/Y)) STANDS and is checked numerically at one point; the "level 1/(2theta)" phrasing WITHDRAWN as a theorem shape (kept only as
exponent bookkeeping). (c), (d): unchanged. RISK: WITHDRAWN (packaging error, section 3). The route remains an exact graded criterion with
no 3/4 cap, known in type (Beurling), whose finite-level content is a mollified mean value off the critical line.
