import RHFormal.OnePositiveDirection
import Mathlib.LinearAlgebra.BilinearMap
import Mathlib.LinearAlgebra.Prod
set_option autoImplicit false

/-!
# Lemma A (fibre classes): Weil positivity as ONE signature statement

Source: `rh/experiments/r2_cubic/PROOF_trickle.md`, Lemma A (seat R2-cubic), board s1 message B36 (A).
Used by idea #10 (cubic certificates) and by S1-parity's claim B32.

Informal statement, quoted:

> Let Ntilde be the symmetric form on V + R F1 + R F2 with
>     Ntilde(f,g) = N(f,g),  Ntilde(f,F1) = <f,p>,  Ntilde(f,F2) = <f,q>,
>     Ntilde(F1,F1) = Ntilde(F2,F2) = 0,  Ntilde(F1,F2) = 1.
> Then (number of positive eigenvalues of Ntilde) = 1 + (number of negative eigenvalues of Q),
> and (number of zero eigenvalues of Ntilde) = (number of zero eigenvalues of Q).
> In particular  Q >= 0 on V  <=>  Ntilde has at most one (then exactly one) positive eigenvalue.

where `Q(f) := 2 <f,p><f,q> - N(f,f)` is the Weil form, and from the proof:

> U^perp = { phi(f) := (f, -<f,q>, -<f,p>) : f in V },  and  Ntilde(phi(f), phi(f)) = ... = -Q(f).

WHAT IS FORMAL HERE (for any real vector space `V`, any dimension, `N` a symmetric bilinear form,
`p, q` linear functionals):
* the defining values of `Ntilde` (`Ntilde_inl_inl`, `Ntilde_inl_F1`, ..., `Ntilde_F1_F2`) and its symmetry;
* the algebraic core of the proof: `Ntilde_phi_F1`, `Ntilde_phi_F2` (phi(f) is orthogonal to both fibre
  classes), `Ntilde_phi_phi` (on phi(V) the form is `-Q`, polarised), `Ntilde_self` (the orthogonal
  decomposition `Ntilde(v,v) = -Q(f) + 2 (α + <f,q>)(β + <f,p>)`);
* the "In particular" clause: `weil_nonneg_iff_atMostOnePos`:
  `(∀ f, 0 ≤ Q f) ↔ AtMostOnePos Ntilde`, and `exists_pos` (there always is a positive direction).

WHAT IS NOT FORMAL: the two eigenvalue-count equalities (they need Sylvester's law of inertia), and the
identification of `AtMostOnePos` (no positive definite plane) with "at most one positive eigenvalue"
(see `OnePositiveDirection.lean`).
-/

namespace RHFormal.LemmaA

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- The bordered form on `V ⊕ ℝ F1 ⊕ ℝ F2`; the triple `(f, α, β)` stands for `f + α F1 + β F2`. -/
def Ntilde (N : LinearMap.BilinForm ℝ V) (p q : V →ₗ[ℝ] ℝ) : LinearMap.BilinForm ℝ (V × ℝ × ℝ) :=
  LinearMap.mk₂ ℝ
    (fun v w => N v.1 w.1 + w.2.1 * p v.1 + v.2.1 * p w.1 + w.2.2 * q v.1 + v.2.2 * q w.1
      + v.2.1 * w.2.2 + w.2.1 * v.2.2)
    (by
      intro v v' w
      simp only [Prod.fst_add, Prod.snd_add, map_add, LinearMap.add_apply]
      ring)
    (by
      intro c v w
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, LinearMap.smul_apply, smul_eq_mul]
      ring)
    (by
      intro v w w'
      simp only [Prod.fst_add, Prod.snd_add, map_add]
      ring)
    (by
      intro c v w
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, smul_eq_mul]
      ring)

variable (N : LinearMap.BilinForm ℝ V) (p q : V →ₗ[ℝ] ℝ)

theorem Ntilde_apply (v w : V × ℝ × ℝ) :
    Ntilde N p q v w = N v.1 w.1 + w.2.1 * p v.1 + v.2.1 * p w.1 + w.2.2 * q v.1 + v.2.2 * q w.1
      + v.2.1 * w.2.2 + w.2.1 * v.2.2 := rfl

/-- The Weil form `Q(f) = 2 <f,p><f,q> - N(f,f)`. -/
def weil (f : V) : ℝ := 2 * p f * q f - N f f

/-- The embedding `phi(f) = (f, -<f,q>, -<f,p>)` of `V` onto the orthogonal complement of the fibre
classes. -/
def phi (f : V) : V × ℝ × ℝ := (f, -q f, -p f)

/-! ### The defining values of `Ntilde` -/

theorem Ntilde_inl_inl (f g : V) : Ntilde N p q (f, 0, 0) (g, 0, 0) = N f g := by
  simp [Ntilde_apply]

theorem Ntilde_inl_F1 (f : V) : Ntilde N p q (f, 0, 0) (0, 1, 0) = p f := by
  simp [Ntilde_apply]

theorem Ntilde_inl_F2 (f : V) : Ntilde N p q (f, 0, 0) (0, 0, 1) = q f := by
  simp [Ntilde_apply]

