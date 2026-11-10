# r1_C  Lane C (Spectral / geometric) -- proposer, round 1

Started 2026-11-10. Read: SUBAGENT_PREAMBLE, PROJECT_BRIEF, KNOWLEDGE (B1-B10), IDEAS (#1-#5), rhlib.py,
and lane A's PROGRESS.md (so as not to redo the truncated Weil form: lane A already reproduced the
Connes-van Suijlekom minimiser and ran it on Davenport-Heilbronn).

Plan (written before computing):
- E1  Real-rooted prime-only family (Hermite-Biehler / Gonek type): F_X(t) = Re[e^{i theta(t)} P_X(1/2+it)],
      P_X = truncated Euler product. Real zeros are free (real function of real t). Measure zero error vs X.
      Controls: fake primes (Beurling-type, B10) and the formal "Euler product" of Davenport-Heilbronn (B1).
- E2  Hermitian pencil (B, A) built ONLY from values of xi'/xi in Re s > 1 (absolutely convergent prime sums):
      rational-Krylov Rayleigh-Ritz for the would-be Hilbert-Polya operator. Ritz values vs first 20 zeros.
      Control: same pencil on Davenport-Heilbronn; positivity scan in the half-plane parameter a.

All runs: 4 CPUs, python3; double precision unless a dps is given. Runtimes are wall-clock on this box.
Davenport-Heilbronn (DH) zeros for comparison are lane A's file ../r1_A/dh_zeros.json (not recomputed here).

## (a) What Weil's proof uses, and the shopping list for "Spec Z x Spec Z"  [PROVED = classical, from memory]
Curve C/F_q, genus g, S = C x C.
- W1 A group Num(S) of divisor classes with a symmetric intersection pairing.
- W2 Special classes: fibres h = C x pt, v = pt x C, diagonal D, Frobenius graphs G_n (n >= 1).
     D.G_n = N_n = #C(F_{q^n}) (fixed points, transversal because dFrob = 0); D.D = 2 - 2g; G_n.G_n = q^n (2 - 2g);
     bidegrees of G_n are (1, q^n).
- W3 Hodge index theorem / Castelnuovo-Severi: E.E <= 2 (E.h)(E.v) for every divisor E. Proof: Riemann-Roch on the
     SURFACE (if E.E > 0 and E.H > 0 then a multiple of E is effective) -- "effective divisors pair non-negatively with ample ones".
- W4 Apply W3 to E = a D + b G_n: |N_n - q^n - 1| <= 2 g q^{n/2}.
- W5 Rationality and the functional equation (Riemann-Roch on the CURVE) turn the bounds for all n into |alpha_i| = sqrt q.
Linear-algebra core (PROVED, one line): W3 on span{G_n} says the Toeplitz matrix T_{ij} = sum_k alpha_k^{|i-j|} q^{-|i-j|/2} is PSD,
and a Toeplitz matrix of finite rank 2g is PSD iff its measure sits on the unit circle (Caratheodory-Toeplitz).
The integer analogue of T is Weil's distribution; Weil positivity is "W3 without the surface".

Needed for Spec Z:                                            candidate                                    status
- R1 square S with real-valued pairing on classes             Arakelov theory (but for curve x Spec Z);       partial
                                                              Connes-Consani square of the scaling site
- R2 correspondences Psi_lambda, lambda in R_+^* (scaling     Connes 1999 adele class space; scaling site;   exists
     flow replaces Frobenius powers), bidegree (1, lambda)    Deninger's foliated spaces (conjectural)
- R3 Lefschetz: D.Psi_lambda = explicit-formula distribution  Connes' trace formula (semi-local proved;      exists semi-locally
     (log p at lambda = p^m, archimedean term)                global form <=> RH)
