# PROGRESS of SP-modular, session 1 (2026-11-11)

Written as I go. Times are UTC from `date -u`.

## 00:49 start. Read the record
Preamble, roster, SP-reflection's CHARTER/LIBRARY/MEMORY, HUB, KNOWLEDGE (B1-B11), JOURNAL J4, NOTEBOOK N33-N38,
ATLAS F17/F20/F22, ideas 12/13, board B13-B17, B69, B71, B81, B111-B113, B117, B118, B131-B133, B137, B139, B140,
B147-B150, B158, B160, B161, B163-B165, B168, B172; library INDEX; digests brs-fourier-interpolation.md and
suzuki-1606.05726.md in full.

## 00:53-01:25 sources read (details in LIBRARY.md)
Zagier 1981 (whole paper, OCR text); Lagarias-Suzuki math/0412039 (abstract, sec. 1, Thm 2.1, sec. 3 start, sec. 5);
Conrey-Ghosh math/9204217 (sec. 1-2, start of 3); Blomer-Brumley 1003.0559 (introduction); arXiv 1809.07605
(Maass-Selberg lemma); Long 0707.3315 (Berger's theorem); 2011.07796 (theta-power eigenform lemma); BRS source
(definition of moderate growth, M_k(Gamma_theta, eps), Prop. 3.1).

## PREDICTIONS written before computing (rule 4)
Wed Nov 11 01:08:01 UTC 2026
(P1) dial coefficients. r_n(m) = coefficient of q^m in (1 + 2q + 2q^4 + 2q^9 + ...)^n. By hand: r_n(2) = 2n(n-1),
     r_n(3) = (4/3)n(n-1)(n-2), r_n(7) = n(n-1)(n-2)(n-3)[8/3 + (8/315)(n-4)(n-5)(n-6)]; hand value r_2.5(7) = -2.1875.
     PREDICTION: the script reproduces -2.1875 exactly.
(P2) PREDICTION (60% confident): for n = 3.5 NO coefficient r_n(m), m <= 2000, is negative; (80%) none for
     n = 4.5, 5.5, 6.5, 7.5 either. If P2 holds, "coefficients >= 0" singles out the integers only for n <= 3.
     If it fails, the first negative m for n = 3.5 is of the form 4^a(8b+7)... no: those vanish at n = 3 only; I
     have no candidate m. Second guess recorded: if a negative exists it is at m = 2^(odd) large (where r_4 is small).
(P3) Hejhal's statement quoted by Lagarias-Suzuki: for 0 < y < 1 the constant term a_0(y,s) = xi(2s) y^s +
     xi(2s-1) y^(1-s) has zeros off the line with arbitrarily large real part. PREDICTION (from |phi(s)| =
     y^(2 sigma - 1) and |phi(sigma+it)| ~ sqrt(pi/t)): for y = 0.9 there is a zero near
     sigma = 1/2 + log(t/pi)/(4 log(1/y)), i.e. sigma about 4.5 to 5.5 for t between 15 and 30; for y = 1.1 the same
     search finds none. Impostor contrast: none (this is a check of a cited theorem, not a test of an idea).

## Results of the three predictions (logs: dial_coeffs.log, hejhal_check.log; one implementation each)
- (P1) HIT: r_2.5(7) = -35/16 = -2.1875 exactly (exact rational arithmetic).
- (P2) MISS for n = 3.5: negative coefficients exist (76 of the first 2000; first at m = 16, 40, 64, 88, 112, 128;
  minimum -1367.7 at m = 1888). Also n = 3.1 (first at m = 28, 47, 103) and n = 3.9 (m = 64, 128, 256, 448, ...: 9 of the
  first 1000). My second guess (multiples of large powers of 2, where r_4 is small) describes n = 3.5 and 3.9, not 3.1.
  HIT for n = 4.5, 5.5, 6.5, 7.5: no negative coefficient among the first 1000.
  Reading: coefficientwise positivity separates the integers from the non-integers on the dial exactly below
  n = 4 (PROVED on (0,3], computed at three points of (3,4)); above 4 the dial is blind to it (computed).
- (P3) HIT: y = 0.9: zero of a_0(y,s) at s = 4.70686244206 + 18.1261394951 i (predicted real part 4.659);
  y = 0.5: four zeros with real part 1.259 .. 1.458 for 15 <= Im s <= 30; y = 1.1: none found by the same search.
  mpmath, 30 digits, not interval-certified; "none found" is not a proof of absence (the theorem for y >= 1 is
  Hejhal / Lagarias-Suzuki).

## 01:37 PREDICTION (P4), before computing: two-route check of the norm identity for pseudo-Eisenstein series
Identity derived by unfolding (NOTES D2): for psi(y) = y^(1/2) f(log y), f real, smooth, compactly supported,
  ||E_psi||^2 = int f^2 dv + sum_{c>=1} (phi(c)/c) int int f(v) f(v') kappa(-(v+v') - 2 log c) dv dv',
  kappa(w) = (1 - e^(-w))^(-1/2) for w > 0, 0 otherwise   [GEOMETRIC ROUTE: totients, finitely many c]
