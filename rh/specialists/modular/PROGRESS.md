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

## 01:59 (clock) PREDICTION (P9), before computing: the family on e_0 at L = 0.75 and L = 1.0
Atoms n <= e^(2L): n <= 4 and n <= 7; q_w(n) = n^w prod_{p|n}(1 - p^(-2w)).
PREDICTION: (i) at w = 0.01 the value is within 0.5% of lane A's q_00 (pole included); (ii) the curve is monotone
decreasing in w on [0.01, 0.5] as at L = 0.5; (iii) the w = 1/2 end is within 20% of q_00 at both windows.

## Result of P9 (d12_family.log, weil_q00.log; mpmath 20 digits; builder with Arb 200 bits)
   L = 0.75 (atoms n <= 4): 0.057726 (w = 0.5), 0.058225 (0.2), 0.059335 (0.05), 0.059763 (0.01); builder q_00 = 0.0598792939.
   L = 1.0  (atoms n <= 7): 0.050510 (w = 0.5), 0.052407 (0.2), 0.053174 (0.05), 0.053312 (0.01); builder q_00 = 0.0533411242.
(i) HIT: 0.19% and 0.05% off at w = 0.01. (ii) HIT: monotone decreasing in w on the points computed. (iii) HIT: the
w = 1/2 end is 3.6% and 5.3% below q_00 (8.2% at L = 0.5). So on e_0, at three windows, the Weil matrix element is the
w -> 0 end of Suzuki's arithmetic family, and the half-shift end is within 10% of it. One vector; no claim beyond it.

## 01:59 (clock) NEW MAIN TASK from the coordinator (owner's rule 13: fewer measurements, more structure; one object,
three toolkits): Phi(s) = E*(omega, s). Read rh/HUNCHES.md whole, digest openai-qrh-11-12.md whole, openai-qrh-7-8.md
to line 120, Bombieri-Garrett arXiv 2002.07929 (abstract, contents, introduction). Wrote OBJECT_PHI.md (221 lines).
Sanity checks of formulas only (phi_check.py.txt, phi_check.log; mpmath 20 digits, lattice sums |m|,|n| <= 400, s = 2.5):
E*(omega,s) = 0.1793191816 (lattice) against 0.1793191826 by both closed forms; E*(i sqrt5, s) = 0.6219439099 against
0.6219439117; E*((-1 + i sqrt5)/2, s) = 0.1946334709 against 0.194633472 (differences = truncation of the lattice sums).
Found while writing: my recollection of the formula for L(s, D f^2)/L(s, D) was wrong by a term p^(-s); the lattice
count (Hecke operator on delta_omega) and the classical identity for x^2 + 3y^2 agree with each other, and that is what
OBJECT_PHI 3(c) states. No prediction was made for this file (no measurement).

## Session 2 (02:15-02:40 UTC, after a container restart): Round 2 on the common object (rule 13)
Read: the other two seats' OBJECT_PHI.md, HUNCHES F3-F5 and H9, NOTEBOOK N43-N46, Dunn-Radziwill arXiv 2109.07463 sec. 5.1
(Patterson's coefficients as their (5.7)), the 11/12 paper's passages quoting them. Wrote OBJECT_PHI.md "Round 2" (about 130 lines).
No prediction (structure, not measurement). Sanity checks only (rs_theta_check.py.txt, .log; mpmath 25 digits): the Bessel
integral int u^(2s-1) K_{1/3}^2 = sqrt(pi)Gamma(s+1/3)Gamma(s-1/3)Gamma(s)/(4Gamma(s+1/2)) and its Gauss-multiplied form agree with
quadrature to 15 digits at s = 0.9, 1.5, 1.2+0.7i; the 3-part of sum |tau|^2 N^(-s) agrees with its closed form at s = 2, 1.3.
Result: the Rankin-Selberg identity of the cubic theta function is exact with Gamma factors (they match Gamma(s)Gamma(3s-1));
the factor at 3 is (1 + 3^(1-2s))(1 - 3^(-s)) after completion.
Corrected while writing: I first wrote that the second zero (rho+1)/3 "contracts" the Jensen defect; to first order it
contributes about three times as much as rho (it is three times closer to the line and three times lower).

## Round 2b (02:40-02:50 UTC): lead's correction (Schoenberg) checked by reading Groechenig arXiv 2007.12889 (theorem
statements) and Newman-Wu arXiv 1901.06596 (Polya, de Bruijn sections). Log-concavity test withdrawn. "Every zero twice"
examined: union of two copies, kernel = K * K dilated by 3; no theorem of the asked shape can exist (Epstein fake). No numerics.

