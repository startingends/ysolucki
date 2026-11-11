BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# A. Connes, "An essay on the Riemann Hypothesis", arXiv 1509.05576 (Sept 2015; in "Open Problems in Mathematics", Nash and Rassias eds., Springer 2016, per the essay's own context — not checked)

Reader: READER-9, 2026-11-11. Source: arXiv TeX `rh/library/src/ff-1509.05576/x/rharXiv.tex`. Read because it is
the most explicit statement, by Connes, of the frontier of the joint Connes-Consani "Riemann-Roch strategy"; the
later Connes-Consani papers scanned (2022-2026, `f1-frontier-scan.md`) do not restate it.

## 1. What was read
**PARTLY: 66,669 / 111,233 characters.** Read: abstract, §1 Introduction, §2 (RH and algebraic geometry: explicit
formulas, RH for function fields, the proof via Riemann-Roch on C̄ × C̄, Grothendieck and topos), §4 (the
Riemann-Roch strategy: q → 1 limit, characteristic one, arithmetic and scaling sites, Table 1), §5 (absolute algebra,
Γ-rings, topological cyclic homology, final remarks). NOT read: §3 (Riemannian geometry, Selberg trace formula,
"the minus sign", the adele class space; 12,763 characters); bibliography skimmed.

## 2. What it states (a survey; results are cited, not proved)
- Weil's proof as reformulated by Mattuck-Tate-Grothendieck (§2.3): explicit formula terms = intersection numbers
  D.Δ for D = Σ a_k Ψ^k (Ψ = Frobenius correspondence) on X = C̄ × C̄; RH reduces to negativity of D.D on degree-zero
  divisors, obtained from the Riemann-Roch inequality ℓ(D) + ℓ(K−D) ≥ ½ D.(D−K) + χ(X) plus three facts
  (ℓ(D) > 1 ⇒ D ~ strictly positive; D > 0 ⇒ D.ξ_0 + D.ξ_1 > 0; ξ_0.ξ_1 = 1, ξ_j.ξ_j = 0) and Lemma 2.1
  (I(x,x) ≤ 2 I(x,ξ_0) I(x,ξ_1)).
- Counting distribution (§4.1, citing Connes-Consani): N(u) = d/du φ(u) + κ(u), φ(u) = Σ_{n<u} n Λ(n), positive on
  (1, ∞), N(u) = u − d/du(Σ_ρ ord(ρ) u^{ρ+1}/(ρ+1)) + 1; "N(1) = −∞" formally; κ violates N(q) ≤ N(q^r).
- Arithmetic site (N^×-topos with structure sheaf ℤ_max): its points over ℝ_max = ℚ^×\𝔸_ℚ/Ẑ^×, Frobenius
  automorphisms Fr_λ (x ↦ x^λ, λ ∈ ℝ_+^*) ↔ idele class action. Square of the site: Frobenius correspondences Ψ(λ)
  as congruences, Ψ(λ)∘Ψ(λ') = Ψ(λλ') (λλ' ∉ ℚ), = id_ε ∘ Ψ(λλ') in the exceptional case.
- Scaling site: periodic orbits C_p = ℝ_+^*/p^ℤ are analogues of elliptic curves, Jacobian ℤ/(p−1)ℤ; Theorem 4.2:
  for deg D ≥ 0, Dim_ℝ H^0(D) = deg D (continuous dimension), and Dim H^0(D) − Dim H^0(−D) = deg D.

## 3. Method in ten lines
1-3. Weil's proof is recast as "Riemann-Roch on the square ⇒ Hodge-index negativity ⇒ RH".
4-6. For ζ the proposed analogue: curve = arithmetic site / scaling site (char. 1, tropical), Galois group of ℝ_max
   over 𝔹 = ℝ_+^* acting as Frobenius, points = adele class space.
7-8. Divisors on the square: D(f) = ∫ Ψ(λ) f(λ) d*λ for compactly supported f on ℝ_+^*.
9. Riemann-Roch is known on the periodic orbits only (curve level).
10. Third strategy: Γ-rings / sphere spectrum / topological cyclic homology as cohomology (Hesselholt's formula for
   ζ(X,s) over F_q).

## 4. Where it stops (Connes's own statement, shaded box in §4.3.2)
"At this point, what is missing is an intersection theory and a Riemann-Roch theorem on the square of the arithmetic
site. One expects that the right hand side of the Riemann-Roch formula will be of the form ½ D.D = I(f,f) when the
divisor D is of the form D(f) = ∫ Ψ(λ) f(λ) d*λ." Further: "So far the Riemann-Roch formula in tropical geometry is
limited to curves and there is no Serre duality or good cohomological version of H^j for j ≠ 0, but in the above
context one can hope that a Riemann-Roch inequality ... Dim(H^0(D)) + Dim(H^0(−D)) ≥ ½ D.D would suffice to apply the
strategy ... to prove the key inequality". Also (§1): "It is yet unclear if this is the right set-up for the final
Riemann-Roch step"; (§5) the sites are "only the semiclassical shadows of a more mysterious structure"; a stumbling
block for a cohomology theory is "the problem of coefficients" (embeddings W(F_q) → ℂ are non-measurable).

## 5. What it changes in our record
- For the brief's question (d): this is the frontier as stated by the program's authors: an intersection theory and
  a Riemann-Roch theorem (at least an inequality) on the SQUARE of the arithmetic site, with D(f).D(f) = 2 I(f,f)
  (Weil's quadratic form). The curve-level Riemann-Roch theorems now exist (C_p 2016; Spec ℤ-bar over S[±1] 2022,
  over S 2023); no paper read here claims the square-level statement.
- The program follows WEIL's proof (square, intersection, Hodge index), not Stepanov-Bombieri; the essay never
  mentions Stepanov or Bombieri 1973 (string search). In the record's terms (`rh/HUNCHES.md` G6, N68): the
  Connes-Consani "Frobenius" is a one-parameter group Fr_λ (λ ∈ ℝ_+^*) on points over ℝ_max, i.e. ONE flow for all
  primes, not a family of p-power maps; its infinitesimal generator plays the role van Frankenhuijsen assigns to
  d/dx (`vanfrankenhuijsen-0806.0044.md`). This is reported as a fact about the literature; nothing is inferred.
- The "missing inequality" is, by Connes's own identification, equivalent in content to Weil positivity of I(f,f)
  (Lemma 2.1 converts the RR inequality plus three facts into it); the record's digests on Weil positivity
  (`connes-consani-weil-positivity-archimedean.md`, `2106.01715.md`, `bombieri-2000.md`) concern exactly that form.

## 6. Reliability
Survey/essay by a single author describing joint work; theorems cited to refereed papers (Connes-Consani CRAS 2014,
2015; Compositio/Adv. Math. papers on the arithmetic and scaling sites — not read here). Statements of hope are
marked as such by the author.
