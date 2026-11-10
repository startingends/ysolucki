# PROOF_trickle.md  (R2-cubic)  Five lemmas about cubic certificates for the windowed Weil form

All five statements are PROVED here in full (finite-dimensional linear algebra). None of them proves any case of
Weil positivity that was not known. Their role: they fix exactly what a cubic ("triple intersection") certificate
for idea #10 must satisfy, show that the bare notion has no content, and give two necessary conditions that any
candidate formula for the cubic object can be tested against.

Notation. V a real vector space of dimension n with inner product <.,.> (in the application: the span of n
functions in L^2[-L, L], e.g. n disjoint boxes). N a symmetric bilinear form on V (application: N = primes - arch).
p, q in V (application: p = projection of e^{x/2}, q = projection of e^{-x/2}; pole term = 2 <f,p><f,q>).
Q(f) := 2 <f,p><f,q> - N(f,f) is the Weil form. "Lorentzian" for a symmetric matrix means: exactly one positive
eigenvalue. A <= B for symmetric matrices means B - A is positive semidefinite.

---------------------------------------------------------------------------------------------------------------
## Lemma A (fibre classes).  PROVED.

Let Ntilde be the symmetric form on V + R F1 + R F2 with
    Ntilde(f,g) = N(f,g),  Ntilde(f,F1) = <f,p>,  Ntilde(f,F2) = <f,q>,  Ntilde(F1,F1) = Ntilde(F2,F2) = 0,  Ntilde(F1,F2) = 1.
Then   (number of positive eigenvalues of Ntilde) = 1 + (number of negative eigenvalues of Q),
and (number of zero eigenvalues of Ntilde) = (number of zero eigenvalues of Q).
In particular  Q >= 0 on V  <=>  Ntilde has at most one (then exactly one) positive eigenvalue.

Proof. Let U = span(F1, F2). On U the form is [[0,1],[1,0]]: non-degenerate, signature (1,1). Hence
V + U = U (+) U^perp (Ntilde-orthogonal direct sum). A vector (f, alpha, beta) := f + alpha F1 + beta F2 is in U^perp iff
Ntilde(., F1) = <f,p> + beta = 0 and Ntilde(., F2) = <f,q> + alpha = 0. So U^perp = { phi(f) := (f, -<f,q>, -<f,p>) : f in V },
and  Ntilde(phi(f), phi(f)) = N(f,f) + 2 alpha <f,p> + 2 beta <f,q> + 2 alpha beta
                            = N(f,f) - 2<f,q><f,p> - 2<f,p><f,q> + 2<f,p><f,q> = -Q(f).
By Sylvester's law of inertia the inertia of Ntilde is (1,1,0) + inertia(-Q).  QED