- R4 Riemann-Roch on the curve (gives functional equation)    Tate's thesis; Connes-Consani RR for Spec Z    exists
- R5 Hodge index / Castelnuovo-Severi on the square           NONE with a proof                              MISSING
- R6 from the inequality for all lambda to the zeros          Weil's criterion (1952)                        theorem
Other objects: Borger's Lambda-rings give a definition of descent to F_1 (and Z (x)_{F_1} Z as a Witt-type object) but no
pairing; Scholze-Weinstein's Spd Q_p x Spd Q_p is a rigorous LOCAL square with partial Frobenii, no intersection theory.
The genuinely missing item is R5: a notion of "effective" on the square with a Riemann-Roch INEQUALITY forcing effectivity.
Sharper remark from this session (HEURISTIC, see idea C4): global geometric positivity does exist over Spec Z
(Maass-Selberg: the L^2 norm of a truncated Eisenstein series is >= 0; Faltings-Hriljac), but every instance controls
xi(w)/xi(w+1), i.e. is displaced from the critical line by exactly 1/2 and proves only "no zeros with Re w > 1".

## E1  Real-rooted prime-only family  [COMPUTED]
F_X(t) = cos Phi_X(t), Phi_X = theta(t) + Im sum_{n<=X} Lambda(n) w(n) n^{-1/2-it}/log n - Im G_X(1/2 - it) + arctan 2t,
w = 1 - log n/log X (Fejer) or 1 (sharp); G_X = pole correction (formula in e1_hb.py.txt). F_X is a real function of real t:
real zeros are free, no zero of zeta is used. Grid step 0.002, zeros by linear interpolation.
Command: `python3 e1_hb.py.txt zeta fejer 3 10 30 100 1000 10000 100000 1000000` (34 s); `... zeta sharp ...`.
| X | zeros below (g20+g21)/2 | max err, first 20 | mean err | err #1 |
|---|---|---|---|---|
| 3 | 20 | 0.692 | 0.297 | 0.2205 |
| 10 | 20 | 0.170 | 0.070 | 0.0574 |
| 30 | 20 | 0.080 | 0.037 | 0.0276 |
| 100 | 20 | 0.060 | 0.023 | 0.0143 |
| 1e3 | 20 | 0.0239 | 0.0098 | 0.0065 |
| 1e4 | 20 | 0.0155 | 0.0058 | 0.0036 |
| 1e5 | 20 | 0.0089 | 0.0037 | 0.0023 |
| 1e6 | 20 | 0.0069 | 0.0027 | 0.0016 |
Sharp cutoff: max err 0.222, 0.068, 0.0187, 0.0081, 0.0068 for X = 10, 1e2, 1e3, 1e4, 1e5.
Fit: max err ~ 1.2/log^2 X (0.9 .. 1.3 over the table). Compare lane A: the truncated-Weil minimiser with primes <= 7 gets
gamma_1 to 3e-26. The count is right from X = 3 on (the count comes from theta alone).
Without the pole correction the family is wrong for X >= 1e4 (first run, kept in the script history): the pole of zeta at 1
must be put in by hand.
Control 1 (B10), "primes" q = p + 1/2: `python3 e1_hb.py.txt fake fejer 10 100 1000 10000 100000`: 30, 38, 42, 43 zeros
below height 78.2 instead of 20. Real-rootedness survives (it is free), the zero set is wrong. NOTE this control is weak:
prod (1 - (p+1/2)^{-s})^{-1} = zeta(s) H(s) with H analytic and non-vanishing in Re s > 0 (HEURISTIC, one-line expansion),
so that system has the same zeros as zeta and only lacks the functional equation. The extra zeros come from arg H.
Control 2 (B1), DH with the formal coefficients Lambda_f(n) of -f'/f (not supported on prime powers, growing: max|Lambda_f|
= 2.3, 5.9, 18.5, 30.8 for n <= 10, 100, 1000, 3000):
`TMAX=120 python3 e1_hb.py.txt dh fejer 30 300 3000; python3 e1_dh_cmp.py.txt 30 300 3000`
(the line "family has 68 zeros in (0.5,80)" should read (0.5,120)).
- The family tracks the 64 on-line DH zeros below 120: median distance 0.031, 0.014, 0.007 for X = 30, 300, 3000.
- It has 68 real zeros where DH has 64 on-line + 2 off-line pairs (85.70, 114.16): the argument principle count is kept and
  every off-line pair is replaced by a PAIR OF REAL ZEROS ("shadow pair"):
  near 85.699: (85.262, 86.113), (85.474, 85.917), (85.573, 85.822) for X = 30, 300, 3000; gap 0.851, 0.443, 0.249 -> 0.
