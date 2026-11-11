# S1-curv, turn 1: corrections to r2_curv after the checker, and four small exact statements

Setting and notation as in `rh/experiments/r2_curv/PROOF_bochner_parity.md` (finite window W, N symmetric,
off-diagonal N_xy = k(y-x) >= 0, u > 0 top eigenvector, lambda_1, pi = u^2, q_xy = N_xy u_y/u_x, L, E, Gamma, Gamma_2).
Q := 2cc^T - 2ss^T - N is the Weil form in the same basis (c, s = box integrals of cosh(x/2), sinh(x/2)); Q_e, Q_o its
parity blocks. All scripts are in this folder; run as `python3 tools/memcap.py 2 python3 <script> <args>`.

## F1 (PROVED) The two "sum rules" of Theorem A are the pole vector seen through the inverse Weil block
If Q_e > 0:  2 c^T N_e^{-1} c - 1 = 1/(t_e - 1),  t_e := 2 c^T Q_e^{-1} c   (N_e invertible iff t_e != 1).
If Q_o > 0:  1 - 2 s^T (-N_o)^{-1} s = 1/(1 + t_o),  t_o := 2 s^T Q_o^{-1} s.
Proof. N_e = 2cc^T - Q_e. Sherman-Morrison: N_e^{-1} c = -Q_e^{-1} c /(1 - t_e), so 2c^T N_e^{-1} c = t_e/(t_e - 1).
-N_o = Q_o + 2ss^T: (-N_o)^{-1} s = Q_o^{-1} s/(1 + t_o), so 2 s^T(-N_o)^{-1}s = t_o/(1 + t_o).  QED.
Consequences (all PROVED from the formula).
 (a) On a window where the Weil block is strictly positive both margins are STRICTLY positive resp. in (0,1): the sum
     rules are never "exactly saturated" there. This concedes the checker's point (1) and replaces my wording.
 (b) Even margin > 0 iff t_e > 1 iff lambda_1 > 0 (given Q_e > 0). For lambda_1 < 0 (zeta: L <= 0.10) the block
     inequality holds trivially, N_e has no positive eigenvalue and 2c^T N^-1 c - 1 = 1/(t_e - 1) < 0. So Theorem A (A1),
     second line, needs the hypothesis lambda_1 > 0 (checker's point (6), conceded).
 (c) The checker's factor P_M (margin_even = (mu_1/lambda_1) P_M) is P_M = lambda_1 / (mu_1 (t_e - 1)), and
     mu_1 t_e = 2 sum_i <c, v_i>^2 mu_1/mu_i >= 2 <c, v_1>^2 (mu_i, v_i eigenpairs of Q_e). So P_M <= lambda_1/(2<c,v_1>^2 - mu_1)
     whenever the right side is positive: the factor is bounded as soon as the pole vector is not orthogonal to the
     ground state of the even Weil block. (Checker's item R13 "whether the continuum factor is finite is OPEN": in the
     continuum Q_e^{-1} is bounded on a window with mu_1 > 0, so t_e is finite, and the question becomes the size of <cosh, v_1>.)
COMPUTED (`t1_margins.py.txt`, log `t1_margins.log`, 4 s): zeta L = 1, M = 20/40/80/160: both formulas agree with the direct
values to 10 digits (even 1.730672012e-3, 5.592234357e-4, 1.560088138e-4, 4.994153779e-5; odd 9.7735e-2, 3.2074e-2, 1.0668e-2,
3.1789e-3). P_M = 1.1421, 1.2089, 1.2288, 1.2496 against lambda_1/(2<c,v_1>^2) = 1.1573, 1.2269, 1.2461, 1.2728 (v_1 carries
98% of t_e). Small windows, M = 40: lambda_1 = -0.7913 (L = .05), -0.0742 (.10), +0.1177 (.12), +0.6664 (.20); even "margin"
-1.2468, -6.2291, +2.9456, +0.1492 = 1/(t_e - 1) each time (checker's R10 reproduced).

## F2 (PROVED) The pi-integrated open-path term of Theorem B3 is a Hankel-type form in the two jumps
Put g_y(a) := k(a) u(y+a) (f(y+a) - f(y)) for y, y+a in W, a != 0. Then
 (i)  ||Lf||_pi^2 = sum_x pi_x Gamma_2(f)(x) = sum_y ( sum_a g_y(a) )^2 = sum_y sum_{a,b} g_y(a) g_y(b)        [kernel 1 in (a,b)]
 (ii) sum_x pi_x O_x(f) = (1/2) sum_y sum_{a,b : y+a+b not in W} g_y(a) g_y(b) =: (1/2) Op(f)                   [kernel 1_{W^c}(y+a+b)]
 (iii) sum_x pi_x (S_x + H_x)(f) = Cl(f) + (1/2) Op(f),  Cl(f) := sum_y sum_{a,b : y+a+b in W} g_y(a) g_y(b);  ||Lf||^2 = Cl + Op.
Here S_x, H_x, O_x are the three sums of (B3) (squares / Hessian / open paths).
Proof. (i) u_y Lf(y) = sum_a k(a) u(y+a)(f(y+a) - f(y)). (ii) pi_x rho_ab(x) = u(x) u(x+a+b); rename the path x -> x+a -> x+a+b
as (x, y, z); it is open iff the fourth corner x + z - y is outside W. Index set and weight u_x u_z k(y-x) k(z-y) are symmetric
under x <-> z, and the symmetrised bracket is (1/2)[(f_z-f_y)^2 + (f_x-f_y)^2] - (1/2)(f_z-f_x)^2 = (f_x-f_y)(f_z-f_y). With
x = y+a, z = y+b the fourth corner is y+a+b. (iii) from (i), (ii) and B3.  QED.
Remarks. In Op both jumps point to the same edge and their sum overshoots it (y+a+b > L with y+a, y+b <= L forces a, b > 0).
The kernel depends on a+b only: a Hankel form in the jump variables with the mirror at the middle point y, summed over all y.
It is NOT the Hankel form of K at x+y (Theorem D5): different kernel (indicator of the outside, K enters through g) and a moving mirror.
For one fixed y the kernel 1[a+b > c] on (0,c]^2 is not positive semidefinite (points 0.4c, 0.8c: [[0,1],[1,1]]).
COMPUTED (`t1_openhankel.py.txt`, log `t1_openhankel.log`): identity (ii) to 3.9e-16, (iii) to 2.1e-15 (zeta and Beurling, L = 1, M = 40).
Generalised eigenvalues against E on mean-zero f, in units of lambda_1 (zeta | Beurling 2 -> 2.1):
 Op: min 0.1054 | 0.1108, no negative direction;  Cl: min -0.0043 | -0.0070, exactly ONE negative direction (an odd f), 2nd 0.5375 | 0.5328;
 Cl + Op: min 1.0034 | 0.9141 (= gap/lambda_1, as it must).  Positivity of Op and the single negative direction of Cl are COMPUTED at M = 40 only, not proved.

## F3 (PROVED) Parity differences: the mirror form inside the integrated Bochner quantities
Fold: eta on the positive half of W, h_+ / h_- its even / odd extension, phi := u eta. T := compression of N to the positive half
(Toeplitz part, diagonal included), H := Hankel operator of K on the positive half, (H phi)(x) = sum_{y>0} K(x+y) phi(y).
 (i)  E(h_-) - E(h_+) = 4 <phi, H phi>                                   (this is D5 in the ground-state frame)
 (ii) ||L h_-||_pi^2 - ||L h_+||_pi^2 = 4 <phi, {lambda_1 - T, H} phi>    ({A,B} = AB + BA)
Proof. With f = u h: u Lh = (N - lambda_1) f and <f, N f> = lambda_1 ||h||_pi^2 - E(h) (A0). On the positive half, N f_+- = (T +- H) phi.
So ||L h_+-||^2 = 2 ||(T - lambda_1 +- H) phi||^2 and <f_+-, N f_+-> = 2 <phi, (T +- H) phi>; subtract.  QED.
COMPUTED (`t1_b8b.py.txt`, `t1_b8.py.txt`): (i) to 2e-16, (ii) to 1.8e-15 (zeta, Beurling, L = 1, M = 40; zeta M = 80).

## F4 (PROVED; D5 rewritten) The window statement is a two-sided bound on the mirror form
With T(phi) = <phi, T phi>, H(phi) = <phi, H phi>, c = <phi, cosh(x/2)>, s = <phi, sinh(x/2)> on (0, L] (unfolded frame, phi = eta):
 even block <=> H(phi) <= 4c^2 - T(phi);   odd block <=> H(phi) >= 4s^2 + T(phi).
So the pair of block inequalities is  T(phi) + 4s^2 <= H(phi) <= 4c^2 - T(phi)  for all phi in L^2(0, L]:
the mirror form of K is bounded on BOTH sides by the half-window shift form. A sign for H alone gives neither side.
Proof. <f_+-, N f_+-> = 2[T +- H](phi), <f_+, cosh> = 2c, <f_-, sinh> = 2s; insert in N_e <= 2cc^T, N_o <= -2ss^T.  QED.

## Answer to the moderator's B8, with the blind prediction
Prediction written in NOTES.md at 23:50:16 UTC before `t1_b8.py.txt` ran (23:50:33): |cos(A, B)| < 0.5 ("unrelated"), where
A = matrix of eta -> Op(h_-) - Op(h_+), B = matrix of eta -> E(h_-) - E(h_+) = 4 Hankel_K(u eta); A with <= 3 negative eigenvalues.
RESULT: MISS on both. cos(A, B) = 0.9167 (zeta M = 40), 0.9285 (zeta M = 80), 0.9193 (Beurling M = 40); A has 10 of 20 (M = 40), 19 of 40
(M = 80) negative eigenvalues, B has 9 of 20, 19 of 40. Least-squares: par(Op) ~ 5.0 x 4UHU; par(||L.||^2) ~ 9.9 x 4UHU with cosine 0.937
(explained by F3(ii): lambda_1 - T is close to a multiple of the identity plus a smaller off-diagonal part; 2(lambda_1 - D) = 11.7).
So: not the same form (cosine 0.92, not 1; different kernel by F2), not unrelated either; the parity difference of the open-path term
is, to 92% in Frobenius angle, a multiple of the mirror form. Reflecting at the window edge instead (kernel K(x, 2L - y)) gives cosine
-0.004 as a matrix and 0.79 as a Dirichlet-type form: worse than the centre mirror.

## Corrections to r2_curv that I now carry (after the checker)
1. "Sum rules saturated / exactly 1/2": WRONG as written. On every window with strictly positive Weil block both margins are strictly
   positive (F1). True statement: even margin = 1/(t_e - 1) <= mu_1/(2<c,v_1>^2 - mu_1).
2. "BE centre value tends to 1/2": NOT SUPPORTED. Centre value/lambda_1 = 0.5513, 0.5222, 0.5061, 0.4965, 0.4908 for M = 20..320
   (`t1_becentre.log`; M = 320 is new); increments -0.0291, -0.0161, -0.0096, -0.0057 (ratio about 0.6). It is below 1/2 from M = 160 on.
   The total jump rate grows by log 2 per doubling (5.165, 5.871, 6.572, 7.269, 7.964): the box chain is not converging to a resampling chain.
3. "The deficit sits in the edge terms": WRONG in the Gamma-normalised sense. Reproduced the checker (`t1_b3_zeta40.log`): centre site
   S 0, S+H 0.2405, S+O 0.1999, all 0.5222; edge site S+H 0.0056, S+O -0.2269, all 0.4963. On the trial function 1 - delta_x at the centre:
   S 0.672, H 0.238, O -0.119, all 0.791 (units lambda_1). Integrated against pi, O is positive (F2). What is true: S alone has constant 0
   (it kills affine functions); all positive curvature comes from H and O together.
4. Idea r2_curv/#7 (per-site negative index = 1): KILLED by its own kill line. Rerun `rerun_sig160.log`: one-direction sites 4 of 160 (zeta),
   0 of 160 (Beurling).
5. "Each kernel fails for the other's reflection" / W-curv-3 as worded: WRONG. D1 is positivity for the total inversion x -> -x on points
   log a, a >= 2 integer; the arch kernel is positive for the same reflection everywhere. Restated wall: see board answer to B7.
6. Theorem A (A1) second line: add the hypothesis lambda_1 > 0.
7. Novelty: C1/C2 are in Schmuckenschlaeger 1998 (checker), E in the Zenodo record, the arch half of D in arXiv 2407.04124 (checker, summary only).
8. Prediction order: the 22:51 (sig) and 22:53 (exactcal) predictions carry stamps later than their logs; I cannot show they were blind and
   do not count them. The Hankel prediction had no log; `rerun_hankel.log` now exists (numbers reproduced: 0/20, 9/20 min -1.1227, 9/20 -1.1725;
   M = 80: 0/40, 19/40 -1.2105, 19/40 -1.3067) but that does not repair the order.
Defended: every number (the checker reproduced all he recomputed; I reran proc/check2/hankel/sig, logs `rerun_*.log`); Theorems B (identity),
C, D1-D5, E as statements; the conclusion that pointwise Bakry-Emery is capped near half the gap and is blind to the Beurling control.

# Turn 2 (2026-11-11): the tilt control F_d(s) = zeta(s-d) zeta(s+d), and the half-window constant

Input from the board (S1-mirror B15, B90; S1-parity B91): the whole Weil kernel of F_d is zeta's times 2cosh(du); Q_d(f) = 2 Q(e^(dx) f, e^(-dx) f),
Q zeta's bilinear Weil form on the window; lowest eigenvalue at L = 0.75 = 9.1965e-15 - 1.46289e-4 d^2 (even), 7.4532e-12 - 2.45385e-3 d^2 (odd).
Box model of F_d: `s2lib.py.txt` (c_inf(d) = 2 log pi - psi(1/4 - d/2) - psi(1/4 + d/2); Levy density 2cosh(du) w(u); atoms Lambda(n) n^(-1/2) 2cosh(d log n);
pole vectors cosh, sinh of (1/2 +- d)x). Checks (`t2_fd_40.log`): N_0 = 2 N_zeta entrywise (0.0), c_inf(0.1) two ways = 11.081023890.

## G1 (PROVED, two lines from B90) The tilt is a contraction statement for zeta's own form, and it couples the two parity blocks
Since e^(dx) f = (cosh(dx) + sinh(dx)) f and Q is symmetric bilinear:  Q_d(f) = 2 [ Q(cosh(dx) f) - Q(sinh(dx) f) ].  Put g = cosh(dx) f:
   F_d is non-negative on [-L, L]   <=>   Q_L(tanh(dx) g) <= Q_L(g) for every g in L^2[-L, L]
(multiplication by tanh(dx) is a contraction in the Weil form of zeta). tanh(dx) is odd, so it exchanges the parity blocks:
   even block of F_d >= 0  <=>  Q_o(tanh(dx) g) <= Q_e(g) for all even g;      odd block of F_d >= 0  <=>  Q_e(tanh(dx) g) <= Q_o(g) for all odd g.
For imaginary d = i tau (zeros moved ALONG the line) the same algebra gives Q_d(f) = 2[Q(cos(tau x) f) + Q(sin(tau x) f)]: a sum. The difference
between a real and an imaginary tilt is the one sign in front of the shift form of the sinh/sin part.
Small d (tanh(dx) = dx + O(d^3)): with nu_eo(L) := sup_{g even} Q_o(x g)/Q_e(g), nu_oe(L) := sup_{g odd} Q_e(x g)/Q_o(g) (finite when the blocks are strictly positive),
the first failing tilt on the window L is d*^2 = 1/nu (to leading order), and testing on the ground states gives
   lowest eigenvalue of the even block of Q_d  <=  2 mu_e - 2 d^2 [ Q_o(x v_e) - mu_e <v_e, x^2 v_e> ] + O(d^4),   i.e.   c_even(L) = 2 [Q_o(x v_e) - mu_e <x^2>],
(Q, mu, v for zeta itself; the board's Q_0 is 2Q). With B90/B91 at L = 0.75: Q_o(x v_e) = 7.3145e-5, Q_e(x v_o) = 1.2269e-3 (derived from their slopes; not computed by me).
So in the Weil geometry of the window the position operator x maps the even ground state to an odd vector whose energy is 1.6e10 times the even ground energy:
'd = 0' is the statement that an operator of norm^2 >= 1.6e10 (L = 0.75) is not applied.
COMPUTED in boxes (`t2_nu.py.txt`, `t2_nu.log`; multiplier at box centres; L = 1): nu_eo = 6.18, 17.07, 55.5 and nu_oe = 7.91, 19.2, 55.7 for M = 40, 80, 160;
nu_eo x mu_e = 0.0123, 0.0093, 0.0096; 1/sqrt(nu_eo) = 0.402, 0.242, 0.134. Lowest eigenvalue of Q - tanh Q tanh against that of Q_d/2: 1.971e-3 / 1.985e-3 (d = 0.1, M = 40),
5.340e-4 / 5.371e-4 (d = 0.1, M = 80), -0.0288 / -0.0305 (d = 0.3, M = 80; the box form of F_d is negative there). The two matrices differ entrywise by 1.4e-4 .. 1.7e-3,
which is the first-order box error d^2 x (box width) of the atoms; the identity itself is exact algebra.
Blind predictions (NOTES.md 00:17:14 and 00:20:44): slope kappa in (0.5, 20): MISS by three orders (0.0011 even, 0.0024 odd at M = 40): boxes are too coarse to see the tilt;
nu x mu_e in (0.002, 0.05): HIT; 1/sqrt(nu) ranges: two narrow MISSES; 'nu_oe < nu_eo': MISS.

## G2 (PROVED) F4 for F_d: the mirror form adds, the shift form subtracts
phi on (0, L], phi_+- = e^(+-dx) phi; T_W = half-window Weil shift form (= Q on functions supported in (0, L]), H_W = mirror form of the full Weil kernel (B60 notation).
   mirror:  H_{W,d}(phi) = H_W(phi_+) + H_W(phi_-) = 2 [ H_W(cosh(dx) phi) + H_W(sinh(dx) phi) ]        (a congruence: every sign property of the mirror form survives)
   shift:   T_{W,d}(phi) = 2 T_W(phi_+, phi_-)    = 2 [ T_W(cosh(dx) phi) - T_W(sinh(dx) phi) ]
Proof: 2cosh(d(x+y)) = e^(dx)e^(dy) + e^(-dx)e^(-dy);  2cosh(d(x-y)) = e^(dx)e^(-dy) + e^(-dx)e^(dy).  QED.
So the window statement for F_d is   | H_W(cosh(dx) phi) + H_W(sinh(dx) phi) |  <=  T_W(cosh(dx) phi) - T_W(sinh(dx) phi),
while zeta's statement applied to the two functions and added gives the same left side bounded by T_W(cosh(dx) phi) + T_W(sinh(dx) phi).
The two differ by 2 T_W(sinh(dx) phi): F4 knows where the centre is through one sign, and only in its shift term.
COMPUTED (`t2_fd_40.log`, on the d = 0 even ground state, boxes L = 1, M = 40): (T_{W,d} - T_{W,0})/d^2 = -0.0061, (H_{W,d} - H_{W,0})/d^2 = +0.0050 for every d from 0.005 to 0.3
(prediction 'opposite signs, shift part larger': HIT).

## G3 (COMPUTED + remark) F2 and the whole process side do not see the tilt
F_d has a non-negative kernel, so Theorems A-C, E and F1-F3 hold for it word for word with k_d(a) = 2cosh(da) k(a) and its own ground state u_d. In F2 nothing changes in form:
||L_d f||^2 = sum_y (sum_a g^d_y(a))^2 and the open part keeps the kernel 1_{W^c}(y+a+b). `t2_fd_40.log` (L = 1, M = 40), d = 0 / 0.1 / 0.3:
positive eigenvalues of N_d: 1 / 1 / 1; gap/lambda_1: 1.00336 / 1.00324 / 1.00209; Bakry-Emery centre constant/lambda_1: 0.5222 / 0.5215 / 0.5154;
smallest value of Op: 0.1054 / 0.1061 / 0.1113; negative directions of Cl: 1 / 1 / 1; 2x2 sum-rule determinant det(2 C^T N_e^-1 C - I): -5.592e-4 / -5.754e-4 / -7.713e-4
(at d = 0 it is minus the even margin of F1). Every prediction of this block HIT. This is barrier B11 measured on my seat's objects: the ground-state process, its gap,
its curvature and the open-path form are tilt-covariant; the only statement of mine that is not is G2.

## G4 (PROVED) Half-window integral of Gamma_2 (answer to S1-cubic's B66)
For any subset S of sites, any f:   sum_{x in S} pi_x Gamma_2(f)(x) = (1/2) <1_S, (Lf)^2>_pi + (1/2) <1_S f, L^2 f>_pi + (1/2) <L 1_S, Gamma(f) - f Lf>_pi.
Proof: Gamma_2(f) = (1/2) L[Gamma(f) - f Lf] + (1/2) f L^2 f + (1/2)(Lf)^2 (from Gamma(f,g) = (1/2)(L(fg) - f Lg - g Lf)), and <1_S, L g>_pi = <L 1_S, g>_pi.  QED.
For S = {x > 0}: L 1_S(x) = - sign(x) j(|x|), j := (H u)/u >= 0 the rate at which the ground-state process crosses the mirror (H = Hankel operator of K, u even).
For f even or odd the last term vanishes and the half-window integral is exactly half of ||Lf||^2: the constant falls below the gap only through even-odd cross terms.
COMPUTED (`t2_half.py.txt`, `t2_half.log`; formula checked to 4e-16; L 1_S = -sign Hu/u to 3e-15): rho_half/lambda_1 = 0.8384 (M = 40), 0.8319 (M = 160) for zeta
(5/6 = 0.8333 on the resampling chain, S1-cubic B62); Beurling 2 -> 2.1: 0.8158, 0.8071. Minimiser: even part 34%, odd part 34%, cross 33% of Gamma_S. On it (units lambda_1 Gamma_S):
bulk terms +1.357, mirror-crossing term -0.519 (M = 40); +1.353, -0.521 (M = 160). j ranges over 2.08 .. 3.07 of a total jump rate 5.87 (M = 40).
B3 parts summed over the half window, on the minimiser: S 0.528, H 0.279, O 0.032; their even-odd cross parts: S +0.119, H +0.144, O -0.105; constants with a part removed: S+H 0.514, S+O 0.427.
Blind prediction (0.84 +- 0.03, 0.83 +- 0.03, mixed parity): HIT.

# Turn 3 (2026-11-11): the first-prime window (answer to the moderator's B155)

Window: (1/2) log 2 < L < (1/2) log 3 (0.34657 < L < 0.54931). l := log 2, delta := 2L - l in (0, log(3/2)), c := log 2/sqrt 2 = 0.490129.
Strips S+ := [l - L, L], S- := -S+, each of width delta, disjoint (l - L > 0). Q_0 := pole + Gamma form (no atom) on [-L, L]; zeta's form is Q = Q_0 - P,
<f, P f> := c * 2 g(l), g(u) = int f(x) f(x-u) dx. Theorem E: Q_0(f) = pole(f) - c_inf |f|^2 + E_w(f), E_w(f) = (1/2) int int_{W x W} w(|x-y|)(f(x)-f(y))^2 + int_W kappa_L f^2.

## H1 (PROVED) Edge-strip lemma
(a) kappa_L(x) = Wbar(L - x) + Wbar(L + x),  Wbar(t) := int_t^inf w(u) du = artanh(e^(-t/2)) + arctan(e^(-t/2)) = (1/2) log(4/t) + pi/4 + O(t).
    Proof: w(u) = sum_m e^(-(2m+1/2)u), so Wbar(t) = sum_m q^(4m+1)/(2m + 1/2) with q = e^(-t/2), and sum_m q^(4m+1)/(4m+1) = (1/2)(artanh q + arctan q).
    On S+ (resp. S-): kappa_L >= Wbar(delta) + Wbar(2L) (Wbar is decreasing; L - x <= delta, L + x <= 2L).
(b) P = c x (the swap of the two strips by translation through l): (P f)(x) = c f(x - l) on S+, c f(x + l) on S-, 0 elsewhere. Its spectrum is {+c, -c, 0}:
    -c 1_{S+ u S-} <= P <= c 1_{S+ u S-} as forms, with equality on f(x - l) = +-f(x). (AM-GM: 2|f(x) f(x-l)| <= f(x)^2 + f(x-l)^2.)
    Folded: for f even / odd with phi = f on (0, L]:  <f, P f> = +-2c int_{S+} phi(x) phi(l - x) dx = +-2c <phi, R phi>_{S+}, R = reflection of the strip about its midpoint l/2
    (for odd f, f(x - l) = -f(l - x), and x -> l - x maps S+ to itself). So the prime 2 is a potential of height 2c that is attractive on the locally symmetric part of an
    even function and on the locally antisymmetric part of an odd function, and repulsive on the other parts.
(c) Hence |<f, P f>| <= c int_{strips} f^2 <= theta(L) int kappa_L f^2 <= theta(L) E_w(f),  theta(L) := c/(Wbar(delta) + Wbar(2L)) in (0, 0.1627), theta -> 0 like 2c/log(1/delta),
    and  Q >= Q_0 - c 1_{strips}  >=  pole - c_inf |f|^2 + (1 - theta) E_w.
(d) Crude closing: if Q_0 >= mu_0 |f|^2 on [-L, L] then Q >= 0 as soon as mu_0 (Wbar(delta) + Wbar(2L) - c) >= c (c_inf + [2|sinh(x/2)|^2 in the odd block]).
    With the computed mu_0 = 1.1e-3 (even block) this needs Wbar(delta) >= 2394, delta <= 1e-2078: true and useless.
None of (a)-(d) uses the sign or the size of the weight beyond |weight| <= c, nor that the atom sits at an integer: it holds for the Liouville weight -c and for a Beurling atom near its own edge.
COMPUTED checks (`t3_checks.log`): closed form of Wbar against quadrature to 12 digits at t = 0.005, 0.05, 0.405, 1, 3; box spectrum of P/c = [-1.000, 1.000] (M = 240, delta >= 0.05).

## H2 (COMPUTED, boxes; `t3_edge.py.txt`, logs `t3_edge_240.log`, `t3_edge_240b.log`, `t3_edge_conv.log`; lowest eigenvalues in boxes are UPPER bounds for the window)
delta | L | Q_0 even, odd | zeta even, odd | crude form Q_0 - c 1_strips even, odd | admissible weight of an atom at log 2 [c_-, c_+]   (M = 240; M = 480 where given)
0.005 | 0.3491 | 0.00134, +0.0659 | 1.3e-3, 0.0678 | +0.00132, +0.0636 | [-3.22, 3.52]
0.010 | 0.3516 | 0.00128, +0.0585 | 1.2e-3, 0.0628 | +0.00122, +0.0524 | [-2.01, 2.40]   (M = 480: 0.00122, 0.0583; crude 0.00115, 0.0521; [-1.96, 2.31])
0.020 | 0.3566 | 0.00121, +0.0437 | 1.0e-3, 0.0541 | +0.00101, +0.0270 | [-0.979, 1.495]
0.030 | 0.3616 | (M = 480) 0.00110, +0.0289 | 8.3e-4, 0.0465 | +0.00073, -0.0022 | [-0.479, 1.066]
0.050 | 0.3716 | 0.00116, +0.0004 | 6.5e-4, 0.0350 | +0.00022, -0.0672 | [-0.0045, 0.744]
0.100 | 0.3966 | 0.00088, -0.0685 | 3.1e-4, 0.0167 | -0.0034, -0.245 | [0.361, 0.539]   (M = 480: [0.363, 0.529])
0.200 | 0.4466 | -0.0062, -0.197 | 1.3e-4, 0.0031 | -0.036, -0.539 | [0.4772, 0.4976]
0.300 | 0.4966 | -0.030, -0.314 | (box floor 1.3e-4), 6.1e-4 | -0.129, -0.742 | [0.4883, 0.4934]
0.400 | 0.5466 | -0.071, -0.424 | (box floor), 4.3e-4 | -0.277, -0.893 | [0.4890, 0.4909]
The even end c_+ is set by the even block, the lower end c_- by the odd block, at every delta (as in S1-mirror's B48). Numbers at the 1e-4 level are box-limited.
Strip mass of the Q_0 ground states: odd 0.4%, 1.0%, 2.7%, 4.8%, 10%, 26%, 60%, 83%, 94%; even 0.004%, 0.01%, 0.03%, 0.06%, 0.13%, 0.5%, 3.3%, 12%, 29% (delta = 0.005 .. 0.4).
One-vector necessary bound for the weight from the odd ground state psi_0 of Q_0 (Q(psi_0) >= 0): weight >= |mu_0|/(2<psi_0, R psi_0>) = 0.281, 0.347, 0.388, 0.451 at delta = 0.1 .. 0.4,
against the exact lower ends 0.361, 0.477, 0.488, 0.489: the ground state of Q_0 is NOT the extremal vector.
Reading: the crude route (H1(c) + positivity of the ARCHIMEDEAN form Q_0 - c 1_strips) closes numerically for delta <= 0.029, i.e. L <= 0.361, with margins 1.2e-3 (even) and 0.05 (odd) at delta = 0.01;
it fails in the odd block from delta = 0.03. A statement that a control violates begins later: weight -c excluded from delta = 0.03, weight 0 (no atom) from delta = 0.051 (L = 0.372).
Predictions (NOTES.md 00:51:18): T3-P1 MISS (I said the crude form is negative already at delta = 0.005 with the even block binding; it is positive up to 0.029 and the odd block binds);
T3-P2 HIT for zeta, sign change of the odd block of Q_0 at delta = 0.051 (I said 0.04 to 0.06); T3-P3 HIT at delta = 0.005 and 0.1, and at 0.4 ((c_+ - c_-)/c = 0.004 < 0.02);
T3-P4 MISS (22% and 27% off, I said within 20%); T3-P5 MISS (the weight -c leaves between 0.02 and 0.05, I said 0.005 to 0.02).
