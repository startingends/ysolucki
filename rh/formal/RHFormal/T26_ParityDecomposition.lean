import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# T26: parity decomposition of a reflection-invariant form, and the pole in the two parity blocks

Source: `rh/THEORY.md`, entry T26; `rh/experiments/r2_parity/PROOF_parity_index.md`, Lemma 1.
Used by ideas #8, #9 (live routes), #10, #21.

Informal statement (THEORY.md T26, quoted):

> Let R f(x) = f(-x). (i) Each of P, A, Pi, N, Q satisfies q(Rf, Rh) = q(f, h); hence
> q(f_e, h_o) = 0 and q(f) = q(f_e) + q(f_o). (ii) For every f in D:
> P(f) = 2 |<f_e, c>|^2 - 2 |<f_o, s>|^2 (for real f: 2<f_e,c>^2 - 2<f_o,s>^2).

with (THEORY.md T5) `c = cosh(u/2)`, `s = sinh(u/2)` and the pole term `P(f) = 2 <f, e^{x/2}> <f, e^{-x/2}>`.

FORMAL HERE, as linear algebra over the reals: `V` any real vector space, `R` a linear involution
(`R (R f) = f`), `f_e = (f + R f)/2`, `f_o = (f - R f)/2`.
* `evenPart_add_oddPart`, `R_evenPart`, `R_oddPart` : `f = f_e + f_o`, `R f_e = f_e`, `R f_o = -f_o`;
* `cross_eq_zero` : for a bilinear form `q` with `q(Rf, Rh) = q(f, h)`: `q(f_e, h_o) = 0`;
* `form_eq_even_add_odd` : `q(f, f) = q(f_e, f_e) + q(f_o, f_o)`;
* `pole_eq` : (ii) for real `f`. `p` is the linear functional `<·, e^{x/2}>`; then `<·, e^{-x/2}> = p ∘ R`,
  `c = (p + p∘R)/2` is `<·, cosh(x/2)>`, `s = (p - p∘R)/2` is `<·, sinh(x/2)>`, and
  `2 p(f) p(Rf) = 2 c(f_e)^2 - 2 s(f_o)^2`.

DIFFERENCES: real scalars only (the complex case with `|.|^2` is not formalised); the fact that the
concrete forms P, A, Pi, N, Q of the project ARE reflection invariant (an integral change of variable
`x → -x`) is the hypothesis `hq`, not proved here; likewise `<f, e^{-x/2}> = <Rf, e^{x/2}>`.
-/

namespace RHFormal.T26

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- Even part `f_e = (f + R f)/2`. -/
noncomputable def evenPart (R : V →ₗ[ℝ] V) (f : V) : V := (1 / 2 : ℝ) • (f + R f)

/-- Odd part `f_o = (f - R f)/2`. -/
noncomputable def oddPart (R : V →ₗ[ℝ] V) (f : V) : V := (1 / 2 : ℝ) • (f - R f)

variable (R : V →ₗ[ℝ] V)

theorem evenPart_add_oddPart (f : V) : evenPart R f + oddPart R f = f := by
  simp only [evenPart, oddPart, ← smul_add]
  have : f + R f + (f - R f) = (2 : ℝ) • f := by
    rw [two_smul]
    abel
  rw [this, smul_smul]
  norm_num

theorem R_evenPart (hR : ∀ f, R (R f) = f) (f : V) : R (evenPart R f) = evenPart R f := by
  simp only [evenPart, map_smul, map_add, hR]
  rw [add_comm]

theorem R_oddPart (hR : ∀ f, R (R f) = f) (f : V) : R (oddPart R f) = -oddPart R f := by
  simp only [oddPart, map_smul, map_sub, hR]
  rw [← smul_neg, neg_sub]

/-- **(i), first part.** For a reflection-invariant bilinear form, even and odd vectors are
orthogonal: `q(f_e, h_o) = 0`. -/
theorem cross_eq_zero (q : LinearMap.BilinForm ℝ V) (hR : ∀ f, R (R f) = f)
    (hq : ∀ f h, q (R f) (R h) = q f h) (f h : V) : q (evenPart R f) (oddPart R h) = 0 := by
  have h1 := hq (evenPart R f) (oddPart R h)
  rw [R_evenPart R hR, R_oddPart R hR, map_neg] at h1
  linarith

/-- The same with the roles exchanged: `q(f_o, h_e) = 0`. -/
theorem cross_eq_zero' (q : LinearMap.BilinForm ℝ V) (hR : ∀ f, R (R f) = f)
    (hq : ∀ f h, q (R f) (R h) = q f h) (f h : V) : q (oddPart R f) (evenPart R h) = 0 := by
  have h1 := hq (oddPart R f) (evenPart R h)
  rw [R_evenPart R hR, R_oddPart R hR, map_neg, LinearMap.neg_apply] at h1
  linarith

/-- **(i), second part.** `q(f) = q(f_e) + q(f_o)`. -/
theorem form_eq_even_add_odd (q : LinearMap.BilinForm ℝ V) (hR : ∀ f, R (R f) = f)
    (hq : ∀ f h, q (R f) (R h) = q f h) (f : V) :
    q f f = q (evenPart R f) (evenPart R f) + q (oddPart R f) (oddPart R f) := by
  have h0 := evenPart_add_oddPart R f
  have h1 := cross_eq_zero R q hR hq f f
  have h2 := cross_eq_zero' R q hR hq f f
  calc q f f = q (evenPart R f + oddPart R f) (evenPart R f + oddPart R f) := by rw [h0]
    _ = q (evenPart R f) (evenPart R f) + q (oddPart R f) (oddPart R f) := by
      simp only [map_add, LinearMap.add_apply]
      rw [h1, h2]
      ring

/-- **(ii), real case.** With `p = <·, e^{x/2}>`, `c = (p + p∘R)/2 = <·, cosh(x/2)>` and
`s = (p - p∘R)/2 = <·, sinh(x/2)>`: the pole term `2 <f, e^{x/2}> <f, e^{-x/2}> = 2 p(f) p(Rf)` equals
`2 c(f_e)^2 - 2 s(f_o)^2`. -/
theorem pole_eq (hR : ∀ f, R (R f) = f) (p : V →ₗ[ℝ] ℝ) (f : V) :
    2 * p f * p (R f)
      = 2 * ((p (evenPart R f) + p (R (evenPart R f))) / 2) ^ 2
        - 2 * ((p (oddPart R f) - p (R (oddPart R f))) / 2) ^ 2 := by
  simp only [evenPart, oddPart, map_smul, map_add, map_sub, hR, smul_eq_mul]
  ring

/-- The cosh functional does not see the odd part, the sinh functional does not see the even part:
`c(f) = c(f_e)` and `s(f) = s(f_o)`. -/
theorem cosh_sinh_parts (hR : ∀ f, R (R f) = f) (p : V →ₗ[ℝ] ℝ) (f : V) :
    (p f + p (R f)) / 2 = (p (evenPart R f) + p (R (evenPart R f))) / 2 ∧
    (p f - p (R f)) / 2 = (p (oddPart R f) - p (R (oddPart R f))) / 2 := by
  constructor
  · simp only [evenPart, map_smul, map_add, hR, smul_eq_mul]
    ring
  · simp only [oddPart, map_smul, map_sub, hR, smul_eq_mul]
    ring

end RHFormal.T26
