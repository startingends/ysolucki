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

P8 (22:52 UTC, before computing).  Doob transform of Ntilde by a: generator L with rates r_ij = H_ij a_j / s_i (i != j),
    reversible for pi_i = a_i s_i; Lemma B's H <= HDH is "L^2 + L >= 0" (spectral gap >= 1).  The Bakry-Emery
    site forms B_i = pi_i (Gamma_2 - Gamma)(i) sum to the same matrix G = HDH - H as the certificate pieces a_i P_i.
    Prediction: (i) sum_i B_i = G to 1e-10 (identity); (ii) the Bakry-Emery pieces are NOT positive semidefinite for
    zeta at L = 1, n = 12 (pointwise curvature < 1 at most sites; best constant rho_BE in [0.2, 0.95]);
    (iii) the tensor T^BE_k := l_k l_k^T/s_k - B_k/a_k is NOT symmetric in its three indices (relative asymmetry > 10%).
    So Bakry-Emery is a lossy, non-symmetric member of the same family of site decompositions in which the cubic
    certificates are the symmetric, lossless ones.  If (iii) fails (T^BE symmetric) then idea #10 and idea #11 are
    literally the same condition and the cone certificate gives a curvature-type criterion that is exact.

P9 (22:57 UTC, before computing; follows the P8 surprise that T^BE is symmetric).
    Derived by hand (PROOF_BE_cubic.md): T^BE_ijk = (1/2)[H_ij H_ik/s_i + H_ij H_jk/s_j + H_ik H_jk/s_k] for distinct
    i, j, k (two-step chains through a middle vertex; >= 0 whenever the couplings are >= 0);
    T_iik = H_ii H_ik/s_i + H_ik^2/(2 s_k) - (HDH)_ik/(4 a_i);  T_iii = (3/2) H_ii^2/s_i - (3/4)(HDH)_ii/a_i + s_i/(4 a_i^2).
    Predictions: (i) these formulas reproduce the numerically built T^BE to 1e-12 and T^BE.a = H to 1e-12;
    (ii) for the pure resampling chain (H = rank one + nothing, K = projection on constants, m sites, uniform)
    rho_BE = 1/2 + O(1/m)  (so Bakry-Emery is lossy by a factor 2 at mean field, structurally);
    (iii) for zeta at L = 1 the Bakry-Emery constant tends to 1/2 from above as n grows: rho_BE(n = 48) in [0.49, 0.53];
    control (Beurling, L = 1, n = 48): rho_BE within 0.02 of zeta's (curvature does not see the failure; the gap does:
    second eigenvalue of -L below 1 for Beurling, above 1 for zeta).

P10 (22:59 UTC, before computing).  Family of symmetric local cubics (derivation in PROOF_BE_cubic.md, section 3):
    Theta_t = t (sigma_1 - sigma_2) + (1/2 - t) sigma_11 + (3t - 1/2) sigma_111,  sigma's = symmetrised pointwise products
    [K^a g, K^b f, K^c h]_pi.  Every member contracts to H; every member equals the unique certificate when K is the
    resampling chain (Bakry-Emery is NOT in this family: it is lossy by a factor 2 there).
    Prediction: for zeta, L = 1, n = 12, NO t in [-1, 2] makes all slices Lorentzian (some slice has 2 positive
    eigenvalues for every t), but the best t has worst violation min_k lambda_min(P_k) >= -0.1, ten times better than
    Bakry-Emery's -1.03.  Control (Beurling, L = 1, n = 12, form NOT positive): no t works either (forced by Lemma B).
    If some t works for zeta: that Theta_t is a formula-defined, non-cone certificate - the object the seat was asked for.

P11 (23:00 UTC, before computing).  SDP over ALL symmetrised pointwise-product cubics [K^a g, K^b f, K^c h], a,b,c <= d
    (10 tensors for d = 2, 20 for d = 3, 35 for d = 4), coefficients free, T.a = H imposed for the given chain.
    tau*(d) := min tau with P_k + tau I >= 0 for all k (tau* = 0 iff a certificate of "chain-degree" d exists).
    Prediction for zeta L = 1, n = 12: tau*(2) in [0.005, 0.05] (no certificate), tau*(3) > 0 but at least 3 times
    smaller than tau*(2), tau*(4) > 0.  Control Beurling L = 1 n = 12 (form not positive): tau* > 0 at every d (forced).

