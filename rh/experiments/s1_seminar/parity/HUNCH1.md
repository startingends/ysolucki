# HUNCH1.md  (seat S1-parity; plank zero of Hunch 1, rh/HUNCHES.md part E; requested by the lead after seminar S1 closed)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Scripts and logs: this folder (h1_*.py.txt, h1_*.log). Floats (numpy) unless said.

## 0. Definitions used in this file

Coordinates. Put v = L - u, so the window is v in [0, l], l = 2L (only the LENGTH of the window matters: PROVED, translation).
For a coefficient sequence c (c(1) = 1) let
    (C_l f)(v) = sum over m with log m <= v of c(m) m^(-1/2) f(v - log m),     v in [0, l],
a causal (lower-triangular) sum of shifts. Z_l is c = 1; its inverse M_l is c = mu (Moebius), because the cut is compatible with
Dirichlet convolution. For another Dirichlet series F = sum a(n) n^-s the pair is c = a and c = b, b = Dirichlet inverse of a.
G_a(L) := operator norm of M_l on L^2[0, l].
G_K(L) := sup of |M_l f| / |f| over the trigonometric polynomials f(v) = sum_{|k| <= K/2} x_k e^(2 pi i k v / l) (K + 1 modes; K = 8, 16, 32).
S(L) := sum_{m <= e^(2L)} |c(m)| m^(-1/2), the trivial bound for both.
Systems: zeta (c = mu); impostor (c = b_DH, inverse of the period-5 coefficients 1, kappa, -kappa, -1, 0); F_d = zeta(s-d) zeta(s+d),
d = 1/4 (c = (mu n^d) * (mu n^-d)); its base point F_0 = zeta^2 (c = mu * mu); one-prime system (c(1) = 1, c(2) = -1, nothing else).

## 1. PREDICTIONS, written 01:52:19 UTC 2026-11-11, before any code for this file exists

P1 (G_a, the L^2 norm). It CANNOT see RH: I expect G_a(L) to be a fixed fraction (0.5 to 1) of the trivial bound S(L) for every
   system, growing like e^L for zeta too. Reason (HEURISTIC, Kronecker): L^2 contains e^(itv) with p^(-it) close to -1 for all
   p <= e^(2L), on which every term mu(m) m^(-it) is positive. So the rates 0 / 0.62 / 0.5 are NOT the rates of definition (a).
   Numbers expected for zeta at L = 0.25, 0.5, 0.75, 1.0, 1.25, 1.5: 1.0, 1.5, 1.9, 2.6, 3.0, 3.7, each +-30% (S = 1, 1.71, 2.28, 3.52, 4.13, 5.41).
   The lead's blind prediction 'zeta's G(2L)/G(L) < 4 on [0.25, 0.75]' will hold (I expect 1.4 to 2.0), for a trivial reason.
P2 (G_K, smooth class). zeta: between 1 and 2 at every L <= 1.5 and K <= 32, rising slowly with K, no visible growth in L.
   Impostor: NOT larger than zeta's (its coefficients at 2 and 3 are +-0.284 instead of -1): G_K within [0.6, 1.3] x zeta's; no trace
   of e^(0.62 L). F_{1/4}: larger than zeta's by 1.5 to 3 (coefficients -(p^d + p^-d)), but against its own base point zeta^2 the ratio
   stays in [1.0, 1.5] on L <= 1.5: no visible e^(0.5 L) either. One-prime system: G <= 1 + 2^(-1/2) = 1.707 for every L (bounded).
