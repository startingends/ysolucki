# Connes, Consani, Moscovici: Zeta zeros and prolate wave operators

Reader: R-read-1, 2026-11-11. This note reports what the paper contains. It recommends nothing.

## 1. Reference and how much was read
- A. Connes, C. Consani, H. Moscovici, "Zeta zeros and prolate wave operators", arXiv 2310.18423 v2
  (4 May 2024; v1 27 Oct 2023), 30 pages. Published as "Zeta zeros and prolate wave operators: semilocal
  adelic operators", Ann. Funct. Anal. 15 (2024), no. 4, Paper No. 87 (reference taken from the bibliography
  of arXiv 2511.23257; the published text was not compared).
- Source: TeX, `rh/library/src/2310.18423/mainc2m24fine.tex` (1474 lines, 99 875 bytes).
- Read: **all of it**, lines 159 to 1475 (`\begin{document}` to `\end{document}`): abstract, sections 1 to 5,
  bibliography. The source contains two passages switched off with `\iffalse` (a French abstract and a
  paragraph on Burnol's structure functions for de Branges spaces, lines 1074 to 1098); both were read and
  are not part of the paper. There are no figures.
- Theorem numbers below are those of the arXiv PDF (v2), obtained with `pdftotext`: propositions have their
  own counter, separate from theorems, definitions, lemmas, corollaries and remarks.

Notation: S (blackboard) = -i(x d/dx + 1/2), the self-adjoint generator of scaling on L^2(R)^ev;
h_n the normalised Hermite functions for exp(-pi x^2); W_lambda the prolate operator
(W_lambda psi)(q) = -d((lambda^2 - q^2) d psi) + (2 pi lambda q)^2 psi; L_v the local Euler factors,
L_infty(z) = pi^(-z/2) Gamma(z/2), L_p(z) = (1 - p^(-z))^(-1).

## 2. What it proves
All statements are unconditional. None is a statement about the location of zeros or about positivity of the
Weil form. Several objects are explicitly "formal" (no domain, no self-adjointness).

- **Theorem 2.1.** A cyclic pair (D, xi) (D self-adjoint, xi a cyclic unit vector in all domains of D^n) is
  unitarily equivalent to multiplication by s on L^2(R, d mu) with xi -> 1; the spectral measure is a complete
  invariant. **Definition 2.2**: "The formal prolate operator omega(D, xi, lambda) is the operator
  -D^2 + lambda^2 N", N the number operator of the orthogonal polynomials of mu. ("This definition is formal
  inasmuch as it does not give precisely the domain of the operator.")
- **Propositions 2.1 to 2.4.** The pair is even iff mu is symmetric, and then the grading is exp(i pi N)
  (2.1); (c_0(N), H, D) is a spectral triple (2.2) whose spectral distance on N is equivalent to
  |phi(n) - phi(m)|, phi(n) = sum_{j <= n} 1/a_j, a_j the Jacobi coefficients (2.3); Jacobi matrices J^+-
  of the formal prolate operator on the even and odd parts (2.4).
- **Theorem 3.1** (archimedean case; the "Hardy-Titchmarsh transform" V = M o U). With
  U(f)(s) = pi^(-1/2) int_0^inf f(v) v^(1/2 - is) d*v: (i) U(h_0) = 2^(-3/4) pi^(-1/2) L_infty(1/2 - is);
  (ii) U(h_{2n}) = (-1)^n P_n(s) U(h_0) with P_n orthonormal polynomials for the probability measure
  dm(s) = (2 pi)^(-3/2) |Gamma(1/4 + is/2)|^2 ds; (iv) V carries h_{2n} to (-1)^n P_n and S to multiplication
  by s; (v) "V o W_lambda o V* = -s^2 + 2 pi lambda^2 (4N + 1) - 1/4". So the classical prolate operator is
  the formal prolate operator of the pair (S, h_0), up to constants.
- **Propositions 3.1 to 3.5.** The grading of (S, h_0) is the Fourier transform (3.1);
  N = H/(8 pi) - 1/4 with H = -d^2 + (2 pi q)^2 (3.2); explicit P_m and the Jacobi matrix of s:
  zero diagonal, off-diagonal (i/2) sqrt((2n+1)(2n+2)) (3.3); the spectral metric is equivalent to the
  metric of log on N* (3.4); Jacobi coefficients of W_lambda on the Fourier-even part:
  a_n = (1/4)((4n+1)(4n+2)(4n+3)(4n+4))^(1/2), b_n = -8n^2 - 2n - 3/4 + 2 pi lambda^2 (8n+1); on the
  Fourier-odd part a_n = (1/4)((4n+3)(4n+4)(4n+5)(4n+6))^(1/2), b_n = -8n^2 - 10n - 15/4 + 2 pi lambda^2 (8n+5)
  (3.5).
- **Lemma 3.3, Proposition 3.6** (link with E and zeta). For psi^+_l = h_{4l} - (h_{4l}(0)/h_0(0)) h_0 and
  psi^-_l = -h_{4l+2} + (h_{4l+2}(0)/h_2(0)) h_2 (the Hermite combinations with f(0) = fhat(0) = 0), and
  E(f)(u) = u^(1/2) sum_n f(nu): "F_mu(E(psi^+-_l))(s) = R^+-_l(s) Xi(s)" with explicit polynomials R^+-_l
  built from the P_m; and the spectrum of multiplication by s on the quotient of the ring of entire functions
  of order <= 1 by the closure of the span of these functions is the set of s with 1/2 + is a non-trivial zero.
  (Proof: "as in [Connes-Marcolli, Proposition 2.24]".) This is a statement about all zeros, as complex
  numbers; it does not locate them.
- **Proposition 4.1 (= Theorem 1 (i) to (ii) of the introduction).** For a finite set of places S containing
  infinity and f in L^2(R)^ev, with E_S(f)(u) = u^(1/2) sum over the positive integers gamma whose prime
  factors lie in S of f(gamma u): F_mu(E_S(f))(s) = (prod_{p in S, p finite} L_p(1/2 - is)) (F_mu w_infty f)(s);
  eta_S respects the support cutoffs P_lambda and intertwines the Fourier transforms.
- **Proposition 4.2 (= Theorem 1 (iii), (iv)).** On L^2(X_S)^{K_S} (X_S the semilocal adele class space) the
  pair (S, xi_S), xi_S = class of 1_{R_S} (x) h_0, is an even cyclic pair with canonical form L^2(R, dm_S),
  "dm_S(s) := |prod_{v in S} L_v(1/2 - is)|^2 ds", and grading the semilocal Fourier transform.
  **Proposition 4.3**: the identity map L^2(dm) -> L^2(dm_S) is bounded with bounded inverse.
- **Theorem 4.1.** The "semilocal Hermite operator" N_S (number operator of (S, xi_S)) has eigenfunctions
  eta_S(P^S_n(x) exp(-pi x^2)) with polynomials P^S_n "obtained by orthonormalization and induction"; the
  matrix of S in that basis is a Hermitian Jacobi matrix. Then: "we have reached a candidate ... for the
  prolate operator ...: W_{lambda,S} = (H + 1/2)^2 + lambda^2 N_S". **Remark 4.2**: N_S o eta_S differs from
  eta_S o N_infty unless S = {infty}; a second guess (|x|_S^2 plus its Fourier conjugate) is mentioned.
- **Definition 4.4, Proposition 4.5.** Sonin space S_lambda(K, alpha) of a local field (f and its Fourier
  transform vanish on |x| < lambda). For K = Q_p the Z_p^*-invariant part of S_1(Q_p, e_p) is one-dimensional,
  spanned by sigma_p = eps_0 - (1/p) eps_1, and sigma_p is its own Fourier transform.
- **Proposition 4.6, 4.7, Theorem 4.6 (= Theorem 2 of the introduction).** theta_S(f) := class of
  sigma_S (x) f satisfies F_mu(w_S(theta_S f))(s) = F_mu(w_infty f)(s) prod_{p in S}(1 - p^(-1/2 - is));
  <theta_S f | eta_S g> = <f | g>; and "the map theta_S is a hilbertian isomorphism of the Sonin spaces
  theta_S: S_lambda(R, e_infty) -> S_lambda(X_S, alpha)" for every lambda > 0 ("hilbertian" = isomorphism
  of topological vector spaces, not isometric).
