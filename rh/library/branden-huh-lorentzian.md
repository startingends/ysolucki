# Brändén, Huh, "Lorentzian polynomials"

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- P. Brändén, J. Huh, *Lorentzian polynomials*, arXiv 1902.03719, latest arXiv source (file
  "Lorentzian240717.tex", July 2024; it contains a remark correcting a lemma of "the previous version").
  Published in Ann. of Math. 192 (2020) (not checked independently; the arXiv text is later than the
  journal version).
- **Read in full from the TeX source** (`rh/library/src/1902.03719/lorentzian.tex`, 4977 lines):
  §1 Introduction; §2 Basic theory: §2.1 the space of Lorentzian polynomials, §2.2 Hodge–Riemann relations,
  §2.3 independence and negative dependence, §2.4 characterizations; §3.1 linear operators preserving
  Lorentzian polynomials; §4.1 convex bodies; §4.2 projective varieties.
- **Skimmed (theorem statements only, extracted by script, proofs not read):** §3.2 matroids and M-convex
  sets, §3.3 valuated matroids / M-convex functions / tropicalization, §4.3 Potts model and Mason's
  conjecture, §4.4 M-matrices, §4.5 Lorentzian probability measures.
- Numbering below: the source uses one counter per section for all statements; numbers were counted from
  the source for §2, §3.1, §4.1–4.2.

## 2. What it proves

All results are unconditional theorems of real algebra/combinatorics. H^d_n = homogeneous degree-d real
polynomials in n variables.

- **Definition 2.1 (strictly Lorentzian).** L̊²_n = quadratic forms with **positive coefficients** whose
  Hessian is nonsingular with exactly one positive eigenvalue; for d > 2, f ∈ L̊^d_n iff f has positive
  coefficients and ∂_i f ∈ L̊^{d−1}_n for all i. "Lorentzian" = limit of strictly Lorentzian.
- **Definition 2.6.** M^d_n = polynomials with **nonnegative coefficients** and **M-convex support** (for
  α, β in the support and α_i > β_i there is j with α_j < β_j and α − e_i + e_j in the support).
  L²_n = nonnegative quadratic forms with at most one positive eigenvalue (= stable ones);
  L^d_n = {f ∈ M^d_n : ∂^α f ∈ L²_n for every α of size d − 2}.
- **Theorem 2.25 (main characterisation).** "The closure of L̊^d_n in H^d_n is L^d_n." So: a homogeneous
  polynomial with nonnegative coefficients is Lorentzian iff its support is M-convex and every (d−2)-fold
  partial derivative is a quadratic form with at most one positive eigenvalue.
- **Example 2.4.** The support condition cannot be dropped: for f = w_1³ + w_2³, "∂_1 f and ∂_2 f are
  Lorentzian, but f is not Lorentzian" (its Hessian diag(6w_1, 6w_2) has two positive eigenvalues).
- **Theorem 2.16 (the "Hodge–Riemann" statement).** For nonzero homogeneous f of degree d ≥ 2: "(1) If f is
  in L̊^d_n, then ℋ_f(w) is nonsingular for all w ∈ ℝ^n_{>0}. (2) If f is in L^d_n, then ℋ_f(w) has exactly
  one positive eigenvalue for all w ∈ ℝ^n_{>0}." The sentence relating it to Hodge theory: "When f is the
  volume polynomial of a projective variety …, then the one positive eigenvalue condition for the Hessian
  of f at w is equivalent to the validity of the Hodge–Riemann relations on the space of divisor classes of
  the projective variety with respect to the polarization corresponding to w." The abstract calls it "an
  analog of the Hodge–Riemann relations".
- **Lemma 2.15.** If ℋ_{∂_i f}(w) has exactly one positive eigenvalue for every i and every w > 0, then
  ker ℋ_f(w) = ∩_i ker ℋ_{∂_i f}(w). (Proof: Euler's identity (d−2)ℋ_f = Σ w_i ℋ_{∂_i f}; each ℋ_{∂_i f} is
  negative semidefinite on the hyperplane orthogonal to ℋ_{∂_i f}w.)
