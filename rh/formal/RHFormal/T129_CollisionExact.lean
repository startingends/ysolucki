import RHFormal.T129_PairGram
import Mathlib.Algebra.Polynomial.Inductions
import Mathlib.Algebra.Polynomial.Eval.Coeff
import Mathlib.Algebra.BigOperators.Ring.Finset
set_option autoImplicit false

/-!
# T129 (exact polynomial form): `det Gram(k₊, k₋) = 4 ‖k‖² J u + u² R(u)` with `R` a polynomial

Source: `rh/THEORY.md` T129; `rh/specialists/operator/TWO_ZERO.md` 3.4 ("Collision expansion ... for any
analytic family of kernel vectors k(t): with k± = k(c ± √u), λ_min Gram{k₊, k₋} = 2u·J(c) + O(u²) ...
κ₂(u) = 4J(c)·u + O(u²)"). Coordinator, session 4: "state it without analysis (e.g. the determinant is
exactly 4Ju + u^2·R(u) with R a polynomial)".

SETTING (exact, no analysis). The family is a POLYNOMIAL in `t` with vector coefficients, written
around `c`: `k(c + s) = ∑_{i<N} s^{2i} a_i + ∑_{i<N} s^{2i+1} b_i` (every vector polynomial splits this
way; `a₀ = k(c)`, `b₀ = k'(c)`). With `s = √u`: `k₊ = k(c + s)`, `k₋ = k(c - s)`.

FORMAL HERE (`E` a real inner product space, `N ≥ 1`):
* `det_exact` : there is a polynomial `R ∈ ℝ[X]` (depending on `a, b, N`, not on `s`) with
  `det Gram(k₊, k₋) = 4 · det Gram(a₀, b₀) · u + u² · R(u)` for every real `s`, `u = s²`;
* `trace_exact` : a polynomial `T` with `trace Gram(k₊, k₋) = 2‖a₀‖² + u · T(u)`;
* `det_exact_J` : for `a₀ ≠ 0`, `det Gram(a₀, b₀) = ‖a₀‖² J` with `J = ‖b₀ - (⟨b₀,a₀⟩/‖a₀‖²) a₀‖²`,
  so `det = 4 ‖k(c)‖² J u + u² R(u)`: the exact form of "κ₂ = 4Ju + O(u²)" at the level of the
  determinant (`κ₂ = 2 λ_min`, and `λ_min` lies between `det/trace` and `det·trace/(trace² - 2 det)`
  by `T129.lam_bounds`).

DIFFERENCES: polynomial families only (an analytic family is the limit of its Taylor polynomials;
that limit is not formalised). `u = s² ≥ 0` (the continuation to `u = -β²` is not formalised; the
identity is a polynomial identity in `u` and holds wherever both sides are defined by the same
polynomials). The step from the determinant to `λ_min = 2uJ + O(u²)` is the pair of inequalities
`T129.lam_bounds`; the `O(u²)` constant is not made explicit.
-/

open Finset Polynomial
open scoped RealInnerProductSpace

namespace RHFormal.T129

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The vector polynomial `P_x(u) = ∑_{i<N} u^i x_i`. -/
def vpoly (N : ℕ) (x : ℕ → E) (u : ℝ) : E := ∑ i ∈ range N, u ^ i • x i

/-- The scalar polynomial `∑_{i,j<N} ⟨x_i, y_j⟩ X^{i+j}`, whose value at `u` is `⟨P_x(u), P_y(u)⟩`. -/
noncomputable def ipoly (N : ℕ) (x y : ℕ → E) : ℝ[X] :=
  ∑ i ∈ range N, ∑ j ∈ range N, C ⟪x i, y j⟫ * X ^ (i + j)

theorem eval_ipoly (N : ℕ) (x y : ℕ → E) (u : ℝ) :
    (ipoly N x y).eval u = ⟪vpoly N x u, vpoly N y u⟫ := by
  simp only [ipoly, vpoly, eval_finsetSum, eval_mul, eval_C, eval_pow, eval_X]
  rw [sum_inner]
  simp only [inner_sum, real_inner_smul_left, real_inner_smul_right]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  rw [pow_add]
  ring

/-- `det Gram(P_a(u), P_b(u))` as a polynomial in `u`. -/
noncomputable def gpoly (N : ℕ) (a b : ℕ → E) : ℝ[X] :=
  ipoly N a a * ipoly N b b - ipoly N a b ^ 2

theorem eval_gpoly (N : ℕ) (a b : ℕ → E) (u : ℝ) :
    (gpoly N a b).eval u = gramDet (vpoly N a u) (vpoly N b u) := by
  simp only [gpoly, eval_sub, eval_mul, eval_pow, eval_ipoly, gramDet]

theorem vpoly_zero (N : ℕ) (hN : 1 ≤ N) (x : ℕ → E) : vpoly N x 0 = x 0 := by
  simp only [vpoly]
  rw [Finset.sum_eq_single 0]
  · simp
  · intro i _ hi
    simp [zero_pow hi]
  · intro h
    exact absurd (Finset.mem_range.2 (by omega)) h

/-- `G(u) = G(0) + u · R(u)` for a polynomial `G` (`R = divX G`). -/
theorem eval_eq_zero_add (G : ℝ[X]) (u : ℝ) :
    G.eval u = G.eval 0 + u * (divX G).eval u := by
  have h := congrArg (Polynomial.eval u) (divX_mul_X_add G)
  rw [eval_add, eval_mul, eval_X, eval_C, coeff_zero_eq_eval_zero] at h
  linarith

/-- `gramDet x (s • y) = s² · gramDet x y`. -/
theorem gramDet_smul_right (x y : E) (s : ℝ) : gramDet x (s • y) = s ^ 2 * gramDet x y := by
  simp only [gramDet, real_inner_smul_left, real_inner_smul_right]
  ring

/-- The two kernel vectors `k₊ = k(c + s)`, `k₋ = k(c - s)` of the family. -/
def kplus (N : ℕ) (a b : ℕ → E) (s : ℝ) : E :=
  ∑ i ∈ range N, s ^ (2 * i) • a i + ∑ i ∈ range N, s ^ (2 * i + 1) • b i

theorem kplus_eq (N : ℕ) (a b : ℕ → E) (s : ℝ) :
    kplus N a b s = vpoly N a (s ^ 2) + s • vpoly N b (s ^ 2) := by
  simp only [kplus, vpoly, Finset.smul_sum, smul_smul]
  congr 1
  · refine Finset.sum_congr rfl fun i _ => ?_
    rw [pow_mul]
  · refine Finset.sum_congr rfl fun i _ => ?_
    rw [pow_succ, pow_mul, mul_comm]

theorem kminus_eq (N : ℕ) (a b : ℕ → E) (s : ℝ) :
    kplus N a b (-s) = vpoly N a (s ^ 2) - s • vpoly N b (s ^ 2) := by
  rw [kplus_eq, neg_sq, neg_smul, sub_eq_add_neg]

/-- **T129, exact determinant.** For `N ≥ 1` there is a polynomial `R` with
`det Gram(k(c+s), k(c-s)) = 4 · det Gram(a₀, b₀) · u + u² · R(u)`, `u = s²`, for every `s`. -/
theorem det_exact (N : ℕ) (hN : 1 ≤ N) (a b : ℕ → E) :
    ∃ R : ℝ[X], ∀ s : ℝ,
      gramDet (kplus N a b s) (kplus N a b (-s))
        = 4 * gramDet (a 0) (b 0) * s ^ 2 + (s ^ 2) ^ 2 * R.eval (s ^ 2) := by
  refine ⟨C 4 * divX (gpoly N a b), fun s => ?_⟩
  rw [kplus_eq, kminus_eq, gramDet_sum_diff, gramDet_smul_right, ← eval_gpoly,
    eval_eq_zero_add (gpoly N a b) (s ^ 2), eval_gpoly, vpoly_zero N hN, vpoly_zero N hN,
    eval_mul, eval_C]
  ring

/-- **T129, exact trace.** A polynomial `T` with `trace Gram(k₊, k₋) = 2 ‖a₀‖² + u · T(u)`. -/
theorem trace_exact (N : ℕ) (hN : 1 ≤ N) (a b : ℕ → E) :
    ∃ T : ℝ[X], ∀ s : ℝ,
      ⟪kplus N a b s, kplus N a b s⟫ + ⟪kplus N a b (-s), kplus N a b (-s)⟫
        = 2 * ⟪a 0, a 0⟫ + s ^ 2 * T.eval (s ^ 2) := by
  let G : ℝ[X] := C 2 * (ipoly N a a + X * ipoly N b b)
  refine ⟨divX G, fun s => ?_⟩
  have hG : ∀ u, G.eval u = 2 * (⟪vpoly N a u, vpoly N a u⟫ + u * ⟪vpoly N b u, vpoly N b u⟫) := by
    intro u
    simp only [G, eval_mul, eval_C, eval_add, eval_X, eval_ipoly]
  have h1 := eval_eq_zero_add G (s ^ 2)
  rw [hG, hG, vpoly_zero N hN] at h1
  rw [kplus_eq, kminus_eq, gramTrace_sum_diff]
  simp only [real_inner_smul_left, real_inner_smul_right] at h1 ⊢
  nlinarith [h1]

/-- **T129 with `J`.** For `a₀ = k(c) ≠ 0` and `J := ‖b₀ - (⟨b₀,a₀⟩/‖a₀‖²) a₀‖²`:
`det Gram(k₊, k₋) = 4 ‖k(c)‖² J u + u² R(u)` with `R` a polynomial. -/
theorem det_exact_J (N : ℕ) (hN : 1 ≤ N) (a b : ℕ → E) (ha : a 0 ≠ 0) :
    ∃ R : ℝ[X], ∀ s : ℝ,
      gramDet (kplus N a b s) (kplus N a b (-s))
        = 4 * ⟪a 0, a 0⟫ * ⟪b 0 - (⟪b 0, a 0⟫ / ⟪a 0, a 0⟫) • a 0,
            b 0 - (⟪b 0, a 0⟫ / ⟪a 0, a 0⟫) • a 0⟫ * s ^ 2 + (s ^ 2) ^ 2 * R.eval (s ^ 2) := by
  obtain ⟨R, hR⟩ := det_exact N hN a b
  refine ⟨R, fun s => ?_⟩
  rw [hR s, gramDet_eq_J (a 0) (b 0) ha]
  ring

end RHFormal.T129
