# TRANSPORT: the Bettin-Gonek dictionary read in both directions, the hybrid family, copies in t (SP-sieve, session 2, 2026-11-11)

Written without reading SP-modular's answer to the same object (rule 13 (b)). Labels: PROVED (argument here) / KNOWN (with what I
read) / FROM MEMORY / HEURISTIC / CONJECTURE / RISK. Read for this file: NOTEBOOK N62-N65; digests bettin-gonek-1604.02740.md,
conrey-1989.md, bcr-1411.7764.md, radziwill-1207.6583.md, balazard-deroton-0812.1689.md; my S2_B10d.md; the 11/12 digest
(session 1). No numerics. Notation: M_N(s) log N = sum_{n<=N} mu(n) n^-s log(N/n) (Levinson weights, as in Bettin-Gonek);
I_N(T1,T2) = int_{T1}^{T2} |zeta M_N(1/2+it)|^2 dt.

## 1. The converse of the dictionary
(1a) THE DICTIONARY IS AN EQUIVALENCE AT BOUNDED HEIGHT (PROVED, given one classical lemma).
  Lemma (FROM MEMORY: Titchmarsh 14.2 run with a zero-free half-plane in place of RH; Borel-Caratheodory on discs centred at
  2 + it, then Hadamard three circles): if zeta has no zeros in Re s > sigma, then for every delta, eps > 0,
  zeta(s)^(+-1) << (|t|+2)^eps on Re s >= sigma + delta.
  (=>) Perron: M_N(1/2+it) log N = (1/2 pi i) int_(c) N^w dw / (w^2 zeta(1/2+it+w)). Move the line to Re w = sigma - 1/2 + delta
  (> 0, so w = 0 is not crossed, no pole). The lemma bounds the integrand by N^(sigma-1/2+delta) (|t|+|w|+2)^eps/|w|^2, integrable:
     |M_N(1/2+it)| << N^(sigma - 1/2 + delta) (|t|+2)^eps,   hence   I_N(0,T0) << N^(2 sigma - 1 + 2 delta) T0^(1+eps).
  (<=) Bettin-Gonek's proof (KNOWN, digest: steps 1-8, checked line by line by READER-8) uses only bounded t: step 6 gives
  x^(2 beta0)/(1+|t|)^4 << int_1^x |M_y(1/2+it)|^2 log^2 y dy for each t; integrate against |zeta|^2 over [0, T0] with T0 FIXED:
  if I_y(0,T0) << y^(2 sigma - 1 + eps) for all y, then x^(2 beta0) << x^(2 sigma + 2 eps) log^2 x, so beta0 <= sigma.
  SO: no zeros in Re s > sigma  <=>  I_N(0,T0) = O_(T0,eps)(N^(2 sigma - 1 + eps)) for every N.
  In Bettin-Gonek's coupling N = T^theta the bounded-height part is T^(theta(2 sigma - 1)), which equals T exactly at
  theta = 1/(2 sigma - 1): THAT is where the dictionary's exponent comes from; 7/8 <-> growth N^(3/4) at bounded height.
