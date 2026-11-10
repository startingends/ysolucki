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
