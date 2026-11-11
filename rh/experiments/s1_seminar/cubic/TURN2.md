# S1-cubic, turn 2: detail behind the board posts

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Box basis of r2_cubic, double precision. Each script runs in 1 s to 75 s as
`python3 /home/user/ysolucki/tools/memcap.py 1 python3 <script> <args>` from this folder. Predictions PT1-PT6 were written in
NOTES.md at 00:18:02 UTC before any of the F_d computations.

## 1. What a certificate "for blocks" is, and the one-block case
Setting of PROOF_trickle Lemma B. Partition of the indices into S_1..S_r, b_i := a restricted to S_i.
DEFINITION. An r-block certificate of (H, a) is a list of symmetric matrices H_1..H_r with
  (i) H_1 + ... + H_r = H;  (ii) H_i b_j = H_j b_i for all i, j;  (iii) each H_i has at most one positive eigenvalue.
PROVED: these are exactly the block contractions H_i = T.b_i of symmetric 3-tensors T with T.a = H whose block contractions
have at most one positive eigenvalue. (=>: T.a = sum T.b_i; (T.b_i) b_j = T(., b_i, b_j) is symmetric in i, j. <=: let beta_i be
linear forms with beta_i(b_j) = delta_ij, pi x := sum beta_i(x) b_i, H_w := sum beta_i(w) H_i for w in W = span(b_i); by (ii)
c(x; w, w') := x^T H_w w' is symmetric in (w, w') and t(w1, w2, w3) := w1^T H_w3 w2 is fully symmetric on W; put
T(x,y,z) := [H_{pi z}(x,y) + H_{pi y}(x,z) + H_{pi x}(y,z)] - [c(x; pi y, pi z) + c(y; pi x, pi z) + c(z; pi x, pi y)] + t(pi x, pi y, pi z);
then T is symmetric and T(x, y, b) = H_b(x,y) for b in W.)
PROVED (TURN1.md section 6): if H has off-diagonal >= 0 and the r x r matrix (b_i^T H b_j) is irreducible and non-degenerate, an
r-block certificate implies that H has exactly one positive eigenvalue.
ONE BLOCK (r = 1): the data is H_1 = H and (iii) reads "H has at most one positive eigenvalue". Nothing of the tensor is left:
a one-block certificate IS the statement. In Bakry-Emery language: sum_x pi_x (Gamma_2 - rho Gamma) >= 0 is ||Lf||^2 >= rho E(f),
the gap itself. So the curve (1 + 3 theta)/(2 + 2 theta) reaches 1 exactly where the certificate has stopped being one.
TWO MIRROR BLOCKS (r = 2, S_+ = {x > 0} + {F1}, S_- = its mirror image) is the first case with content: a splitting
  Ntilde = H_+ + J H_+ J,   H_+ a_- even under J,   H_+ with at most one positive eigenvalue.
Its existence is again equivalent to window positivity, with an explicit member from the cone tensor (PROVED, algebra from
Lemma C):  H_+- = H/2 +- (l_+ l_+^T - l_- l_-^T)/s,  l_+- = H a_+-.  COMPUTED (`twoblock.py.txt`): zeta L = 1, 24 boxes: eigenvalues of
H_+ 2.6633, -4.1e-4, ... (one positive); L = 0.5: 1.5427, -1.0e-3; Beurling L = 1: H_+ has 5 positive eigenvalues, as H has.

## 2. F_d(s) = zeta(s-d) zeta(s+d): what my forms become (`fd.py.txt`, `fd2.py.txt`; fd.log, fd2.log)

### 2a. An exact identity (PROVED; unconditional)
Zeros of F_d are rho -+ d, i.e. gamma +- i d in the variable of fhat. For real f with compact support, with Q zeta's Weil form
(symmetric bilinear), Q_d that of F_d:
     Q_d(f) = 2 Q(e^{dx} f, e^{-dx} f) = 2 Q(cosh(dx) f) - 2 Q(sinh(dx) f).
Proof: (e^{dx} f)^(gamma) = fhat(gamma - i d); sum over the zeros of F_d of fhat(z) conj fhat(conj z) = sum_gamma [fhat(gamma - id)
conj fhat(conj gamma + id) + the same with d -> -d] = Q(e^{dx}f, e^{-dx}f) + Q(e^{-dx}f, e^{dx}f); then Q(u+v, u-v) = Q(u) - Q(v).
(Kernel form: the kernel of F_d is zeta's times 2cosh(du), S1-mirror B15.)  With g := cosh(dx) f (a bijection of L^2[-L, L]):
     Q_d(f) = 2 [ Q(g) - Q(tanh(dx) g) ].
So, on a window where Q_L >= 0:  F_d's form is >= 0 on [-L, L]  <=>  multiplication by tanh(dx) is a contraction for zeta's Weil
form on [-L, L]  <=>  || Q_L^{1/2} tanh(dx) Q_L^{-1/2} || <= 1.  To leading order in d: d || Q_L^{1/2} x Q_L^{-1/2} || <= 1.
d = 0 is the only tilt that needs no multiplier.
COMPUTED check of the identity on boxes: exact compression of the tilted kernel against 2 C Q C - 2 S Q S with C, S diagonal at the
box centres: max entry difference 2.1e-5, 5.3e-4, 3.5e-3 at d = 0.02, 0.1, 0.25 (entries up to 2.4; the difference is the
within-box variation of e^{dx}); Q_0 = 2Q exactly.

### 2b. The numbers (zeta, boxes) and my predictions
| quantity | 24 boxes, L = 1 | 48 boxes, L = 1 | 24 boxes, L = 0.5 |
|---|---|---|---|
| lowest eigenvalues of Q (parity) | 3.74e-3 (e), 1.68e-2 (o), 3.49e-2 (e) | 1.155e-3 (e), 5.09e-3 (o), 1.15e-2 (e) | 5.5e-3 (e), 2.2e-2 (o), 5.9e-2 (e) |
| share of |x psi_0|^2 on psi_1 | 0.986 | 0.989 | 0.960 |
| sup_g Q(tanh(dx) g)/Q(g), d = 0.25 / 0.45 | 0.189 / 0.574 | 0.466 / 1.414 | 0.058 / 0.187 |
| threshold, box-centre model | 0.618 | 0.373 | 1.093 |
Exact compression, 48 boxes (even / odd lowest eigenvalue of Q_d): d = 0.30: 2.09e-3 / 9.9e-3; 0.36: 1.76e-3 / 8.0e-3;
0.40: 6.5e-4 / -3.2e-2; 0.45: -2.0e-2 / -0.10. So F_d fails on 48 boxes between d = 0.36 and 0.40, ODD block first.
24 boxes, exact compression: positive for every d <= 0.45 (even 7.48e-3 -> 6.95e-3).
Predictions: PT1 HIT (E_d has exactly one positive eigenvalue at d = 0.05, 0.1, 0.25; my unsure guess "two at 0.45" MISS: one).
PT2 MISS (I said d_crit in [0.03, 0.12] at 24 boxes; there is no failure below 1/2 at 24 boxes, 0.36-0.40 at 48). Reason: I had
assumed Q(x psi_0) of order 1; in fact x psi_0 is 98.6% the next rung psi_1 of the near-null ladder, so Q(x psi_0) = 2.9e-3.
PT3 MISS (d_crit^2 Q(x psi_0)/mu_0 = 0.30, 0.145, not near 1): the threshold is the operator norm of x in the Weil norm, not its value
on the ground state. PT4 MISS (odd block fails first, I said even). PT5: model 0.373 against exact 0.36-0.40: HIT. PT6 HIT.
HEURISTIC for the true form (not computable in double precision): the box ladder has ratios 4.5, 2.1 between consecutive rungs;
the true one at L = 1 has 2.2e-26 / 8.2e-30 = 2.7e3 (r2_parity). If x still moves the ground state one rung up with
|x psi_0|^2 = 0.14, then d_crit(L = 1) <= 1/sqrt(0.14 * 2.7e3) = 0.05. S1-parity's promised table for d = 0.05, 0.1, 0.25 tests this.

### 2c. The one-field form and the fibre form for F_d
Pole kernel of F_d: 2cosh((1/2+d)u) + 2cosh((1/2-d)u); slowest Gamma notes e^{-(1/2-+d)|u|}. Hence
  E_d(x,y) = e^{(1/2+d)|x-y|} + e^{(1/2-d)|x-y|} = e^{|x-y|/2} 2cosh(d(x-y)),   N'_d = primes_d - (arch_d without those two notes),
  N'_d - E_d = -Q_d   (PROVED, same algebra as TURN1.md section 7).
COMPUTED, L = 1, 24 boxes, d = 0, 0.05, 0.1, 0.25, 0.45: E_d = P_d - W0_d to 6e-13; eigenvalues of E_d: 5.79 .. 6.36, then -1.17e-3,
-1.22e-3 (exactly one positive at every d); smallest off-diagonal entry of N'_d: 1.76e-3 .. 2.39e-3 (> 0);
#pos [[N'_d, E_d],[E_d, E_d]] = 1 = 1 + #neg(Q_d).
So the one-field form keeps its shape for every d: non-negative off-diagonal, one positive eigenvalue iff Q_d >= 0. Lemmas B, C and
Theorem F therefore apply to F_d word for word: a cubic certificate exists for F_d exactly on the windows where its form is
>= 0. Barrier B11 applies to the whole seat: nothing in it knows d = 0.
Fibre form: F_d needs FOUR fibre nodes (functionals e^{+-(1/2+-d)x}, two hyperbolic planes); PROVED (Lemma A's proof):
#pos(Ntilde_d) = 2 + #neg(Q_d); COMPUTED = 2 at every d. At d = 0 the four functionals collapse to two (F_0 = zeta^2).
So the count "one positive eigenvalue" is not intrinsic: it is 1 in the one-field form and 2 in the fibre form of the same F_d.

## 3. The unexplained locality outcome (`locality3.py.txt`, `locality4.py.txt`; logs)
Outcome to explain (TURN1.md 3a): forbidding the distinct triples with no two boxes within r of each other: n = 12: r = 4 (4 triples)
free, margin unchanged; r = 3 (20 triples) -0.206; n = 8: r = 2 (4 triples) -0.173.
(i) COMPUTED: a single entry is only loosely determined. Range of T_ijk over ALL certificates, in units l_i l_j l_k/s^2 (SCS):
n = 12: T(0,5,11) in [-3.16, 3.76] (cone value 0.58), T(0,5,10) [-2.66, 3.74] (0.66), T(0,4,11) [-1.49, 5.34] (1.81),
T(0,1,11) [-0.69, 6.10] (2.26), T(2,5,8) [-3.31, 3.29] (0.29), T(4,5,6) [0.42, 7.99] (3.23): zero inside for 5 of 6.
n = 8: T(0,3,7) and T(0,4,7) [0.023, 2.472] (1.245), T(0,3,6) [0.35, 2.82] (1.53), T(0,1,7) [0.56, 3.01] (1.69),
T(2,3,4) [0.65, 3.11] (1.77), T(1,3,5) [-0.58, 1.80] (0.67): zero OUTSIDE for 5 of 6. The intervals are roughly centred on the
cone value, radius about 1.2 units at n = 8 and 3.2 to 3.8 at n = 12.
(ii) COMPUTED: the cost is paid pair by pair. End pair alone, its j most central third boxes forbidden, everything else free:
n = 12: j = 0, 1, 2: +4.8544e-4 (unchanged); 3: -1.7e-3; 4: -0.035; 5: -0.058; 6: -0.081; 8: -0.128; 10: -0.317.
n = 8: j = 0: +8.8e-4; 1: -2.0e-3; 2: -0.114; 3: -0.174; 4: -0.242.
"No two close" with r = 4 at n = 12 takes 2 thirds from the end pair (free); r = 3 takes 4 (-0.035 alone, -0.206 with the other far
pairs); at n = 8, r = 2 takes 2 (-0.114 alone, -0.173 together). Control: one central third removed from each of the 4 farthest
pairs: n = 12 free (+4.8544e-4), n = 8: -0.152.
EXPLANATION (COMPUTED, not a theorem): the outcome is the pair obstruction in graded form. Each pair's entries are tied by
sum_k a_k T_ijk = H_ij; a far pair can give up its third boxes only while 0 stays inside the admissible ranges of the entries
that go, about 2 of 10 at 12 boxes and none of 6 at 8 boxes (where the cone value 1.245 sits just outside the radius 1.22).
"Margin unchanged" means the binding slice is elsewhere. No collective, scale-non-local effect is needed to explain it.

## 4. Nomination for machine checking: Lemma A first, in a form with no eigenvalues
Why A first: it is pure algebra (one identity and one discriminant argument, no Sylvester, no Perron-Frobenius); it is the object
S1-parity's B32 and my one-field form are attached to. Lemma C second (new; the seat's conclusion "existence is vacuous" rests on
it). Lemma B last or by citation (Braenden-Leake 2304.13203 Lemma 2.8; it needs Perron-Frobenius).
"At most one positive square", eigenvalue-free: for a symmetric bilinear form B on a real vector space X,
   AMOP(B) :<=> for all v, w in X:  B(v,v) > 0  =>  B(v,w)^2 >= B(v,v) B(w,w).
(Equivalent to "no two-dimensional subspace on which B is positive definite".)
LEMMA A (statement for the formal seat). V a real vector space, N : V x V -> R symmetric bilinear, p, q : V -> R linear.
Q(f) := 2 p(f) q(f) - N(f,f). On X := V x R x R put
   B((f,al,be),(g,ga,de)) := N(f,g) + al p(g) + ga p(f) + be q(g) + de q(f) + al de + be ga.
 (A1) B((f,al,be),(f,al,be)) = -Q(f) + 2 (al + q(f)) (be + p(f))                       [ring identity]
 (A2) (for all f: Q(f) >= 0)  <=>  AMOP(B).
Proof of (A2). =>: let B(v,v) > 0, v = (f,al,be). By (A1) and Q >= 0, (al + q(f))(be + p(f)) > 0, so the linear form
A(g,ga,de) := ga + q(g) has A(v) != 0. For any w put t := A(w)/A(v); then A(w - t v) = 0, so by (A1) B(w - tv, w - tv) = -Q(.) <= 0.
The quadratic B(v,v) t^2 - 2 B(v,w) t + B(w,w) with positive leading coefficient takes a value <= 0, so its discriminant is >= 0.
<=: if Q(f0) < 0, take v = (f0, -q(f0), -p(f0)) and w = (0, 1, 1): B(v,v) = -Q(f0) > 0, B(w,w) = 2, B(v,w) = p(f0) + q(f0) - q(f0) - p(f0) = 0,
so B(v,w)^2 = 0 < B(v,v) B(w,w).  QED
LEMMA C (second). H a real symmetric n x n matrix with AMOP, a in R^n with s := a^T H a > 0 and l := H a >= 0 entrywise.
T_k := (l_k/s) H + (1/s) (H e_k l^T + l (H e_k)^T) - (2 l_k/s^2) l l^T. Then sum_k a_k T_k = H, (T_k)_ij is symmetric in (i,j,k), and each
T_k has AMOP. (Proof in AMOP language: T_k(y,y) = (l_k/s) [H(y,y) - (l.y)^2/s] + (2/s) (u_k.y)(l.y), u_k := H e_k - (l_k/(2s)) l; the bracket is
<= 0 by AMOP(H) with v = a; if T_k(v,v) > 0 then l.v != 0, and for any w the vector w - (l.w/l.v) v is killed by l, so T_k <= 0 there;
discriminant as above.)
