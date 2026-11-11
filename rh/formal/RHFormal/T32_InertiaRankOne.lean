import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dimension.StrongRankCondition
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Prod
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic
set_option autoImplicit false

/-!
# T32: exact inertia relation between a Weil block and the corresponding block of N (rank-one pole)

Source: `rh/THEORY.md`, entry T32; board s1, posts B56 and B92 (S1-parity, nominated for Lean);
derivation written out in `rh/experiments/k_theory/PROGRESS.md`. Routes #9 (live), #10.

Informal statement (THEORY.md T32, quoted):

> FINITE SETTING. V a finite-dimensional real inner-product space ... Q a real symmetric J-invariant
> form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o ...
> Assume Q_e and Q_o invertible and put t_e := 2 c^T Q_e^{-1} c, t_o := 2 s^T Q_o^{-1} s, with
> t_e != 1 and t_o != -1. Then (number of positive eigenvalues of N_e) = (number of negative
> eigenvalues of Q_e) + [t_e > 1], and (number of positive eigenvalues of N_o) = (number of negative
> eigenvalues of Q_o) - [t_o < -1] ... No sign hypothesis on Q.

and (board B92, quoted): "for a real symmetric n x n matrix M let pos(M) = the largest dimension of a
subspace V of R^n with x^T M x > 0 for all non-zero x in V, and neg(M) = pos(-M)."

HOW IT IS STATED HERE. The two blocks are treated one at a time: `V` is the block (any real vector
space, any dimension), `Q` a symmetric bilinear form on it, `c` a linear functional (the pole vector
`c` resp. `s`), and `w : V` a vector with `Q(w, ·) = c` (this is `w = Q^{-1} c`), `t = 2 c(w)`.
Indices are measured as in B92, without eigenvalues:

  `NegDim q k` : there is a finite-dimensional subspace of dimension `≥ k` on which `q` is negative
                 definite   (i.e. `neg(q) ≥ k`);
  `PosDim q k` : the same with positive definite   (i.e. `pos(q) ≥ k`).

Main results (`Qd x = Q x x`):
* `even_le` : if `t ≤ 1`: `∀ k, neg(Q) ≥ k ↔ pos(2cc^T - Q) ≥ k`          (pos(N_e) = neg(Q_e));
* `even_gt` : if `t > 1`: `∀ k, neg(Q) ≥ k ↔ pos(2cc^T - Q) ≥ k + 1`      (pos(N_e) = neg(Q_e) + 1);
* `odd_gt`  : if `t > -1`: `∀ k, neg(Q) ≥ k ↔ pos(-2ss^T - Q) ≥ k`        (pos(N_o) = neg(Q_o));
* `odd_le`  : if `t ≤ -1`: `∀ k, neg(Q) ≥ k + 1 ↔ pos(-2ss^T - Q) ≥ k`    (pos(N_o) = neg(Q_o) - 1).