- **Proposition 2.2.** Homogeneous stable polynomials with nonnegative coefficients are Lorentzian.
  Example 2.3: 2w_1³ + 12w_1²w_2 + 18w_1w_2² + θw_2³ is Lorentzian iff 0 ≤ θ ≤ 9 and stable iff 0 ≤ θ ≤ 8.
  Lemma 2.5: for quadratic forms with positive coefficients, Lorentzian signature ⇔ strict reverse
  Cauchy–Schwarz (u^Tℋv)² > (u^Tℋu)(v^Tℋv) for u ≥ 0 ⇔ f(xu − v) has two distinct real zeros.
- **Closure properties.** Proposition 2.7: f ∈ L^d_n ⇒ (1 + θ w_i ∂_j)f ∈ L^d_n for θ ≥ 0.
  **Theorem 2.10:** f(w) ∈ L^d_n ⇒ f(Av) ∈ L^d_m for every n×m matrix A with nonnegative entries.
  Corollary 2.11: Σ a_i ∂_i f ∈ L^{d−1}_n for a_i ≥ 0. Corollary 2.32: products of Lorentzian polynomials are
  Lorentzian. Theorem 2.28: the projectivised space of Lorentzian polynomials is compact and contractible
  (Conjecture 2.29: homeomorphic to a closed ball).
- **Negative dependence.** Proposition 2.17/2.19: every f ∈ L^d_n satisfies
  f ∂_i∂_j f ≤ 2(1 − 1/d) ∂_i f ∂_j f on ℝ^n_{≥0} ("2(1 − 1/d)-Rayleigh"). Proposition 2.24: the constant
  is optimal for n ≥ 3; for n ≤ 2 the constant 1 holds. Theorem 2.23: the support of any homogeneous
  c-Rayleigh polynomial is M-convex.
- **Theorem 2.30.** For homogeneous f: completely log-concave (Anari–Liu–Oveis Gharan–Vinzant) ⇔ strongly
  log-concave (Gurvits) ⇔ Lorentzian. Proposition 2.33: for f(w) > 0, ℋ_{f^{1/d}} ≤ 0 ⇔ ℋ_{log f} ≤ 0 ⇔
  ℋ_f has exactly one positive eigenvalue at w.
- **§3.1 operators.** Proposition 3.1: polarization and projection preserve the Lorentzian property.
  **Theorem 3.2:** a homogeneous linear operator T whose symbol sym_T(w,u) = Σ_α (κ choose α)T(w^α)u^{κ−α} is
  Lorentzian maps Lorentzian polynomials to Lorentzian polynomials (the converse fails, unlike for stable
  polynomials). Theorem 3.4: a homogeneous operator preserving stable polynomials and nonnegativity of
  coefficients preserves Lorentzian polynomials. Corollaries 3.5, 3.7, 3.8, 3.9: multi-affine part,
  normalisation w^α ↦ w^α/α!, the product N(f), N(g) ⇒ N(fg), the symmetric exclusion process.
- **§4.1.** Theorem 4.1: the volume polynomial vol(w_1K_1 + … + w_nK_n) of convex bodies is Lorentzian (proof:
  Brunn–Minkowski concavity of mixed volumes + Prop. 2.33 + Thm 2.25). Propositions 4.4, 4.5: every
  Lorentzian polynomial satisfies Alexandrov–Fenchel type inequalities c_α² ≥ c_{α+e_i−e_j}c_{α−e_i+e_j} and
  F_f(v_1,v_2,v_3,…)² ≥ F_f(v_1,v_1,v_3,…)F_f(v_2,v_2,v_3,…) for v_1 ∈ ℝ^n, v_2,…,v_d ≥ 0.
- **§4.2.** Theorem 4.6: for **nef** divisors H_1,…,H_n on an irreducible projective variety,
  (w_1H_1 + … + w_nH_n)^d is Lorentzian (proof: Kleiman, Bertini down to a surface, Hodge index theorem).
  Remark 4.3 and the footnote to Question 4.9: not every Lorentzian polynomial is a (limit of a) volume
  polynomial; an explicit Lorentzian cubic in three variables is not in the closure of volume polynomials
  of projective varieties.
- Skimmed, statements only: J is M-convex ⇔ its generating function is Lorentzian (label `charjump`);
  ν is M-convex ⇔ Σ q^{ν(α)}w^α/α! is Lorentzian for all 0 < q ≤ 1 (`classical`); tropicalizations
  (`tropical`); the homogenised multivariate Tutte polynomial is Lorentzian for 0 < q ≤ 1 (`mainpotts`),
  hence the strongest Mason conjecture (`TheoremMasonThird`); the multivariate characteristic polynomial of
  an M-matrix is Lorentzian (`M-matrix`); Lorentzian measures are 2-Rayleigh and closed under symmetric
  exclusion.