So this family cannot tell zeta from the impostor by real-rootedness (it is real-rooted for both); the off-line zero shows up
as a pair of real zeros that close up as X grows, which by Hurwitz is exactly the failure of locally uniform convergence.

## E3  Exact Fejer-window Weil test (the derivative of the phase of E1, with the exact archimedean term)
S_X(t) := sum over zeros of ghat(gamma_rho), g(x) = (1 - |x|/V)_+ e^{-itx}, V = log X, ghat(r) = (4/V) sin^2((r-t)V/2)/(r-t)^2.
Prime side: S_X(t) = Pole + Arch - 2 sum_{n<=X} Lambda(n) n^{-1/2} (1 - log n/log X) cos(t log n)  (formulas in e3_phase.py.txt).
Validation [COMPUTED]: `python3 e3_phase.py.txt zeta 60 50 check`: prime side vs sum over 20000 zeros + tail agree to 8 digits
at t = 0, 10, 14.135, 17.5, 50 (0.02060674, 0.07894864, 3.94811192, 0.06826132, 3.86441616).
Lemma F [PROVED, short; critic please check]. RH <=> S_X(t) >= 0 for all real t and all X > 1 <=> the same for all t and
an unbounded sequence of X.
  (=>) every term ghat(gamma - t) >= 0 when gamma is real. (<=) for f in C_c^infty, h = f * f~, the prime-side functional P
  satisfies P(T_V h) = (1/2pi) int S_X(t) |fhat(t)|^2 dt >= 0 (T_V = triangle), and P(T_V h) - P(h) = -P(|x| h)/V -> 0
  (|x| h is Lipschitz with compact support, P is finite on it). So W(f * f~) >= 0 for all f: Weil's criterion.
  In words: the triangle is positive definite, products of positive definite functions are positive definite (Schur).
  This is Weil positivity restricted to a 2-parameter family; an equivalence (B6), not a reduction.
Numbers [COMPUTED], t in [0,120], grid 0.005: `python3 e3_phase.py.txt zeta 120 10 100 1000 10000 100000 1000000`
| X | min_t S_X(t) | at t | min * log X |
|---|---|---|---|
| 10 | +0.033377 | 0.000 | 0.0769 |
| 100 | +0.014718 | 7.345 | 0.0678 |
| 1e3 | +0.010570 | 0.455 | 0.0730 |
| 1e4 | +0.008703 | 7.320 | 0.0802 |
| 1e5 | +0.007019 | 0.000 | 0.0808 |
| 1e6 | +0.005356 | 0.000 | 0.0740 |
Never negative; the margin is ~ 0.075/log X. HEURISTIC: S_X(0) log X = 8 sum_{gamma>0} sin^2(gamma V/2)/gamma^2, which lies in
[0, 8 * 0.0231] = [0, 0.185] with mean 4 sum_{gamma>0} gamma^-2 = 0.0924 (sum gamma^-2 = 0.023105 from memory; close to lambda_1 = 0.023096);
if the ordinates are linearly independent over Q its liminf is 0. So there is no uniform slack (B3).
Control (DH, formal Lambda_f, alpha = 3/4, no pole): `python3 e3_phase.py.txt dh 120 5 10 20 30 50 70 100 150 200 300 500 1000 3000`
min_t S_X = +0.195, +0.139, +0.090, +0.085, +0.091 for X = 5, 10, 20, 30, 50; then -0.132 (X = 70, at t = 84.455),
-0.421 (100), -0.617 (200), -1.145 (300), -2.749 (1000), -4.785 (3000, at t = 85.075).
The impostor fails this one-line test at X* in (50, 70], next to its first off-line zero 85.70. Lane A's full eigenvalue
minimisation first fails at e^{2L*} in (30, 31.2]. So the plain Fejer window loses only a factor ~2 in X against the optimal
test function, at a cost of 0.2 s in double precision instead of 500-bit linear algebra.