theorem Ntilde_F1_F1 : Ntilde N p q (0, 1, 0) (0, 1, 0) = 0 := by
  simp [Ntilde_apply]

theorem Ntilde_F2_F2 : Ntilde N p q (0, 0, 1) (0, 0, 1) = 0 := by
  simp [Ntilde_apply]

theorem Ntilde_F1_F2 : Ntilde N p q (0, 1, 0) (0, 0, 1) = 1 := by
  simp [Ntilde_apply]

theorem Ntilde_symm (hN : ∀ f g, N f g = N g f) (v w : V × ℝ × ℝ) :
    Ntilde N p q v w = Ntilde N p q w v := by
  rw [Ntilde_apply, Ntilde_apply, hN v.1 w.1]
  ring

/-! ### The algebraic core of the proof -/

/-- `phi(f)` is orthogonal to the fibre class `F1`. -/
theorem Ntilde_phi_F1 (f : V) : Ntilde N p q (phi p q f) (0, 1, 0) = 0 := by
  simp [Ntilde_apply, phi]

/-- `phi(f)` is orthogonal to the fibre class `F2`. -/
theorem Ntilde_phi_F2 (f : V) : Ntilde N p q (phi p q f) (0, 0, 1) = 0 := by
  simp [Ntilde_apply, phi]

/-- On `phi(V)` the bordered form is minus the (polarised) Weil form. -/
theorem Ntilde_phi_phi (f g : V) :
    Ntilde N p q (phi p q f) (phi p q g) = -(p f * q g + p g * q f - N f g) := by
  simp only [Ntilde_apply, phi]
  ring

/-- `Ntilde(phi(f), phi(f)) = -Q(f)`. -/
theorem Ntilde_phi_self (f : V) : Ntilde N p q (phi p q f) (phi p q f) = -weil N p q f := by
  rw [Ntilde_phi_phi, weil]
  ring

/-- The orthogonal decomposition `V ⊕ U = phi(V) ⊕ U` on the diagonal:
`Ntilde(v, v) = -Q(f) + 2 (α + <f,q>)(β + <f,p>)` for `v = f + α F1 + β F2`. -/
theorem Ntilde_self (f : V) (α β : ℝ) :
    Ntilde N p q (f, α, β) (f, α, β) = -weil N p q f + 2 * (α + q f) * (β + p f) := by
  simp only [Ntilde_apply, weil]
  ring

/-! ### The "In particular" clause -/

/-- `Ntilde` always has a positive direction (`F1 + F2`). -/
theorem exists_pos : ∃ v : V × ℝ × ℝ, 0 < Ntilde N p q v v :=
  ⟨(0, 1, 1), by simp [Ntilde_apply]⟩

/-- **Lemma A, "In particular".** The Weil form `Q(f) = 2<f,p><f,q> - N(f,f)` is `≥ 0` on `V`
if and only if the bordered form `Ntilde` has at most one positive direction
(no positive definite plane). `V` is any real vector space; `N` is symmetric. -/
theorem weil_nonneg_iff_atMostOnePos (hN : ∀ f g, N f g = N g f) :
    (∀ f : V, 0 ≤ weil N p q f) ↔ AtMostOnePos (Ntilde N p q) := by
  have hsymm := Ntilde_symm N p q hN
  constructor
  · intro hQ
    -- on the hyperplane (α + <f,q>) + (β + <f,p>) = 0 the form is -Q(f) - 2 (β + <f,p>)^2 ≤ 0
    refine atMostOnePos_of_nonpos_on_ker _ hsymm
      ((q + p).comp (LinearMap.fst ℝ V (ℝ × ℝ))
        + (LinearMap.fst ℝ ℝ ℝ + LinearMap.snd ℝ ℝ ℝ).comp (LinearMap.snd ℝ V (ℝ × ℝ))) ?_
    rintro ⟨f, α, β⟩ hx
    simp only [LinearMap.add_apply, LinearMap.comp_apply, LinearMap.fst_apply,
      LinearMap.snd_apply] at hx
    rw [Ntilde_self]
    have h1 : α + q f = -(β + p f) := by linarith
    rw [h1]
    have h2 := hQ f
    nlinarith [sq_nonneg (β + p f)]
  · intro h f
    by_contra hneg
    rw [not_le] at hneg
    have hrc := (atMostOnePos_iff_reverse_cauchy_schwarz _ hsymm).1 h
    have h1 : 0 < Ntilde N p q (phi p q f) (phi p q f) := by
      rw [Ntilde_phi_self]
      linarith
    have h2 := hrc (phi p q f) (0, 1, 1) h1
    have h3 : Ntilde N p q (phi p q f) (0, 1, 1) = 0 := by
      simp [Ntilde_apply, phi]
    have h4 : Ntilde N p q ((0 : V), (1 : ℝ), (1 : ℝ)) (0, 1, 1) = 2 := by
      simp [Ntilde_apply]
      norm_num
    rw [h3, h4] at h2
    nlinarith

end RHFormal.LemmaA
