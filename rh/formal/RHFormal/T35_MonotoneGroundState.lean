import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# T35: the lowest window eigenvalue is non-increasing in the window size

Source: `rh/THEORY.md`, entry T35; `rh/experiments/r2_parity/PROOF_first_failure.md`, Lemma 1.
Route #8 (first-failure template), a live route.

Informal statement (THEORY.md T35, quoted):

> lambda_a = inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is non-increasing in a > 0.

Written proof: "one line from the nestedness of the form domains" (T10 (5): Dom_a ⊆ Dom_b for a < b).

FORMAL HERE (the one line): for ANY family of sets `D a` that is increasing in `a`, any real function
`F` on the ambient type (the Rayleigh quotient `Q(v)/‖v‖^2`), with `F` bounded below on the larger
set and the smaller set non-empty: `sInf (F '' D b) ≤ sInf (F '' D a)` for `a ≤ b`.
`D a` stands for `Dom_a \ {0}`.

NOT FORMAL (hypotheses here): the nestedness `Dom_a ⊆ Dom_b` and the lower bound of the Weil form
on each window (T10, `known`).
-/

namespace RHFormal.T35

/-- **T35.** The infimum of a function over an increasing family of sets is non-increasing. -/
theorem sInf_antitone {E : Type*} (D : ℝ → Set E) (hD : ∀ a b, a ≤ b → D a ⊆ D b) (F : E → ℝ)
    (hbdd : ∀ b, BddBelow (F '' D b)) (hne : ∀ a, (D a).Nonempty) {a b : ℝ} (hab : a ≤ b) :
    sInf (F '' D b) ≤ sInf (F '' D a) :=
  csInf_le_csInf (hbdd b) ((hne a).image F) (Set.image_mono (hD a b hab))

end RHFormal.T35