P3 (when the impostor's pole shows). In the smooth class: only when y^0.3085 exceeds about 85.7 |f'(rho_0)| (y = e^(2L)), i.e. L between
   6 and 8. At the resonant frequency t = 85.7 (not in the class for K <= 32 on these windows): the partial sums of 1/f_DH exceed
   zeta's at the same t by a factor 3 somewhere between y = 100 and y = 3000 (L = 2.3 to 4). So the lead's expectation (invisible up
   to the first failure of the form at L = 1.71) is what I expect to find.
P4 (doubling as mathematics). I expect an EXACT identity M_2l = [[M_l, 0], [H R, M_l]] with H the Hankel (mirror) operator of the
   Moebius measure on (0, l]^2, and H = - M_l H_1 M_l^# with H_1 the mirror operator of the integer comb; hence only the QUADRATIC bound
   G(2L) <= G(L) + |H_1| G(L)^2. To be derived and checked numerically below.

## 2. RESULTS OF PLANK ZERO  (COMPUTED; `python3 tools/memcap.py 1 python3 h1.py.txt table|identity|longrange`, `... h1b.py.txt`; logs h1_table.log,
##    h1_identity.log, h1_longrange.log, h1b.log; numpy floats; each run under 2 minutes)

### 2.1 Definition (a), the L^2 operator norm, is blind to the zeros.  PROVED + COMPUTED
PROVED. Conjugating by multiplication with e^(itv) turns c(m) into c(m) m^(-it) and does not change the norm. If the signs of c on
its support are given by a completely multiplicative function (true for mu, for mu*mu and for F_d: sign = Liouville's lambda), then
by Kronecker's theorem (the log p are rationally independent) there are t with m^(-it) arbitrarily close to sign c(m) for all
m <= e^(2L), and the sum is finite, so   G_a(L) = norm of the operator with |c(m)| in place of c(m).
For zeta this is the operator with |mu|: it does not know the signs of mu, hence nothing about the zeros.
COMPUTED (that positive operator; grid 6000, agrees with grid 3000 to 3 digits):
| L | 0.25 | 0.5 | 0.75 | 1.0 | 1.25 | 1.5 | 1.75 | 2.0 |
|---|---|---|---|---|---|---|---|---|
| zeta G_a | 1.000 | 1.414 | 1.729 | 2.177 | 2.597 | 3.205 | 3.934 | 4.926 |
| trivial bound S | 1.000 | 1.707 | 2.284 | 3.518 | 4.136 | 5.410 | 6.968 | 8.829 |
| impostor: between | 1.000 | 1.105 | 1.399 | 1.639 | 2.035-2.038 | 2.477-2.548 | 3.03-3.28 | 3.64-4.38 |
| F_d, d = 1/4 | 1.000 | 1.949 | 2.838 | 4.353 | 5.927 | 8.612 | 12.31 | 18.01 |
| zeta^2 (d = 0) | 1.000 | 1.932 | 2.795 | 4.202 | 5.655 | 8.014 | 11.13 | 15.67 |
| one-prime | 1.000 | 1.414 | 1.551 | 1.551 | 1.611 | 1.642 | 1.660 | 1.660 |
(impostor: its signs are not multiplicative, so I give [grid value of the signed operator, norm with |c|].)
zeta's G_a(2L)/G_a(L) = 1.41, 1.54, 1.85, 2.26 at L = 0.25, 0.5, 0.75, 1.0: below 4, as the lead predicted, for a trivial reason. The local rate
d log G_a / dL rises towards 1 (0.82 between L = 1 and 2): G_a ~ e^L for every system. The rates 0 / 0.62 / 0.5 are not rates of (a).

### 2.2 Definition (b), K + 1 Fourier modes of the window.  COMPUTED (h1_table.log)
| | L = 0.25 | 0.5 | 0.75 | 1.0 | 1.25 | 1.5 | 1.75 | 2.0 |
|---|---|---|---|---|---|---|---|---|
| zeta, K = 8 | 1.000 | 1.414 | 1.675 | 1.778 | 1.735 | 1.784 | 1.792 | 1.818 |
| zeta, K = 16 | 1.000 | 1.414 | 1.708 | 2.055 | 2.382 | 2.761 | 3.141 | 1.821 |
| zeta, K = 32 | 1.000 | 1.414 | 1.728 | 2.084 | 2.422 | 2.854 | 3.202 | 3.599 |
| impostor, K = 8 | 1.000 | 1.105 | 1.322 | 1.507 | 1.706 | 1.903 | 2.126 | 2.414 |
| impostor, K = 16 | 1.000 | 1.106 | 1.372 | 1.598 | 1.716 | 1.915 | 2.179 | 2.462 |
| impostor, K = 32 | 1.000 | 1.106 | 1.399 | 1.609 | 1.866 | 2.105 | 2.235 | 2.486 |
| F_d, K = 8 / 32 | 1 / 1 | 1.948 / 1.949 | 2.693 / 2.836 | 3.305 / 4.081 | 3.053 / 5.294 | 3.170 / 7.358 | 3.199 / 9.251 | 3.349 / 11.74 |
| zeta^2, K = 8 / 32 | 1 / 1 | 1.931 / 1.932 | 2.652 / 2.793 | 3.221 / 3.950 | 3.010 / 5.072 | 3.123 / 6.924 | 3.159 / 8.588 | 3.302 / 10.66 |
| one-prime, K = 8 / 32 | 1 / 1 | 1.414 / 1.414 | 1.498 / 1.551 | 1.551 / 1.551 | 1.600 / 1.611 | 1.628 / 1.642 | 1.641 / 1.642 | 1.658 / 1.660 |
What the table shows. (i) 'K modes of the window' is NOT a fixed smooth class: its top frequency is pi K / (2L) and falls as L grows. zeta's
G_K jumps down from 3.14 to 1.82 between L = 1.75 and 2.0 at K = 16 exactly when the frequency 14.13 (the first zero) leaves the class.
(ii) Whenever the class contains the height of a zero ON the line, G grows LINEARLY in L (see 2.3). (iii) The impostor is below zeta
at K = 32 for all L <= 2 and at K = 16 for L <= 1.75; it is above zeta at K = 8 for L >= 1.5 and at K = 16, L = 2 (after 14.13 has left
zeta's class), and that is caused by its low ON-line zeros (5.09, 8.94), not by its off-line pole. (iv) F_d against its own base point zeta^2: ratio 1.01 to 1.10 at K = 32 and 1.013 to 1.015 at K = 8, L >= 1.25: no rate visible.

### 2.3 The right smooth class is a fixed frequency band; frequency-resolved size.  COMPUTED (h1b.log), partly PROVED
s_L(t) := |M_l e_t| / |e_t| for the pure frequency e^(itv) on the window: s_L(t)^2 = (1/l) int_0^l |sum_{m <= e^v} c(m) m^(-1/2-it)|^2 dv (exact).
G_T(L) := max over |t| <= T of s_L(t) (a lower bound for the norm on any class containing the band; t-grid 0.02).
| L | 0.5 | 1.0 | 1.5 | 1.72 | 2.0 | 2.5 | 3.0 | 3.5 | 4.0 | 5.0 | 6.0 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| zeta, T = 100 | 1.26 | 1.95 | 2.66 | 2.96 | 3.38 | 4.11 | 4.83 | 5.55 | 6.27 | 7.73 | 9.18 |
| ... attained at t = | 95.18 | 13.98 | 14.06 | 14.10 | 14.10 | 14.12 | 14.12 | 14.12 | 14.12 | 14.12 | 14.12 |
| impostor, T = 100 | 1.07 | 1.49 | 2.17 | 2.57 | 3.18 | 4.52 | 6.27 | 8.52 | 11.57 | 20.67 | 36.53 |
| ... attained at t = | 95.18 | 86.00 | 85.78 | 85.74 | 85.72 | 85.72 | 85.72 | 85.70 | 85.70 | 85.70 | 85.70 |
| impostor, T = 10 | 1.07 | 1.42 | 1.82 | 2.01 | 2.27 | 2.68 | 3.12 | 3.56 | 3.98 | 4.87 | 5.75 |
| impostor, T = 4 | 1.06 | 1.28 | 1.37 | 1.38 | 1.34 | 1.23 | 1.18 | 1.19 | 1.21 | 1.23 | 1.24 |
| zeta, T = 4 or 10 | 1.25 | 1.60 | 1.70 | 1.72 | 1.75 | 1.78 | 1.80 | 1.82 | 1.83 | 1.85 | 1.85 |
| F_d, T = 100 | 1.59 | 3.43 | 6.09 | 7.49 | 9.77 | 14.6 | 20.7 | 28.4 | 38.1 | 65.7 | 109 |
| zeta^2, T = 100 | 1.58 | 3.35 | 5.81 | 7.05 | 9.02 | 12.9 | 17.5 | 22.9 | 28.9 | 43.1 | 60.2 |
| F_d, T = 4 | 1.57 | 2.42 | 2.90 | 3.00 | 3.13 | 3.28 | 3.42 | 3.59 | 3.79 | 4.32 | 5.27 |
| zeta^2, T = 4 | 1.56 | 2.39 | 2.87 | 2.96 | 3.07 | 3.21 | 3.31 | 3.41 | 3.50 | 3.62 | 3.71 |
| one-prime, any T | 1.26 | 1.50 | 1.57 | 1.59 | 1.61 | 1.63 | 1.64 | 1.65 | 1.66 | 1.67 | 1.67 |
(t = 95.18 = 21 pi / log 2 is the trivial alignment 2^(-it) = -1; it wins only at L = 0.5.)
Readings.
 * zeta, band 100: LINEAR growth, slope 1.45 per unit L, located at t = 14.12 = gamma_1. HEURISTIC formula that matches: at s = rho_1 the
   partial sums of 1/zeta are ~ log y / zeta'(rho_1), so s_L ~ 2L / (sqrt 3 |zeta'(rho_1)|) = 1.456 L (|zeta'(rho_1)| = 0.7932). This is the
   hunch's 'zeros on the line give polynomial growth', confirmed with its constant. In bands below gamma_1 zeta's G is bounded (1.85).
 * impostor, band 100: EXPONENTIAL growth located at t = 85.70, the height of its off-line zero; successive ratios per unit of L:
   2.13 (1 -> 2), 1.97 (2 -> 3), 1.85 (3 -> 4), 1.79 (4 -> 5), 1.77 (5 -> 6); e^0.617 = 1.85. The partial sums at t = 85.699 follow
   y^0.3085 / (0.3085 |f'(rho_0)|), |f'(rho_0)| = 1.2557, to 2% at L = 6 and 0.4% at L = 7.45 (h1_longrange.log: 103 against 105, 255 against 256).
   The impostor is BELOW zeta up to L = 2.0 (2.17 against 2.66 at L = 1.5; 2.57 against 2.96 at L = 1.72), crosses between L = 2.0 and 2.5,
   and is above by 1.30, 1.85, 2.7, 4.0 at L = 3, 4, 5, 6.
 * Doubling ratios G_100(2L)/G_100(L), zeta / impostor: L = 1: 1.73 / 2.13; 1.5: 1.82 / 2.88; 2: 1.86 / 3.64; 3: 1.90 / 5.83. zeta's tends to 2
   (linear growth); the impostor's grows without bound. The lead's blind prediction (the impostor's ratio exceeds zeta's by a factor that
   grows with L) HOLDS in this band: 1.23, 1.58, 1.96, 3.07.
 * In bands that do not reach the zero's height the impostor's pole is invisible: T = 4: bounded by 1.38 up to L = 6; T = 10: linear growth
   from its ON-line zeros at 5.09 and 8.94. The off-line term there has size y^0.3085 / (|rho_0 - s| |f'|) = 0.03 at L = 1.72, 0.9 at L = 7.45;
   it overtakes the linear growth only near L = 13 (y of order 1e11). HEURISTIC estimate.
 * F_d against zeta^2: ratio 1.006, 1.025, 1.05, 1.06, 1.08, 1.13, 1.18, 1.24, 1.32, 1.52, 1.81 (band 100); in the band T = 4: 1.01 up to
   L = 2, then 1.03, 1.05, 1.08, 1.19, 1.42 at L = 3, 3.5, 4, 5, 6. Its rate 0.5 is visible from L of about 4 to 5, not before.

### 2.4 Answer to the lead's expectation (question 2)
'The impostor is indistinguishable from zeta on all windows up to its first failure at L = 1.71': TRUE FOR SIZE, FALSE FOR SHAPE.
 Size: in every class I tried (L^2, K modes, bands 4, 10, 100) the impostor's G is not larger than zeta's for L <= 2.0.
 Shape: from L = 1.0 on (partial sums of length 7!) the frequency at which the impostor's cut Moebius operator is largest, over the whole
 band [0, 100], is 86.0, 85.78, 85.74 (L = 1.0, 1.5, 1.72): the height of its off-line zero. Reason (HEURISTIC, and it is how such zeros
 arise): at t near 85.7 the first few powers p^(-it) line up with the signs of the first coefficients (2^(-it) ~ -1, 3^(-it) ~ +1,
 7^(-it) ~ -0.7), which makes the first terms of f cancel and those of 1/f add. So a sum of length 30 does see the pole; what it cannot
 yet show is that the growth there is exponential rather than linear: on [1, 2] the doubling ratio is 2.13 against zeta's 1.73.
 THE POINT THAT MATTERS FOR A BRIDGE: on this side windows far beyond 1.71 cost nothing. L = 6 (sums of length 160 000) took a minute in
 floats; the Weil form at L = 1.72 needed 120 digits. From L = 2.5 the impostor is above zeta and by L = 4 the rate 0.62 is unmistakable.
 So the kill line of the hunch ('the impostor's G is indistinguishable on all computable windows') is NOT met, provided the class is a
 frequency band that reaches the zero's height (T >= 86). With a class of low frequencies only, it is met: nothing shows up to L = 6.

## 3. The doubling question as mathematics (question 3)

### 3.1 The exact doubling identity on the Moebius side.  PROVED (two lines), checked to 1e-15 (h1_identity.log); KNOWN in substance
For any coefficient sequence c and any l > 0, in the splitting L^2[0, 2l] = L^2[0, l] + L^2[l, 2l]:
        C_2l = [[ C_l , 0 ], [ H_c R , C_l ]],     (H_c g)(x) = sum over m with 0 < log m - x <= l of c(m) m^(-1/2) g(log m - x),   (R f)(y) = f(l - y).
(Rows: for v <= l only f on [0, l] enters; for v = l + x the terms with log m <= x reproduce C_l on the second half, the others reach back
across the midpoint.) H_c is the HANKEL (mirror) operator of the measure sum c(m) m^(-1/2) delta_{log m}: kernel 'c*(x + y)', mirror at the
midpoint of the window. It is the same geometry as the seminar's doubling step for the Weil kernel (B25/B60: shift part T, mirror part H).
For an inverse pair (Z with c = 1, M with c = mu), Z_2l M_2l = 1 gives
        H_mu = - M_l H_1 M_l^# ,      M_l^# = R M_l R ,
H_1 the mirror operator of the integer comb sum m^(-1/2) delta_{log m}. In terms of Dirichlet polynomials this is Vaughan's identity for mu
with both cut-offs at sqrt(D), at the length D where its type II term is empty: mu on (sqrt D, D] = - (mu_{<=sqrt D} * mu_{<=sqrt D} * 1).
(KNOWN: Vaughan 1977 / Heath-Brown's identity with k = 2; from memory.)
Consequences (PROVED):   max( G(l), |H_mu(l)| ) <= G(2l) <= G(l) + |H_mu(l)|,     |H_mu(l)| <= |H_1(l)| G(l)^2.
COMPUTED on L^2 (zeta; l = 2L): L = 0.5: G = 1.414, G(2L) = 2.177, |H_mu| = 1.383, |H_1| = 1.729 (e^l - 1 = 1.718), G + |H_mu| = 2.80, G + |H_1| G^2 = 4.87;
L = 0.75: 1.729, 3.205, 2.354, 3.464 (3.482), 4.08, 12.1;  L = 1.0: 2.177, 4.926, 4.042, 6.379 (6.389), 6.22, 32.4.
|H_1(l)| = e^l - 1 to 3 digits: it is the pole (the comb is the density e^(u/2) du plus an oscillating remainder, and the mirror operator of
e^((x+y)/2) has rank one and norm e^l - 1).

### 3.2 The best inequality I can derive, and the exact step where an idea is needed
BEST DERIVED:   G(2L) <= G(L) + (e^(2L) - 1 + o(1)) G(L)^2      (L^2 norms; on a smaller class the same with the class norms of M_l, M_l^#).
It is QUADRATIC, with an exponentially large constant. This is the outcome the hunch lists as a kill line ('the doubling identity relates
G(2L) to G(L)^2 only'). It is not a matter of careless estimation: for a single resonance y^(rho - 1/2) the identity is an equality between
the term at length e^(2l) and the SQUARE of the term at length e^l, so any bound read off H_mu = - M H_1 M^# without cancellation between
the three factors is quadratic.
WHERE THE FUNCTIONAL EQUATION COULD ENTER: only in the middle factor. H_1 is a sum over all integers of a smooth function, the one object
here to which Poisson summation (plank 5) applies: H_1 = (pole part, rank one, kernel e^((x+y)/2)) + (dual part). Then
        H_mu = - (M_l p)(M_l^# p)^T - M_l (dual part) M_l^# ,     p(x) = e^(x/2),   (M_l p)(v) = e^(v/2) sum_{k <= e^v} mu(k)/k .
THE STEP THAT NEEDS AN IDEA, stated exactly: a bound for the right side that is LINEAR in the size of M_l, i.e.
        | (M_l p)(M_l^# p)^T + M_l (dual part of the comb on (0, l]^2) M_l^# |  <=  poly(l) x G(l)     on the class.
Each of the two terms separately is of size G(l)^2 or worse (the first is the square of e^(v/2) sum_{k<=e^v} mu(k)/k, whose L^2 size is
itself an RH-equivalent quantity at length e^l). So one needs cancellation BETWEEN the pole term and the dual term after Moebius inversion
on both sides, to the square-root level. In the classical language this is the type II information that Vaughan's identity does not
contain at this length; I know no mechanism that provides it, and neither B25/B60 nor plank 5 does (next paragraph).

### 3.3 Do the seminar's half-window identities or plank 5 give ANY inequality between G(2L) and G(L)?  NO, and the reason is a control
PROVED (by exhibiting controls): no inequality of the form G(2L) <= poly(L) G(L) can follow from [the half-window identities B25/B60] +
[plank 5: a Poisson/functional-equation identity for the comb] + [an Euler product], in any combination.
 * B25/B60 are identities for ANY even kernel; they hold verbatim for the impostor and for F_d.
 * F_d = zeta(s-d) zeta(s+d) has an Euler product, a functional equation s <-> 1-s and its own summation formula (its comb is
   sum sigma_{2d}(m) m^(-1/2-d) delta_{log m}: Poisson summation applied twice, i.e. a Voronoi formula), so plank 5 has an analogue for it;
   yet its G grows like e^(2dL) (COMPUTED above from L = 4; asymptotically PROVED: 1/F_d has poles at rho +- d), so G(2L) ~ G(L)^2.
 * In the other direction the one-prime system satisfies G(2L) <= 1.71 for all L with no functional equation at all.
So a doubling law with polynomial loss, if true for zeta, must use something F_d lacks. On the board's list that is one item: local roots
of modulus 1 (barrier B11). In the identity of 3.1 that item sits in ONE place: the trivial size of the coefficients, |c(p)| = 2cosh(d log p)
against 1, i.e. in how large M_l can be at all. I do not see how the functional equation can use it.
What B25/B60 DO say in these coordinates (PROVED, bookkeeping only): the Weil form is Q = Z^*(pole + arch)Z + 2 Re<Z psi, Z' psi> (plank 7a), and
positivity on the window 2L is the two-sided bound |H_W| <= T_W for the mirror and shift forms of the Weil kernel on half the window. G(L)
bounds psi by f (|psi| <= G |f|) and nothing in these identities bounds G: the one-prime system has G <= 1.71 and a negative form, and
F_d with d below d_c(L) has a positive form on the window and G as large as zeta^2's. There is no implication in either direction window
by window, hence no inequality between G(2L) and G(L) to be had from the form side.

## 4. The fake-first rule (question 4)

| fake | does it fail the hunch's first statement (G = e^(o(L)) on a fixed band)? | is the failure visible in a computation we can run? |
|---|---|---|
| Davenport-Heilbronn impostor | YES (PROVED asymptotically: 1/f has a pole at 0.8085 + 85.699 i; rate 2 x 0.3085 = 0.617) | In a band reaching t = 86: YES. Maximum sits at t = 85.7 from L = 1.0; above zeta from L = 2.5; ratios per unit L 1.97, 1.85, 1.79, 1.77 for L = 2..6. In a band of low frequencies (|t| <= 10, or 'K modes of the window' with K fixed): NO, nothing up to L = 6; estimated L = 13 |
| F_d, d = 1/4 | YES (poles of 1/F_d at rho +- d; rate 0.5) | Only from L = 4 to 5: ratio to zeta^2 1.3 at L = 4, 1.8 at L = 6 (band 100); 1.42 at L = 6 (band 4). On L <= 1.5: 5% or less: NOT visible on the windows where the Weil form is computable |
| one-prime system | NO. G <= 1 + 2^(-1/2) = 1.707 for every L (PROVED: M = 1 - 2^(-1/2) x shift by log 2). It also satisfies every doubling inequality | Not applicable: for THIS hunch it is not a fake. Its 'zeta function' (1 - 2^-s)^-1 has no zeros, and the statement 'G sub-exponential <=> no pole of 1/F right of the line' is true for it. It fails Weil positivity (from L = 0.56) only because zeta's Gamma factor and pole are imposed on it, and the hunch's first statement does not see that |
ANSWER to 'for which one is the failure not visible in any computation we can run': none in a band reaching height 86, because this side
is cheap (L = 6 in a minute). If the class is restricted to low frequencies, it is the IMPOSTOR (needs L of about 13, sums of length 1e11),
and on windows L <= 1.5 it is BOTH the impostor (in size) and F_d.
Correction to rh/HUNCHES.md, Hunch 1, FAKE FIRST: 'the one-prime system has no functional equation, so no doubling law' is wrong as a test:
it has the doubling law trivially. And F_d shows that the functional equation cannot be the source of a doubling law by itself (3.3).

## 5. Scoring of the predictions of section 1
P1 HIT (G_a is the |mu|-operator norm, PROVED; numbers 1.00, 1.41, 1.73, 2.18, 2.60, 3.20 inside the stated +-30%; ratios 1.41 to 1.85).
P2: impostor within [0.6, 1.3] x zeta's (ratios 0.74 to 1.07 for L <= 1.5): HIT. F_d / zeta^2 in [1.0, 1.5]: HIT (at most 1.06). One-prime bounded: HIT.
   zeta 'between 1 and 2, no growth in L': MISS for K = 16, 32 (2.05 to 2.85 at L >= 1): I had not seen that an ON-line zero inside the class
   gives linear growth.
P3: 'smooth class: L between 6 and 8': MISS, it is later (about 13). 'At the resonant frequency a factor 3 over zeta between L = 2.3 and 4':
   MISS, it is earlier: the partial sums at t = 85.7 are 2.9 times zeta's at the same t already at L = 1.72 (4.96 against 1.69).
P4 HIT (identity exact, quadratic bound only).

## 6. What I did not do
 * No search for the block identity of 3.1 in the literature beyond naming Vaughan's identity from memory.
 * G on classes other than pure frequencies and Fourier modes (e.g. band-limited functions with a window taper); the true norm on a band is
   at least G_T and I did not bound it from above.
 * The exact L^2 norm for the impostor (its signs are not multiplicative; I give an interval).
 * The estimate 'L = 13' for the low band is an extrapolation of two amplitudes, not a computation.