## E2  Hermitian pencil from prime-side data in Re s > 1 (rational-Krylov Rayleigh-Ritz)
Nodes s_j = sigma0 + i t_j, sigma0 > 1. w = i(s - 1/2), u = w^2, S(u) = i f(s)/(2w), f = xi'/xi. Formally
S(u) = sum_{gamma>0} 1/(gamma^2 - u), but f is evaluated only where -sum Lambda(n) n^{-s} converges absolutely.
A_ij = (S_i - conj S_j)/(u_i - conj u_j), B_ij = (u_i S_i - conj(u_j S_j))/(u_i - conj u_j). Both Hermitian [PROVED, trivial].
A = Gram matrix of the functions 1/(gamma^2 - conj u_i) in "L^2(zeros)", B = the same with a factor gamma^2.
[PROVED modulo the classical Pick-Nevanlinna theorem, from memory]: RH <=> A is PSD for every finite node set on one
segment {sigma0 + it, t in [a,b]} (any sigma0 > 1, a < b). If A > 0 the pencil (B, A) has real eigenvalues [PROVED].
The Euler product is used only to compute f (B1: not in any inequality). mpmath for f, Arb (python-flint) for eigenvalues.
`python3 e2_pencil.py.txt zeta N 1.25 100 220`  (N nodes, t_j equally spaced in [1,100], 220 digits; 1-5 s each)
| N | min eig A | # real Ritz | err gamma_1 | err gamma_2 | err gamma_5 | err gamma_9 | first err > 1e-2 |
|---|---|---|---|---|---|---|---|
| 12 | 2.8e-7 | 12/12 | 1.35e-2 | 3.3e-1 | 8.7 | 28 | #1 |
| 12 (t in [1,60], 60 digits: `... zeta 12 1.25 60 60`) | 1.8e-12 | 12/12 | 6.0e-8 | 2.3e-5 | 3.4e-2 | 2.5 | #4 |
| 24 | 1.8e-17 | 24/24 | 8.7e-14 | 3.6e-10 | 3.1e-5 | 9.1e-2 | #8 |
| 36 | 2.1e-41 | 36/36 | < 1e-14 | < 1e-14 | < 1e-14 | < 1e-14 | #27 (zeros 13-26: 7e-15 .. 1.3e-3; first 20 all <= 4.1e-8) |
| 48 | 5.0e-75 | Arb eig failed (nan) at 220 digits | | | | | |
(double-precision comparison floor ~1e-14 because rhlib.zeros are floats.)  A is PSD in every zeta run.
Same with sigma0 = 2.5, N = 24: gamma_1 to 3.5e-13, gamma_2 to 5.3e-10, gamma_5 to 3.8e-5 (e2_zeta_s2.5.log).
Truncating the primes kills positivity at once (B5/B3): f from primes <= 1e5 at sigma0 = 2.5 (truncation error ~1e-8):
A gets a negative eigenvalue -6.6e-12 and two spurious Ritz values, while gamma_1..gamma_4 are still found to 2.5e-7, 2.2e-5,
2.5e-4, 6.9e-3 (e2_zetaX1e5_s2.5.log); primes <= 1000 at sigma0 = 1.25: negative eigenvalue -1.7e-4, zeros to ~1e-2..1e-1.
Control (DH) `python3 e2_pencil.py.txt dh 48 1.25 100 300 70` (nodes t in [70,100], 32 s):
  A has exactly ONE negative eigenvalue (-5.3e-6); the pencil has exactly one non-real pair of Ritz values,
  sqrt(lambda) = 85.6993484854 -+ 0.308517182457 i  = the off-line zero 0.808517182457 + 85.699348485 i (12 digits);
  on-line zeros inside the node window: 64.68 to 5e-7, 68.94 .. 78.72 to the float comparison floor (printed 0.00e+00).
