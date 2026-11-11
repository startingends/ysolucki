/-!
Smoke test for the formal-checking setup. No mathlib needed.
If this file compiles, the Lean toolchain works in this environment.

History: the first version of this file cited a lemma name that does not exist in core Lean
(`Int.mul_self_nonneg`) and Lean rejected it. That is the point of formal checking: the lead's
memory of a lemma is not a proof.
-/

theorem smoke_add : 2 + 2 = 4 := rfl

/-- A square of an integer is non-negative (proved from the sign cases, core Lean only). -/
theorem smoke_sq_nonneg (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have hx : 0 ≤ -x := Int.neg_nonneg_of_nonpos h
    have : x * x = (-x) * (-x) := by rw [Int.neg_mul_neg]
    rw [this]
    exact Int.mul_nonneg hx hx

/-- A rank-one form `x ↦ c * x * x` with `c ≥ 0` is non-negative: the shape of every
"sum of squares, one per prime" statement in the project (theory document, mirror form). -/
theorem smoke_rank_one_nonneg (c x : Int) (hc : 0 ≤ c) : 0 ≤ c * (x * x) :=
  Int.mul_nonneg hc (smoke_sq_nonneg x)