P12 (23:02 UTC, before computing; follows the P11 surprise).  Is "a chain-degree-2 certificate exists" special to the
    Weil form or a general fact about Lorentzian matrices with non-negative off-diagonal?  Test: random H = c v v^T - B
    (v > 0, B positive semidefinite, entries arranged so that off-diagonal >= 0, exactly one positive eigenvalue),
    m = 8 and 12, a = Perron vector, 6 instances each.  Prediction: degree-2 certificates exist for ALL of them
    (the phenomenon is general linear algebra, not arithmetic); degree 1 fails for most.  If degree 2 fails for
    random H but works for zeta: the Weil form has a special second-order structure and that would be the lead.

## 3. Results (all COMPUTED in double precision unless marked; scripts *.py.txt in this folder, logs *.log)

Run as `python3 /home/user/ysolucki/tools/memcap.py 3 python3 <script> <arg>`; each takes 1 s to 2 min.

Validation of the box builder (`validate.py.txt 0.8`): the kernel formulas (pole, arch with w, prime atoms) against lane A's
Fourier matrix on a smooth function: N(f) = 1.558525793986 both routes (difference < 1e-12), pole 1.574044060767 both.
Box assembly: cell averages of the same f, x^T N x -> Fourier value with error -7.7e-2, -3.9e-2, -1.3e-2, -4.0e-3 at
n = 8, 16, 32, 64 (falls with n; the function has jumps at the window ends, so first-order convergence is expected).
NOT done: an exact same-function check of the box assembly (the direct quadrature version was too slow and was killed).
All off-diagonal entries of N in the box basis are > 0 (min 5.3e-2 .. 2.1e-1 in the cases run).

