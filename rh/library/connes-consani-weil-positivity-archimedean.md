# Connes, Consani: Weil positivity and trace formula, the archimedean place

Reader: R-read-1, 2026-11-11. This note reports what the paper contains. It recommends nothing.

## 1. Reference and how much was read
- A. Connes, C. Consani, "Weil positivity and Trace formula, the archimedean place", arXiv 2006.13771 v1
  (24 Jun 2020), 57 pages, 17 figures. Identifier found through the arXiv API (search au:Connes,
  ti:"Weil positivity"). Published as Selecta Math. (N.S.) 27 (2021), no. 4, Paper No. 77 (reference taken
  from the bibliography of arXiv 2511.23257; the published text was not compared with v1).
- Source: TeX, `rh/library/src/2006.13771/weil-compo.tex` (2496 lines, 198 369 bytes).
- Read: **all of it**, lines 67 to 2431 (`\begin{document}` to `\end{document}`): abstract, introduction,
  sections 1 to 6, appendices A to F, bibliography; also the table of angles left after `\end{document}`
  (lines 2433 to 2496, not part of the paper). Figures not opened; captions read. The two data files linked
  from the paper (Dropbox: 1732 angles alpha_j and coefficients d(j)) were not downloaded.
- Theorem numbers below are computed from the source: Theorem 1, Corollary 2, Theorem 3 in the introduction,
  then one shared counter per section. They agree with the arXiv PDF (checked with `pdftotext`); not checked
  against the numbering of the journal version.

