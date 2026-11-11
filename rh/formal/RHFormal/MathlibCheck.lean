import Mathlib.Tactic
import Mathlib.Data.Real.Basic

/-!
Check that mathlib is available: a real-number statement proved with mathlib tactics.
The statement is the two-term case of "a positive combination of squares is non-negative",
the shape of the mirror form: log 2 * (x/√2 + z/2)^2 + log 3 * (y/√3)^2 ≥ 0.
-/

theorem two_squares_nonneg (c₁ c₂ u v : ℝ) (h₁ : 0 ≤ c₁) (h₂ : 0 ≤ c₂) :
    0 ≤ c₁ * u ^ 2 + c₂ * v ^ 2 := by
  positivity
