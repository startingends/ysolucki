BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# M. van Frankenhuijsen, "The Riemann Hypothesis for Function Fields over a Finite Field", arXiv 0806.0044 v2 (9 Jun 2008; v1 31 May 2008; 30 pp., written as a book chapter)

Reader: READER-9, 2026-11-11. Source: arXiv TeX `rh/library/src/ff-0806.0044/x/zetaRH.tex` (two .ps figures not
opened). No journal reference on arXiv; refereeing status not checked.

## 1. What was read
**All of it**: 91,192 / 91,192 characters of the TeX source (88,725 from `\begin{document}`; preamble macros read
for notation). §1 introduction, §2 zeta function via Tate's thesis for function fields (local theory, adeles,
Riemann-Roch from Poisson summation, Pellikaan's two-variable zeta function), §3 Bombieri's proof, §4 comparison
with ζ and the Nevanlinna proposal, bibliography.

## 2. What it proves
Expository; everything in §§2-3 is known (Tate, Weil, F. K. Schmidt, Pellikaan, Bombieri). Statements as written:
- **Lemma "L: RH".** If for every ε > 0 there is m with |N_C(nm) − q^{nm} − 1| ≤ B q^{nm(1/2+ε)} for all n, then RH
  holds for ζ_C (proof by Dirichlet approximation + the functional-equation symmetry, Remark R:symmetry). Note: this
  is TWO-SIDED.
- **Lemma "L: f|phi".** For k < q, the map f ↦ f|_φ (restriction of Σ a_i(X)s_i(Y), a_i ∈ L_k, to the graph of
  Frobenius) is injective.
- **Theorem "T: upper bound".** q > (g+1)^4 a square ⇒ N_C(1) ≤ q + (2g+1)√q. Intermediate (E: N1m):
  N_C(1) ≤ (q/p^μ)(m+1), best when q/p^μ = p^μ.
- **Theorem "T: upper bound, covers".** Same bound for N_{C'}(1, σ) = #{x ∈ C'(F̄_p) over P^1(F_q) with
  φ_q(x) = σ(x)}, g' = genus of C'.