## 02:45-03:00 UTC: SHORT_FAMILY.md (new common object, rule 13 (b); SP-operator's answer not read). Read N49, N53, the
11/12 paper's sections 2, 4.4, 5 in the text. No numerics. Finding: the step needing H > D is (2.15) (theta + quadratic large
sieve, dual column length calH^2/X); at H = D^(1-theta) the transfer has b = 1 as a fixed point and returns the trivial bound.

## 03:10 UTC: seminar S2 (board s2). Read B1-B9 (incl. the lead's B9: Deligne tensor-power limit, quasi-RH fixed point).
Answered B3 as B10 (long form S2_B3.md). Read for it: Dunn-Radziwill main theorem; 11/12 paper App. A.2 lines 2695-2752. No numerics.

## 03:40 (clock) PREDICTION (P10), before computing: rightmost real part of zeros of the Davenport-Heilbronn function
Derivation (NOTES below in S2_B23.md): f = c L(chi) + conj(c) L(conj chi); f(s) = 0 with Re s > 1 iff
F(s) := sum_{p = 2,3 mod 5} eps_p arctan(p^(-s)) (eps = +1 at p = 2 mod 5, -1 at p = 3 mod 5) equals pi/2 + arctan(kappa) + k pi; by
Kronecker the closure of the values of F on Re s = sigma is the set of sums eps_p arctan(p^(-sigma) z_p), |z_p| = 1, whose real parts
fill [-M(sigma), M(sigma)], M(sigma) = sum_{p = 2,3 mod 5} arctan(p^(-sigma)). The nearest target is pi/2 - arctan(kappa) = 1.2940.
So zeros exist in Re s > 1 and their real parts accumulate up to sigma_1 with M(sigma_1) = 1.2940.
PREDICTION: sigma_1 in [1.01, 1.06], my point guess 1.03.
Result of P10 (dh_sigma1.log; numpy, primes <= 10^7 exactly, PNT tail ~0.027; one implementation, 4 s): M(1.01) = 2.503,
M(1.05) = 1.712, M(1.10) = 1.381; sigma_1 = 1.1204 (tail uncertainty affects the third decimal). Prediction [1.01, 1.06]: MISS (I
underestimated the head of the prime sum: arctan(2^(-sigma)) + arctan(3^(-sigma)) alone is 0.72).
## 03:45 UTC: posted B26 (B22) and B27 (B23); SHORT_FAMILY 4(a) corrected.
## 03:55 UTC: TRANSPORT.md written (N62-N65, Bettin-Gonek and Conrey digests read). No numerics.
## 05:25 UTC: S3 B3 answered as B7 (S3_B3.md). No numerics.