Conventions: multiplicative variable rho in R_+^*; fhat(s) = int f(u) u^(-is) d*u; f*(u) = conj f(1/u);
W_infty := -W_R (the archimedean term with the sign that makes it the positive candidate);
theta = Riemann-Siegel angle; W_infty(f) = int fhat(t) (2 theta'(t)/2 pi) dt. The test functions g live on
[2^(-1/2), 2^(1/2)], i.e. our half-width L_ours = (1/2) log 2 = 0.3466, mu = e^(2 L_ours) = 2: the largest
window in which NO prime power enters. The pole term of our window form is removed by the condition
ghat(i/2) = 0.

## 2. What it proves
Everything is unconditional. The main theorem (1 = 6.11) is computer-assisted: its proof uses numerical
evaluations that are not interval-certified (see part 6).

- **Statement recalled, attributed to Yoshida (introduction).** "For any smooth, positive definite function f
  with support in the interval (1/2, 2) and whose Fourier transform vanishes at +-i/2 one has:
  W_infty(f) >= 0". "This result was proved in [Yoshida 1992] by reducing it to an explicit computation."
  Equivalently QW(g) := W_infty(g * g*) >= 0 on smooth g supported in [2^(-1/2), 2^(1/2)] with ghat(i/2) = 0.
- **Proposition C.1** (after Yoshida's Proposition 1). For any finite set F containing {0, 1} and disjoint from
  the zeros: RH iff sum_v W_v(g * gbar^#) <= 0 for all g in C_c^infty(R_+^*) with Mellin transform vanishing on
  F. (So extra vanishing conditions at finitely many non-zeros cost nothing.)
- **Theorem 1** (main result). "Let g in C_c^infty(R_+^*) have support in the interval [2^(-1/2), 2^(1/2)] and
  Fourier transform vanishing at i/2 and 0. Then one has W_infty(g * g*) >= Tr(theta(g) S theta(g)*)."
  Here theta(.) is the scaling representation on L^2(R)_ev and S the orthogonal projection on Sonin's space
  S(1,1) = even functions vanishing, together with their Fourier transform, on [-1, 1]. The right side is
  >= 0 by construction.
- **Theorem 6.11** (precise form). Same g but only ghat(-i/2) = 0 required:
  W_infty(g * g*) >= Tr(theta(g) S theta(g)*) - c |ghat(0)|^2 with c = 4 gamma/log 2, gamma ~ 2.94355
  (so c ~ 16.99). **Remark 6.12**: the best constant satisfies 13 < c < 17.
- **Corollary 2.** For such g and Z = 1/2 + iS the zeros: c |ghat(0)|^2 + sum_{s in S} ghat(s) conj ghat(sbar)
  >= Tr(theta(g) S theta(g)*). The authors' gloss: Sonin's trace needs, besides the zeros, an extra
  contribution on the critical line between the first two zeros, "as if one would multiply zeta(z) by
  (z - 1/2)^17".
- **Proposition 1.5** (local trace formula, geometric proof). For f in C_c^infty(R_+^*) the operator
  theta(f) (1/2) u* dbar u is trace class, with trace int f(1/rho) tau(rho) d*rho,
  tau(rho) = (rho^(1/2)/2)(1/(1+rho) + 1/|1-rho|) as a principal value, equal to W_R. The Schwartz-kernel
  computation splits the trace into the unit square Delta (0 <= x, y <= 1) and Sigma (x, y > 1).
- **Definition 2.1, Proposition 2.2 and the formula after it (label `sch18`)** (trace-remainder). delta(rho) := the
  contribution of Delta; delta(rho) = delta(1/rho); for rho >= 1,
  delta(rho) = 2 rho^(1/2) (Si(2 pi (1+rho))/(2 pi (1+rho)) + Si(2 pi (rho-1))/(2 pi (rho-1))). delta > 0, it has
  a corner at rho = 1 (one-sided derivatives -1 and +1), and
  tr(theta(f) P Phat P) = int f(1/rho)(delta(rho) - tau(rho)) d*rho, P = multiplication by 1_{[1, inf)}.
- **Corollary 2.3.** (i) L(f) := W_infty(f) + int f(1/rho) delta(rho) d*rho is a positive functional on the
  whole convolution algebra C_c^infty(R_+^*), **with no support condition**. (ii) Equivalently
  "the function 2 theta'(t) + deltahat(t) is non-negative".
- **Section 3 counterexample.** Without the support condition W_infty is not positive on the ideal
  fhat(+-i/2) = 0: for ghat(t) = (1 + 4t^2) e^(-t^2/4), W_infty(g * g*) ~ -28.8971 (numerical).
- **Lemma 3.3, Proposition 3.5.** The conditions fhat(+-i/2) = 0 define an ideal J = range of
  Q := -(rho d/drho)^2 + 1/4 on functions with the same support; a functional phi is positive on
  C_c^infty(I) cap J iff phi o Q is positive on C_c^infty(I).
- **Theorem 3.6.** For a bounded symmetric interval I there is a compact (Hilbert-Schmidt) operator K_I on
  L^2(sqrt I, d*rho) with D o Q(xi * xi*) = <xi | (-2 Id + K_I) xi>, D(f) := int f(1/rho) delta(rho) d*rho. So
  D o Q is negative on a subspace of finite codimension, and W_infty is positive there.
- **Corollary 3.8, Remark 3.9.** Elementary positivity: D o Q <= 0 on C_c^infty([1/u, u]) for u = 1.10246,
  improved to u = 1.15077 with a Boas-Kac bound (both "verified numerically"). And (3.9 ii) D o Q is NOT
  negative on [1/2, 2] (explicit family, limit value ~ 2.98699).
- **Lemma 4.1, Proposition 4.5.** delta(rho) = tr(theta(1/rho) Phat_1 P_1) for rho >= 1, with P_1, Phat_1 the
  cutoff projections |x| <= 1 and |p| <= 1 (Lambda = 1). In terms of the even prolate functions
  PS_{2n,0}(2 pi, x) with truncated-Fourier eigenvalues lambda(n) (0.999971, -0.979485, 0.524086, -0.0589766,
  0.00273233, ...): delta(1) = sum lambda(n)^2 = 2(Si(4 pi)/(4 pi) + 1) ~ 2.2375 and
  sum lambda(n)^2 xi_n(1)^2 = 2 (Remark 4.6).
- **Theorem 4.7 (= Theorem 3).** "The functional tr(theta(f) S) is positive and one has
  tr(theta(f) S) = W_infty(f) + int f(rho) epsilon(rho) d*rho, for all f in C_c^infty(R_+^*)", with
  epsilon(rho) = epsilon(1/rho) and, for rho >= 1,
  epsilon(rho) = sum_n (lambda(n)/sqrt(1 - lambda(n)^2)) <xi_n | theta(1/rho) zeta_n>, xi_n the normalised prolate
  functions on [-1, 1] and zeta_n the normalised parts of their Fourier transforms outside [-1, 1].
  **No support condition.** This is an exact formula: archimedean Weil functional = Sonin trace minus an
  explicit prolate functional.
- **Proposition 5.3, Lemma 5.4, Proposition 5.5.** Formula for Q epsilon as a series over prolate functions;
  epsilon'(1+) = sum lambda(n)^2 xi_n(1)^2/(1 - lambda(n)^2) ~ 22.9965; for an interval I of length <= log 2 the
  form E o Q is represented by -2 epsilon'(1+)(Id - K_I) with K_I Hilbert-Schmidt and of zero "diagonal".
- **Lemma F.1.** The first 11 terms of the series for Q epsilon approximate it uniformly on [1, 2] within
  2.366e-12 (rigorous tail bound from Rokhlin-Xiao and Wang).
- **Section 6 (numerical facts used in the proof).** Fact 6.1: an explicit trigonometric sum with 1732
  frequencies approximates Q epsilon(e^x)/(2 epsilon'(1+)) in L^1([0, log 2]) to ~ 0.00122. Lemma 6.4: the
  top eigenvector of the finite-rank model T is the Fourier transform of an explicit canonical product.
  Fact 6.5: its overlap with the constant function is ~ 0.94865. Lemma 6.8: Spec T is inside
  {lambda_max} cup [-2, lambda_2] with lambda_max = 1.05158 and lambda_2 <= 0.772216. Lemma 6.10:
  <xi | N_I xi> <= gamma |<xi_0 | xi>|^2.

## 3. Method in ten lines
1. Write W_R as a trace, (1/2) tr(fhat u* dbar u), with u = e^(2 i theta) the ratio of archimedean local
   factors, and compute it through Schwartz kernels: an integral over the quadrant that splits into the unit
   square Delta and the infinite square Sigma.
2. Sigma alone gives tr(theta(f) P Phat P), manifestly positive on f = g * g*. So
   W_infty = (positive) - D, where D is integration against the explicit function delta (the Delta part).
3. Impose fhat(+-i/2) = 0 by composing with Q = -(rho d/drho)^2 + 1/4. Because delta has a corner at rho = 1,
   Q delta contains -2 (Dirac at 1): D o Q = -2 Id + compact. This is where the support condition enters: the
   compact part is small only on short intervals.
4. That is not enough on [1/2, 2] (Remark 3.9). Refine: delta(rho) = tr(theta(1/rho) Phat_1 P_1), decompose the
   pair of projections (P_1, Phat_1) into its 2-dimensional pieces (prolate functions, c = 2 pi) and move the
   part of delta that lives on those pieces into the positive side.
5. What remains positive is the trace on Sonin's space (where both projections vanish); what remains to
   subtract is epsilon, with a larger corner: Q epsilon = -2 epsilon'(1+)(Dirac - compact kernel).
6. So everything reduces to: is the compact operator K_I on L^2 of an interval of length log 2 below 1?
7. Numerically it has exactly one eigenvalue above 1 (1.05) and the next is 0.69.
8. To prove this, discretise (q -> 1): K_I becomes a Toeplitz matrix; Caratheodory-Fejer gives its canonical
   decomposition through the unimodular roots of the top eigenvector; the roots and weights stabilise as
   q -> 1 and suggest a trigonometric approximation of the kernel, hence a finite-rank model T of K_I.
9. Control ||K_I - T|| by an L^1 norm (computer), the spectrum of T by a 20001-dimensional matrix with an
   explicit truncation error (Lemma 6.8), and the bad eigenvector by its overlap with the constants.
10. One rank-one correction c |ghat(0)|^2 restores positivity (Lemma 6.9). The work is in steps 4, 5 (exact)
   and 8, 9 (numerical).

## 4. Where it stops
- One place only. The abstract: "We explore in great details the simplest case of the single archimedean
  place." The introduction describes the intended continuation, "to implement this fundamental positivity in
  the semi-local framework applied to the finite set of places {infty, 2, 3, ..., p}, and provide a conceptual
  reason for Weil's negativity for functions f fulfilling the support condition Support(f) in (1/p, p)", and
  then: "In this paper we consider the simplest instance of this strategy, namely when the support of the
  test function is contained in the interval (1/2, 2) so that rational primes are not involved." The abstract
  ends: "All the ingredients and tools used above make sense in the general semi-local case, where Weil
  positivity implies RH." No semi-local statement is proved.
- The inequality itself (positivity for support in (1/2, 2)) is Yoshida's; the paper's addition is the lower
  bound by the Sonin trace and the operator-theoretic mechanism. The authors call it "a potential conceptual
  reason for the positivity".
- The exact part of the method ends at Theorem 4.7 and Proposition 5.5: W_infty = (Sonin trace) - E with
  E o Q = -2 epsilon'(1+)(Id - K_I). From there on the sign of Id - K_I is obtained numerically, and it FAILS
  by one eigenvalue (1.05 > 1) on the full interval of length log 2; positivity holds only after one linear
  condition (ghat(0) = 0) or the correction c |ghat(0)|^2, 13 < c < 17. Figure "protrude" shows the top
  eigenvalue passing 1 as the interval length approaches log 2.
- The geometric approach of the authors (intersection theory on the square of the Scaling Site) is said to be
  "not yet in shape to handle the delicate principal values involved in the Riemann-Weil explicit formula".
- Nothing in the paper depends on, or says anything about, primes, the window size beyond mu = 2, the lowest
  eigenvalue of the window form, or its eigenfunctions.

## 5. What it changes in our record
- **KNOWLEDGE section 2**: "Weil positivity for test functions of small support (Yoshida 1992), and at the
  archimedean place via the prolate operator (Connes-Consani 2021; Connes-Consani-Moscovici 2022)."
  To be made exact from this paper:
  - Yoshida's range, as stated here: f positive definite with support in (1/2, 2) and fhat(+-i/2) = 0; i.e.
    g supported in [2^(-1/2), 2^(1/2)] (our L = (1/2) log 2), exactly the window before the prime 2 enters.
    (Paper 2106.01715 says "using numerical analysis", this paper says "by reducing it to an explicit
    computation". Yoshida's paper itself was not read by this seat.)
  - Appendix B of this paper adds: "In [Bombieri 2000] and [Burnol 2000] a positivity result for the
    distribution W_infty = -W_R is proven, (for test functions with support in a small enough interval
    around 1)".
  - Connes-Consani's own theorem is the SAME range (no primes), strengthened to
    W_infty(g * g*) >= Tr(theta(g) S theta(g)*) under ghat(i/2) = ghat(0) = 0 (Theorem 1), and it is
    computer-assisted. The phrase "at the archimedean place" in our entry is right; "via the prolate
    operator" is imprecise: the paper uses the prolate functions of bandwidth 2 pi and Sonin's space. The prolate
    differential OPERATOR is used only as the commuting operator of Slepian-Pollak; the prolate-operator
    spectral results are the other paper (2310.18423).
  - So in the papers read by this seat the proved range of window positivity is: mu <= 2 (no prime). Nothing
    is proved for any window containing a prime.
- **KNOWLEDGE barrier B6**, "Known partial positivity (small support, one place, large n) degenerates in the
  limit": this paper supplies a precise instance at the first step: already at the full length log 2 the
  natural sufficient condition (Id - K_I >= 0) fails by one eigenvalue, 1.05 against 1.
- **THEORY T1** (Weil's criterion on windows, "quoted from Yoshida 1992 in Suzuki"): the same criterion, with
  the additional freedom of imposing vanishing at any finite set F disjoint from the zeros and containing
  {0, 1}, is Proposition C.1 here (proof: Yoshida's, "verbatim" with one refinement). Compatible with T1.
- **THEORY T5** (parity-block form; pole term +2<f, cosh>^2 on even f and -2<f, sinh>^2 on odd f): this paper
  works on the subspace where the pole functionals vanish (ghat(+-i/2) = 0), via the ideal J = range of Q
  (Lemma 3.3, Proposition 3.5). The statement "phi is positive on C_c^infty(I) cap J iff phi o Q is positive
  on C_c^infty(I)" is a proved device for removing the pole term without changing supports. Not in our record.
- **IDEAS #9 log** ("with no atom at all the form is negative from about L = 0.362 on") and **IDEAS #10
  result (c)**: consistent with this paper, whose positivity range ends exactly at L_ours = (1/2) log 2 =
  0.3466 on the subspace ghat(i/2) = 0. The paper does not compute where the archimedean form first fails
  beyond that; that is in 2106.01715, section 2.2 (numerical).
- **r1_A PROGRESS, archimedean kernel** w(u) = e^(u/2)/(2 sinh u): the same function appears here as
  tau(rho) = rho^(3/2)/(rho^2 - 1) for rho > 1 (formula after Proposition 1.5), i.e. e^(u/2)/(2 sinh u) at
  rho = e^u. **THEORY T4** (the kernel of N = primes - arch is pointwise >= 0 off the diagonal): for the
  archimedean part this is the paper's remark that W_R "coincides, outside 1, with a locally rational,
  positive function that tends to +infinity as the variable tends to 1". Known; stated in the introduction.
- **Not in our record, contained here** (facts, listed without comment):
  (a) Corollary 2.3: 2 theta'(t) + deltahat(t) >= 0 for all real t, with delta the explicit Si-function above;
      equivalently W_infty + D is positive on ALL test functions.
  (b) Theorem 4.7: the exact identity tr(theta(f) S) = W_infty(f) + int f epsilon d*rho for all f.
  (c) The mechanism "corner of a kernel at rho = 1 becomes -2 x derivative x identity under Q"
      (Theorem 3.6, Remark 3.7): the positive identity term comes from the jump of the first derivative.
  (d) The use of Caratheodory-Fejer for a real symmetric Toeplitz matrix of co-rank one (roots of the top
      eigenvector on the unit circle, unique decomposition into rank-one Toeplitz projections with positive
      weights; the weights d(j) -> 1 and the angles alpha_j -> j). This is the Toeplitz statement that
      arXiv 2511.23257 later reproves (its Corollary 1.1) and extends.
- **NOTEBOOK N19** ("Burnol (Sonine spaces; the archimedean part alone is exactly solvable ...)", from
  memory): this paper cites Burnol's C. R. notes (2000, 2002) for small-support positivity and for Sonine
  spaces, and gives its own exact formula for the archimedean functional (Theorem 4.7). Painleve functions
  and a Krein-type equation in the window size do not occur in this paper.
- **ATLAS**: no entry is contradicted or duplicated.

## 6. Reliability
- Published in Selecta Mathematica (refereed). This note is from arXiv v1.
- The exact identities (Propositions 1.5, 2.2, Theorems 3.6, 4.7, Propositions 5.3, 5.5) have full proofs,
  read here line by line but not re-derived.
- The main inequality (Theorems 1 and 6.11) rests on computations reported with "~": the L^1 distance 0.00122
  (Fact 6.1, "The proof is a computer calculation"), the overlap 0.94865 (Fact 6.5), eigenvalues of matrices
  of size up to N = 10 000 (Lemma 6.8), the norm ||h||_2 ~ 1.05143, and the 1732 angles and weights obtained
  from a Toeplitz matrix at omega = 1/5000 and stored in external files. The authors do bound truncation
  errors (Lemmas 6.8, F.1) but do not use interval arithmetic and do not state the software or precision. The
  margins are not large: epsilon_2 - epsilon_1 = 0.00441 - 0.00122.
- Corollary 3.8 and Remark 3.9 (u = 1.10246, 1.15077) are also "verified numerically".
- In Corollary 3.8's proof one sentence says the functional "is positive" where "negative" is meant; in
  formula "(sch17)" the symbol I(S) stands for I(Delta). Harmless.
- The introduction's Theorem 1 asks for vanishing "at i/2 and 0", Theorem 6.11 for vanishing at "-i/2"; for
  the statement about g * g* the two signs are exchanged by g -> g*.