## 3. Method in ten lines

1. Two definitions: an open one by recursion on partial derivatives (strictly Lorentzian), and a closed one
   (nonnegative coefficients, M-convex support, quadratic derivatives with ≤ 1 positive eigenvalue).
2. The engine for "closed ⊆ closure of open" is a Nuij-type homotopy: the operators (1 + θw_i∂_j) preserve
   L^d_n (Prop. 2.7; proof via interlacing of stable quadratics and a support lemma from discrete convex
   analysis), and a product of them pushes any f ∈ L^d_n with positive coefficients into L̊^d_n (Lemma 2.12).
3. So L̊^d_n is connected and every strictly Lorentzian polynomial can be deformed, inside L̊^d_n, to one
   fixed polynomial (hence to a stable one).
4. The signature statement (Thm 2.16) is then a continuity argument, **not** a linear-algebra induction from
   slices to the whole: (a) for stable polynomials the Hessian has one positive eigenvalue (quadratic part
   of f(z + w) is stable); (b) along the connected set L̊^d_n the Hessian never becomes singular
   (Lemma 2.15 + induction on d); (c) eigenvalues are continuous, so the signature is constant.
5. Lemma 2.15 is the only slice-to-whole step, and what it transfers is the **kernel**, not the signature.
6. "closure of open ⊆ closed": the signature gives the 2(1−1/d)-Rayleigh inequality (a 2×2 minor of the
   Hessian restricted to span(w, e_i + te_j)); Rayleigh inequalities are closed under limits and force
   M-convex support (a minimal-counterexample argument with deletion/contraction/translation).
7. Operators: polarise to the multi-affine case, multiply by the symbol (products are Lorentzian), apply
   one explicit elementary operator per variable pair, set variables to zero.
8. Geometry enters only as a source of examples: Brunn–Minkowski and the Hodge index theorem are inputs
   showing volume polynomials are Lorentzian.
9. Stable-polynomial theory (Borcea–Brändén, interlacing ≺) is the technical base throughout.
10. Where the work is: Proposition 2.7 with Lemma 2.12 (the homotopy) and Theorem 2.23 (support).

## 4. Where it stops

- The class is defined for polynomials with **nonnegative coefficients**; every Hessian entry ∂_i∂_jf(w),
  diagonal ones included, is then ≥ 0 on the positive orthant. Forms with negative diagonal entries are
  outside the definitions (the paper does not treat "Lorentzian on a cone").
- Theorem 2.16 gives the signature only at points of the open positive orthant.
- The Hodge–Riemann analogy is in degree ≤ 1 only (one positive eigenvalue of a Hessian); no hard Lefschetz
  or higher-degree Hodge–Riemann statement is made.
- Open in the paper: Conjecture 2.29 (ball); the conjecture that bases of matroids are characterised by an
  8/7-Rayleigh generating function (§3.2); Question 4.9 on which Lorentzian polynomials are volume
  polynomials: "The problem of finding a Lorentzian polynomial that is not a volume polynomial remains open"
  in the introduction, answered in part by the footnote for n = d = 3.
- The converse of the operator theorem fails ("there are homogeneous linear operators T preserving the
  Lorentzian property whose symbols are not Lorentzian").
- Nothing in the paper concerns infinite-dimensional forms, kernels, limits in the number of variables, or
  number theory.

## 5. What it changes in our record

- **Idea #10, novelty field ("Only result lists were read, no paper in full").** Now read (parts listed in
  §1). The precise theorem behind idea #10's "non-negative symmetric 3-tensor with Lorentzian slices" is
  Theorem 2.25 + Theorem 2.16 at d = 3: if a cubic form has **all coefficients ≥ 0** (the tensor entries
  T_iii and T_iij included), **M-convex support**, and every slice ∂_if has at most one positive eigenvalue,
  then the contraction ℋ_f(w) = Σ_k w_k T_k has exactly one positive eigenvalue for every w > 0. Our record
  states the mechanism without the support hypothesis; Example 2.4 (w_1³ + w_2³) shows it cannot be omitted.
- **Idea #10 / atlas F2: "the local-to-global theorem this borrows is lossless exactly at the threshold".**
  Confirmed in the sense of Theorem 2.25: L^d_n is closed, and Theorem 2.16(2) holds on all of it, singular
  Hessians included; no margin is assumed.