## 05:45 (clock) PREDICTION (P11) for the identities of CUBIC_ABSORB.md, before computing
For split primary primes pi of Z[omega], N(pi) = p <= 400, with chi = (./pi)_6, gamma_j = p^(-1/2) sum_x chi(x)^j e(x/pi), e(z) = exp(4 pi i Im z/sqrt3),
alpha = pi/|pi|, G = conj(chi(4)) gamma_3 (READER-4's corrected form):
 (I1) gamma_2^3 = -alpha;  (I2) gamma_1 gamma_2 = -alpha G;  (I3, derived) -gamma_2^2 = alpha conj(gamma_2) [mu x cubic^2 = alpha x conj cubic];
 (I4, derived) -conj(gamma_2) = gamma_1 conj(alpha) conj(G) [mu x conj cubic = sextic Gauss sum x ray class / alpha];
 (I5) gamma_3^2 = chi(-1)^3 = (-1/pi)_2 [quadratic: no constant -1].
PREDICTION: all five hold to 1e-12 at every prime; (I3), (I4) are algebraic consequences of (I1), (I2), so they cannot fail alone.
Result of P11 (cubic_absorb_check.log; double precision, 74 split primary primes, N <= 400): I1 3.5e-14, I2 2.3e-14, I3 2.6e-14,
I4 2.2e-14, I5 3.1e-14. HIT (all five).
## 05:48 UTC: CUBIC_ABSORB.md written (88 lines).
## 06:30 UTC (approx.): H_CUB.md written (N76 task). No numerics (no prediction). Read: S3_SLOPE sec. 1, 7; DDDS24 2410.03048 sec. 5-6
statements; Dunn-Radziwill 2109.07463 sec. 2, 5.1, Prop typeI, sec. "Improved cubic large sieve"; Dunn 2403.13151 sec. 4.
Finding: (H_cub) in A2's shape follows from Heath-Brown's cubic large sieve (frequency shift = cubic character of h); family sign is
frequency h^2 (opposite to N76's dilation hn): no theta residue, post-theta twist non-trivial cubic (HEURISTIC, R1). CUBIC_ABSORB 3(c) corrected.
## (new session) LOCAL_PARAMETERS.md written (H-2 task). Construction only, no numerics. Read CORE.md, HUNCHES part H.
Finding: rho -> Ind(|.|^(rho-1/2)) -> Sym^k multiplies r with fixed half-width, but unitary <=> beta = 0 already (GL_2(R) dual): empty.
Candidates have at most two of {automorphic+Satake, unitary at the parameter, parameter controlled by a zero}. Q 5, Toward RH 1.
## (session 2 of the object) TRIANGLE.md written. Construction only, no numerics. Read CORE.md, N83-N85.
Finding: P_rho = |det|^(i gamma) x Ind(|.|^beta,|.|^-beta) has A + B_1 + C (L(1/2,P_rho) = zeta(rho)zeta(1-conj rho)); corrects N83.
Theorem 1: character constituent => RS pole at 1 + 2k beta, so uniform B_k <=> beta = 0; missing ingredient = decay at the cusp. Q 6, RH 1.
## (session 3 of the object) DISCRETE_ORBIT.md written. Construction only, no numerics. Read N87, N88.
Findings: T_p-equivariant cutoffs are (log p)-periodic, so no equivariant truncation even with a lattice (also false over F_q(t);
there the bound is Harder's compact support). A cusp over Q forces a continuous archimedean height. Zeta has no lattice-frequency factorisation.
## MISSING_SPACE_CHECK.md written (adversarial check of rh/MISSING_SPACE.md). No numerics; literature mostly FROM MEMORY.
Verdicts: sec 2 correct with fix (the gap is ample class + RR amplifier, not the group law; C x C handles signed classes); sec 3 wrong as
stated (Witt vectors with F_n, function spaces see all characters); sec 4 correct with fix (closest: Bost-Kuehn omega-hat^2 ~ zeta'(-1)/zeta(-1)).
## (GUESS_A session) PREDICTION (P12), written before computing (clock: 20:58 UTC)
For 1 <= n < m <= 60: |Res(Phi_m, Phi_n)| = p^phi(n) if m/n is an integer power of a prime p (n | m), else 1 (Apostol's formula, from memory);
in particular n = 1 gives Phi_m(1) = e^Lambda(m). Prediction: holds for every pair, no exception.
Result of P12 (scratchpad res_check.py, sympy, memcap 1 GB): 1770 pairs, 0 failures. HIT.