`python3 e2_pencil.py.txt dh 64 1.25 125 260` (global nodes, 33 s): A is PSD, no complex Ritz value, on-line zeros good to
height ~45 only. The impostor PASSES until the node set resolves height 85. (N = 110 global: A has 2 negative eigenvalues;
Arb's eigen-solver then returned nan for the pencil, script crashed in the report loop. Not repaired.)
Reading: number of negative squares of A = number of off-line zero pairs the node set resolves (Pontryagin-space picture,
Krein-Langer; HEURISTIC as a general statement, COMPUTED in these two cases).

## E4  Half-plane detector from the same data  [COMPUTED]
G^(a)_ij = (f(s_i) + conj f(s_j))/(s_i + conj s_j - 2a). PSD for all node sets <=> Re f > 0 on Re s > a <=> no zero with Re > a.
[PROVED for a >= 1 unconditionally: Re xi'/xi = sum (sigma - beta)/|s - rho|^2 > 0.]
`python3 e4_ascan.py.txt zeta 24 1.25 5 40 200 1 0.75 0.6 0.51 0.5 0.49 0.45 0.4 0.25`
  a = 1, .75, .6, .51: PSD, smallest eigenvalue 6.6e-2, 6.8e-3, 1.1e-3, 7.2e-5;  a = 0.5: PSD, smallest 4.8e-32;
  a = 0.49: 15 negative eigenvalues (most negative -1.3e-2); a = 0.45, 0.4, 0.25: 15, 16, 16 negative.
`python3 e4_ascan.py.txt dh 30 1.25 76 96 200 1.2 1 0.9 0.82 0.81 0.80 0.75 0.6 0.5 0.4`
  PSD for a >= 0.75 (smallest eigenvalue 5.0e-3 at 0.75); ONE negative eigenvalue at a = 0.6 (-4.8e-2) and a = 0.5 (-0.146);
  14 negative at a = 0.4. True threshold is 0.8085: 30 nodes locate it only to (0.6, 0.75). A negative eigenvalue is a
  certificate; PSD on a finite node set is not.
For zeta the data on Re s = 1.25 put the edge between 0.49 and 0.50, with nothing to spare at 0.5 (4.8e-32).

## What the numbers say  [HEURISTIC]
1. Every prime-only construction tried here and in lane A is exact about the low zeros and passes for the impostor until
   its resolution reaches the first off-line zero (E1: shadow pairs; E2: PSD with global nodes; E3: X* ~ 60; lane A: L* = 1.71).
   All these tests are local in height. With zeros verified to 3e12, no finite test can fail for zeta. A proof must be an
   identity or a "no first failure" argument uniform in height.
2. Real-rootedness and convergence trade off exactly: E1 has free real-rootedness and convergence ~1/log^2 X that cannot be
   uniform off the real axis (shadow pairs); E2/lane A have double-exponential convergence and real-rootedness <=> positivity.
3. Positivity never survives truncation of the primes (E2: -6.6e-12 at X = 1e5), consistent with B3.
4. The integer "number of negative squares" is the cleanest invariant seen: 0 for zeta, 1 for DH at the right resolution.

## Walls
W-C1 (conservation of difficulty). For F_X of E1: Phi_X is strictly increasing in t for all X  <=>  RH (Lemma F). I cannot
     prove monotonicity for any fixed X >= 70 without the zeros. Exact statement not proved:
     2 sum_{n<=X} Lambda(n) n^{-1/2} (1 - log n/log X) cos(t log n) <= Pole_X(t) + Arch_X(t) for all real t.
     Suggests: treat it as a one-sided extremal problem for cosine polynomials with NON-NEGATIVE coefficients on the
     frequencies log n (Lambda >= 0 is where the Euler product would enter); look for a Fejer-Riesz / sum-of-squares
     certificate numerically for X = 10..100 and see whether it has arithmetic structure.
W-C2 (resolution). Statement not proved: for some explicit node set growing with T, "A PSD" implies no off-line zero below T.
     (E2 shows 64 global nodes miss the DH zero at height 85 while 48 local nodes see it.) Suggests: a quantitative
     Pick-Nevanlinna estimate (how negative must the form be, given an off-line zero at distance d from the nodes).
W-C3 (half-shift wall). Every geometric positivity I know over Spec Z gives xi(w)/xi(w+1); I could not write down any
     global object whose scattering coefficient is xi(w)/xi(w+k) with 0 < k < 1 (idea C4). Exact missing statement:
     existence of a Hilbert space with commuting self-adjoint operators Delta_k, T_p^{(k)} (Macdonald parameter t_p = p^k,
     Jacobi/Heckman-Opdam multiplicity k at infinity) whose continuous spectrum has scattering coefficient xi(w)/xi(w+k).
W-C4 (R5). No Hodge-index statement on any candidate square; unchanged from B9.

## Literature checks (WebSearch, one query each, 2026-11-10)
- Fejer/triangle test functions in Weil's criterion: only general Weil-positivity sources came back (Burnol, "The explicit
  formula and a propagator", arXiv math/9809119; "Sur les formules explicites I", math/0101068). No hit for Lemma F as stated;
  it is a short corollary of Weil 1952, so "variant of known".
- Heckman-Opdam / Macdonald c-functions with real multiplicity are standard locally (Opdam, Stokman); no hit for a GLOBAL
  Eisenstein series with xi(z)/xi(z+k), non-integer k. One search is not a literature review.
- Not searched: Pick/Loewner matrices for xi'/xi (related from memory: Li 1997, Bombieri-Lagarias 1999, Freitas 2006
  Li-type criterion for half-planes), Gonek 2012 "Finite Euler products and the Riemann hypothesis" (E1 is of this type),
  de Bruijn 1950 (cosh multipliers), Lagarias-Suzuki 2006, Ki, Weng (shift-1/2 theorems), Suzuki's screw functions.

## Ideas  (title . claim . first test . kill line)
C1 Fejer-window test. RH <=> S_X(t) >= 0 for all t, X (Lemma F). Claim to test: min_t S_X(t) log X stays in (0, 0.185] for zeta
   for all X <= 1e8, and for every degree-1 impostor the first failure X* satisfies log X* <= 1.3 * 2 L* (lane A's window).
   First test: rerun with interval arithmetic for X <= 1e4; three more impostors (mod 5 second function, mod 7, mod 11).
   Kill: an impostor whose X* is more than 10 times lane A's e^{2L*} (then the cheap test is not a usable detector).
   Plain english: add up one cosine wave per prime power, quieter for bigger primes, faded out linearly up to a cutoff X.
   RH says this sum never rises above an explicit smooth ceiling. Example: with cutoff 50 the gap to the ceiling at t = 0 is
   0.0206, and it is 3.95 at the first zero t = 14.135. For the impostor the sum breaks through the ceiling once X reaches 70.
C2 Prime-side Pick pencil and the negative-square count. Claim: for nodes on Re s = 1.25, t in [T-15, T+15], spacing <= 0.65,
   the number of negative eigenvalues of A equals the number of off-line zero pairs with ordinate in [T-8, T+8], for zeta
   (always 0) and for DH-type functions. First test: slide the window over DH up to height 200 (off-line zeros at 85.70,
   114.16, 166.48, 176.70) and over zeta at heights 1e3, 1e4. Kill: a window containing an off-line DH zero with A PSD at
   spacing 0.3, or a negative eigenvalue for zeta above the rounding level.
   Plain english: from measurements taken safely to the right, where the prime formula converges, build a table of numbers.
   If all zeros are on the line the table is "positive" (like a table of distances that could come from real points).
   Each zero off the line produces exactly one "impossible" direction. Example: 48 measurements for the impostor give one
   negative number, -5.3e-6, and return the offending zero 0.808517182457 + 85.699348485 i to 12 digits.
C3 Shadow pairs. Claim: in the real-rooted Euler family F_X, an off-line pair at height T with offset b appears as two real
   zeros whose gap is ~ c(b)/log X -> 0, while a genuine close pair of on-line zeros keeps a fixed gap; so
   "RH and simple zeros <=> no pair of zeros of F_X closes up as X -> infinity". First test: gap * log X for the DH pairs at
   85.70 and 114.16 for X up to 1e5 against the closest zeta pair below 1e4 (a Lehmer-type pair). Kill: gap law for DH not
   monotone, or a zeta pair whose gap in F_X keeps shrinking through X = 1e6.
   Plain english: draw the wave built from the first primes and mark where it crosses zero. For zeta each crossing settles
   on a true zero. For the impostor two crossings appear where there is no zero on the line at all, at 85.26 and 86.11,
   and creep toward each other (85.57 and 85.82 with primes up to 3000): the picture is trying to show a zero that sits off the line.
C4 Fractional-multiplicity Eisenstein series (new object). Claim: the kernel K^{(k)}_Y(z,z') obtained from the Maass-Selberg
   formula by replacing phi = xi(z)/xi(z+1) with c_k = xi(z)/xi(z+k) is PSD on Re z > (1-k)/2 exactly when zeta has no zero
   with Re w > (1+k)/2, and for every k in (0,1] the LOCAL ingredients exist with proved positivity (Macdonald spherical
   functions with t = p^k at p, Jacobi functions of multiplicity k at infinity). RH would follow from a global Hilbert space
   realising K^{(k)} as a Gram kernel for all k > 0. First test: (i) verify numerically PSD of K^{(k)} for zeta, k = 1, .8, .5, .2,
   and its failure for DH when (1+k)/2 < 0.8085; (ii) for k = 1 reproduce K from an actual truncated Eisenstein series;
   (iii) try to build T_p^{(k)} on functions of the lattice-like set {y = m/n} and test commutation with a Jacobi-type
   Laplacian numerically. Kill: the product of the local Plancherel measures for non-integer k admits no discrete
   "lattice" (no k-deformed Poisson summation) -- e.g. if a putative k-theta function with Euler product
   prod_p (1 - p^{-w})^{-1}(1 - p^{-w-k}) and the Jacobi-k gamma factor fails the functional equation numerically.
   Plain english: there is one place where geometry already proves a statement of RH type for zeta: a sound wave sent into the
   modular surface comes back with all its energy, and "energy cannot be negative" forces zeta to have no zeros on or right
   of the line Re = 1. That is the prime number theorem, half a unit away from RH. The surface has a cusp shaped like a
   circle (dimension 1). If the cusp could have dimension k between 0 and 1, the same energy argument would push the
   zero-free line to (1+k)/2; k -> 0 is RH. At each single prime and at infinity the "dimension k" mathematics exists
   (trees with p^k + 1 branches make sense as algebra). What is missing is the global space gluing them.

## Corrections made during the session (so the critic is not misled by earlier file versions)
- e3_phase.py.txt, first version (numerical derivative of the E1 phase with the UNSMOOTHED theta' and an unsorted prime-power
  list with an early `break`): gave spurious negative minima for zeta (-0.53 .. -29 at t < 2.1). Two errors: the list bug, and the
  missing Fejer smoothing of the archimedean term, which is O(1/log X), the same size as the true minimum. Replaced by the exact
  explicit-formula version described above, validated against the zero sum to 8 digits. The old e3_*.log contents are superseded.
- e1_hb.py.txt, first version had no pole correction: wrong zero counts for X >= 1e4 (22, 27 zeros instead of 20).
- e1_dh_X*.npy are scratch outputs of `TMAX=120 python3 e1_hb.py.txt dh fejer <X>` (regenerated with TMAX = 120 for all six X).
- Time spent: about 75 minutes, over the 30-40 minute budget.