| # | prediction | outcome |
|---|---|---|
| P1a | zeta: Ntilde has one positive eigenvalue, L = 0.3 .. 1.0, n = 12, 14 | HIT (7 of 7). eig2 at L = 1, n = 12: -1.8e-3 (predicted [-0.3, -1e-3]: HIT, at the edge) |
| P1b | Beurling 2 -> 2.1 NOT detected at L = 0.5 with 14 boxes, detected at L = 1 | MISS at L = 0.5: detected (2 positive eigenvalues; lowest Weil eigenvalue -3.0e-3 at n = 12, -1.4e-2 at n = 14). Reason: the Beurling negativity at L = 0.5 is a low-frequency effect of size 1e-2, not small. HIT at L = 1 (2 to 3 positive eigenvalues). Not detected at L = 0.4, n = 12 (e10 found it from L = 0.38 in a 61-function Fourier basis: box resolution). |
| P2 | cone certificate: slices Lorentzian; 50-95% of distinct box triples negative | slices: HIT (14 of 14, twice). Sign: MISS at n = 12 (0% negative), but that was a coarse-grid accident: see P7. |
| P3 | certificate with T >= 0 on distinct triples exists (SDP) for zeta; also for a positive-window control; none where Ntilde is not Lorentzian | HIT. zeta L = 0.5, 1.0, n = 8, 10: feasible with margin t* = 0.65 .. 0.79 (in units l_i l_j l_k / s^2). Beurling on windows where its box form is positive (L = 0.3, 0.5, n = 8): feasible, t* = 1.30, 0.78 (zeta at L = 0.5: 0.79). Beurling L = 1: infeasible. "All entries except T_iii >= 0": NOT possible for anyone (t* = -0.44 .. -6.6): MISS on the stronger form. |
| P4 | product cubic <f^2, N f>: slices far from Lorentzian | HIT: 11 positive eigenvalues of 12. Killed (R2-cubic/#5). |
| P5 | locality radius R* >= 2 boxes at n = 8; same for the control | HIT in direction, stronger than predicted: R* = n - 1 in every case (zeta L = 0.5, 1.0 n = 8; zeta L = 1 n = 12; Beurling L = 0.5): forbidding only the most spread-out triples (0, j, n-1) already kills every certificate. Slack version, two solvers (CLARABEL, SCS), n = 2, 3, 4, 6, 8: full support tau = 0, R = n - 2 infeasible by 5.8, 3.2, 2.3, 1.4, 0.82. Proved only for R = 0 at a critical window (Lemma E). |
| P6 | rigidity: slices annihilate the null vector after making the form singular (< 1e-4) | HIT within solver accuracy: max_k |T_k vt| = 1.07e-4 (|T_k| about 2), max_k |vt^T T_k vt| = 9.5e-9. Identity (D3) on the unmodified form: 1.321e-2 = 1.321e-2. |
| P7 | rho(L=1) in [1.0, 1.3], crossing 1 between L = 1.2 and 2 | n = 12: 1.0005 (HIT) but NOT converged: n = 24 gives 0.98 (L = 0.5), 0.61 (0.75), 0.45 (1.0), 0.43 (1.25), 0.42 (1.5). So in the continuum the cone certificate is negative on spread-out triples at every L tried; the n = 12 sign was produced by prime atoms smeared over wide boxes. |
| P8 | Bakry-Emery pieces sum to G; not PSD; T^BE NOT symmetric | (i) HIT 1e-15. (ii) HIT: rho_BE = 0.65 (L = 0.5), 0.59, 0.53 (L = 1, n = 12, 24); 0 of 14 sites PSD. (iii) MISS, and the miss is the main finding of the seat: T^BE IS a symmetric tensor (defect 7e-16). Proved afterwards: PROOF_BE_cubic.md Theorem F. |
| P9 | closed formula for T^BE; rho_BE = 1/2 + O(1/m) for the resampling chain; zeta rho_BE(n = 48) in [0.49, 0.53]; Beurling within 0.02 | (i) HIT 4e-15, also for a non-Perron a. (ii) HIT: 1/2 + 1/m exactly. (iii) MISS by 0.008: 0.4816 (still falling with n; the log-divergent self-energy pushes it below the mean-field value 1/2; limit unknown). Control HIT: Beurling 0.4825; its gap is 0.928 against zeta's 1.00005. |
| P10 | mean-field-exact family Theta_t: no t works for zeta; worst violation >= -0.1 | HIT: best t = 0.05, -0.047 (n = 12), -0.052 (n = 24), -0.032 (L = 0.5). Resampling chain: exact for every t (as proved). Beurling: -0.048, indistinguishable. |
| P11 | polynomial cubics of chain-degree d: tau*(2) in [0.005, 0.05] | MISS: tau*(2) = 0: a degree-2 certificate exists (details in PROOF_BE_cubic.md section 4). d = 1 fails (0.014 .. 0.073). d = 3, 4: solver failures (ill-conditioned powers of K), no statement. |
| P12 | degree-2 certificates exist for random Lorentzian Metzler matrices; degree 1 fails for most | first part HIT (12 of 12); second part MISS (degree 1 works for 11 of 12; fails only for the smallest margin). |

Controls not run: the Davenport-Heilbronn impostor and the theta-dial at n = 1.4. Reason: both have negative off-diagonal
couplings, so Lemma B's Perron step does not apply to them at all (PROVED where the sign is used: step 5 only), and by
Lemma C a tensor with Lorentzian slices exists for them exactly when their form is positive on the window; nothing
would be learned from the SDP. The dial also needs its own Gamma factor and pole, which the box builder does not have.

## 4. What this seat concludes

1. PROVED (PROOF_trickle.md A): the right object is the fibre-extended matrix Ntilde; "one positive eigenvalue of
   Ntilde" is the full Weil positivity on the window (both parity blocks), with all off-diagonal entries >= 0.
2. PROVED (B, C): the bare cubic certificate of idea #10 exists if and only if the conclusion holds. As a target it is
   a reformulation. This also answers the brief's question about a control whose form is still non-negative on the
   window: it has a certificate too, even with T >= 0 on distinct triples (COMPUTED, margins 0.78 against 0.79).
   Idea #10's kill line "a certificate also exists for a Beurling system" must be re-read: existence can never
   discriminate; only a FORMULA for T valid on all windows could.
3. PROVED (D, E): two necessary conditions any formula must meet: (i) every slice vanishes on the near-null ladder of
   the Weil form to accuracy mu(L); (ii) at a critical window every coupled pair of scales needs a third scale.
   COMPUTED: certificates are maximally non-local in scale (R* = n - 1).
4. PROVED (F): the canonical local cubic made of two-step chains (prime-prime, prime-Gamma, Gamma-Gamma pairs hanging
   from one scale) is the Bakry-Emery form; its slice condition is CD(1, infinity). So idea #10 (cubic certificate) and
   idea #11 (curvature) are one mechanism, and the canonical member FAILS by a structural factor 2 (exactly 1/2 + 1/m
   on the mean-field model; 0.48 .. 0.65 for zeta). The Beurling control has the same curvature as zeta.
