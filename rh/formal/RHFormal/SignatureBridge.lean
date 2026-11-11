import RHFormal.T32_InertiaRankOne
import Mathlib.LinearAlgebra.QuadraticForm.Signature
set_option autoImplicit false

/-!
# Bridge: the indices `PosDim` / `NegDim` of this library are mathlib's signature of a quadratic form

`T32_InertiaRankOne.lean`, `T50_FibreClassesCount.lean` and `T27_KappaInequalities.lean` measure
"number of positive / negative squares" by

  `PosDim q k` : there is a finite-dimensional subspace of dimension `≥ k` on which `q` is positive
                 definite (and `NegDim` likewise),

which is the formulation of S1-parity (board s1, B92: "pos(M) = the largest dimension of a subspace V
of R^n with x^T M x > 0 for all non-zero x in V") and of theory entry T27 ("kappa_+(q)").

mathlib has the same notion for a quadratic form `Q` on a finite-dimensional space:
`QuadraticForm.sigPos Q`, `QuadraticForm.sigNeg Q` (`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`),
together with the uniqueness part of **Sylvester's law of inertia**
(`QuadraticForm.sigPos_of_equiv_weightedSumSquares`: for any diagonalisation of `Q` as a weighted sum of
squares, `sigPos Q` is the number of positive weights, `sigNeg Q` the number of negative weights).

FORMAL HERE: for a real quadratic form `Q` on a finite-dimensional space,
* `posDim_iff_le_sigPos` : `PosDim Q k ↔ k ≤ Q.sigPos`;
* `negDim_iff_le_sigNeg` : `NegDim Q k ↔ k ≤ Q.sigNeg`.
So in finite dimension every statement "`∀ k, NegDim q k ↔ PosDim n (k + 1)`" of this library reads
`sigPos n = sigNeg q + 1`, in mathlib's own signature, for which Sylvester's law is machine-checked in
mathlib. What then remains between these statements and "number of positive eigenvalues of a real
symmetric matrix" is only that the spectral theorem gives a diagonalisation (not typed here).
-/

namespace RHFormal.SignatureBridge

open RHFormal.T32 QuadraticForm

variable {M : Type*} [AddCommGroup M] [Module ℝ M] [FiniteDimensional ℝ M]

/-- `pos(Q) ≥ k` in the sense of this library iff `k ≤ sigPos Q` in mathlib's sense. -/
theorem posDim_iff_le_sigPos (Q : QuadraticForm ℝ M) (k : ℕ) :
    PosDim (fun x => Q x) k ↔ k ≤ sigPos Q := by
  constructor
  · rintro ⟨W, -, hk, hpos⟩
    have hV : (Q.restrict W).PosDef := by
      intro x hx
      exact hpos x x.2 fun h => hx (Subtype.ext h)
    exact hk.trans (le_sigPos_of_posDef Q hV)
  · intro hk
    obtain ⟨V, hV, hpd⟩ := exists_finrank_eq_sigPos_and_posDef Q
    refine ⟨V, inferInstance, by rw [hV]; exact hk, fun x hx hx0 => ?_⟩
    exact hpd ⟨x, hx⟩ fun h => hx0 (congrArg Subtype.val h)

/-- `neg(Q) ≥ k` in the sense of this library iff `k ≤ sigNeg Q` in mathlib's sense. -/
theorem negDim_iff_le_sigNeg (Q : QuadraticForm ℝ M) (k : ℕ) :
    NegDim (fun x => Q x) k ↔ k ≤ sigNeg Q := by
  have h := posDim_iff_le_sigPos (-Q) k
  rw [← sigNeg] at h
  rw [← h]
  constructor
  · rintro ⟨W, h1, h2, h3⟩
    refine ⟨W, h1, h2, fun x hx hx0 => ?_⟩
    have := h3 x hx hx0
    simp only [neg_apply]
    linarith
  · rintro ⟨W, h1, h2, h3⟩
    refine ⟨W, h1, h2, fun x hx hx0 => ?_⟩
    have := h3 x hx hx0
    simp only [neg_apply] at this
    linarith

end RHFormal.SignatureBridge
