BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/README.md`, `rh/library/INDEX.md`).

# A. Olevskii, A. Ulanovskii, "A Simple Crystalline Measure", arXiv 2006.12037 v2

## 1. Reference and extent of reading
- arXiv 2006.12037, v1 22 Jun 2020, **v2 24 Jun 2020** (current e-print read). No journal reference in the arXiv API;
  publication status not checked. Read because Olevskii–Ulanovskii 2009.12810 rests its converse on it.
- Source: gzipped `crystalline1.tex`, saved as `rh/library/src/crystal_2006.12037/x/main.tex` (gitignored).
  **Read whole: 22,887 / 22,887 characters (432 lines).**

Notation: Exp = exponential polynomials ψ(z) = Σ_{j=1}^l b_j e^{2πiα_j z}, α_j real; Λ_ψ its zero set (always in a
strip |Im z| < r); Exp_s ⊂ Exp: simple zeros and Λ uniformly discrete (u.d.); Exp_r ⊂ Exp_s: Λ ⊂ ℝ.

## 2. What it proves (unconditional)
- **Theorem 1.** For ψ ∈ Exp, φ ∈ Exp_s with Λ_φ ⊄ Λ_ψ (by Ritt: ψ is not a multiple φφ_1 in Exp):
  (i) Σ_{λ∈Λ_φ} c_λ f(λ) = Σ_{s∈S} a_s f̂(s), with c_λ = ψ(λ)/φ'(λ) bounded, S ⊂ ℝ locally finite with
  #S ∩ (−r, r) ≤ C r^m, for every entire f with f(x + iy) ∈ 𝒮(ℝ) for each y;
  (ii) if φ ∈ Exp_r, the a_s are bounded and the formula holds for all f ∈ 𝒮(ℝ).
- **Corollary 1:** μ = Σ c_λ δ_λ is crystalline. **Corollary 2 (ψ = φ'):** for φ ∈ Exp_r, **Σ_{λ∈Λ_φ} δ_λ is a crystalline
  measure** (unit masses).
- **Example 1.** φ(z) = sin πz + δ sin z, 0 < δ ≤ ½: Λ_φ = {k + δ_k}, |sin πδ_k| ≤ δ, δ_k ∈ [−1/6, 1/6]; Λ_φ contains no
  arithmetic progression. Same for sin πz + Σ d_j sin α_j z with 0 < α_j < π, some π/α_j irrational, Σ|d_j| ≤ ½.
- **Corollary 3.** For every ε > 0 there is Λ = {k + δ_k}, |δ_k| < ε, with no arithmetic progression and Σ δ_λ
  crystalline. Contrast (citing Favorov, arXiv 2006.07610): if δ_k → 0 and Σ δ_λ is crystalline then Λ = ℤ.

## 3. Method in ten lines
Contour integral of f ψ/φ over two horizontal lines Im z = ±R. Residues give Σ c_λ f(λ) (Langer 1931: φ is bounded
below away from its zeros; Claim 1: inf |φ'(λ)| > 0 by a normal-families argument). On Im z ≥ R_+ expand 1/φ as a
geometric series in the exponentials e^{2πi(α_j − α_1)z}, so ψ/φ = Σ_{s∈S_+} p_s e^{2πisz}; similarly below. Each line
integral becomes a sum of values of f̂. Bounded a_s for real Λ: test against e^{2πisz}β(sin πβz/πβz)² and Bessel's
inequality. It is the Kurasov–Sarnak contour argument with an arbitrary exponential polynomial in place of P(b^{−s}).

## 4. Where it stops
- Requires simple zeros and u.d. zero set (the general case would bring derivatives of f and unbounded coefficients;
  "we will not consider this case"). Claim 2 (S_+ ⊂ [β_1 − α_1, ∞) with polynomial counting) "We omit the simple proof."
- Says nothing about which exponential polynomials have only real zeros beyond the perturbation examples.

## 5. What it changes in our record
- Supplies the converse direction quoted in `olevskii-ulanovskii-2009.12810.md`: real-rooted (simple, u.d.)
  exponential polynomials ⇔ unit-mass FQs. Kurasov–Sarnak's construction is the case φ(x) = P(e^{−iξx}); stability of P
  is one way to certify real roots, not needed for the summation formula itself. No zeta, prime or L-function appears.

## 6. Reliability
- Short, elementary, complete except the omitted Claim 2. Typo: before Lemma 1 "if Λ_φ ⊂ ℤ" should read "⊂ ℝ" (the
  lemma itself is stated for Λ ⊂ ℝ). Publication status not verified.
