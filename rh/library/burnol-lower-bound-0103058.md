BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# J.-F. Burnol, "A lower bound in an approximation problem involving the zeros of the Riemann zeta function", arXiv math/0103058 v2 (20 Mar 2001); Adv. Math. 170 (2002) 56-70

Reader: READER-8, 2026-11-11. Source: arXiv TeX `0103approxB.tex`, saved as
`rh/library/src/mollif_math_0103058/burnol.tex`. (Not the same paper as Burnol math/9809119, digested in
`burnol-explicit-formula-propagator.md`.)

## 1. What was read
**34,308 / 34,308 characters (762 / 762 lines)**: title page, sections 1-5, acknowledgements, bibliography.

## 2. What it proves
Setting (the variant of Nyman–Beurling used by BDBLS): K = L²(]0,∞[, dt), χ = 1_{]0,1]}, ρ = fractional part,
𝓑_λ = span{t ↦ ρ(θ/t) : λ ≤ θ ≤ 1} (CONTINUOUS dilations θ ∈ [λ, 1]), D(λ) = inf_{f ∈ 𝓑_λ} ‖χ − f‖.
- **Theorem 1.1 (Nyman, Beurling).** RH ⟺ χ ∈ closure of ∪_λ 𝓑_λ.
- **Theorem 1.2 (BDBLS, Adv. Math. 149 (2000), quoted).** liminf_{λ→0} D(λ) √(log(1/λ)) ≥ √(Σ_ρ 1/|ρ|²), zeros
  counted ONCE. (If RH fails the left side is +∞ and the statement is trivial; so assume RH.)
- **Theorem 1.3 = Theorem 5.4 (main).** liminf_{λ→0} D(λ) √(log(1/λ)) ≥ √(Σ_ρ m_ρ²/|ρ|²), m_ρ the multiplicity.
- **Theorem 1.4 / 2.1 (toy model).** Q(z) = Π_α (1 − ᾱz)^{m_α}, all roots on |z| = 1, degree q ≥ 1, P any polynomial,
  E(N,P) = inf_{deg A ≤ N} ∫_{S¹}|P − QA|² dθ/2π. Then lim N E(N,P) = Σ_α m_α² |P(α)|². (Extracted from
  Grenander–Rosenblatt 1954; a root inside the disc gives E bounded below; all roots outside the closed disc give
  exponential decay.)
- **Prop. 4.1 (Burnol, Ehm).** Z(s) = ((s−1)/s)(ζ(s)/s) ∈ H² = Mellin of L²(]0,1]); inverse Mellin
  A(t) = [1/t] log t + log([1/t]!) + [1/t] = ½ log(1/t) + O(1).
