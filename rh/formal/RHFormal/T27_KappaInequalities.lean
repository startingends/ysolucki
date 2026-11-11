import RHFormal.T32_InertiaRankOne

/-!
# T27: negative squares of Q are bounded by positive squares of N, with no hypothesis

Source: `rh/THEORY.md`, entry T27; `rh/experiments/r2_parity/PROOF_parity_index.md`,
Proposition 3 (b), (c). Routes #10 and T31.

Informal statement (THEORY.md T27, quoted):

> For a hermitian form q let kappa_-(q) (kappa_+(q)) be the supremum of the dimensions of subspaces
> on which q is negative (positive) definite. For every L > 0:
> kappa_-(Q_{L,even}) <= kappa_+(N_{L,even}); kappa_-(Q_{L,odd}) <= kappa_+(N_{L,odd}) + 1; hence
> kappa_-(Q_L) <= kappa_+(N_L) + 1. In particular 'kappa_+(N_L) <= 1 for all L' implies
> kappa_-(Q_L) <= 2 for all L.

with (T5, T26) `Q = 2 c c^T - N` on even functions, `Q = -2 s s^T - N` on odd functions and
`Q = 2 c c^T - 2 s s^T - N` on the whole window (`c`, `s` the cosh and sinh functionals).

FORMAL HERE (real scalars; `V` any real vector space; `Q`, `N` arbitrary real functions on `V` tied
by the displayed relation; `c`, `s` linear functionals; `NegDim q k` means `kappa_-(q) ≥ k` and
`PosDim q k` means `kappa_+(q) ≥ k`, as in `T32_InertiaRankOne.lean`):
* `even` : `kappa_-(Q) ≥ k → kappa_+(N) ≥ k`              when `N = 2 c^2 - Q`;
* `odd`  : `kappa_-(Q) ≥ k + 1 → kappa_+(N) ≥ k`          when `N = -2 s^2 - Q`;
* `full` : `kappa_-(Q) ≥ k + 1 → kappa_+(N) ≥ k`          when `Q = 2 c^2 - 2 s^2 - N`;
* `at_most_two` : if `kappa_+(N) ≥ 2` fails then `kappa_-(Q) ≥ 3` fails.

DIFFERENCES: real instead of hermitian forms; `kappa ≥ k` is witnessed by a FINITE-dimensional
definite subspace of dimension `≥ k`. The Lean proof of `full` does not go through the two parity
blocks (the written proof's unwritten step `kappa_-(Q) ≤ kappa_-(Q_e) + kappa_-(Q_o)` is not needed):
it cuts the negative subspace by the single functional `s`.
-/

namespace RHFormal.T27

open RHFormal.T32

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- Cutting a finite-dimensional subspace by one linear functional lowers the dimension by at most
one. -/
theorem exists_ker_subspace (W₀ : Submodule ℝ V) [FiniteDimensional ℝ W₀] (s : V →ₗ[ℝ] ℝ) :
    ∃ W : Submodule ℝ V, W ≤ W₀ ∧ (∀ x ∈ W, s x = 0) ∧
      Module.finrank ℝ W₀ ≤ Module.finrank ℝ W + 1 ∧ FiniteDimensional ℝ W := by
  refine ⟨(LinearMap.ker (s.comp W₀.subtype)).map W₀.subtype, ?_, ?_, ?_, inferInstance⟩
  · rintro x ⟨y, -, rfl⟩
    exact y.2
  · rintro x ⟨y, hy, rfl⟩
    exact hy
  · rw [Submodule.finrank_map_subtype_eq]
    have hrn := LinearMap.finrank_range_add_finrank_ker (s.comp W₀.subtype)
    have hr1 : Module.finrank ℝ (LinearMap.range (s.comp W₀.subtype)) ≤ 1 := by
      have h1 := Submodule.finrank_le (LinearMap.range (s.comp W₀.subtype))
      rwa [Module.finrank_self] at h1
    omega

/-- **T27, even block.** If `N = 2 c^2 - Q` then `kappa_-(Q) ≤ kappa_+(N)`. -/
theorem even (Q N : V → ℝ) (c : V →ₗ[ℝ] ℝ) (h : ∀ x, N x = 2 * c x ^ 2 - Q x) {k : ℕ}
    (hk : NegDim Q k) : PosDim N k := by
  obtain ⟨W, h1, h2, h3⟩ := hk
  refine ⟨W, h1, h2, fun x hx hx0 => ?_⟩
  rw [h]
  have h4 := h3 x hx hx0
  nlinarith [sq_nonneg (c x)]

/-- **T27, odd block.** If `N = -2 s^2 - Q` then `kappa_-(Q) ≤ kappa_+(N) + 1`. -/
theorem odd (Q N : V → ℝ) (s : V →ₗ[ℝ] ℝ) (h : ∀ x, N x = -2 * s x ^ 2 - Q x) {k : ℕ}
    (hk : NegDim Q (k + 1)) : PosDim N k := by
  obtain ⟨W₀, h1, h2, h3⟩ := hk
  have := h1
  obtain ⟨W, hle, hs, hdim, hfd⟩ := exists_ker_subspace W₀ s
  refine ⟨W, hfd, by omega, fun x hx hx0 => ?_⟩
  rw [h, hs x hx]
  have h4 := h3 x (hle hx) hx0
  norm_num
  linarith

/-- **T27, whole window.** If `Q = 2 c^2 - 2 s^2 - N` then `kappa_-(Q) ≤ kappa_+(N) + 1`. -/
theorem full (Q N : V → ℝ) (c s : V →ₗ[ℝ] ℝ) (h : ∀ x, Q x = 2 * c x ^ 2 - 2 * s x ^ 2 - N x)
    {k : ℕ} (hk : NegDim Q (k + 1)) : PosDim N k := by
  obtain ⟨W₀, h1, h2, h3⟩ := hk
  have := h1
  obtain ⟨W, hle, hs, hdim, hfd⟩ := exists_ker_subspace W₀ s
  refine ⟨W, hfd, by omega, fun x hx hx0 => ?_⟩
  have h4 := h3 x (hle hx) hx0
  rw [h, hs x hx] at h4
  nlinarith [sq_nonneg (c x)]

/-- **T27, "in particular".** If `N` has no positive definite plane (`kappa_+(N) ≤ 1`) then `Q` has no
negative definite subspace of dimension 3 (`kappa_-(Q) ≤ 2`). -/
theorem at_most_two (Q N : V → ℝ) (c s : V →ₗ[ℝ] ℝ)
    (h : ∀ x, Q x = 2 * c x ^ 2 - 2 * s x ^ 2 - N x) (hN : ¬ PosDim N 2) : ¬ NegDim Q 3 :=
  fun hQ => hN (full Q N c s h hQ)

end RHFormal.T27
