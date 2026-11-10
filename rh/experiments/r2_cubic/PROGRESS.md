# r2_cubic  (seat "cubic", agent R2-cubic)  round 2, creation round

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.  Ideas: IDEAS_LOCAL.md (cite R2-cubic/#N).
Note: `pip install cvxpy` was run at 22:39 UTC (system site-packages; needed an SDP solver; nothing in the repo changed).

## 0. Thinking before any computation (22:34-22:39 UTC)

Setting. Window [-L, L] cut into n boxes of width h = 2L/n, orthonormal basis e_i = 1_box_i / sqrt(h).
N = primes - arch (matrix N, off-diagonal entries >= 0), p_i = <e_i, e^{x/2}>, q_i = <e_i, e^{-x/2}>.
Pole kernel 2 cosh((x-y)/2) = p(x) q(y) + q(x) p(y).  Weil form Q = p q^T + q p^T - N.

(a) R2-cubic/#1 FIBRE CLASSES.  Ntilde := [[N, p, q], [p^T, 0, 1], [q^T, 1, 0]]  ((n+2) x (n+2)).
    Claim (to prove, PROOF_trickle.md): Q >= 0 on the box space  <=>  Ntilde has exactly one positive eigenvalue.
    This is the Hodge index theorem in its usual form on C x C (two fibre classes F1, F2 with F1^2 = F2^2 = 0, F1.F2 = 1)
    and it repairs wall WJ13 inside idea #10: the signature statement for Ntilde IS both parity-block inequalities
    at once, and every off-diagonal entry of Ntilde is >= 0 (p, q > 0).
(b) R2-cubic/#2 METZLER TRICKLE-DOWN.  Hypotheses as I believe they must be (proof to write):
    T symmetric real 3-tensor, a > 0 entrywise, H = T.a, slices T_k.  If (i) H has off-diagonal >= 0 and is irreducible,
    (ii) (Ha)_k > 0 for all k, (iii) every slice T_k has at most one positive eigenvalue, then H has exactly one
    positive eigenvalue.  No sign condition on T is needed, and the diagonal of H may be negative.
(c) R2-cubic/#3 VACUITY.  If H is Lorentzian and a > 0 with Ha > 0, then the "cone" tensor
    T = (1/(2s)) [ sym(H (x) l) - (4/s) l(x)l(x)l ]-type, l = Ha, s = a^T H a, is a certificate.  So bare existence of a
    certificate is EQUIVALENT to the conclusion: by itself it is a reformulation (owner rule 2).  Content can only come
    from an extra restriction on T (sign on distinct triples as in Braenden-Huh; locality; a formula).
(d) R2-cubic/#4 RIGIDITY.  Hv = 0 forces T(v,.,.) = 0.  Near-null vectors of the Weil form (the prolate ladder,
    mu = 6e-30 at L = 1) must be near-lineality directions of ANY certificate.

## 1. Predictions, written BEFORE the computations (22:39 UTC)

P1 (signature of Ntilde, zeta, boxes).  n = 12 boxes, L = 0.5, 0.75, 1.0: exactly ONE positive eigenvalue each time.
    Second-largest eigenvalue of Ntilde at L = 1.0, n = 12: in [-0.3, -1e-3] (the box space cannot resolve the
    near-null ladder, so the margin is of discretisation size, not 1e-23).
    Control (Beurling, 2 -> 2.1, same Gamma factor and pole): L = 0.5, n = 14: I predict the control is NOT detected
    (still one positive eigenvalue), because the lowest Beurling eigenvalue at L = 0.5 is small and 14 boxes are coarse;
    I predict detection (TWO positive eigenvalues) at L = 1.0, n = 14.  If detected already at L = 0.5: MISS.
P2 (cone certificate, zeta, L = 1.0, n = 12, a = Perron vector of Ntilde).  All 14 slices have exactly one positive
    eigenvalue (this must hold by (c); it tests the algebra).  Sign: among the entries T_ijk with i, j, k three DISTINCT
    box indices, between 50% and 95% are NEGATIVE (crude estimate: positive iff the mean of w over the three gaps
    exceeds 4/3, i.e. only for tight triples).  So the cone certificate is NOT a Braenden-Huh object.
P3 (sign-constrained certificate, SDP).  A certificate with T_ijk >= 0 on all triples of distinct indices (fibre nodes
    included) and the same a: I predict it EXISTS for zeta at L = 0.5 and L = 1.0, n = 8 (plenty of freedom: 220 unknowns
    against 55 linear constraints).  Stronger: with ALL entries with at least two distinct indices >= 0: also exists.
    Controls: for the Beurling shift at a window where its Ntilde has two positive eigenvalues the SDP is infeasible
    (forced by (b), not a surprise).  For a control still non-negative on the window (Beurling at L = 0.30, or the
    synthetic control "coupling at 3 multiplied by -0.16" on a window where its form is still >= 0) I predict a
    sign-constrained certificate ALSO exists when all couplings are >= 0 (Beurling), i.e. existence does not see more
    than window positivity.  A number that would differ: margin t* := max t such that T_ijk >= t * l_i l_j l_k / s^2... 
    measured, no prediction of its value (I have no model for it); prediction only on existence.
P4 (product cubic <f^2, N f>, R2-cubic/#5): slices have about n-1 positive eigenvalues (not Lorentzian). Kill expected.

## 2. Second batch of predictions, written BEFORE computing (22:47 UTC)

P5 (locality radius).  Restrict T: for three box indices, T_ijk = 0 unless the three boxes lie within R boxes of
    each other (max index difference <= R); entries involving a fibre node are free.  R*(L, n) := smallest R with a
    certificate.  Prediction: R* >= 1 (a certificate whose only cubic data are the two fibre slices does NOT exist),
    and R* h >= L/2 at L = 1.0, n = 8 (i.e. R* >= 2).  Control (Beurling, L = 0.5, n = 8, still Lorentzian on that box
    space): same R* as zeta at L = 0.5 (no discrimination).  If R* = 0 the certificate degenerates to a statement about
    two matrices, which would be a real simplification: N - diag = alpha A + beta B with A <= p p^T/s1, B <= q q^T/s2.
P6 (rigidity, Lemma D).  Make the box Weil form exactly singular (subtract mu f f^T from Q, f its ground state) and
    solve the SDP: every slice T_k must annihilate vtilde = (f, -<f,q>, -<f,p>):  max_k |T_k vtilde| < 1e-4 (solver
    accuracy), compared with |T_k| of order 1.  For the unmodified form: max_k |vtilde^T T_k vtilde| <= (mu + mu^2 f^T D f)/a_k.
P7 (sign of the cone certificate in the continuum).  rho(L) := min over distinct box triples of
    [H_ij/(a_i a_j) + H_ik/(a_i a_k) + H_jk/(a_j a_k)] / (2 lambda)  (cone certificate >= 0 on distinct triples iff
    rho >= 1; a = Perron vector, lambda = top eigenvalue of Ntilde).  After the P2 miss I expect rho(1.0) in [1.0, 1.3],
    decreasing in L, crossing 1 between L = 1.2 and L = 2.0 (far triples have w(2L) ~ e^{-L}, lambda grows).
