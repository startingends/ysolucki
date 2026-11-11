import RHFormal.Perron_GroundState
import Mathlib.LinearAlgebra.Matrix.Kronecker
set_option autoImplicit false

/-!
# T140 (finite core): the bottom of a Kronecker sum is the sum of the bottoms, attained at a
# tensor-product vector

Source: `rh/THEORY.md`, entry T140 ("H-3: exact decoupling of the Landau-Gonek form on a divisor box");
`rh/NOTEBOOK.md` N91. The coordinator's formulation of the finite core (session 3):

> on a tensor product of finite-dimensional real inner-product spaces V_1 ⊗ ... ⊗ V_r, the self-adjoint
> operator c·I + sum_i (I ⊗ .. ⊗ A_i ⊗ .. ⊗ I) has smallest eigenvalue c + sum_i lambda_min(A_i)
> (Kronecker sum). ... state it for Matrix.kronecker with two factors and induct, or prove the
> two-factor case only.

T140's own last clause (quoted): "the spectrum of M is log(T/2 pi) + (Minkowski sum of the spectra of the
M_p), and the bottom of M is attained at a tensor product (Euler-product-shaped) vector."

FORMAL HERE (two factors; `K = c·1 + A ⊗ₖ 1 + 1 ⊗ₖ B` on the index set `m × n`; "smallest eigenvalue"
read without eigenvalues, as the minimum of the Rayleigh quotient, as in the rest of this library):
* `form_kron_one`, `form_one_kron` : `z^T (A ⊗ 1) z = ∑_j (z_{·j})^T A z_{·j}`, and the same for `1 ⊗ B`;
* `kroneckerSum_lower` : if `a |x|^2 ≤ x^T A x` and `b |y|^2 ≤ y^T B y` for all `x, y`, then
  `(c + a + b) |z|^2 ≤ z^T K z` for all `z`;
* `kroneckerSum_attained` : if `x₀`, `y₀` attain `a`, `b`, then the tensor product `x₀ ⊗ y₀` attains
  `c + a + b`;
* `kroneckerSum_ground_eigen` : for symmetric `A`, `B`, the tensor product `x₀ ⊗ y₀` is an eigenvector of
  `K` with eigenvalue `c + a + b` (via `Perron.eigen_of_ground`).
So `c + λ_min(A) + λ_min(B)` is the minimum of the Rayleigh quotient of `K`, attained at `x₀ ⊗ y₀`.

DIFFERENCES: two factors only. The `r`-factor statement follows by applying the two-factor theorem
`r - 1` times to `K_r := K_{r-1} ⊗ 1 + 1 ⊗ A_r` (the theorem is for ARBITRARY matrices with a lower bound,
so it applies to `K_{r-1}`); that induction is NOT typed. "Smallest eigenvalue" is the Rayleigh minimum
(equal for symmetric matrices by the spectral theorem, not typed). The arithmetic half of T140 (the
identification of the Landau-Gonek matrix on the divisor box with `log(T/2π) I + ∑_p M_p`) is NOT
formalised here.
-/

open Finset Matrix
open scoped Kronecker

namespace RHFormal.T140

open RHFormal.Perron

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]

/-- The quadratic form is additive in the matrix. -/
theorem form_add {ι : Type*} [Fintype ι] (M N : Matrix ι ι ℝ) (z : ι → ℝ) :
    form (M + N) z = form M z + form N z := by
  simp only [form, Matrix.add_apply, mul_add, add_mul, Finset.sum_add_distrib]