- **Proposition 4.8.** Through the dual transform upsilon_S (multiplication by prod_{v in S} L_v(1/2 + is)
  after Mellin) every semilocal Sonin space is identified with one space B_lambda of entire functions (de
  Branges' Sonine space); S only changes the norm, to that of L^2(R, ds/|E_S(s)|^2),
  E_S(s) = prod_{v in S} L_v(1/2 + is), and each such norm makes it a de Branges space.
- **Proposition 5.1.** Formally W_lambda = varpi(h^2 + 4 pi lambda^2 k - 1/4), varpi the metaplectic
  representation of sl(2, R).
- **Lemma 5.1, Theorem 5.2.** For a symmetric measure with Jacobi coefficients a_n, the operators A (mult.
  by s) and N generate a representation of sl(2, R) with sigma(h) = -iA, sigma(k) = N + c iff c = 1/4 and
  a_n = (1/2) sqrt((2n+1)(2n+2)); the moment problem is then determinate, the measure is proportional to
  |Gamma(1/4 + is/2)|^2 ds, and the representation is the even part of the metaplectic one.
- **Proposition 5.2.** The moments of dm satisfy sum c_n (ix)^n/n! = sqrt(2/(e^x + e^(-x)))
  (c_2 = 1/2, c_4 = 7/4, c_6 = 139/8, ...; numerators OEIS A126156).

Stated in the introduction as known, without proof: there is "a property P(n), involving only the Euler
factors for primes smaller than n, and whose validity for all n is equivalent to RH", namely positivity of
the Weil form Q_n on test functions supported in [1/n, n]; and (from Connes-Moscovici, PNAS 2022) that the
negative eigenvalues of the prolate operator extended to the whole line reproduce the "ultraviolet"
behaviour of the zeros and that its negative eigenspace is, "up to a finite dimensional possible
discrepancy", the Sonin space.

## 3. Method in ten lines
1. Abstract a pair (self-adjoint D, cyclic vector xi); the spectral theorem turns it into orthogonal
   polynomials for the spectral measure, with number operator N.
2. Observe the identity W_lambda = -S^2 + lambda^2 H - 1/4 (H the harmonic oscillator), so the prolate
   operator is "-D^2 + lambda^2 N" for D = scaling, xi = Gaussian.
3. Compute the spectral measure of (scaling, Gaussian): Mellin transform of the Gaussian is the archimedean
   Euler factor, so the measure is |L_infty(1/2 - is)|^2 ds; the Gamma functional equation turns Hermite
   functions into polynomials times that factor.
4. Read off Jacobi matrices (tridiagonal forms) of S, S^2 and W_lambda.
5. Apply E to Hermite combinations vanishing at 0 with their transforms: get explicit polynomial multiples of
   Xi; this is the lambda -> infinity shadow of the prolate construction of 2106.01715.
6. Semilocal step: replace the Gaussian by (characteristic function of the integers of the finite places)
   (x) Gaussian on the semilocal adele class space; the map E_S is exactly the identification with functions
   on idele classes, and it multiplies Mellin transforms by the finite Euler factors.
7. Hence the semilocal cyclic pair has spectral measure |prod_{v in S} L_v(1/2 - is)|^2 ds, comparable to the
   archimedean one because each finite Euler factor is bounded above and below on the critical line.
8. Define the semilocal number operator, and hence a candidate semilocal prolate operator, by the same recipe.
9. Dual side: the p-adic Sonin vector sigma_p has Mellin factor (1 - p^(-1/2 - is)), the inverse Euler
   factor; pairing eta_S with theta_S is the L^2(R) pairing, which gives the stability of Sonin spaces.
10. Independent characterisation: the Lie-algebra relations of sl(2, R) force the Jacobi coefficients of the
   archimedean case. The work is in steps 3, 6, 9; steps 2 and 8 are definitions.

## 4. Where it stops
- The semilocal prolate operator is only a candidate, defined formally: "Ignoring the delicate domain
  definition needed to obtain a selfadjoint operator"; "finding the relevant selfadjoint extension is
  delicate". No self-adjoint extension, no spectrum, no eigenfunction, no relation between its spectrum and
  the zeros, and no relation to the Weil quadratic form is proved for any S other than {infinity}.
- "The computation of the coefficients of the hermitian Jacobi matrix of the cyclic pair for a general S ...
  is deferred to a forthcoming paper." For S != {infinity} the polynomials P^S_n are not computed.
- A "second potential candidate for the semilocal prolate operator", from the Weil representation of the
  metaplectic cover of SL_2(A_S), is announced for "a forthcoming paper"; section 5 treats the real place only.
- What the authors say they are after and do not have: "the tantalizing program of finding the semilocal
  analogue of the prolate operator"; "We expect that the use of such operator-theoretic tools in the semilocal
  case opens a way to handle Weil's positivity"; the Sonin space "should, when suitably equiped with a prolate
  type operator, play the role of the sought for Weil cohomology". The stated strategy for semilocal Weil
  positivity is "comparing the trace functional associated to the operator - which is automatically positive
  for a selfadjoint operator - with the Weil functional"; it is not carried out.
- The exact point where the proofs end: (a) the spectral measure of the semilocal pair (Proposition 4.2) and
  (b) the isomorphism of Sonin spaces (Theorem 4.6). Both are statements about finitely many Euler factors on
  the critical line, where each factor is bounded and invertible; nothing in the paper is uniform in S or
  passes to a limit over S, and the window parameter lambda is not tied to S.
- Proposition 3.6 gives the zeros as a spectrum on a quotient by multiples of Xi; like Theorem 6.4 of
  2106.01715 it is a spectral realisation, with no constraint on location.

## 5. What it changes in our record
- **Library README**, reason for listing ("semilocal operators"): accurate. The paper contains the semilocal
  cyclic pair and Sonin spaces, and a formal candidate operator; no result on zeros or positivity.
- **KNOWLEDGE section 2**: "Weil positivity ... at the archimedean place via the prolate operator
  (Connes-Consani 2021; Connes-Consani-Moscovici 2022)". This paper (2023; published 2024) contains no
  positivity theorem. It attributes archimedean positivity to Connes-Consani ("The Scaling Hamiltonian" and
  arXiv 2006.13771) and the prolate-spectrum observation to Connes-Moscovici, PNAS 119 (2022), which it
  describes as a match between the negative prolate spectrum and the ultraviolet behaviour of the zeros, not
  as a positivity result. So the second citation in that line does not support the statement it is attached
  to. (Connes-Moscovici 2022 itself was not read by this seat.)
- **THEORY T1**: the introduction restates the window criterion as "a property P(n), involving only the Euler
  factors for primes smaller than n, and whose validity for all n is equivalent to RH". Same statement as T1.
- **r1_A PROGRESS, the truncated completed zeta** Lambda_X(s) = pi^(-s/2) Gamma(s/2) exp(sum_{n <= X}
  Lambda(n) n^(-s)/log n) in the "structural identity": the paper has a neighbouring but different object,
  prod_{v in S} L_v(1/2 - is) with the FULL Euler factors of the primes in S, as the square root of the
  spectral density dm_S (Proposition 4.2). Ours truncates at prime powers n <= e^(2L); theirs keeps all powers
  of finitely many primes. The paper does not connect dm_S to the window form or to any Loewner/Pick matrix.
- **r1_A PROGRESS "Why n = 4, 8, ... (HEURISTIC)"**: section 3.6 of this paper is the Hermite (lambda ->
  infinity) version of the same construction: combinations psi^+_l of h_{4l} with h_0 and psi^-_l of
  h_{4l+2} with h_2, chosen so that f(0) = fhat(0) = 0, and E of them equal to polynomial multiples of Xi
  (Proposition 3.6). The indices 4l and 4l+2 and the removal of one function per parity are the same
  bookkeeping as in our paragraph. The paper also summarises 2106.01715 in one sentence that matches the
  reading in `connes-consani-zeta-cycles.md`: the Weil eigenfunctions "are reconstructed ... by Gram-Schmidt
  orthogonalization of E(phi_n)" and were used "to condition the scaling operator with periodic boundary
  conditions".
- **r1_A prolate.py** (1 - chi_n from the Legendre/Bouwkamp expansion): Proposition 3.5 gives a different
  exact tridiagonal form of the same operator W_lambda, in the Hermite basis, split by Fourier parity. It
  concerns the differential operator's eigenvalues, not the concentration eigenvalues chi_n.
- **IDEAS #20**, "the strategy is that of Connes-Consani-Moscovici, arXiv 2511.22755": that is another paper.
  The present one (2310.18423) contains no gap condition, no Davis-Kahan-type argument and no convergence of
  eigenfunctions to Xi. Its only statement of strategy is the sentence quoted in part 4.
- **NOTEBOOK N19** (Burnol, Sonine spaces, from memory): the paper cites Burnol's two C. R. notes (2001, 2002)
  and his 2004 Bordeaux paper for the dual transform and the de Branges realisation of Sonine spaces
  ("In the case of the single archimedan place this transform was introduced by J-F. Burnol in connection with
  the work of L. de Branges"). A paragraph on Burnol's structure function for these spaces is present in the
  source but switched off. Nothing about Painleve functions or a differential equation in lambda.
- **KNOWLEDGE barrier B9** names the arithmetic site and scaling site as candidates for the missing geometry;
  this paper adds the authors' own phrase that the semilocal Sonin space "should ... play the role of the
  sought for Weil cohomology" (an expectation, no theorem).
- **IDEAS #21** (killed; places as a spectrum): unrelated in mechanism. The only overlap is the appearance of
  the finite Euler factors as multipliers: eta_S multiplies by prod L_p(1/2 - is), theta_S by its inverse
  conjugate (Propositions 4.1, 4.6).
- **Not in our record, contained here**: Theorem 3.1(v) (prolate operator = -S^2 + 2 pi lambda^2 (4N+1) - 1/4
  in the picture where S is multiplication by s on L^2(|Gamma(1/4 + is/2)|^2 ds)); Proposition 4.5 (the
  p-adic Sonin space is one-dimensional on spherical vectors); Theorem 4.6 (Sonin spaces do not change, as
  topological vector spaces, when places are added); Theorem 5.2 (sl(2) rigidity of the archimedean measure).
- **ATLAS, THEORY T2 to T6**: untouched.

## 6. Reliability
- Published in Annals of Functional Analysis (refereed). This note is from arXiv v2.
- Proofs are short and mostly computational; the semilocal propositions are proved "for simplicity" for
  S = {p, infinity} and asserted in general. Read line by line, not re-derived.
- The paper repeatedly marks its central objects as formal. Statements (v) of Theorem 3.1, Proposition 5.1
  and the candidate W_{lambda,S} are identities of formal differential or matrix expressions; no operator
  domains are specified.
- Small slips noticed: in the proof of Proposition 4.2 "U_S(h_S)" for "U_S(xi_S)"; Theorem 4.1's proof of
  item 2 uses "(ii)" for item 2 in Remark 4.2; the reference "J. Operator Theory 851" should be volume 85,
  no. 1. Harmless.
- Proposition 3.6 is proved by reference to Connes-Marcolli's book (Proposition 2.24), which was not read.
