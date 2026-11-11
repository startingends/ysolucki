import RHFormal.T140_KroneckerSum
set_option autoImplicit false

/-!
# T140 (finite core, r factors): the bottom of `c·I + ∑_i (I ⊗ … ⊗ A_i ⊗ … ⊗ I)` is
# `c + ∑_i λ_min(A_i)`, attained at the tensor product of the bottom vectors

Source: `rh/THEORY.md` T140 (NOTEBOOK N91); coordinator, session 4: "the r-factor Kronecker sum by
induction from your two-factor lemma (bottom of c·I + sum_i A_i acting on factor i equals
c + sum_i lambda_min(A_i), attained at the tensor product of bottom eigenvectors), for matrices over R
with Matrix.kronecker".

FORMAL HERE. A `Factor` is a real square matrix `A` of size `n` together with a real `a` and a vector
`x ≠ 0` such that `a |y|^2 ≤ y^T A y` for all `y` and `x^T A x = a |x|^2` (so `a = λ_min(A)` in the
Rayleigh sense and `x` a bottom vector), with `A` symmetric. For a list `L = [F₁, …, F_r]`:
* `Idx L = Fin n₁ × (Fin n₂ × (… × Unit))` (the tensor index set);
* `Ksum c L` : `Ksum c [] = c·1`, `Ksum c (F :: L) = F.A ⊗ₖ 1 + 1 ⊗ₖ Ksum c L` (`kroneckerSum 0`),
  i.e. `c·I + ∑_i (I ⊗ … ⊗ A_i ⊗ … ⊗ I)` with `Matrix.kronecker`;
* `vec L = x₁ ⊗ x₂ ⊗ … ⊗ x_r`;
* `Ksum_lower` : `(c + ∑_i a_i) |z|^2 ≤ z^T (Ksum c L) z` for all `z`;
* `Ksum_attained` : `vec L` attains it; `vec_ne_zero` : `vec L ≠ 0`;
* `Ksum_ground_eigen` : `Ksum c L (vec L) = (c + ∑_i a_i) (vec L)`.
Proof: induction on `L`, each step is `T140.kroneckerSum_lower` / `kroneckerSum_attained` with `c = 0`.

DIFFERENCES: "smallest eigenvalue" = minimum of the Rayleigh quotient (the bottom value is attained at
a non-zero vector and bounds the quotient from below; the identification with the least eigenvalue of
a symmetric matrix is the spectral theorem, not typed). Factors are `Fin n` matrices, nested
Kronecker products associate to the right (`A₁ ⊗ (A₂ ⊗ (…))`). The ARITHMETIC half of T140 (the
Landau-Gonek matrix on the divisor box equals `log(T/2π) I + ∑_p M_p`) is NOT formalised.
-/

open Finset Matrix
open scoped Kronecker

namespace RHFormal.T140

open RHFormal.Perron

/-- A factor: a symmetric matrix with a Rayleigh bottom `a` attained at a non-zero vector `x`. -/
structure Factor where
  n : ℕ
  A : Matrix (Fin n) (Fin n) ℝ
  a : ℝ
  x : Fin n → ℝ
  symm : ∀ i j, A i j = A j i
  lower : ∀ y, a * normSq y ≤ form A y
  attained : form A x = a * normSq x
  ne_zero : x ≠ 0

/-- The tensor index set `Fin n₁ × (Fin n₂ × (… × Unit))`. -/
def Idx : List Factor → Type
  | [] => Unit
  | F :: L => Fin F.n × Idx L

/-- `Fintype` instance of the index set, by recursion. -/
@[instance_reducible] def idxFintype : (L : List Factor) → Fintype (Idx L)
  | [] => inferInstanceAs (Fintype Unit)
  | F :: L =>
    letI := idxFintype L
    inferInstanceAs (Fintype (Fin F.n × Idx L))

/-- `DecidableEq` instance of the index set, by recursion. -/
@[instance_reducible] def idxDecEq : (L : List Factor) → DecidableEq (Idx L)
  | [] => inferInstanceAs (DecidableEq Unit)
  | F :: L =>
    letI := idxDecEq L
    inferInstanceAs (DecidableEq (Fin F.n × Idx L))