theorem form_smul_one {ι : Type*} [Fintype ι] [DecidableEq ι] (c : ℝ) (z : ι → ℝ) :
    form (c • (1 : Matrix ι ι ℝ)) z = c * normSq z := by
  simp only [form, normSq, Matrix.smul_apply, Matrix.one_apply, smul_eq_mul, mul_ite, mul_one,
    mul_zero, ite_mul, zero_mul, Finset.sum_ite_eq, Finset.mem_univ, ite_true, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  ring

/-- The quadratic form through the matrix-vector product. -/
theorem form_eq_sum_mulVec {ι : Type*} [Fintype ι] (M : Matrix ι ι ℝ) (z : ι → ℝ) :
    form M z = ∑ p, z p * ∑ q, M p q * z q := by
  simp only [form, Finset.mul_sum]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
  ring

omit [DecidableEq m] in
theorem mulVec_kron_one (A : Matrix m m ℝ) (w : m × n → ℝ) (p : m × n) :
    ∑ q, (A ⊗ₖ (1 : Matrix n n ℝ)) p q * w q = ∑ i', A p.1 i' * w (i', p.2) := by
  rw [Fintype.sum_prod_type]
  refine Finset.sum_congr rfl fun i' _ => ?_
  rw [Finset.sum_eq_single p.2]
  · simp
  · intro j _ hj
    simp [Matrix.one_apply_ne (Ne.symm hj)]
  · intro h
    exact absurd (Finset.mem_univ _) h

omit [DecidableEq n] in
theorem mulVec_one_kron (B : Matrix n n ℝ) (w : m × n → ℝ) (p : m × n) :
    ∑ q, ((1 : Matrix m m ℝ) ⊗ₖ B) p q * w q = ∑ j', B p.2 j' * w (p.1, j') := by
  rw [Fintype.sum_prod_type, Finset.sum_eq_single p.1]
  · simp
  · intro i _ hi
    simp [Matrix.one_apply_ne (Ne.symm hi)]
  · intro h
    exact absurd (Finset.mem_univ _) h

omit [DecidableEq m] in
/-- `z^T (A ⊗ₖ 1) z = ∑_j (z_{·j})^T A (z_{·j})`. -/
theorem form_kron_one (A : Matrix m m ℝ) (z : m × n → ℝ) :
    form (A ⊗ₖ (1 : Matrix n n ℝ)) z = ∑ j, form A (fun i => z (i, j)) := by
  rw [form_eq_sum_mulVec]
  simp only [mulVec_kron_one]
  rw [Fintype.sum_prod_type, Finset.sum_comm]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [form_eq_sum_mulVec]

omit [DecidableEq n] in
/-- `z^T (1 ⊗ₖ B) z = ∑_i (z_{i·})^T B (z_{i·})`. -/
theorem form_one_kron (B : Matrix n n ℝ) (z : m × n → ℝ) :
    form ((1 : Matrix m m ℝ) ⊗ₖ B) z = ∑ i, form B (fun j => z (i, j)) := by
  rw [form_eq_sum_mulVec]
  simp only [mulVec_one_kron]
  rw [Fintype.sum_prod_type]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [form_eq_sum_mulVec]

omit [DecidableEq m] [DecidableEq n] in
theorem normSq_prod (z : m × n → ℝ) :
    normSq z = ∑ j, normSq (fun i => z (i, j)) := by
  simp only [normSq, Fintype.sum_prod_type]
  exact Finset.sum_comm

omit [DecidableEq m] [DecidableEq n] in
theorem normSq_prod' (z : m × n → ℝ) :
    normSq z = ∑ i, normSq (fun j => z (i, j)) := by
  simp only [normSq, Fintype.sum_prod_type]

/-- The Kronecker sum `K = c·1 + A ⊗ₖ 1 + 1 ⊗ₖ B`. -/
def kroneckerSum (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ) : Matrix (m × n) (m × n) ℝ :=
  c • (1 : Matrix (m × n) (m × n) ℝ) + A ⊗ₖ (1 : Matrix n n ℝ) + (1 : Matrix m m ℝ) ⊗ₖ B

theorem form_kroneckerSum (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ) (z : m × n → ℝ) :
    form (kroneckerSum c A B) z
      = c * normSq z + ∑ j, form A (fun i => z (i, j)) + ∑ i, form B (fun j => z (i, j)) := by
  rw [kroneckerSum, form_add, form_add, form_smul_one, form_kron_one, form_one_kron]

/-- **Lower bound.** `(c + a + b) |z|^2 ≤ z^T K z` when `a`, `b` bound the Rayleigh quotients of
`A`, `B` from below. -/
theorem kroneckerSum_lower (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ) (a b : ℝ)
    (hA : ∀ x, a * normSq x ≤ form A x) (hB : ∀ y, b * normSq y ≤ form B y) (z : m × n → ℝ) :
    (c + a + b) * normSq z ≤ form (kroneckerSum c A B) z := by
  rw [form_kroneckerSum]
  have h1 : a * normSq z ≤ ∑ j, form A (fun i => z (i, j)) := by
    rw [normSq_prod, Finset.mul_sum]
    exact Finset.sum_le_sum fun j _ => hA _
  have h2 : b * normSq z ≤ ∑ i, form B (fun j => z (i, j)) := by
    rw [normSq_prod', Finset.mul_sum]
    exact Finset.sum_le_sum fun i _ => hB _
  linarith

theorem form_smul_vec {ι : Type*} [Fintype ι] (M : Matrix ι ι ℝ) (t : ℝ) (x : ι → ℝ) :
    form M (fun i => x i * t) = t ^ 2 * form M x := by
  simp only [form, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

theorem normSq_smul_vec {ι : Type*} [Fintype ι] (t : ℝ) (x : ι → ℝ) :
    normSq (fun i => x i * t) = t ^ 2 * normSq x := by
  simp only [normSq, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  ring

/-- **Attainment at a tensor product.** If `x₀`, `y₀` attain `a`, `b`, then `x₀ ⊗ y₀` attains
`c + a + b`. -/
theorem kroneckerSum_attained (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ) (a b : ℝ)
    (x₀ : m → ℝ) (y₀ : n → ℝ) (hx : form A x₀ = a * normSq x₀) (hy : form B y₀ = b * normSq y₀) :
    form (kroneckerSum c A B) (fun p => x₀ p.1 * y₀ p.2)
      = (c + a + b) * normSq (fun p : m × n => x₀ p.1 * y₀ p.2) := by
  rw [form_kroneckerSum]
  have e1 : ∑ j, form A (fun i => x₀ i * y₀ j) = a * (normSq x₀ * normSq y₀) := by
    simp only [form_smul_vec, hx]
    rw [← Finset.sum_mul]
    simp only [normSq]
    ring
  have e2 : ∑ i, form B (fun j => x₀ i * y₀ j) = b * (normSq x₀ * normSq y₀) := by
    have : ∀ i, (fun j => x₀ i * y₀ j) = (fun j => y₀ j * x₀ i) := fun i => by
      funext j
      ring
    simp only [this, form_smul_vec, hy]
    rw [← Finset.sum_mul]
    simp only [normSq]
    ring
  have e3 : normSq (fun p : m × n => x₀ p.1 * y₀ p.2) = normSq x₀ * normSq y₀ := by
    rw [normSq_prod]
    simp only [normSq_smul_vec]
    rw [← Finset.sum_mul]
    simp only [normSq]
    ring
  rw [e1, e2, e3]
  ring

omit [Fintype m] [Fintype n] in
/-- `K` is symmetric when `A` and `B` are. -/
theorem kroneckerSum_symm (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ)
    (hA : ∀ i j, A i j = A j i) (hB : ∀ i j, B i j = B j i) (p q : m × n) :
    kroneckerSum c A B p q = kroneckerSum c A B q p := by
  simp only [kroneckerSum, Matrix.add_apply, Matrix.smul_apply, Matrix.kroneckerMap_apply,
    smul_eq_mul]
  rw [hA p.1 q.1, hB p.2 q.2, Matrix.one_apply, Matrix.one_apply, Matrix.one_apply,
    Matrix.one_apply, Matrix.one_apply, Matrix.one_apply]
  simp only [eq_comm]

/-- **The ground state is an eigenvector.** For symmetric `A`, `B` with Rayleigh minima `a`, `b`
attained at `x₀`, `y₀`: `K (x₀ ⊗ y₀) = (c + a + b) (x₀ ⊗ y₀)`. -/
theorem kroneckerSum_ground_eigen (c : ℝ) (A : Matrix m m ℝ) (B : Matrix n n ℝ) (a b : ℝ)
    (hAs : ∀ i j, A i j = A j i) (hBs : ∀ i j, B i j = B j i)
    (hA : ∀ x, a * normSq x ≤ form A x) (hB : ∀ y, b * normSq y ≤ form B y)
    (x₀ : m → ℝ) (y₀ : n → ℝ) (hx : form A x₀ = a * normSq x₀) (hy : form B y₀ = b * normSq y₀)
    (p : m × n) :
    ∑ q, kroneckerSum c A B p q * (x₀ q.1 * y₀ q.2) = (c + a + b) * (x₀ p.1 * y₀ p.2) :=
  eigen_of_ground (kroneckerSum c A B) (kroneckerSum_symm c A B hAs hBs) (c + a + b)
    (kroneckerSum_lower c A B a b hA hB) _ (kroneckerSum_attained c A B a b x₀ y₀ hx hy) p

end RHFormal.T140