- **Theorem.** RH for C, via Σ_{σ∈G} N_{C'}(1,σ) = |G|(q+1), the subgroup H, and Lemma L: RH.
- **Table T: comparison (§4).** For ℤ: RH ⟺ ψ(x) = x + O(x^{1/2+ε}) ⟺ ψ(x) ≤ x + O(x^{1/2+ε}) (one-sided suffices).
  For curves: RH ⟺ N_C(n) = q^n + O(q^{n/2}); the one-sided ψ_C(x) ≤ ... or N_C(n) ≤ q^n + O(q^{n/2}) is only
  IMPLIED by RH (arrow ⟹ only). Footnote: the difference "is a consequence of the density of log|x|, x ∈ ℚ, in the
  real line."

## 3. Method in ten lines
1. Historical account (§1, from Bombieri, personal communication 2007): to understand Stepanov's derivations
   geometrically Bombieri used a standard connection; it worked only over the prime field "because of the
   obstruction arising from iterating the connection p times"; "derivatives of order p gave the Cartier operator,
   which turned out to be the same as taking the p-th power of the function". The final proof uses neither.
2. Bombieri's proof "uses the graph of Frobenius in C × C and the Riemann-Roch formula" (on C), via functions
   f(X,Y) = Σ a_i(X) s_i(Y) on C × C (Bombieri never mentions C × C, only F̄_p(C) ⊗ F̄_p(C)).
3. Remark R:arith geo: X is the "arithmetic" coordinate (coefficients), Y the "geometric" one (variable); for P^1,
   f is a polynomial in Y with coefficients in X, "analogous to a polynomial in Y with integer coefficients".
4. Restriction to the graph of Frobenius: s_i(φ_q(X)) = s_i(X)^q; injectivity by pole orders (k < q).
5. Coefficients a_i = b_i^{p^μ}, p^μ n < q; restriction to the diagonal f|_Δ = 0 is the only linear condition.
6. f|_φ is a nonzero p^μ-th power vanishing at the N_C(1) − 1 rational points ⇒ p^μ(N_C(1)−1) zeros ≤ p^μ n + qm poles.
7. Genus 0 example: f = X^{p^μ} − Y^{p^μ} gives N_{P^1}(1) ≤ q + 1 exactly.
8. Lower bound by Galois covers (Frobenius as symmetries of a cover).
9. §4: the ℤ-dictionary — no constant field, hence "no analogue of the points on C" and "no Frobenius flow on Spec ℤ",
   although every Galois extension of ℚ has local Frobenius elements; ψ(x) replaces N_C(n).
10. Proposal: only the UPPER-bound step needs translating (because of the one-sided equivalence for ℤ).

## 4. Where it stops (the paper's own account of what fails over ℤ, §4, quoted or close paraphrase)
- Frobenius-flow analogue: by Connes (Sel. Math. 1999, Remark c p. 72) the Frobenius flow corresponds to the action
  of ℝ_{>0} ⊂ 𝔸*/ℚ* on 𝔸/ℚ*; "according to Deninger, the analogue of the Frobenius flow of the first step may be
  provided by the shift on the real line"; "the infinitesimal generator of the shift ... is the derivative operator.
  So we may try to construct such a function that vanishes at the prime numbers to a high order."
- Proposed model (Nevanlinna theory): f(z) = Π_{p≤x}(1 − pz)^{[log_p x]} on the unit disc has Nevanlinna counting
  function N_f(0,1) = ψ(x); basis s_i = z^{1−i}; coefficients = integers b_i, f(z) = Σ b_i z^{1−i}.
- What fails, in the author's words: "We do not know what the analogue of the choice b_i = a_i^{p^μ} could be. The
  main problem is that the arithmetic coordinate cannot be compared with the geometric coordinate: z ∈ ℂ is the
  geometric coordinate and the coefficients of f are integers ... Hence there is no diagonal and we have to force
  the vanishing of f at the primes in an artificial manner. As a consequence, we do not know how to bound the
  Nevanlinna height (i.e., the degree) of this function." The analogue of the injectivity lemma is "automatically
  satisfied" (coefficients are determined by f); convergence on |z| ≤ 1 of an infinite series is an open issue
  (footnote).
- Poisson-Jensen as a product formula: for Laurent coefficients in ℚ, Σ_p v_p(c) log p + v_0(f) log r +
  Σ_{0<|x|<r} v_x(f) log(r/|x|) + ∫_{Γ_r} v_z(f) dz/(2πiz) = 0; "It is still puzzling why the archimedean valuation
  v_∞(c) = −log|c| should be excluded". Ends: "We invite the reader to continue this line of reasoning."
- No theorem about ζ is proved; the §4 material is explicitly speculative.
- Also stated (§1, opinion): Weil's first proof — "some reason to believe that no analogue will ever exist for
  number fields, or else that constructing an analogue is harder than establishing the Riemann hypothesis"; same
  for the Jacobian proof. And: Connes's approach "does not use the action of Frobenius".

## 5. What it changes in our record
- `rh/NOTEBOOK.md` N68 ("STEPANOV OVER ℤ (where nobody in the project had looked, but the literature has)") and
  `rh/HUNCHES.md` G6: **already in the literature, in a different form.** The explicit proposal to translate the
  Bombieri-Stepanov upper-bound step to Spec ℤ, by a function vanishing to high order at the primes ≤ x with
  controlled "degree", is van Frankenhuijsen 2008 §4. His model is a Nevanlinna one (zeros at z = 1/p of order
  [log_p x], size = Nevanlinna height), not N68's "auxiliary INTEGER divisible by p^m" (Chebyshev/Nair). His named
  failures — no diagonal, no analogue of b_i = a_i^{p^μ}, no height bound — are different from N68's named failure
  ("no single derivation that kills a Frobenius at every prime"); his Frobenius analogue is the scaling flow with
  generator d/dx (Deninger), i.e. one global derivation already exists in that picture, and what is missing is the
  diagonal / p-power structure.
- N68's one-sided remark: vF's table agrees with N68's corrected H10 for ℤ (one-sided ψ bound ⟺ RH) and shows the
  CONTRAST with curves, where one-sided does not suffice (see `bombieri-1973.md` §5 for the error in N68).
- N68's "Chebyshev's method ... cannot even reach PNT (integer Chebyshev problem; Gorshkov, Montgomery,
  Borwein-Erdélyi)": not addressed by this paper; not checked by this reader (still "recalled" in N68).

## 6. Reliability
arXiv preprint, exposition of known results (§§2-3) plus explicitly speculative §4. Personal communications from
Bombieri and Connes are cited for the history and for the "average" operator E. The §3 proof was checked line by
line against Bombieri 1973 (consistent; vF's (E: N1m) uses n = q/p^μ − 1 and gives the slightly cleaner bound
q + (2g+1)√q without the +1).