and by the spectral theorem
  ||E_psi||^2 = (3/pi) (int f(v) e^(-v/2) dv)^2 + (1/4pi) int |fhat(-t) + phi(1/2 - it) fhat(t)|^2 dt,
  phi(s) = xi(2s-1)/xi(2s), xi(w) = pi^(-w/2) Gamma(w/2) zeta(w), fhat(t) = int f(v) e^(itv) dv   [SPECTRAL ROUTE: zeta on Re = 1].
PREDICTION: the two routes agree to at least 6 digits for a bump f supported in [-1.2, 0.3] (c = 1, 2, 3 contribute).
If they differ by a clean factor (2, pi, 3/pi) one of my constants is wrong and the identity is not to be posted.

## Result of P4 (gram_check.log; mpmath 25 digits, nested quadrature, 7.7 minutes, one implementation)
HIT: geometric route 0.286868370825262 (int f^2 = 0.0998145906; c = 1: 0.1592678431, c = 2: 0.0555645818 x phi(2)/2,
c = 3: 5.469e-6 x phi(3)/3), spectral route 0.286868351034754 (residue 0.1697934702, continuous 0.1170748809, t cut at 60
where the density is 6.9e-10). Difference 2.0e-8, ratio 1.00000007. The constants phi(c)/c, kappa, 3/pi, 1/(4 pi) stand.

## 01:27 An exact identity found by hand while preparing Q3 (PREDICTION P5 before the machine check)
With a_n(m) = r_n(m)/(2n): multiplicativity at the first coprime pair (2,3) is a polynomial identity in n:
   2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8)        [hand computation, 01:27]
so a_n(2) a_n(3) = a_n(6) exactly for n in {1, 2, 4, 8}. PREDICTION: the exact-rational script confirms the identity
at 12 rational values of n, and the analogous defect at the pair (2,5), 2n r_n(10) - r_n(2) r_n(5), also vanishes at
n = 1, 2, 4, 8 (if it did not, n = 4 or 8 would fail to be multiplicative: contradiction with Jacobi's formulas).

## 01:40 PREDICTION (P6) for the half-shift window instrument (idea SP-modular/#1), before computing
Object: G_l = 1 + K on L^2(-l, l) (v = log y; functions supported between heights e^(-l) and e^l), K the Hankel operator
of NOTES D4 (atoms phi(c)/c at -2 log c, kernel kappa). G_l is a Gram operator (norm of a pseudo-Eisenstein series), so
its lowest eigenvalue mu(l) is > 0 (strictly, by the zero count of NOTES D7 (c)).
First prediction (written in the idea log at 01:35): mu(l) decays only exponentially in l, about e^(-l/2), because the
spectral side is absolutely continuous. SECOND THOUGHT before computing (01:40): the near-null vectors are functions
supported in (-l, l) that are almost odd under the scattering involution; their obstruction is the discrete set of
resonances rho/2 (same zero count as Suzuki's strictness argument), so the margin could collapse faster than any
exponential, as for the Weil window. I now give 65% to FASTER than exponential (log mu(l) convex downward, |log mu| growing
at least like l e^l), 35% to plain exponential. For 1 - K (no norm interpretation known to me): the same law (60%).
Pinning of the totient weight at c = 2 (true value 1/2): admissible interval contains 0 and shrinks at the rate of mu(l).
Impostor contrast: with the weight at c = 2 set to 0 ("missing denominator") the form goes negative at some l between
log 2 and 1.5 (the atom enters at 2l = 2 log 2).
Method: piecewise-constant Galerkin on M cells, exact cell integrals (second differences of the second antiderivative
of kappa, closed form with a dilogarithm), double precision, M = 200, 400, 800 to see convergence. Rayleigh-Ritz gives
UPPER bounds for mu(l).