instance (L : List Factor) : Fintype (Idx L) := idxFintype L
instance (L : List Factor) : DecidableEq (Idx L) := idxDecEq L

/-- The `r`-factor Kronecker sum `c·I + ∑_i (I ⊗ … ⊗ A_i ⊗ … ⊗ I)`. -/
noncomputable def Ksum (c : ℝ) : (L : List Factor) → Matrix (Idx L) (Idx L) ℝ
  | [] => c • (1 : Matrix Unit Unit ℝ)
  | F :: L => kroneckerSum 0 F.A (Ksum c L)

/-- The tensor product of the bottom vectors. -/
def vec : (L : List Factor) → Idx L → ℝ
  | [] => fun _ => 1
  | F :: L => fun p => F.x p.1 * vec L p.2

/-- The sum of the bottoms `∑_i a_i`. -/
def bottomSum (L : List Factor) : ℝ := (L.map Factor.a).sum

/-- **Lower bound.** `(c + ∑ a_i) |z|^2 ≤ z^T (Ksum c L) z`. -/
theorem Ksum_lower (c : ℝ) : (L : List Factor) →
    ∀ z : Idx L → ℝ, (c + bottomSum L) * normSq z ≤ form (Ksum c L) z
  | [] => fun z => by
    have h := form_smul_one (ι := Unit) c z
    simp only [bottomSum, List.map_nil, List.sum_nil, add_zero]
    exact le_of_eq h.symm
  | F :: L => fun z => by
    have h := kroneckerSum_lower 0 F.A (Ksum c L) F.a (c + bottomSum L) F.lower
      (Ksum_lower c L) z
    have e : c + bottomSum (F :: L) = 0 + F.a + (c + bottomSum L) := by
      simp only [bottomSum, List.map_cons, List.sum_cons]
      ring
    rw [e]
    exact h

/-- **Attainment at the tensor product.** -/
theorem Ksum_attained (c : ℝ) : (L : List Factor) →
    form (Ksum c L) (vec L) = (c + bottomSum L) * normSq (vec L)
  | [] => by
    have h := form_smul_one (ι := Unit) c (vec [])
    simp only [bottomSum, List.map_nil, List.sum_nil, add_zero]
    exact h
  | F :: L => by
    have h := kroneckerSum_attained 0 F.A (Ksum c L) F.a (c + bottomSum L) F.x (vec L)
      F.attained (Ksum_attained c L)
    have e : c + bottomSum (F :: L) = 0 + F.a + (c + bottomSum L) := by
      simp only [bottomSum, List.map_cons, List.sum_cons]
      ring
    rw [e]
    exact h

/-- The tensor product of non-zero vectors is non-zero. -/
theorem vec_ne_zero : (L : List Factor) → ∃ p : Idx L, vec L p ≠ 0
  | [] => ⟨(), by simp [vec]⟩
  | F :: L => by
    obtain ⟨p, hp⟩ := vec_ne_zero L
    have hx : ∃ i, F.x i ≠ 0 := by
      by_contra h
      push Not at h
      exact F.ne_zero (funext h)
    obtain ⟨i, hi⟩ := hx
    exact ⟨(i, p), mul_ne_zero hi hp⟩

/-- `Ksum c L` is symmetric. -/
theorem Ksum_symm (c : ℝ) : (L : List Factor) → ∀ p q : Idx L, Ksum c L p q = Ksum c L q p
  | [] => fun p q => by
    have hpq : p = q := Subsingleton.elim (α := Unit) p q
    rw [hpq]
  | F :: L => fun p q => kroneckerSum_symm 0 F.A (Ksum c L) F.symm (Ksum_symm c L) p q

/-- **The tensor product of bottom vectors is an eigenvector** with eigenvalue `c + ∑ a_i`. -/
theorem Ksum_ground_eigen (c : ℝ) (L : List Factor) (p : Idx L) :
    ∑ q, Ksum c L p q * vec L q = (c + bottomSum L) * vec L p :=
  eigen_of_ground (Ksum c L) (Ksum_symm c L) (c + bottomSum L) (Ksum_lower c L) (vec L)
    (Ksum_attained c L) p

end RHFormal.T140