5. COMPUTED: lossless local cubics exist one order up (products with K^2: three-step chains), for zeta and equally
   for any Lorentzian matrix with margin. No formula for the coefficients; they are found by SDP per window.

WALL (exact statement). Find coefficients c_abc(L), given by a rule that does not use the spectrum of the window form,
such that T = sum c_abc sym[K^a g, K^b f, K^c h] has Lorentzian slices for the Weil chain on [-L, L] for all L. By (D4)
the rule must make every slice vanish on the prolate ladder to accuracy mu(L) ~ exp(-4 pi e^{2L}); by section 4 of
PROOF_BE_cubic.md the degree needed is expected to grow as the margin closes. Nothing in the present work says such
a rule exists; the 10-parameter SDP solutions at d = 2 are not unique and I did not find a pattern in them.

What the wall suggests next. (a) Bakry-Emery with a dimension term, CD(rho, n): on the resampling chain the plain
criterion loses exactly a factor 2; the dimension-corrected one may be exact there, and then the question becomes
whether the Weil chain has "dimension" matched to it. Not tried. (b) Compute d*(margin) on a family of matrices whose
margin is dialled to zero, to test the conjecture that the chain-degree grows; if instead d* stays 2, look for the
formula of the d = 2 certificate on the simplest exactly solvable ferromagnet. (c) The slice at a fibre node is a
quadratic form of the same kind one window "lower" only in the function-field picture (surface inside a threefold);
here it was not identified.

## 5. Literature (owner rule 5): four web searches, result lists and snippets only, no paper read in full
1. "Bakry-Emery curvature trickle-down theorem Garland's method Bochner Lorentzian polynomials cubic form Gamma_2
   high dimensional expanders": found Oppenheim's trickle-down, Kaufman-Tessler (Garland for posets, arXiv 2101.12621),
   "Trickle-Down in Localization Schemes" (arXiv 2407.16104). Nothing linking Bakry-Emery Gamma_2 to a symmetric cubic
   or to Lorentzian slices in the snippets.
2. "Braenden Leake Lorentzian polynomials on cones negative coefficients Hodge-Riemann": arXiv 2304.13203 exists
   (C-Lorentzian polynomials on an open convex cone; captures Hodge-Riemann relations of degree 0 and 1). This is the
   literature's treatment of negative self-intersections. Not read; how it relates to Lemma B is unchecked.
3. "Weil explicit formula positivity Lorentzian OR trickle-down OR Bakry-Emery ... Hodge index fibre classes": only
   the classical statements (Weil positivity; function-field case via the Hodge index theorem; Connes-Consani
   archimedean place). Nothing with Lorentzian / trickle-down / Bakry-Emery.
4. "Bakry-Emery curvature Markov chain equivalent Lorentzian OR trickle-down Hessian cubic one positive eigenvalue":
   general Bakry-Emery literature for graphs and Markov chains only.
Status: Lemma A is Weil's Hodge-index picture (KNOWN, classical). Lemma B is the standard trickle-down argument with
the sign hypothesis reduced to what is used (probably folklore; not found stated). Lemmas C, D, E and Theorem F:
NOT FOUND in four searches; NOT established as new. "Garland's method is a Bochner argument" is folklore (from memory),
so Theorem F may well be known to people in that area in some form.

Correction to "what the wall suggests next (a)", 23:03 UTC, PROVED by a two-line computation: on the resampling chain,
for <f> = 0, Gamma_2 - rho Gamma - (1/n)(Lf)^2 = (3/4 - rho/2)<f^2> + (1/4 - rho/2 - 1/n) f_k^2, so CD(rho, n) needs
rho <= 1/2 - 2/n (up to O(1/m)), and the Lichnerowicz bound rho n/(n-1) = (n - 4)/(2(n - 1)) < 1/2 for every n.
The dimension term makes it worse. Suggestion (a) is dead; (b) and (c) stand.
