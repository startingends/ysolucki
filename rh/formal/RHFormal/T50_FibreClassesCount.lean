import RHFormal.LemmaA_FibreClasses
import RHFormal.T32_InertiaRankOne

/-!
# T50 (Lemma A, the count): pos(Ntilde) = 1 + neg(Q), without eigenvalues

Source: `rh/THEORY.md`, entry T50; `rh/experiments/r2_cubic/PROOF_trickle.md`, Lemma A; board s1,
B36 (A), B109 (S1-cubic's nomination), and B32 / T61 (S1-parity), which use the COUNT.

Informal statement (Lemma A, quoted):

> Then (number of positive eigenvalues of Ntilde) = 1 + (number of negative eigenvalues of Q),
> and (number of zero eigenvalues of Ntilde) = (number of zero eigenvalues of Q).

Written proof (quoted): "V + U = U (+) U^perp ... U^perp = { phi(f) } ... Ntilde(phi(f), phi(f)) = -Q(f).
By Sylvester's law of inertia the inertia of Ntilde is (1,1,0) + inertia(-Q)."

FORMAL HERE: the first equality, with the indices of `T32_InertiaRankOne.lean`
(`NegDim q k` = "there is a finite-dimensional subspace of dimension ≥ k on which q is negative
definite", `PosDim` likewise): for every `k`,

    neg(Q) ≥ k   ↔   pos(Ntilde) ≥ k + 1,

on ANY real vector space `V` (this is the form B32 / T61 need: "the proof is algebraic and holds on
the infinite-dimensional window"). Together with `pos(Ntilde) ≥ 1` (`posDim_Ntilde_one`) this says
`pos(Ntilde) = 1 + neg(Q)` as extended natural numbers.

NOT FORMAL: the equality of the numbers of zero eigenvalues, and the identification of these indices
with eigenvalue counts in finite dimension (Sylvester's law of inertia, textbook).
-/

namespace RHFormal.T50

open RHFormal.LemmaA RHFormal.T32

variable {V : Type*} [AddCommGroup V] [Module ℝ V]
variable (N : LinearMap.BilinForm ℝ V) (p q : V →ₗ[ℝ] ℝ)

/-- The change of coordinates `(f, α, β) ↦ ((f, A + B), A - B)` with the fibre coordinates
`A = α + <f,q>`, `B = β + <f,p>`. -/
def toDiag : V × ℝ × ℝ →ₗ[ℝ] (V × ℝ) × ℝ where
  toFun x := ((x.1, (x.2.1 + q x.1) + (x.2.2 + p x.1)), (x.2.1 + q x.1) - (x.2.2 + p x.1))
  map_add' x y := by
    refine Prod.ext (Prod.ext ?_ ?_) ?_ <;>
      simp only [Prod.fst_add, Prod.snd_add, map_add, Prod.mk_add_mk] <;> ring
  map_smul' a x := by
    refine Prod.ext (Prod.ext ?_ ?_) ?_ <;>
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, smul_eq_mul, RingHom.id_apply,
        Prod.smul_mk] <;> ring

/-- The inverse change of coordinates. -/
noncomputable def ofDiag : (V × ℝ) × ℝ →ₗ[ℝ] V × ℝ × ℝ where
  toFun y := (y.1.1, (y.1.2 + y.2) / 2 - q y.1.1, (y.1.2 - y.2) / 2 - p y.1.1)
  map_add' x y := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_) <;>
      simp only [Prod.fst_add, Prod.snd_add, map_add, Prod.mk_add_mk] <;> ring
  map_smul' a x := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_) <;>
      simp only [Prod.smul_fst, Prod.smul_snd, map_smul, smul_eq_mul, RingHom.id_apply,
        Prod.smul_mk] <;> ring

/-- `-Ntilde = Q ⊕ (-1/2) ⊕ (1/2)` in the new coordinates. -/
theorem neg_Ntilde_eq (x : V × ℝ × ℝ) :
    -(Ntilde N p q x x)
      = sumForm (sumForm (weil N p q) (-1 / 2)) (1 / 2) (toDiag p q x) := by
  obtain ⟨f, α, β⟩ := x
  rw [Ntilde_self]
  simp only [sumForm, toDiag, LinearMap.coe_mk, AddHom.coe_mk]
  ring

/-- The same identity read through the inverse change of coordinates. -/
theorem diag_eq_neg_Ntilde (y : (V × ℝ) × ℝ) :
    sumForm (sumForm (weil N p q) (-1 / 2)) (1 / 2) y
      = -(Ntilde N p q (ofDiag p q y) (ofDiag p q y)) := by
  obtain ⟨⟨f, u⟩, v⟩ := y
  simp only [ofDiag, LinearMap.coe_mk, AddHom.coe_mk]
  rw [Ntilde_self]
  simp only [sumForm]
  ring

/-- **Lemma A, the count.** `neg(Q) ≥ k ↔ pos(Ntilde) ≥ k + 1` for every `k`:
the bordered form has exactly one more positive direction than the Weil form has negative ones. -/
theorem negDim_weil_iff_posDim_Ntilde (k : ℕ) :
    NegDim (weil N p q) k ↔ PosDim (fun x => Ntilde N p q x x) (k + 1) := by
  have hw0 : weil N p q 0 = 0 := by simp [weil]
  have hs0 : sumForm (weil N p q) (-1 / 2) 0 = 0 := by simp [sumForm, hw0]
  have hd0 : sumForm (sumForm (weil N p q) (-1 / 2)) (1 / 2) 0 = 0 := by simp [sumForm, hw0]
  have hn0 : (fun x : V × ℝ × ℝ => -(Ntilde N p q x x)) 0 = 0 := by simp
  rw [posDim_iff_negDim_neg,
    ← negDim_sumForm_of_neg (weil N p q) hw0 (-1 / 2) (by norm_num) k,
    ← negDim_sumForm_of_nonneg (sumForm (weil N p q) (-1 / 2)) hs0 (1 / 2) (by norm_num) (k + 1)]
  constructor
  · intro h
    exact negDim_of_pullback _ _ hn0 (ofDiag p q) (diag_eq_neg_Ntilde N p q) h
  · intro h
    exact negDim_of_pullback _ _ hd0 (toDiag p q) (neg_Ntilde_eq N p q) h

/-- `pos(Ntilde) ≥ 1`: the bordered form always has a positive direction. -/
theorem posDim_Ntilde_one : PosDim (fun x => Ntilde N p q x x) 1 := by
  have h : NegDim (weil N p q) 0 :=
    ⟨⊥, inferInstance, Nat.zero_le _, fun x hx hx0 => absurd ((Submodule.mem_bot ℝ).1 hx) hx0⟩
  exact (negDim_weil_iff_posDim_Ntilde N p q 0).1 h

end RHFormal.T50
