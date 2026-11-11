# PROGRESS of SP-modular, session 1 (2026-11-11)

Written as I go. Times are UTC from `date -u`.

## 00:49 start. Read the record
Preamble, roster, SP-reflection's CHARTER/LIBRARY/MEMORY, HUB, KNOWLEDGE (B1-B11), JOURNAL J4, NOTEBOOK N33-N38,
ATLAS F17/F20/F22, ideas 12/13, board B13-B17, B69, B71, B81, B111-B113, B117, B118, B131-B133, B137, B139, B140,
B147-B150, B158, B160, B161, B163-B165, B168, B172; library INDEX; digests brs-fourier-interpolation.md and
suzuki-1606.05726.md in full.

## 00:53 onward: sources read (details in LIBRARY.md); times in this file are from `date -u` where marked (clock)
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

## 01:16 (clock) PREDICTION (P4), before computing: two-route check of the norm identity for pseudo-Eisenstein series
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

## 01:25 (clock) An exact identity found by hand while preparing Q3 (PREDICTION P5 before the machine check)
With a_n(m) = r_n(m)/(2n): multiplicativity at the first coprime pair (2,3) is a polynomial identity in n:
   2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8)        [hand computation]
so a_n(2) a_n(3) = a_n(6) exactly for n in {1, 2, 4, 8}. PREDICTION: the exact-rational script confirms the identity
at 12 rational values of n, and the analogous defect at the pair (2,5), 2n r_n(10) - r_n(2) r_n(5), also vanishes at
n = 1, 2, 4, 8 (if it did not, n = 4 or 8 would fail to be multiplicative: contradiction with Jacobi's formulas).

## 01:36 (clock) PREDICTION (P6) for the half-shift window instrument (idea SP-modular/#1), before computing
Object: G_l = 1 + K on L^2(-l, l) (v = log y; functions supported between heights e^(-l) and e^l), K the Hankel operator
of NOTES D4 (atoms phi(c)/c at -2 log c, kernel kappa). G_l is a Gram operator (norm of a pseudo-Eisenstein series), so
its lowest eigenvalue mu(l) is > 0 (strictly, by the zero count of NOTES D7 (c)).
First prediction (written in the idea log a few minutes earlier): mu(l) decays only exponentially in l, about e^(-l/2), because the
spectral side is absolutely continuous. SECOND THOUGHT before computing: the near-null vectors are functions
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

## Result of P6 (halfshift_window.log, halfshift_window2.log; numpy double precision, Galerkin upper bounds, 1 minute)
Lowest eigenvalue on L^2(-l, l) (M = 1600 cells; "<=" where the value still falls with M):
   l      1 + K (Gram form)   1 + K_c (pole removed)   1 - K_c        top of 1 + K_c
   0.25   0.42403             0.41510                  0.35596        1.64404
   0.50   0.18452             0.17892                  0.25188        1.74812
   0.75   0.016764            0.016666                 0.13433        1.86567
   1.00   1.16e-4             1.16e-4                  6.74e-3        1.99326
   1.25   <= 1.9e-6           <= 1.9e-6                <= 1.1e-5      1.99999
- First prediction (exponential decay): MISS. Second thought (faster than exponential): HIT in shape; no law fitted.
- NOT predicted: 1 - K (pole included) is NEGATIVE already at l = 0.25 (-0.066): the pole of phi at s = 1 is a rank-one
  square (3/pi)|<f, e^(-v/2)>|^2 that has the right sign for 1 + K and the wrong sign for 1 - K. With the pole removed
  (K_c = compression of the unitary involution S) both 1 + K_c and 1 - K_c are positive and ||K_c|| < 1 (top < 2), as
  Suzuki's Prop. 4.4 says after his Blaschke factor. Same anatomy as the board's "one wrong-sign square = the pole" (B25).
- The EVEN combination 1 + K_c has the smaller margin from l = 0.5 on (the board's B112: the even block fails first).
- Missing denominator: with the weight of c = 2 set to 0 the form is negative at l = 0.75 (-2.3e-4), -0.157 at l = 1:
  HIT (the atom enters at l = log 2 = 0.693).
- Pinning of the weight at c = 2 (true value 1/2; eta = change): l = 0.75: eta in [-0.495, +2.55]; l = 1: [-8.0e-4, +0.221];
  l = 1.25: [-3.4e-5, +1.5e-3] (M = 800, lower ends not converged); l = 1.5: [-1.4e-5, +5.3e-5] (not converged).
READING. This is an UNCONDITIONALLY positive form (a norm; for K_c: unitarity of the scattering phase, i.e. the functional
equation alone) which shows every window phenomenon the seminar measured on the Weil form: collapse of the margin,
pinning of the arithmetic weights as their atoms enter, failure right after a missing atom enters, one wrong-sign pole
square, the even block weakest. It is a POSITIVE CONTROL: the first control in the record on the positive side.
What it calibrates: none of those phenomena, by itself, is evidence about RH.

## Check of the Hecke integral (NOTES D2), hecke_integral_check.log (mpmath 25 digits, 3 s)
The K-Bessel Mellin transform quoted from memory is confirmed at three parameter sets to 1e-28. Termwise sum over
n <= 4000 at S = 2.3, d = 0.2: int = 0.0663579, so 2 x int = 0.1327159 against xi(S+d) xi(S-d) = 0.1327351 (the difference
1.9e-5 is the tail of the Dirichlet series). The factor 2 in D2 stands.

## 01:45 (clock) board: posted B211 (Q1), B212-B214 (Q2), B215-B216 (Q3). Read B173-B210: the lead has opened "the bridge"
(rh/BRIDGE.md, idea 27); plank 9 (S1-mirror B199) found that the Davenport-Heilbronn impostor has a Poisson map.

## 01:51 (clock) PREDICTION (P7), before computing: unitary-side check of NOTES D12 (c)
For even f, <f,(1 - calK_w) f> = (1/pi) int |fhat(x)|^2 sin^2(theta_w(x)) dx, theta_w(x) = arg xi_S(1/2 + w - ix),
xi_S(s) = s(s-1) pi^(-s/2) Gamma(s/2) zeta(s). Claim: divided by w it tends to sum over all zeros gamma (both signs) of
|fhat(gamma)|^2 as w -> 0 (assuming the zeros used are on the line: the first 17 are). Test function: Gaussian
f(x) = exp(-x^2/(2 s^2)), s = 0.12, fhat(x) = s sqrt(2 pi) exp(-s^2 x^2/2).
PREDICTION: ratio (left side / w) / (zero sum) = 1 + O(w): within 15% at w = 0.1, within 3% at w = 0.01, and the
deviation shrinks roughly linearly in w. If the ratio tends to 2 or 1/2 my constant in D12 (c) is wrong.

## Result of P7 (d12_check.log; mpmath 20 digits, 10 s)
Zero sum 0.0105228583 (17 zeros of each sign). (1/(pi w)) int |fhat|^2 sin^2(theta_w) / zero sum = 1.7528, 1.3876, 1.1966,
1.0793, 1.0398 at w = 0.2, 0.1, 0.05, 0.02, 0.01: the limit is 1 and the deviation is linear in w (about 4w): the constant of
D12 (c) stands. My predicted sizes (15% at w = 0.1, 3% at w = 0.01) MISSED (39% and 4.0%); limit and linearity HIT.

## 01:44 (clock) THE BOARD WAS CLOSED by the moderator (B218) while I was posting. Not posted: two questions (to
SP-operator, SP-reflection), my line for B158, a caveat to my own B214 (4), a note on plank 9 of the bridge. All in
posts/UNPOSTED.md.

## 01:56 (clock) PREDICTION (P8), before computing: PRIME-side check of NOTES D12 (c) on one function
f = (2L)^(-1/2) on (-L, L), L = 0.5 (the basis function e_0 of rh/experiments/r1_A/weil.py.txt). With Suzuki's arithmetic
kernel K_w(u) = sum_n q_w(n) n^(-1/2) calG_w(u - log n), calG_w the causal inverse transform of
gamma_S(s-w)/gamma_S(s+w), gamma_S(s) = s(s-1) pi^(-s/2) Gamma(s/2):   <f,(1 - K_w[L]) f> = 1 - I_w/(2L),
I_w = Phi_w(2L) + q_w(2) 2^(-1/2) Phi_w(2L - log 2),  Phi_w(a) = (1/2 pi i) int_(c) [gamma_S(s-w)/gamma_S(s+w)] e^((s-1/2)a) (s-1/2)^(-2) ds.
PREDICTION: (1 - I_w/(2L))/w tends, linearly in w, to the matrix element q_00 (pole included) that the project's builder
gives for zeta at L = 0.5; agreement within 5% at w = 0.01. If it tends to q_00 WITHOUT the pole term, my bookkeeping of
the factor s(s-1) in D12 is wrong.

## Result of P8 (d12_prime_check.log, weil_q00.py.txt; mpmath 20 digits; lane A's builder with Arb, 200 bits)
PRIME-side check of D12 (c) on f = e_0 (constant on the window), L = 0.5; atoms n = 1, 2 only.
   w                 0.5       0.4       0.3       0.2       0.1       0.05      0.02      0.01
   (1 - I_w/2L)/w    0.080795  0.081452  0.082455  0.083851  0.085687  0.086786  0.087508  0.087759
Lane A's builder: q_00 = 0.0880146104737 WITH the pole term, -1.954000833 without it.
HIT: the family tends linearly to q_00 with the pole (0.087759 + 0.0256 x 0.01 = 0.088015); 0.3% off at w = 0.01.
So on this vector the project's Weil form is the w -> 0 end of Suzuki's (1 - K_w[L])/w, pole bookkeeping included, and
its w = 1/2 end (the half-shift, positive by a theorem) is 0.0808: the whole family moves by 8% on this vector.
CAUTION written at once: on the Gaussian of P7 (not supported in a window) the same normalised quantity INCREASES
with w; so there is no monotonicity in w in general. If (1 - K_w[L])/w were monotone decreasing in w as a FORM on even
window functions, RH would follow from the half-shift theorem; nothing computed here supports that beyond one vector.

## Maass-Selberg on the unitary axis (maass_selberg_check.log; mpmath 20 digits, 44 s). No prediction (sanity check).
2 log T - phi'/phi(1/2+it) + Im(conj(phi) T^(2it))/t computed three ways (phi'/phi numerically; 4 Re xi'/xi(1+2it); sum over
399 zeros of each sign): T = 1: 0.047919 (t = 0.3), 0.146463 (t = 1), 0.313098 (t = 5), 8.021814 (t = gamma_1/2 = 7.0674);
T = 2: 0.520872, 1.351103, 1.755641, 9.627125. First two routes agree to 10 digits; the zero sum is lower by 0.0053 in
every row (its tail beyond gamma_399 = 670, estimated 0.0054). All positive, as a norm must be; the zero gamma_1 shows as
a peak of height 8 = 4 x (1/2)/(1/4) at 2t = gamma_1: a zero seen from the line Re w = 1.