Remarks. (1) In the box basis every off-diagonal entry of Ntilde is >= 0: N_ij >= 0 (idea #10's sign fact),
p_i, q_i > 0, and the entry 1. The two new diagonal entries are 0; the box diagonal entries are negative.
(2) This is the Hodge index theorem on a product of two curves in its usual form (F1, F2 = the two fibre classes,
F1^2 = F2^2 = 0, F1.F2 = 1, D.F1 and D.F2 the two degrees), i.e. Weil's own picture; nothing about zeta is proved.
What it does for this project: wall WJ13 said "N has one positive eigenvalue" is weaker than RH and that the true
statements are the two parity-block inequalities. Lemma A puts both block inequalities back into ONE signature
statement about ONE matrix with non-negative off-diagonal entries. The object a cubic certificate must be
attached to is Ntilde, not N.
(3) Null vectors: Q f = 0  <=>  Ntilde phi(f) = 0. More generally Ntilde phi(f) = (-Qf, 0, 0)  (the two fibre
components vanish identically; the box component is N f - <f,q> p - <f,p> q = -Q f).

---------------------------------------------------------------------------------------------------------------
## Lemma B (trickle-down with negative diagonal: the exact hypotheses).  PROVED.

Let T be a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with a_k > 0 for
all k. Put T_k := (T_ijk)_{i,j} (the k-th slice), H := sum_k a_k T_k, l_k := H e_k (k-th column of H), s_k := (Ha)_k.
Assume
  (B1) H_ij >= 0 for i != j, and H is irreducible (its graph is connected);
  (B2) s_k > 0 for every k;
  (B3) every slice T_k has at most one positive eigenvalue.
Then H has exactly one positive eigenvalue, and H <= H D H with D := diag(a_k / s_k).
No sign condition on the entries of T is used, and the diagonal entries of H may have any sign.

Proof.
Step 1 (symmetry). (T_k a)_i = sum_j T_ijk a_j = sum_j a_j (T_j)_ik = H_ik. So T_k a = l_k and a^T T_k a = (Ha)_k = s_k > 0.
Step 2 (reverse Cauchy-Schwarz). If A is symmetric with at most one positive eigenvalue and a^T A a > 0, then
A <= (Aa)(Aa)^T / (a^T A a). Indeed for any x put y := x - (x^T A a / a^T A a) a. Then y^T A a = 0 and
x^T A x = y^T A y + (x^T A a)^2 / (a^T A a). If y^T A y > 0, then y and a are linearly independent (y^T A a = 0 < a^T A a)
and A is positive definite on span(a, y), a 2-dimensional space: contradiction with (at most one positive
eigenvalue) by Courant-Fischer. So y^T A y <= 0.
Step 3. By steps 1, 2 and (B3): T_k <= l_k l_k^T / s_k. Multiply by a_k > 0 and add:
    H <= sum_k (a_k/s_k) H e_k e_k^T H = H D H.
Step 4. Put M := D^{1/2} H D^{1/2} (symmetric). Then M <= M^2, so every eigenvalue mu of M has mu <= mu^2:
mu <= 0 or mu >= 1.
Step 5 (the only place a sign is used). M has non-negative off-diagonal entries and is irreducible (same zero
pattern as H). The vector v := D^{-1/2} a has entries sqrt(a_k s_k) > 0 and M v = D^{1/2} H a = D^{1/2} s = v.
For c large, M + cI is an entrywise non-negative irreducible symmetric matrix with a strictly positive
eigenvector v, eigenvalue 1 + c. By Perron-Frobenius, 1 + c is its largest eigenvalue and it is simple. So every
other eigenvalue of M is < 1, hence <= 0 by step 4. M has exactly one positive eigenvalue; by Sylvester so has H.  QED

Remarks. (1) Given T.a = H and (B2), hypothesis (B3) is EQUIVALENT to the linear matrix inequalities
T_k <= l_k l_k^T / s_k (k = 1..m) (step 2 one way; a rank-one upper bound gives at most one positive eigenvalue
the other way). So for fixed a the set of certificates of H is CONVEX (a spectrahedron), and a certificate can be
searched for by semidefinite programming.
(2) Relation to the literature (from memory, then checked by search, see PROGRESS.md section 5): steps 2-5 are the
standard argument behind Oppenheim's trickle-down theorem and behind the cubic step of Braenden-Huh /
Anari-Liu-Oveis Gharan-Vinzant, where T has non-negative entries and H is entrywise non-negative. Negative
self-intersections are handled in the literature by passing to a cone (Braenden-Leake, "Lorentzian polynomials on
cones"). The only point made here is that for ONE Hessian the proof needs signs only on the off-diagonal of H.
(3) Without irreducibility the conclusion fails (H = direct sum of two Lorentzian blocks satisfies everything else).

---------------------------------------------------------------------------------------------------------------
## Lemma C (the cone certificate: bare existence has no content).  PROVED.

Let H be symmetric with exactly one positive eigenvalue and a a vector with l := Ha >= 0 entrywise and
s := a^T H a > 0. Define
    T_ijk := [ H_ij l_k + H_ik l_j + H_jk l_i - (2/s) l_i l_j l_k ] / s.
Then T is symmetric, T.a = H, and every slice T_k has at most one positive eigenvalue.
(T is the tensor of the cubic polynomial (1/(2s)) [ (x^T H x)(l.x) - (2/(3s)) (l.x)^3 ].)

Proof. Symmetry is visible. sum_k a_k T_ijk = [ H_ij s + l_i l_j + l_j l_i - 2 l_i l_j ] / s = H_ij.
Slice: T_k = (l_k/s) (H - l l^T/s) + (1/s) [ u_k l^T + l u_k^T ],  u_k := H e_k - (l_k/(2s)) l   (expand to check).
By step 2 of Lemma B applied to H itself, H - l l^T/s <= 0; since l_k >= 0 the first term is negative
semidefinite. The second term has rank <= 2 and at most one positive eigenvalue (u l^T + l u^T =
(1/2)[(u+l)(u+l)^T - (u-l)(u-l)^T]). By Weyl's inequality lambda_2(A + B) <= lambda_1(A) + lambda_2(B) <= 0.  QED

Corollary (vacuity). Let H satisfy (B1) and let a > 0 with Ha > 0. Then
    H has exactly one positive eigenvalue  <=>  there is a symmetric T with T.a = H whose slices all have at
    most one positive eigenvalue.
(=> Lemma C, <= Lemma B.)  So for the windowed Weil form: "a cubic certificate for Ntilde exists" is EQUIVALENT to
"the Weil form is >= 0 on that subspace", for zeta, for a Beurling system, for anything with non-negative
couplings. Existence of a certificate cannot discriminate beyond window positivity itself, and the statement
"find T" is a reformulation (owner rule 2) unless T is required to have additional structure that makes its
slices EASIER than H. In the cone certificate each slice is (a positive multiple of H - l l^T/s) + rank 2:
every "link" is the whole.

---------------------------------------------------------------------------------------------------------------
## Lemma D (rigidity: null directions of H are lineality directions of every certificate).  PROVED.

In the setting of Lemma B put P_k := l_k l_k^T / s_k - T_k  (positive semidefinite by step 3). Then
  (D1) sum_k a_k P_k = H D H - H =: G   (so the certificates of H are exactly the decompositions of the FIXED
       positive semidefinite matrix G into a_k-weighted positive semidefinite pieces P_k such that
       H_ik H_jk / s_k - (P_k)_ij is symmetric in (i,j,k));
  (D2) G a = 0, hence P_k a = 0 for all k;
  (D3) for every vector v:  sum_k a_k v^T P_k v = v^T (H D H - H) v.  In particular if H v = 0 then P_k v = 0 and
       T_k v = 0 for every k, i.e. T(v, ., .) = 0: the cubic form does not depend on the direction v.
  (D4) (quantitative form for the Weil form) Let Q f = mu f, |f| = 1, and vt := phi(f) = (f, -<f,q>, -<f,p>) as in
       Lemma A with H = Ntilde. Then H vt = (-mu f, 0, 0), and for every k
           0 <= vt^T P_k vt <= (mu + mu^2 f^T D f) / a_k ,     vt^T T_k vt = mu^2 f_k^2 / s_k - vt^T P_k vt
       (f_k := 0 for the two fibre indices).

Proof. (D1) is step 3 with the difference kept. (D2): H D H a = H D s = H a, so G a = 0; then
0 = a^T G a = sum_k a_k a^T P_k a with every term >= 0, so a^T P_k a = 0 and P_k a = 0 (P_k >= 0).
(D3): the identity is (D1) applied to v. If Hv = 0 the right side is 0, every term on the left is >= 0, so
v^T P_k v = 0, so P_k v = 0, and T_k v = l_k (l_k . v)/s_k - P_k v = 0 because l_k . v = (Hv)_k = 0.
(D4): H vt by Lemma A remark (3); vt^T H vt = -mu, vt^T H D H vt = mu^2 f^T D f; then (D3) and
l_k . vt = (H vt)_k = -mu f_k.  QED

Meaning. In the continuum the Weil form on [-L, L] has a ladder of tiny eigenvalues (lane A: 6e-30, 1e-23, ... at
L = 1). By (D4) EVERY slice of EVERY certificate must vanish on each of these vectors to that accuracy. A formula
for T written in terms of primes and the Gamma kernel must therefore "know" the near-null vectors, which are the
Poisson-summation (prolate) functions e^{u/2} sum_n phi(n e^u). This is a cheap blind test for any proposed
construction of T: evaluate T(vt, vt, e_k) on lane A's minimiser; it must be < mu/a_k. No eigenvalue computation
of slices is needed to reject a candidate.

---------------------------------------------------------------------------------------------------------------
## Lemma E (what a "local" certificate would have to do).  PROVED (elementary consequence of D3).

In the setting of Lemma B, for every pair (i, j) the vector t_ij := (T_ijk)_k satisfies
    t_ij . a = H_ij     and     t_ij . v = 0 for every v in ker H.
(First: definition of H. Second: (D3).)  Consequence used in PROGRESS.md: if H = Ntilde has a null vector
vt = phi(f) with <f,p> = <f,q> != 0 (an even null function) and a has equal fibre weights, then no pair (i,j) of
boxes with N_ij != 0 can have T_ijk = 0 for all box indices k: otherwise t_ij is supported on the two fibre
indices, t_ij . vt = -<f,p>(T_ijF1 + T_ijF2) = 0 and t_ij . a = a_F (T_ijF1 + T_ijF2) = N_ij != 0, a contradiction.
So at a critical window every coupled pair of scales needs genuinely cubic data with a third SCALE; the two fibre
slices alone can never carry a certificate.