DIFFERENCES FROM THE INFORMAL STATEMENT.
* "Number of positive / negative eigenvalues" is replaced by the largest dimension of a positive /
  negative definite subspace (S1-parity's own formulation in B92). For a real symmetric matrix the
  two agree by Sylvester's law of inertia; that identification is NOT formalised (textbook, `known`).
* MORE GENERAL than T32: no finite dimension, no inner product, and invertibility of `Q` is not
  assumed: only the existence of `w` with `Q w = c`. The excluded cases `t_e = 1`, `t_o = -1` are
  covered (they go with `t_e < 1`, resp. `t_o < -1`): Lean did not need `t ≠ 1`.
* The parity structure (J, V_e, V_o) is not in the file: it only says which block and which
  functional to plug in.
-/

namespace RHFormal.T32

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- `neg(q) ≥ k`: there is a finite-dimensional subspace of dimension at least `k` on which `q` is
negative definite. -/
def NegDim (q : V → ℝ) (k : ℕ) : Prop :=
  ∃ W : Submodule ℝ V, FiniteDimensional ℝ W ∧ k ≤ Module.finrank ℝ W ∧ ∀ x ∈ W, x ≠ 0 → q x < 0

/-- `pos(q) ≥ k`: there is a finite-dimensional subspace of dimension at least `k` on which `q` is
positive definite. -/
def PosDim (q : V → ℝ) (k : ℕ) : Prop :=
  ∃ W : Submodule ℝ V, FiniteDimensional ℝ W ∧ k ≤ Module.finrank ℝ W ∧ ∀ x ∈ W, x ≠ 0 → 0 < q x

theorem posDim_iff_negDim_neg (q : V → ℝ) (k : ℕ) : PosDim q k ↔ NegDim (fun x => -q x) k := by
  constructor
  · rintro ⟨W, h1, h2, h3⟩
    exact ⟨W, h1, h2, fun x hx hx0 => by have := h3 x hx hx0; linarith⟩
  · rintro ⟨W, h1, h2, h3⟩
    exact ⟨W, h1, h2, fun x hx hx0 => by have := h3 x hx hx0; linarith⟩

theorem NegDim.mono {q : V → ℝ} {k n : ℕ} (h : NegDim q n) (hk : k ≤ n) : NegDim q k := by
  obtain ⟨W, h1, h2, h3⟩ := h
  exact ⟨W, h1, hk.trans h2, h3⟩

section core

variable {V' : Type*} [AddCommGroup V'] [Module ℝ V']

/-- Core step: if `q ∘ f` is negative on the non-zero vectors of a finite-dimensional subspace `U`,
then `f` is injective on `U` and `q` is negative definite on `f(U)`, of the same dimension. -/
theorem negDim_of_map (q : V → ℝ) (hq0 : q 0 = 0) (U : Submodule ℝ V') [FiniteDimensional ℝ U]
    (f : V' →ₗ[ℝ] V) (h : ∀ x ∈ U, x ≠ 0 → q (f x) < 0) : NegDim q (Module.finrank ℝ U) := by
  have hinj : Function.Injective (f.comp U.subtype) := by
    rw [injective_iff_map_eq_zero]
    intro x hx
    by_contra hne
    have hx0 : (x : V') ≠ 0 := fun h0 => hne (Subtype.ext h0)
    have h1 := h x x.2 hx0
    have hfx : f (x : V') = 0 := hx
    rw [hfx, hq0] at h1
    exact lt_irrefl _ h1
  refine ⟨LinearMap.range (f.comp U.subtype), inferInstance, ?_, ?_⟩
  · rw [LinearMap.finrank_range_of_inj hinj]
  · rintro y ⟨x, rfl⟩ hy
    have hx0 : (x : V') ≠ 0 := by
      intro h0
      apply hy
      have hx : x = 0 := Subtype.ext h0
      rw [hx, map_zero]
    exact h x x.2 hx0

/-- Pull-back along a linear map: if `q' = q ∘ f` then `neg(q') ≥ k` implies `neg(q) ≥ k`. -/
theorem negDim_of_pullback (q : V → ℝ) (q' : V' → ℝ) (hq0 : q 0 = 0) (f : V' →ₗ[ℝ] V)
    (hf : ∀ v, q' v = q (f v)) {k : ℕ} (h : NegDim q' k) : NegDim q k := by
  obtain ⟨W, hW, hk, hneg⟩ := h
  have := hW
  refine (negDim_of_map q hq0 W f ?_).mono hk
  intro x hx hx0
  rw [← hf]
  exact hneg x hx hx0

end core

/-- The orthogonal sum of `q` with the one-dimensional form `d y^2`, on `V × ℝ`. -/
def sumForm (q : V → ℝ) (d : ℝ) (v : V × ℝ) : ℝ := q v.1 + d * v.2 ^ 2

/-- Adding a one-dimensional form with `d ≥ 0` does not change the negative index. -/
theorem negDim_sumForm_of_nonneg (q : V → ℝ) (hq0 : q 0 = 0) (d : ℝ) (hd : 0 ≤ d) (k : ℕ) :
    NegDim (sumForm q d) k ↔ NegDim q k := by
  constructor
  · rintro ⟨U, hU, hk, hneg⟩
    have := hU
    refine (negDim_of_map q hq0 U (LinearMap.fst ℝ V ℝ) ?_).mono hk
    intro x hx hx0
    have h1 := hneg x hx hx0
    simp only [sumForm] at h1
    have h2 : 0 ≤ d * x.2 ^ 2 := by positivity
    simp only [LinearMap.fst_apply]
    linarith
  · intro h
    refine negDim_of_pullback (sumForm q d) q (by simp [sumForm, hq0]) (LinearMap.inl ℝ V ℝ) ?_ h
    intro v
    simp [sumForm]

/-- Adding a one-dimensional form with `d < 0` raises the negative index by exactly one. -/
theorem negDim_sumForm_of_neg (q : V → ℝ) (hq0 : q 0 = 0) (d : ℝ) (hd : d < 0) (k : ℕ) :
    NegDim (sumForm q d) (k + 1) ↔ NegDim q k := by
  constructor
  · rintro ⟨U, hU, hk, hneg⟩
    have := hU
    -- the second coordinate, as a functional on U; its kernel has dimension ≥ k
    have hrn := LinearMap.finrank_range_add_finrank_ker ((LinearMap.snd ℝ V ℝ).comp U.subtype)
    have hr1 : Module.finrank ℝ (LinearMap.range ((LinearMap.snd ℝ V ℝ).comp U.subtype)) ≤ 1 := by
      have h1 := Submodule.finrank_le (LinearMap.range ((LinearMap.snd ℝ V ℝ).comp U.subtype))
      rwa [Module.finrank_self] at h1
    have hker : k ≤ Module.finrank ℝ (LinearMap.ker ((LinearMap.snd ℝ V ℝ).comp U.subtype)) := by
      omega
    refine (negDim_of_map q hq0 (LinearMap.ker ((LinearMap.snd ℝ V ℝ).comp U.subtype))
      ((LinearMap.fst ℝ V ℝ).comp U.subtype) ?_).mono hker
    intro x hx hx0
    have hx2 : (x : V × ℝ).2 = 0 := hx
    have hxU0 : (x : V × ℝ) ≠ 0 := fun h0 => hx0 (Subtype.ext h0)
    have h1 := hneg x x.2 hxU0
    simp only [sumForm, hx2] at h1
    simpa using h1
  · rintro ⟨W, hW, hk, hneg⟩
    have := hW
    refine (negDim_of_map (sumForm q d) (by simp [sumForm, hq0]) (⊤ : Submodule ℝ (W × ℝ))
      (LinearMap.prodMap W.subtype LinearMap.id) ?_).mono ?_
    · rintro ⟨a, y⟩ - hne
      simp only [LinearMap.prodMap_apply, Submodule.subtype_apply, LinearMap.id_apply, sumForm]
      by_cases ha : (a : V) = 0
      · have hy : y ≠ 0 := by
          intro hy
          apply hne
          have ha' : a = 0 := Subtype.ext ha
          rw [ha', hy]
          rfl
        rw [ha, hq0]
        have : 0 < y ^ 2 := by positivity
        nlinarith
      · have h1 := hneg a a.2 ha
        have h2 : d * y ^ 2 ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hd.le (sq_nonneg y)
        linarith
    · rw [finrank_top, Module.finrank_prod, Module.finrank_self]
      omega

/-! ### The bordered form and its two diagonalisations -/

variable (Q : LinearMap.BilinForm ℝ V) (c : V →ₗ[ℝ] ℝ)

/-- The bordered form `B_e(x, y) = x^T Q x + 2 y c(x) + e y^2` on `V × ℝ`
(`e = 1/2` for the even block, `e = -1/2` for the odd block). -/
def bordered (e : ℝ) (v : V × ℝ) : ℝ := Q v.1 v.1 + 2 * v.2 * c v.1 + e * v.2 ^ 2

/-- The shear `(x, y) ↦ (x + y w, y)`. -/
def shear (w : V) : V × ℝ →ₗ[ℝ] V × ℝ :=
  LinearMap.prod (LinearMap.fst ℝ V ℝ + (LinearMap.snd ℝ V ℝ).smulRight w) (LinearMap.snd ℝ V ℝ)

theorem shear_apply (w : V) (v : V × ℝ) : shear w v = (v.1 + v.2 • w, v.2) := by
  simp [shear]

/-- The shear `(x, y) ↦ (x, y + g(x))`. -/
def border (g : V →ₗ[ℝ] ℝ) : V × ℝ →ₗ[ℝ] V × ℝ :=
  LinearMap.prod (LinearMap.fst ℝ V ℝ) (LinearMap.snd ℝ V ℝ + g.comp (LinearMap.fst ℝ V ℝ))

theorem border_apply (g : V →ₗ[ℝ] ℝ) (v : V × ℝ) : border g v = (v.1, v.2 + g v.1) := by
  simp [border]

variable (w : V)

/-- First diagonalisation: `B_e(x, y) = Q(x + y w) + (e - c(w)) y^2` when `Q w = c`. -/
theorem bordered_eq_shift (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (e : ℝ)
    (v : V × ℝ) :
    bordered Q c e v = sumForm (fun x => Q x x) (e - c w) (shear w v) := by
  simp only [bordered, sumForm, shear_apply, map_add, map_smul, LinearMap.add_apply,
    LinearMap.smul_apply, smul_eq_mul]
  rw [hQ v.1 w, hw v.1, hw w]
  ring

/-- First diagonalisation, inverse direction. -/
theorem shift_eq_bordered (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (e : ℝ)
    (v : V × ℝ) :
    sumForm (fun x => Q x x) (e - c w) v = bordered Q c e (shear (-w) v) := by
  simp only [bordered, sumForm, shear_apply, map_add, map_smul, map_neg, LinearMap.add_apply,
    LinearMap.smul_apply, LinearMap.neg_apply, smul_eq_mul]
  rw [hQ v.1 w, hw v.1, hw w]
  ring

/-- Second diagonalisation: `B_e(x, y) = (Q(x) - c(x)^2/e) + e (y + c(x)/e)^2` for `e ≠ 0`. -/
theorem bordered_eq_border (e : ℝ) (he : e ≠ 0) (v : V × ℝ) :
    bordered Q c e v
      = sumForm (fun x => Q x x - c x ^ 2 / e) e (border (e⁻¹ • c) v) := by
  simp only [bordered, sumForm, border_apply, LinearMap.smul_apply, smul_eq_mul]
  field_simp
  ring

/-- Second diagonalisation, inverse direction. -/
theorem border_eq_bordered (e : ℝ) (he : e ≠ 0) (v : V × ℝ) :
    sumForm (fun x => Q x x - c x ^ 2 / e) e v = bordered Q c e (border (-(e⁻¹ • c)) v) := by
  simp only [bordered, sumForm, border_apply, LinearMap.smul_apply, LinearMap.neg_apply,
    smul_eq_mul]
  field_simp
  ring

/-- **Congruence.** For `Q w = c` and `e ≠ 0` the forms `Q ⊕ (e - c(w))` and `(Q - c c^T/e) ⊕ e`
on `V × ℝ` have the same negative index. -/
theorem negDim_congruence (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (e : ℝ)
    (he : e ≠ 0) (k : ℕ) :
    NegDim (sumForm (fun x => Q x x) (e - c w)) k
      ↔ NegDim (sumForm (fun x => Q x x - c x ^ 2 / e) e) k := by
  have z1 : sumForm (fun x => Q x x) (e - c w) 0 = 0 := by simp [sumForm]
  have z2 : sumForm (fun x => Q x x - c x ^ 2 / e) e 0 = 0 := by simp [sumForm]
  have z3 : bordered Q c e 0 = 0 := by simp [bordered]
  constructor
  · intro h
    have h1 : NegDim (bordered Q c e) k :=
      negDim_of_pullback _ _ z3 (shear (-w)) (shift_eq_bordered Q c w hQ hw e) h
    exact negDim_of_pullback _ _ z2 (border (e⁻¹ • c)) (bordered_eq_border Q c e he) h1
  · intro h
    have h1 : NegDim (bordered Q c e) k :=
      negDim_of_pullback _ _ z3 (border (-(e⁻¹ • c))) (border_eq_bordered Q c e he) h
    exact negDim_of_pullback _ _ z1 (shear w) (bordered_eq_shift Q c w hQ hw e) h1

/-! ### T32 -/

/-- **T32, even block, `t ≤ 1`.** With `Q w = c`, `t = 2 c(w) ≤ 1`, `N = 2 c c^T - Q`:
`neg(Q) ≥ k ↔ pos(N) ≥ k` for every `k`, i.e. `pos(N) = neg(Q)`. -/
theorem even_le (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (ht : 2 * c w ≤ 1) (k : ℕ) :
    NegDim (fun x => Q x x) k ↔ PosDim (fun x => 2 * c x ^ 2 - Q x x) k := by
  have hq0 : (fun x : V => Q x x) 0 = 0 := by simp
  have hn0 : (fun x : V => Q x x - c x ^ 2 / (1 / 2)) 0 = 0 := by simp
  have e1 : (fun x : V => -(2 * c x ^ 2 - Q x x)) = (fun x : V => Q x x - c x ^ 2 / (1 / 2)) := by
    funext x
    ring
  rw [posDim_iff_negDim_neg, e1,
    ← negDim_sumForm_of_nonneg (fun x => Q x x) hq0 (1 / 2 - c w) (by linarith) k,
    negDim_congruence Q c w hQ hw (1 / 2) (by norm_num) k,
    negDim_sumForm_of_nonneg _ hn0 (1 / 2) (by norm_num) k]

/-- **T32, even block, `t > 1`.** With `Q w = c`, `t = 2 c(w) > 1`, `N = 2 c c^T - Q`:
`neg(Q) ≥ k ↔ pos(N) ≥ k + 1` for every `k`, i.e. `pos(N) = neg(Q) + 1`. -/
theorem even_gt (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (ht : 1 < 2 * c w) (k : ℕ) :
    NegDim (fun x => Q x x) k ↔ PosDim (fun x => 2 * c x ^ 2 - Q x x) (k + 1) := by
  have hq0 : (fun x : V => Q x x) 0 = 0 := by simp
  have hn0 : (fun x : V => Q x x - c x ^ 2 / (1 / 2)) 0 = 0 := by simp
  have e1 : (fun x : V => -(2 * c x ^ 2 - Q x x)) = (fun x : V => Q x x - c x ^ 2 / (1 / 2)) := by
    funext x
    ring
  rw [posDim_iff_negDim_neg, e1,
    ← negDim_sumForm_of_neg (fun x => Q x x) hq0 (1 / 2 - c w) (by linarith) k,
    negDim_congruence Q c w hQ hw (1 / 2) (by norm_num) (k + 1),
    negDim_sumForm_of_nonneg _ hn0 (1 / 2) (by norm_num) (k + 1)]

/-- **T32, odd block, `t > -1`.** With `Q w = s`, `t = 2 s(w) > -1`, `N = -2 s s^T - Q`
(the functional is called `c` here): `neg(Q) ≥ k ↔ pos(N) ≥ k`, i.e. `pos(N) = neg(Q)`. -/
theorem odd_gt (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (ht : -1 < 2 * c w) (k : ℕ) :
    NegDim (fun x => Q x x) k ↔ PosDim (fun x => -2 * c x ^ 2 - Q x x) k := by
  have hq0 : (fun x : V => Q x x) 0 = 0 := by simp
  have hn0 : (fun x : V => Q x x - c x ^ 2 / (-1 / 2)) 0 = 0 := by simp
  have e1 : (fun x : V => -(-2 * c x ^ 2 - Q x x))
      = (fun x : V => Q x x - c x ^ 2 / (-1 / 2)) := by
    funext x
    ring
  rw [posDim_iff_negDim_neg, e1,
    ← negDim_sumForm_of_neg (fun x => Q x x) hq0 (-1 / 2 - c w) (by linarith) k,
    negDim_congruence Q c w hQ hw (-1 / 2) (by norm_num) (k + 1),
    negDim_sumForm_of_neg _ hn0 (-1 / 2) (by norm_num) k]

/-- **T32, odd block, `t ≤ -1`.** With `Q w = s`, `t = 2 s(w) ≤ -1`, `N = -2 s s^T - Q`:
`neg(Q) ≥ k + 1 ↔ pos(N) ≥ k`, i.e. `pos(N) = neg(Q) - 1`. -/
theorem odd_le (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (ht : 2 * c w ≤ -1) (k : ℕ) :
    NegDim (fun x => Q x x) (k + 1) ↔ PosDim (fun x => -2 * c x ^ 2 - Q x x) k := by
  have hq0 : (fun x : V => Q x x) 0 = 0 := by simp
  have hn0 : (fun x : V => Q x x - c x ^ 2 / (-1 / 2)) 0 = 0 := by simp
  have e1 : (fun x : V => -(-2 * c x ^ 2 - Q x x))
      = (fun x : V => Q x x - c x ^ 2 / (-1 / 2)) := by
    funext x
    ring
  rw [posDim_iff_negDim_neg, e1,
    ← negDim_sumForm_of_nonneg (fun x => Q x x) hq0 (-1 / 2 - c w) (by linarith) (k + 1),
    negDim_congruence Q c w hQ hw (-1 / 2) (by norm_num) (k + 1),
    negDim_sumForm_of_neg _ hn0 (-1 / 2) (by norm_num) k]

end RHFormal.T32