- **Negative diagonals (atlas F2 "negative diagonals are harmless"; r2_cubic Lemma B).** This is outside the
  paper: a Brändén–Huh Lorentzian form has nonnegative diagonal. r2_cubic's finding "all entries except
  T_iii ≥ 0: NOT possible for anyone" says that the Weil-form tensors searched there are not Lorentzian
  polynomials in this paper's sense; the hypotheses of r2_cubic's Lemma B (signs only on the off-diagonal of
  H, irreducibility, Ha > 0) are different from this paper's (nonnegative tensor, M-convex support).
  Example 2.4 is the paper's instance of r2_cubic's remark (3) "without irreducibility the conclusion fails".
- **r2_cubic PROOF_trickle remark (2)** says, from memory, that its steps 2–5 (T_k ≤ l_kl_k^T/s_k, H ≤ HDH,
  Perron–Frobenius) are "the standard argument behind … the cubic step of Braenden-Huh". Imprecise: this
  paper does not argue that way. Its proof of the signature is the homotopy/continuity argument of part 3;
  a footnote attributes "an implication similar to (3) ⇒ (1) of Theorem 2.30" to Anari–Liu–Oveis
  Gharan–Vinzant ([ALGV III, Theorem 3.2], not read here). Step 2 of Lemma B (reverse Cauchy–Schwarz for a
  form with one positive eigenvalue) is the content of Lemma 2.5 here.
- **r2_cubic Lemma D, item (D3)** ("if Hv = 0 then T_kv = 0 for every k", listed as "NOT FOUND in four
  searches"): this is Lemma 2.15 of the paper for d = 3, with the same proof (write 0 = v^THv as a positive
  combination of the non-positive numbers v^TT_kv), under the paper's hypotheses. Known. Items (D1), (D2),
  (D4) and Lemma C (the cone tensor, existence of a certificate ⇔ the conclusion) were not found in the
  parts read; Lemma E and Theorem F are not in the paper.
- **Idea #10's del Pezzo example** (prime part on the divisors of 30 ≅ intersection form of the hexagon of
  (−1)-curves): Theorem 4.6 applies to **nef** divisors only; (−1)-curves are not nef, and their
  intersection form has −1 on the diagonal. So that example is not an instance of Theorem 4.6 in the basis
  of the six curves; the one-positive-eigenvalue statement there is the classical Hodge index theorem, as
  the idea entry itself says.
- **Idea #10's "toric candidate: mixed volumes … for a concave function of log n", Alexandrov–Fenchel.**
  What the paper has: Theorem 4.1 (volume polynomials are Lorentzian) and Propositions 4.4–4.5 (AF-type
  inequalities hold for every Lorentzian polynomial), and the fact that Lorentzian is strictly larger than
  "volume polynomial". Nothing about the forms of our project.
- **The factor 2.** The paper has its own sharp constant: Lorentzian ⇒ 2(1 − 1/d)-Rayleigh, optimal for
  n ≥ 3 (Prop. 2.19, 2.24); for cubics the constant is 4/3. r2_cubic's "structural factor 2" (Bakry–Émery
  constant 1/2 + 1/m on the mean-field model) is a statement about a different quantity; whether the two
  are related was not examined here and is not claimed.
- **Knowledge §6 / idea #6 (stability, Lee–Yang).** Proposition 2.2 and Example 2.3: Lorentzian is the
  strictly larger class containing homogeneous stable polynomials; a Lorentzian polynomial need not be
  stable. Theorem 3.4 transfers stability-preserving operators.
- Theory T4–T6, ideas #9, #21: no change.

## 6. Reliability

- Human-written, published in Annals of Mathematics; the arXiv version read is a later revision. It contains
  an explicit erratum: "Lemma 2.20 in the previous version of this manuscript contained the following
  incorrect statement" (diagonalisation of c-Rayleigh polynomials), with the proof of Lemma 2.22 "revised
  accordingly". The footnote to Question 4.9 records a result found "after the completion of this paper".
- An independent, partly overlapping development is credited (Anari–Liu–Oveis Gharan–Vinzant).
- Sections 3.2–3.3 and 4.3–4.5 were only skimmed by this seat; statements from them in part 2 are quoted
  from the theorem environments without checking proofs or exact numbering.
