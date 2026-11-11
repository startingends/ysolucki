# Perfekt, Pushnitski, "On Helson matrices: moment problems, non-negativity, boundedness, and finite rank"

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- K.-M. Perfekt, A. Pushnitski, *On Helson matrices: moment problems, non-negativity, boundedness, and
  finite rank*, **arXiv 1611.03772** (identifier found by direct download and title check; TeX file
  "Helson_matricesFINAL3.tex" dated 30 Aug 2017). Published 2018 according to our record (journal data
  not checked here).
- **Read in full from the TeX source** (`rh/library/src/1611.03772/`, 2452 lines): §1 Introduction,
  §2 Boundedness: Nehari's theorem, §3 Non-negativity and moment sequences, §4 Bounded non-negative
  matrices and Carleson measures, §5 The Bohr lift, Helson matrices and Hankel integral operators,
  §6 Finite rank Helson matrices (statements, examples, corollaries), Appendix A.
- **Not read:** §7, the proof of Theorem 6.6 (lines 1658–2316, commutative and tensor algebra).

## 2. What it proves

Helson matrix: M(α) = {α(nm)}_{n,m≥1} on ℓ²(ℕ). Writing n = p^κ (prime factorisation), α(nm) = α(p^{κ+κ'}):
a Hankel matrix in countably many variables. All statements are unconditional operator theory.

- **Theorem 3.3** (stated with citations in its header: Berezanskii, *Expansions in eigenfunctions of
  selfadjoint operators* (1968); Berg–Christensen–Ressel, *Harmonic analysis on semigroups* (1984);
  Samoilenko, *Spectral theory of families of selfadjoint operators* (1991); "a combination of results
  existing in the literature", "(essentially known)"; a proof sketch is given). "Let α = {α(n)} be a sequence of complex numbers which satisfies the
  bound α(n) = O(n^a), n → ∞, for some finite a > 0. Then
  (i) M(α) ≥ 0 if and only if there exists a measure μ ≥ 0 on ℝ^∞ such that t^κ ∈ L¹(μ) for all
  multi-indices κ and α(n) = ∫_{ℝ^∞} t^κ dμ(t), n = p^κ. In this case the measure μ is unique.
  (ii) We have M(α) ≥ 0 and M(α(p ·)) ≥ 0 for all primes p if and only if there exists a measure μ ≥ 0 as
  above, supported on [0,∞)^∞."
  A point t ∈ ℝ^∞ is the same thing as a real completely multiplicative function n ↦ t^{κ(n)}; so (i)
  says: non-negative ⇔ positive mixture of real completely multiplicative functions.
  "A curious corollary of (ii)": then M(α(ℓ ·)) ≥ 0 for all integers ℓ; "This should be a purely algebraic
  fact, but we do not know how to prove this directly".
- Theorems 3.1, 3.2 (classical): Hamburger and Stieltjes moment problems; in d < ∞ variables non-negativity
  of the Hankel matrix does **not** in general give a moment measure, but does under the growth bound
  |β(κ)| ≤ C^{|κ|}κ_1^{κ_1}···κ_d^{κ_d}.
- Theorem 2.1 (Nehari; Ferguson–Lacey; Lacey–Terwilleger) and Theorem 2.2 (Ortega-Cerdà–Seip): bounded
  d-variable Hankel matrices have bounded symbols with constant C_d ≥ (π²/8)^{d/4}; hence "There exists a
  bounded Helson matrix M(α)" without bounded symbol. "No explicit examples of this kind are available."
- **Theorem 4.7.** For a finite μ ≥ 0 on (−1,1)^∞ with moments α: M(α) bounded ⇔ μ is a Carleson measure for
  H²(𝕋^∞) ⇔ the operators G_d f(t) = ∫K_d(s,t)f(s)dμ(s) are bounded on L²(μ) and converge strongly. Moreover
  M(α) = 𝒩*𝒩 and G_∞ = 𝒩𝒩* (unitarily equivalent modulo kernels), 𝒩 the embedding H²(𝕋^∞) → L²(μ).
  Theorem 4.3: the finite-d version with five equivalent conditions, including |β(κ)| ≤ CΠ(1+κ_j)^{-1}
  (Widom's theorem for d = 1 is Theorem 4.2). Remark: "In the Helson matrix case, there is no simple
  coefficient condition to characterize boundedness".
- **Theorem 5.1 (Bohr lift).** For ν a finite positive measure on (1/2,∞) and α(n) = ∫ n^{-s}dν(s):
  M(α) bounded ⇔ ν((1/2,s]) ≤ C(s−1/2) ⇔ α(n) ≤ C/(√n log n) ⇔ the Hankel-type integral operator
  (Gf)(t) = ∫ζ(s+t)f(s)dν(s) is bounded on L²(ν); and M(α), G are unitarily equivalent modulo kernels. The
  moment measure is the push-forward of ν under s ↦ (p_1^{-s}, p_2^{-s}, …). "ν must be concentrated on
  (1/2,∞) if α ∈ ℓ²".
- Theorem 5.2 (quoted from [BPSSV] and the companion paper [PP2]): the multiplicative Hilbert matrix
  {1/(√(nm) log(nm))}_{n,m≥2} is bounded, with purely absolutely continuous spectrum [0,π] of multiplicity
  one.
- **Theorem 6.6 (Kronecker-type).** A Helson form has finite rank ⇔ it is a finite sum
  Σ_ℓ D(c^{(ℓ)})(fg)(λ^{(ℓ)}) of factorizable differential operators (products of directional derivatives in
  ℂ^∞) at points λ^{(ℓ)} ∈ ℂ^∞; it is bounded and of finite rank ⇔ λ^{(ℓ)} ∈ 𝔻^∞ ∩ ℓ² and directions in ℓ².
  Corollary 6.8: a finite rank Helson form is non-negative ⇔ [f,g] = Σ c^{(ℓ)}f(λ^{(ℓ)})g(λ^{(ℓ)}) with
  finitely many real points and c^{(ℓ)} > 0. Example 6.4: [f,g] = D^n(fg)(ρ) (derivatives of the Dirichlet
  series at ρ) has rank n+1 and is bounded iff Re ρ > 1/2.
- Appendix: Prop. A.2 (necessary Carleson condition μ(I_s) ≤ CΠ(1−s_j²)); Prop. A.3: the reproducing-kernel
  testing condition is **not** sufficient for measures on (−1,1)^∞.

## 3. Method in ten lines

1. Index integers by exponent vectors; a Helson matrix becomes a Hankel matrix on ℕ_0^{(∞)}.
2. Non-negativity: the form ⟨f,g⟩ = Σα(nm)f_n ḡ_m on polynomials in t ∈ ℝ^∞ gives a Hilbert space on which
   multiplication by each t_j is symmetric.
3. Under α(n) = O(n^a) every one-variable Hamburger problem α(n_0p^k) is determinate, so each
   multiplication operator is essentially self-adjoint (Devinatz), and they commute.
4. Spectral theorem for countably many commuting self-adjoint operators (Samoilenko) gives a joint
   resolution of the identity on ℝ^∞; the vector 1 gives the moment measure. Uniqueness: Kolmogorov.
5. Positivity of the shifted matrices ⇔ positivity of the multiplication operators ⇔ support in [0,∞)^∞.
6. Boundedness for non-negative matrices: Widom's argument, M = 𝒩*𝒩 with 𝒩 the Carleson embedding.
7. Bohr lift: measures on a ray of exponents s map to the curve (p_j^{-s}) in the polydisc; the dual
   operator 𝒩𝒩* has kernel ζ(s+t).
8. Finite rank: the kernel of a Helson form is an ideal of finite codimension in ℂ[z_1, z_2, …]; reduce to
   Power's finite-variable theorem; boundedness by tensor algebra (not read).
9. Counterexamples by tensor products of one-variable Hankel matrices (norm (π/2)^N against a testing
   norm 1).
10. Where the work is: §6–7 (finite rank). §3 is, in the authors' words, existing theory.

## 4. Where it stops

- Question (a) (which M(α) are bounded) is answered only for non-negative matrices, and there only in
  terms of Carleson measures for H²(𝕋^∞), which "are notoriously difficult to understand, and we leave the
  topic with many remaining question marks".
- Question 4.6 (open): does every bounded M(α) come from a Carleson measure? "we do not know if such a
  result holds even in the finite variable Hankel setting" for d > 1.
- No explicit bounded Helson matrix without bounded symbol is known.
- "Despite the formal similarity with the Hilbert matrix … we do not know how to explicitly diagonalize H."
- The moment theorem needs a growth hypothesis (α(n) = O(n^a)) and finite total mass (α(1) = μ(ℝ^∞)); in
  finitely many variables non-negativity without growth control does not imply a moment representation.
- The paper is about the matrices {α(nm)} only. It contains no explicit formula, no L-function other than
  ζ(s+t) as a kernel, no statement on zeros, and nothing about translation ("shift") positivity.

## 5. What it changes in our record

- **Idea #21, "smallest" field and kill log ("the a,b ≥ 1 version of the criterion is a known theorem
  (Perfekt–Pushnitski 2018 …)").** Confirmed and made exact: our criterion "[c(ab)] ≥ 0 iff c is a positive
  mixture of real completely multiplicative functions" is their Theorem 3.3(i), under the hypotheses
  c(n) = O(n^a) and indices starting at n = 1 (finite total mass c(1)); the mixing measure is unique. The
  authors themselves attribute it to earlier literature (Berg–Christensen–Ressel and others) and call it
  "essentially known"; so it predates 2018. Our "exactly when all local roots are real with positive
  multiplicity" (Euler-product case) is the special case of a measure carried by points; the version with
  **non-negative** roots is their Theorem 3.3(ii) (add positivity of the shifted matrices M(c(p ·))).
- **Why our matrices start at a, b ≥ 2.** With c(n) = Λ(n)/√n = Σ_p (log p)χ_p(n) the mixing measure
  Σ_p (log p)δ_{χ_p} has infinite total mass, so the entry at n = 1 is not defined and Theorem 3.3 does not
  apply literally; the paper meets the same point for its Hilbert matrix ("a minor modification to the
  framework to eliminate n = 1"). The "if" direction (a positive mixture gives a non-negative matrix) is
  immediate in any case, which is all our identity D1 uses.
- **Idea #21, new input (1): "Finite places are the coordinate axes of the dual semigroup, the archimedean
  place is its diagonal."** The paper has the second half as §5.1: sequences α(n) = ∫n^{-s}dν(s) are moment
  sequences of the push-forward of ν to the curve s ↦ (p_j^{-s}) (the Bohr lift). Our Gamma part
  Σ_{m≥0} n^{-(2m+1/2)} is of this form with ν = Σ_m δ_{2m+1/2}. Theorem 5.1 covers finite measures on the
  open ray (1/2,∞); our ν has an atom at the excluded endpoint s = 1/2. Its contribution is the rank-one
  matrix {(ab)^{-1/2}}, which is non-negative but not bounded on ℓ² (a^{-1/2} ∉ ℓ²; the paper: "ν must be
  concentrated on (1/2,∞) if α ∈ ℓ²"). So the Gamma part of our mirror matrix sits on the boundary of the
  paper's bounded theory. (The prime part on indices ≥ 2 is a direct sum of rank-one blocks, one per prime;
  that is our identity D1, not a statement of the paper.)
- **Idea #21 correction of 2026-11-10 ("the mirror criterion detects real local roots, not zeros").** In the
  paper's terms: non-negativity of M(α) is a statement about the support of the moment measure in ℝ^∞
  (real characters), with no reference to analytic continuation. Consistent with the correction. The paper
  has no L-function example with complex local roots; Corollary 6.8 gives the finite-rank case
  (non-negative ⇔ a positive combination of evaluations at real points).
- **The kill of idea #21** (the bridge mirror ⇒ shift is false, counterexample F_d): nothing in the paper
  bears on a bridge to translation positivity; the paper never considers the additive (shift) structure of
  the logarithms. F_d and barrier B11 are not in the paper. That mirror positivity is invariant under the
  twists α(n) ↦ n^{-d}α(n) follows in one line from Theorem 3.3 (the twist rescales t_j by p_j^{-d}); the
  paper does not state it. In the paper the half-plane Re s > 1/2 enters only through boundedness on ℓ²
  (Theorem 5.1; Example 6.4: bounded iff Re ρ > 1/2).
- **A statement our record lacks:** Theorem 5.1(4): the Helson matrix of α(n) = ∫n^{-s}dν(s) is unitarily
  equivalent (modulo kernels) to the integral operator with kernel ζ(s+t) on L²(ν). And Theorem 5.2: the
  multiplicative Hilbert matrix has spectrum [0,π], absolutely continuous.
- **Theory T19, T71, T76, T77, atlas F22** (read at the end of the session). T19 quotes Theorem 3.3
  correctly; its credit "Berezansky-Kondratiev" is not what the paper cites (Berezanskii's 1968 monograph,
  Berg–Christensen–Ressel 1984, Samoilenko 1991). T19's last sentence (false without a growth condition
  already in two variables) matches the paper's remark with reference [BCR, §6.3]. T76 (the a, b ≥ 2 variant
  with a free term at products of two primes) and T77 (Euler products: real roots with positive
  multiplicity) are not in the paper. T71 cites arXiv 2407.04124 (abstract only) for "Helson matrices
  induced by measures"; the same class is §5.1 of this 2016 paper (α(n) = ∫n^{-s}dν(s), Theorem 5.1).
- Ideas #9, #10, theory T4–T6 (T6 is recorded as open and "not yet a precise statement"; since idea #21 is
  killed the paper adds nothing to it), atlas: no other change.

## 6. Reliability

- Human-written; arXiv version of August 2017; published in a refereed journal according to our record.
- §3 is explicitly presented as a compilation: Theorem 3.3 carries citations in its header and only a
  "Sketch of proof"; the sketch assumes for simplicity that the form is non-degenerate.
- The proof of the main new theorem (Theorem 6.6, §7) was not read by this seat.
- The three sources cited for Theorem 3.3 (checked against the paper's bibliography file) were not read.