(1b) WHAT THE HYPOTHESIS DOES NOT GIVE: the coupled bound I_N(0,T) << T^(1+eps) for N <= T^theta at growing heights.
  PROVED (what one can derive): on a dyadic block at height X, from (1a) and from the mean value theorem applied to the
  approximate functional equation (zeta M_N is a Dirichlet polynomial of length ~ X^(1/2) N; Montgomery-Vaughan, FROM MEMORY):
     I_N(X,2X) << (NX)^eps min( X + X^(1/2) N ,  N^(2 sigma - 1) X ).
  With N = T^theta, X = T^x, the block is << T^(1+eps) iff x <= 2 - 2 theta or x <= 1 - theta(2 sigma - 1). At theta = 1/(2 sigma - 1) > 1
  both right sides are <= 0: NO block at a height T^x, x > 0, is controlled. The derivable statement is the bounded-height one only.
  WHERE CANCELLATION IS NEEDED (HEURISTIC, residue calculus continued left of Re = sigma + delta, not justified on the line): a zero
  rho = beta + i gamma contributes to M_N(1/2+it) the term N^(rho - 1/2 - it) / ((rho - 1/2 - it)^2 zeta'(rho) log N), hence to I_N(X,2X)
     about N^(2 beta - 1) |zeta(1/2 + i gamma)|^2 / (|zeta'(rho)|^2 log^2 N)   for each rho with gamma in [X, 2X].
  (This reproduces Bettin-Gonek's two stated single-zero asymptotics: N^(2 beta0 - 1)(log N)^-2 C(N) on [0,T] and the T^-3 decay on
  [T,2T]; KNOWN as statements, digest section 2.) At theta = 1/(2 sigma - 1) a zero with beta close to sigma costs about T by itself.
  So the coupled bound needs, besides the half-plane, a WEIGHTED ZERO-DENSITY statement:
     sum_{|gamma| <= T, beta > 1/2} N^(2 beta - 1) |zeta(1/2 + i gamma)/zeta'(rho)|^2 << T^(1+eps)  (N = T^theta),
  i.e. roughly N(sigma', T) << T^(1 - theta(2 sigma' - 1) + eps) for 1/2 < sigma' <= sigma. At sigma' -> sigma this allows only T^eps zeros near the
  edge; near 1/2 it is STRONGER than the density hypothesis (exponent 1 - theta(2 sigma' - 1) < 2(1 - sigma') iff theta > 1).
  CONJECTURE: the coupled form is strictly stronger than the zero-free half-plane (a configuration of T^c zeros just left of
  Re s = sigma at heights <= T is consistent with the half-plane and violates it). Not searched.
(1c) Reading N65 correctly. The October theorem gives the BOUNDED-HEIGHT growth N^(3/4+eps) (via (1a, =>)), which is what theta = 4/3
  "means" in the dictionary; it does NOT give BCR-type mean values at height T with N = T^(4/3). "Ahead on the same scale" is true only
  for the bounded-height reading, where mollifier technology (BCR, Conrey: heights [T,2T], theta < 1) does not operate at all.
  The two literatures are on different axes: (height T, length T^theta, theta < 1) versus (height O(1), length N -> infinity).
(1d) Impostor (B1/B2). Both directions of (1a) are complex analysis (Perron, Mellin, Borel-Caratheodory): they hold verbatim for
  1/f_DH. So the dictionary is impostor-blind; the Euler product enters only through the hypothesis. (For f_DH both sides fail:
  zeros in Re s > 1, S2_B10d 5b.) The weighted density in (1b) is where an Euler product could matter; nothing here uses it.

## 2. Transport to zeta_K, K = Q(sqrt -3): a hybrid family
(2a) The t-direction. Replace nu by nu(n) N(n)^(-it). In the October argument (11/12 digest, steps 5-11): Poisson in u does not
  see t; the Gauss-sum conversion mu(z) x (sextic Gauss sum) = cubic Gauss coefficient is pointwise in z and passes N(z)^(-it)
  through; in the column the factor N(n)^(-it) is absorbed into the weight W_t(y) = W(y) (yX)^(-it). Prop. 3.1's constant is
  max_{j<=k} ||W^(j)||^2 with k = k(vartheta, eps) finite (KNOWN, digest section 2), and ||W_t^(j)|| ~ (1+|t|)^j. So (PROVED from the
  statement as quoted, RISK only in that the paper's k must not depend on W): for |t| <= D^(eps/(2k)),
     sum_{0<N(u)<=H} |A_u(D;t)|^2 << H D^(1+2 eps),   H = D^(1+vartheta),  A_u(D;t) = sum mu nu chi_n(u) N(n)^(-it) W(N(n)/D),
  uniformly in t: the hybrid family {u} x [-T, T] with T <= D^(o(1)). Beyond T = D^c: unknown (the derivative loss compounds over
  the O(1) recursion steps, J -> 4J + 12; RISK that it is not merely polynomial).
(2b) What follows for zeta_K (PROVED, conditional on the October theorem; it is (1a) over K): with M^K_N the Levinson-weighted
  Moebius polynomial over ideals of O, I^K_N(0,T0) := int_0^T0 |zeta_K M^K_N(1/2+it)|^2 dt << N^(3/4+eps) (from 7/8; N^(5/6) from 11/12),
  and by (1a, <=) over K this is EQUIVALENT to the half-plane. The same for the Nyman-Beurling-type integral at bounded height.
  (Consistent with SP-reflection's session-4 "Moebius vector grows <= e^(3u/8)": squared, N^(3/4).) Nothing new: a restatement.
(2c) Does the t-direction add family LENGTH? No (PROVED by the bookkeeping of S2_B10d 0.2). In the hybrid family the copies are
  (u = w^6, |t| <= 1/log D): the t-direction dilutes them by (1/log D)/T. If a hybrid diagonal sum_u int_{-T}^T |A_u|^2 << H T D held with
  H T = D^(1+vartheta) (H = D^(1+vartheta-tau), T = D^tau), amplification would give |A_1|^2 << H^(5/6) T D^(1+eps): the exponent grows by tau/6.
  The t-direction has no Poisson duality with u (the theta step needs the u-family alone longer than D), so the hybrid diagonal is
  not available anyway. Angular Groessencharacters alpha^k (n/|n|)^k: the column coefficient becomes alpha^(k+1) gamma_2; the paper produces one
  alpha by one d/dz-bar of theta (App. A.2); alpha^(k+1) needs k+1 raising operators, derivative losses polynomial in k (RISK). Same verdict:
  uniform for k <= D^(o(1)), no copies (alpha^k = 1 on all primary n only for k = 0).

## 3. Rule 13 (c): exact copies inside a t-family
(3a) None exist (PROVED): n^(-it) = 1 for all n <= N forces t log p in 2 pi Z for all p <= N, impossible for t != 0 and N >= 3
  (log 2 / log 3 irrational). Approximate copies on the z-smooth numbers, |p^(-it) - 1| <= eta for p <= z, have density about
  eta^(pi(z)) (Kronecker-Dirichlet, FROM MEMORY); at z = N that is Bagchi's strong recurrence (N49), i.e. RH itself.
(3b) Why the algebraic family has them (my reading, PROVED as a description). The rows are parametrised by a HOMOMORPHISM from a
  monoid with additive structure (u in O, Poisson-able) to characters, u -> (u/.)_6, whose kernel is the sixth powers: density
  H^(1/6 - 1) in the ball, strictly between 0 and positive. The t-family: homomorphism from (R, +), kernel {0} (Kronecker). A depth family:
  kernel of POSITIVE density. Intermediate density needs m-th power residue symbols, i.e. mu_m in the field: non-archimedean.
(3c) The depth-aspect candidate (Postnikov): for n = 1 mod p, chi(n) = e(a log_p(n)/p^(k-1)) for chi mod p^k, an exact p-adic n^(it).
  Copies exist and are exact (a = 0 mod p^(k-1), or the principal character), but the family is a finite group. PROVED (orthogonality):
  sum_{chi mod q} |A_chi(D)|^2 = phi(q) sum_{b mod q} |sum_{n = b} mu(n) W(n/D)|^2. If q > 2D each class has <= 1 term, the sum is phi(q) sum mu^2 W^2
  (exactly diagonal), and the copy bound |A_chi0|^2 <= phi(q) D is >= D^2: trivial. If q <= D the right side is Moebius in progressions
  mod q, which contains A_chi0 itself: circular. Exactly N49 (c): positive-density copies make the diagonal mean square circular.
  Indexing chi by integers a in [1, A] instead (a family longer than q, each character repeated A/q times): uniform multiplicity, the
  trivial member gets no extra weight: no amplification. So the depth aspect reproduces the t-family's wall in p-adic form.
(3d) The closest substitute I can name (CONJECTURE, unsearched): a family that is a product of a residue-symbol part (supplying
  copies with intermediate density) and an archimedean part (supplying height) in which the archimedean part is TIED to the row by
  reciprocity, e.g. Groessencharacters of K whose infinity type is a function of u, so that copies in u force triviality in t.
  Hecke characters of K of conductor u and infinity type k with (u/.)_6 alpha^k ... trivial exactly on sixth powers would need
  alpha^k to be trivial on the kernel: forces k = 0. So within Hecke characters of K: no. This is a negative pointer, not a candidate.

## 4. Ten-line summary
1. PROVED: zero-free Re s > sigma <=> I_N(0,T0) = O(N^(2 sigma - 1 + eps)) at bounded height (Perron + Borel-Caratheodory one way, Bettin-Gonek
   the other). The theta = 1/(2 sigma - 1) of N65 is this bounded-height growth rewritten with N = T^theta.
2. The coupled form (heights up to T, N <= T^theta) does NOT follow from the half-plane: MVT + (1) control no block at height T^x, x > 0.
3. Needed extra (HEURISTIC): a weighted zero-density bound sum N^(2 beta - 1)|zeta(1/2+i gamma)/zeta'(rho)|^2 << T^(1+eps); for theta > 1 stronger than DH near 1/2.
4. Hence the October theorem matches theta = 4/3 only at bounded height, where BCR/Conrey (heights [T,2T], theta < 1) do not operate.
5. The dictionary is impostor-blind (pure complex analysis); the Euler product is only in the hypothesis.
6. Hybrid (u, t): Prop. 3.1 survives for |t| <= D^(o(1)) (weights W(y)y^-it; finite derivative order k); beyond, unknown (RISK).
7. It yields for zeta_K: I^K_N(0,T0) << N^(3/4+eps), equivalent to the half-plane: a restatement. The t-direction dilutes copies (+tau/6).
8. No exact copies in t (Kronecker); approximate copies on z-smooth numbers = Bagchi = RH at z = N.
9. Depth (Postnikov) family: exact copies, but a finite group: the copy bound is trivial (q > D) or circular (q <= D), PROVED: N49 (c) again.
10. What the sextic family has and t lacks: a homomorphic parametrisation whose kernel (m-th powers) has intermediate density; needs mu_m, non-archimedean.