- **Theorem and Definition 4.2.** For 0 < λ ≤ 1, Re s = ½, k ≥ 0, the L²-limit Y^λ_{s,k} = lim_{w→s, Re w<½}
  V^{−1}Q_λ V(ψ_{w,k}) exists, where V is the invariant unitary with multiplier (s/(1−s))³ ζ(1−s)/ζ(s), V = (1−M)²U
  (U Báez-Duarte's operator, M the Hardy averaging operator), Q_λ = projection onto L²([λ,∞[), ψ_{w,k}(t) =
  (log 1/t)^k t^{−w} χ(t); and (D_θ(A), Y^λ_{s,k}) = (−d/ds)^k θ^{s−½} Z(s) for λ ≤ θ ≤ 1.
  **Corollary 4.3:** Y^λ_{s,k} ⊥ 𝓒_λ (span of D_θ(A), λ ≤ θ ≤ 1) iff s = ρ is a zero and k < m_ρ.
- Existence rests on **BDBLS "Lemme 6"** (Theorems 4.5, 4.8: pointwise limits φ_{w,k}(t) = (d/dw)^k(U(w)t^{−w}) + O(1)
  on ]0,1], O(1/t) on [1,∞[; the k ≥ 1 case is proved here).
- **Theorem 5.2.** X^λ_{ρ,k} := (log 1/λ)^{−½−k} Y^λ_{ρ,k}: Gram matrix → block diagonal, Cauchy blocks 1/(k+l+1).
  **Theorem 5.3.** √(log 1/λ)(χ_1, X^λ_{ρ,0}) → (ρ−1)/ρ², other k → 0 (χ_1(t) = (1 + log t)χ(t); D(λ) is the distance
  from χ_1 to 𝓒_λ). The top-left entry of the inverse Cauchy matrix of size m is m² (Cauchy), giving Theorem 5.4.

## 3. Method in ten lines
1. Work in the Mellin picture: 𝓑_λ is a space of multiplicative translates; invariant operators are multipliers.
2. Replace −ζ(s)/s by Z(s) ∈ H² (its "time function" is A(t)).
3. The phase operator V (Báez-Duarte construction) maps the dilates of A to their time-reversals, so 𝓒_λ sits
   isometrically inside L²([λ,∞[).
4. There one can WRITE DOWN vectors orthogonal to 𝓒_λ: Y = V^{−1}Q_λV(ψ_{w,k}) with w → ρ (the zero kills the
   inner product).
5. Distance from χ_1 to 𝓒_λ ≥ norm of the projection of χ_1 on span{X^λ_{ρ,k}}, for any finite set of zeros.
6. As λ → 0 the X^λ_{ρ,k} for distinct ρ become orthogonal (scalar products of t^{−s1}, t^{−(1−s2)} on [λ, 1] grow
   like (log 1/λ)^{j1+j2+1} only when s1 = s2).
7. Exactly the Grenander–Rosenblatt computation for a moving average with roots on the unit circle.
8. Each zero on the line contributes m_ρ²/|ρ|² to (log 1/λ)·D(λ)².
9. No arithmetic of the approximating coefficients is used; the bound holds for the best approximant.
10. Speculation (§5, not proved): the bound may be the exact order; there may be a "continuous spectrum" in the
    quotient H²/𝓒_λ that the rescaling kills, leaving a Hilbert–Pólya space; BDBLS's numerics "seem to support" this.

## 4. What is assumed
Nothing (Theorem 1.3 unconditional; trivial if RH fails). Inputs: BDBLS 2000 Lemme 4 and Lemme 6; Báez-Duarte,
Adv. Math. 144 (1999) for U; Grenander–Rosenblatt for the toy model.

## 5. Where it stops
- Proves a LOWER bound for the CONTINUOUS-dilation distance D(λ). Says nothing about upper bounds, and does not
  itself state the DISCRETE version (dilations k ≤ N, Báez-Duarte's d_N): later papers (BCF 1211.5191, Balazard–de
  Roton 0812.1689) quote "Burnol: liminf d_N² log N ≥ Σ m(ρ)²/|ρ|²" for the discrete d_N. The transfer from D(λ) to
  d_N is not in this text.
- Open (stated): whether the lower bound is the exact order; the construction of a "Hilbert–Pólya space" in the
  limit λ → 0 (probably needs scattering theory).

## 6. What it changes in our record
- `docs/KNOWLEDGE.md` E5: "Burnol (2002): lower bound liminf d_N² log N ≥ Σ_ρ m(ρ)²/|ρ|² unconditionally". The theorem
  in Burnol's paper is for D(λ) with continuous dilations θ ∈ [λ, 1] and log(1/λ) in place of log N; the d_N form is
  how BCF and Balazard–de Roton cite it. Imprecise attribution, not a wrong statement (BDBLS 2005 and the citing
  papers treat both; the reader did not verify the transfer).
- KNOWLEDGE E5 states the BDBLS conjecture as d_N² ~ (2 + γ − log 4π)/log N. Per BCF and Balazard–de Roton the
  conjecture is equality in Burnol's bound; the form with 2 + γ − log 4π = Σ m(ρ)/|ρ|² presupposes RH, and equality
  with Σ m²/|ρ|² then forces simple zeros (Balazard–de Roton: "Cette conjecture entraîne donc l'hypothèse de Riemann
  et la simplicité des zéros").
- `rh/NOTEBOOK.md` N52 ("Burnol's unconditional LOWER bound for d_N is the Fisher–Hartwig contribution of the zeros
  on the line"): Burnol's own §2 makes the analogy with Grenander–Rosenblatt (a Szegő-type problem for a symbol with
  zeros on the circle), which is the Fisher–Hartwig setting; so N52's reading is already Burnol's (2001), stated as
  motivation, with the multiplicity-squared weight as the Cauchy-matrix fingerprint.
- N53 (c) "where in the integral the difficulty lies": in this paper each zero ρ is seen through t^{−ρ} on [λ, 1], i.e.
  at heights |Im ρ| weighted by 1/|ρ|²: the LOW zeros dominate the distance. Consistent with N53's "bounded height".

## 7. Reliability
Refereed (Adv. Math.). Some existence statements are delegated to BDBLS 2000 ("everything is either stated explicitly
in [Bal], Lemme 6 and Lemme 4, or follows from their proofs"), which the reader could not obtain (ScienceDirect
answered with HTTP 403; not circumvented).
