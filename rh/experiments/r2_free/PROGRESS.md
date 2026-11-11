# R2-free PROGRESS (seat "free", round 2)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.

## 23:12 UTC  Blind predictions BEFORE any computation (idea R2-free/#1, #2)

Objects. theta(q) = sum_{k in Z} q^{k^2}; r_n(m) = coefficient of q^m in theta^n for REAL n (polynomial in n).
a_n(m) = r_n(m)/(2n). c_n(m) = coefficient of m^{-s} in log sum_m a_n(m) m^{-s} (Dirichlet logarithm).
 S = {n >= 0 : r_n(m) >= 0 for all m}        ("additive Wallach set of theta")
 M = {n > 0  : c_n(m) >= 0 for all m}        ("multiplicative ID set of the dial")

Hand results before computing (PROVED by hand, to be rechecked by machine):
 r_n(2) = 2n(n-1) < 0 on (0,1);  r_n(3) = (4/3)n(n-1)(n-2) < 0 on (1,2);
 r_n(7) = 64 C(n,4) + 128 C(n,7) < 0 on (2,3).   So S cap [0,3) = {0,1,2}.
 c_n(2) = n-1; c_n(3) = (2/3)(n-1)(n-2); c_n(4) = 1 + (1/3)(n-1)(n-2)(n-3) - (n-1)^2/2  (= -1 at n=3, -1.5 at n=4, +1 at n=5).

PREDICTION P1 (S): no negative r_n(m) for n in [3,12], step 0.01, m <= 400. I.e. S = {0,1,2} u [3,inf).
   Reason guessed: Wishart/Gindikin pattern, continuous part starts at (universal rank - 1); Lagrange => rank 4.
 CONTROL for P1: triangular numbers psi(q) = sum_{k>=0} q^{k(k+1)/2} (Gauss: 3 triangulars suffice):
   predicted Wallach set {0,1} u [2,inf)  (i.e. negatives exist for every n in (0,1) and (1,2), none on [2,12]).
PREDICTION P2 (M): M cap (0,30] = {1,2,8} exactly (m <= 300 suffices to exclude everything else).
   n=3 and n=4 fail at m=4 (c = -1, -1.5). n=16, 24 fail at some non-prime-power m <= 100.
   n=8 is in M (Euler product (1-2^{1-s}+4^{2-s}) zeta(s) zeta(s-3); hand check of 2-power terms positive).
 CONTROL for P2: dial at n=1.4 fails at m=3 with c = (2/3)(0.4)(-0.6) = -0.16; the Davenport-Heilbronn impostor
   fails already at the level of coefficients (not all >= 0).

## 23:16-23:27 UTC  First results (COMPUTED, exact rational arithmetic, `wallach.py.txt`)
- P1 (S = {0,1,2} u [3,inf)): **MISS**. r_n(16) < 0 at n = 3.25..3.75, r_n(28) < 0 at 3.06..3.19, r_n(23) < 0 at 3.016..3.047,
  r_n(64) < 0 at 3.875, r_n(256) < 0 at 3.984. And just ABOVE 4: r_n(512) < 0 for n = 4+1/64 .. 4+9/64.
  No negative found (m <= 600) for n = 4 + 5/32 and beyond, nor for n in [4.25, 30] step 1/4.
  Reason for the miss: I mapped Lagrange to the wrong place. The discrete part is {0,1,2,3,4}; sparse values of the
  integer members (r_3(4^k) = 6, r_4(2^k) = 24 stay bounded) drag the neighbouring real members below zero.
- P1 control (triangular numbers): predicted {0,1} u [2,inf): **MISS in the same way**: negatives on (2, 2.625] at m = 33, 176;
  none found for n >= 2.75 (m <= 300). So again the continuum starts later than the universal rank.
- P2 (M cap (0,30] = {1,2,8}): at m <= 150 the scan showed a spurious continuum n >= 12.75; raising m to 1200 removes it up to
  n = 14 (first failing m = 180, 240, 360, 420: highly composite numbers). Sub-prediction "n = 16, 24 fail at a
  non-prime-power m <= 100": **MISS** (they survive m <= 150). Main prediction still open above 14; see below.
- Hand polynomials c_2, c_3, c_4 and r_n(2), r_n(3), r_n(7): reproduced by machine (values at half-integers agree).

## 23:27 UTC  Prediction P3 (blind) for the start n0 of the continuous part of S
 n0 in (4.14, 4.6); every failure just above 4 is at a power of 2; for n >= 5 no failure at m = 2^k, k <= 13.
 Prediction P4 (blind) for M: for integer n = 15..30 the first failing m is a highly composite number and exists below 60000;
 mechanism guessed: a_n(m) ~ K m^{n/2-1} with K = pi^{n/2}/(2n Gamma(n/2)) < 1, so the series looks like 1 - K + K zeta, whose
 logarithm has coefficient about K - K^2 (d(m)-2)/2 at m: negative once d(m) > 2/K + 2. For n = 16: K = 0.0588, need d(m) > 36,
 i.e. first failure near m = 1260..1680. For n = 14 predicted d(m) > 2/0.0937+2 = 23.3 -> m = 360 (d = 24). (observed above: 420.)
