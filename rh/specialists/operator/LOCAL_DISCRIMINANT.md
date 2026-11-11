# The local Weil discriminant W_k(L) (H-1; SP-operator, one-object seat; session 3 = first session on this object)

Read first: rh/CORE.md, HUNCHES.md part H (H-1), NOTEBOOK N80–N82, verifier_tz/VERDICT.md, my TWO_ZERO.md.
Construction (sections 1–4) was written 2026-11-11 BEFORE any computation of this session. Section 5 is the checks.
Labels: PROVED (argument written here, short), DERIVED (identity derived here, conventions not independently checked),
CONJECTURE, COMPUTED.

Notation. Window [−L, L] (log variable), f real, F(z) = ∫ f(u) e^{izu} du. Zero ρ = ½ + iγ_ρ, γ_ρ = −i(ρ − ½) (complex for an
off-line zero). Q(f) = Σ_ρ F(γ_ρ) conj F(conj γ_ρ) (explicit formula; an on-line zero gives |F(γ)|², an off-line quartet gives
the indefinite 2 Re F(z) conj F(z̄) twice). D = D_L, the foothold seat's comparison form. Its evaluation kernel:
k_z ∈ window space with F(z) = D(f, k_z) for all f (exists: D is bounded and strictly positive, plank 6, Prop 6.1), and
K(z, z′) := D(k_{z′}, k_z) = (transform of k_{z′} at z).

## 1. (v) The object that would make the wall trivial, and whether W_k is it

The wall (CORE 3–4): the Euler product is only ever used through mean squares, so it counts off-line zeros but never
excludes one; and zeta has no slack, so any inequality with a margin is false. An object that made this trivial would have
three properties at once: (A) LOCAL: a statement about one pair of zeros, so no averaging over a family is needed;
(B) TIGHT: its margin is exactly zero at a double zero and negative past it, so it matches Λ = 0; (C) SIGNED INGREDIENTS:
each of its terms is a sum with a sign the Euler product controls pointwise (Λ ≥ 0, μ multiplicative, support on prime
powers), so it can be PROVED term by term rather than by averaging. A, B are geometry; C is where proofs come from.
W_k (section 2) has A and, partly, B. Section 3 finds that it does NOT have C: the D-kernel at the zeros, once written out,
contains neither μ nor Λ (it is an Euler–Maclaurin object in the L-function's own coefficients, which are all 1 for zeta),
and Λ enters W_k only as the ordinary window Weil form, through oscillating weights with no sign. So W_k is a shadow of the
object: the right shape (local, collision-tight) cast by something whose arithmetic is elsewhere. What the real object
would need, said exactly in section 4's last paragraph: a pair-local quantity in which Λ multiplies a weight of KNOWN sign.

## 2. Definition of W_k(L), and what can be proved

**Definition.** For consecutive zeros γ_k < γ_{k+1} (on-line), V_k := span_ℝ{Re k_{γ_k}, Im k_{γ_k}, Re k_{γ_{k+1}}, Im k_{γ_{k+1}}}
(the real span: f is real, and the evaluation F(γ) is a complex functional, i.e. two real ones). For an off-line quartet with
z = γ − iβ (ρ) and z̄ (1 − ρ̄): V := real span of the kernels at z and z̄. Then
  W_k(L) := min_{0 ≠ v ∈ V_k} Q(v)/D(v)   (lowest eigenvalue of the pencil (Q, D) restricted to V_k).
Write G_k := the D-Gram of the spanning vectors (G_k = the 4×4 real form of the 2×2 complex matrix [K(γ_i, γ_j)]).

(P1) W_k ≥ κ_min(L) (restriction of a pencil to a subspace). So RH ⇒ (Weil) Q ≥ 0 ⇒ W_k ≥ 0 for every k, L. PROVED (trivial).

(P2) Decomposition. For v = Σ c_j k_j ∈ V_k, the transform of v at γ_i is (G_k c)_i. Splitting the zero side into the pair's
own terms and the rest: Q|_{V_k} = Π_k + R_k with, in the coordinates c,
  on-line pair:  Π_k = G_k² (each on-line zero gives |F(γ)|², and the pair's own evaluations of v are G_k c),
  off-line pair: Π = G J G with J = the indefinite weight of 2 Re F(z) conj F(z̄) (signature (2, 2) in the real 4-dim form),
  R_k = Σ_{ρ ∉ pair} (the same rank-one or indefinite terms built from the cross kernels K(γ_ρ, γ_i)).
Hence W_k = λ_min(G_k^{-1}(Π_k + R_k)) and: PROVED (linear algebra)
  (a) on-line pair, all other zeros on the line: W_k ≥ λ_min(G_k^{-1} G_k²) = λ_min(G_k) > 0. So W_k ≥ λ_min(G_k) ≥ 0, with the
      pair alone giving exactly λ_min(G_k) (= TWO_ZERO's κ₂ up to the factor convention for ±γ).
  (b) off-line pair: Π = G J G restricted has signature (2, 2) (Sylvester: G is invertible), so the pair's own part of the
      pencil G^{-1}(GJG) ~ G^{1/2}JG^{1/2} has two NEGATIVE eigenvalues. W < 0 as soon as R is smaller than the negative part
      on the corresponding direction.
  (c) double zero (γ_k = γ_{k+1}): the two kernels coincide, V_k drops to the real span of {k_γ, ∂k_γ} (limit of the
      difference quotient), Π degenerates to rank 2 on a 4-dim space, and W_k = (contribution of the OTHER zeros on the
      2-dim kernel of Π)/D ≥ 0, in general > 0. **H-1's claim "W_k = 0 exactly at a double zero" is FALSE for W_k; it holds
      for the pair part λ_min(G_k) only**, which → 0 like u·J (TWO_ZERO 3.4, proved there). Correction recorded.

(P3) When is "W_k(L) ≥ 0 for all k, L" equivalent to RH? ⇐ is (P1). ⇒ needs, for each off-line quartet, one window L with
  (SEP)  ‖G^{-1/2} R G^{-1/2}‖ < |λ_−(G^{1/2} J G^{1/2})| on the quartet's V,
i.e. the D-kernels at the quartet are nearly Q-orthogonal to evaluation at all other zeros (the cross kernels K(γ_ρ, z) are
small for ρ outside the quartet). Under SEP, W < 0 at that window and the equivalence holds.
**Honest status: with SEP, the W-criterion is a pure reformulation of Weil's criterion** (it is Weil positivity tested on
particular 4-dim subspaces, chosen by D), and SEP itself is a statement about the cross kernels at the unknown off-line
zero, not checkable in advance. It escapes rule 2 only if the 2×2 (4×4) inequality has ingredients the Euler product can
attack pair by pair. That is section 3, and the answer there is negative.

## 3. THE KEY STEP: the kernel at the zeros on the "prime side"

**3.1 Leak coordinates (DERIVED from plank 5, PROOF_bridge Thm 5.1).** Every window function is f = E(g)|_window for a
companion g on [−λ, λ] (λ = e^L), and plank 5 gives the null vector E(g) = f + T, T the inner tail, built from the leak
k = (1 − B)ĝ alone: in log variables v > L, T(v) = Σ_m m^{−1/2} 𝒦(v + log m), 𝒦(w) = e^{w/2} k(e^w), w > L.
The transform of E(g) is ζ(½ + iz)·(Mellin of g), which vanishes at the zeros, so for every zero
  F(γ) = − ∫_{v>L} T(v) e^{−iγv} dv = − ∫_{w>L} 𝒦(w) e^{−iγw} ζ_{e^{w−L}}(½ − iγ) dw,   ζ_N(s) := Σ_{n ≤ N} n^{−s}.
Evaluation AT A ZERO sees only the leak (between zeros, F(t) = ζ(½+it)·(Mellin of g) − T̂(t) also sees the band-limited part,
whose extrapolation from the leak is the prolate ill-conditioning: this is the 10²³ pinning of N81, now explained).

**3.2 The pole subtraction.** At a zero, |ζ_N(ρ)| grows like N^{1/2}/|γ| (the pole of ζ at s = 1), so the functional above is
not bounded on L²(w > L) as written. The growing part is N^{1−ρ}/(1 − ρ), whose w-profile e^{(w−L)/2} is the SAME for every
zero up to a constant: one common direction, which is exactly what the two pole conditions on the companion
(∫g = 0, ∫_band ĝ = 0) remove. With it removed, for every zero (DERIVED; Euler–Maclaurin, valid for σ > 0):
  R_N(s) := ζ_N(s) − N^{1−s}/(1 − s) = ζ(s) − {N} N^{−s} + s ∫_N^∞ {x} x^{−s−1} dx,
  so at a zero:   R_N(ρ) = −{N} N^{−ρ} + ρ ∫_N^∞ {x} x^{−ρ−1} dx   (O(N^{−1/2}) for N ≫ |γ|, O(1) for N ≲ |γ|/2π).

**3.3 The kernel formula (CONJECTURE in this exact form; DERIVED under the hypothesis named).** If the admissible leaks
(out-of-band parts of companions, after the pole conditions) are dense in the pole-orthogonal part of L²(w > L) — hypothesis
(ADM), the named error term is the projection onto the closure of admissible leaks — then, since D(f) = min ‖k‖² and ‖k‖² =
2∫_{w>L} |𝒦|² (k even), the D-kernel at zeros is the Gram of the regularised tail functionals:
  **K(γ, γ′) = ½ ∫_L^∞ e^{−i(γ−γ′)w} R_{e^{w−L}}(½ + iγ)‾ R_{e^{w−L}}(½ + iγ′) dw = ½ ∫_1^∞ (N^{−i(γ−γ′)} e^{−i(γ−γ′)L}) R_N(ρ)‾ R_N(ρ′) dN/N.**
Consequences, if (ADM) holds: (i) K at a zero is independent of L except for the phase e^{−i(γ−γ′)L} (diagonal: fully
independent of L); (ii) **it contains neither μ nor Λ**: μ built the norm, the kernel inverts the norm and comes out in the
L-function's own coefficients (all 1), and after the pole subtraction only the sawtooth {x} remains: K at the zeros is a
Mellin–Gram of the sawtooth evaluated at the zeros. The arithmetic of ζ is gone from the kernel; only the POSITIONS of the
zeros enter (as evaluation points). This is why D is pinned to the true zeros: it is "ζ itself, read at the zeros".

**3.4 W_k ≥ 0 as a 2×2 inequality (on-line pair; complex 2×2 form for readability).** With K_k = [K(γ_i, γ_j)]_{i,j ∈ {k,k+1}},
  W_k ≥ 0 ⇔ Q_k := [Q(k_{γ_i}, k_{γ_j})] ⪰ 0 ⇔ Q_k,11 ≥ 0, Q_k,22 ≥ 0, det Q_k ≥ 0,
and each entry has the two exact sides of the explicit formula:
  zero side:  Q_k,ij = Σ_ρ K(γ_ρ, γ_i) K(γ_ρ, γ_j)‾  = (K_k²)_ij + Σ_{ρ ∉ pair} K(γ_ρ, γ_i) K(γ_ρ, γ_j)‾,
  prime side: Q_k,ij = A_ij + P0_ij − 𝒫_ij,  𝒫_ij := Σ_{n < e^{2L}} Λ(n) n^{−1/2} [c_ij(log n) + c_ij(−log n)],
where c_ij = the cross-correlation of the window functions k_{γ_i}, k_{γ_j} (a function on [−2L, 2L]), A_ij the archimedean
term (Ω(t) = Re ψ(¼ + it/2) − log π against K(t, γ_i)K(t, γ_j)‾), P0_ij the pole term. The determinant condition is the
"local discriminant" inequality, written out:
  (A11 + P0_11 − 𝒫_11)(A22 + P0_22 − 𝒫_22) ≥ |A12 + P0_12 − 𝒫_12|².
**This is where the Euler product enters, and only here: through 𝒫_ij.** Diagnosis (DERIVED, heuristic in the last step):
c_ij(x) is the correlation of two functions whose transforms are concentrated near the pair's height γ̄, so
c_ij(log n) ≈ |·|·cos(γ̄ log n − φ_ij) w(log n) with a smooth envelope w. So 𝒫_ij ≈ Re Σ_n Λ(n) n^{−1/2−iγ̄} w(log n)·(const) =
a smoothed −ζ′/ζ(½ + iγ̄), which by the explicit formula equals a smoothed sum over the zeros NEAR the pair. Λ ≥ 0 gives nothing
here: it multiplies an oscillating weight of no sign, and the sum it produces is evaluated, in the end, by the nearby zeros
themselves. The 2×2 inequality is pair-local in its geometry and global (circular) in its arithmetic.

## 4. The impostor's version, and the exact term where they differ

For f_DH (coefficients a_n of period 5, a_n = 1, κ, −κ, −1, 0; no pole; companion inverted with b = a^{−1}, not
multiplicative; −f′/f = Σ c_n n^{−s}, c_n of both signs, on all n ≢ 0 mod 5), the same derivation gives (DERIVED):
- 3.1 verbatim with ζ_N replaced by f_N(s) = Σ_{n ≤ N} a_n n^{−s};
- 3.2 without a pole: A(x) := Σ_{n≤x} a_n is periodic (period 5, values 1, 1+κ, 1, 0, 0) because a sums to 0 over a period, so
  R^f_N(ρ) = f_N(ρ) = −A(N) N^{−ρ} + ρ ∫_N^∞ A(x) x^{−ρ−1} dx at its zeros: no subtraction needed, and the "pole conditions"
  are vacuous, as the foothold seat found;
- 3.3: K^DH(γ, γ′) = the same Mellin–Gram with the sawtooth −{x} replaced by the period-5 step function A(x).
- 3.4: 𝒫_ij^DH = Σ_n c_n n^{−1/2}[c_ij(log n) + c_ij(−log n)].
**The exact terms where zeta and the impostor differ:** (1) in the KERNEL, only the periodic summatory function: −{x}
(period 1, plus the pole) against A_DH(x) (period 5). Both are bounded periodic functions; multiplicativity and Euler product
leave no trace in the kernel. (2) In the 2×2 inequality, only the weights of 𝒫: Λ(n) ≥ 0 on prime powers against c_n of both
signs on all n ≢ 0 (5). Since 𝒫 multiplies weights c_ij(±log n) of no sign, Λ ≥ 0 cannot be used as written: the Euler
product is present in the inequality but not ACTIVE. (After plank 7's rewriting Λ ∗ 1 = log the Λ disappears altogether,
and its impostor analogue c ∗ a = a·log holds as well: then even (2) is invisible.)
**What the real object (section 1, property C) would need, exactly:** a pair-local positive quantity whose prime side is
Σ_n Λ(n) n^{−1/2} ω(n) with ω ≥ 0 (or ≤ 0) FORCED by the pair's geometry, for instance a weight that is a square
|Σ_j x_j n^{−iγ_j}|² over the pair's own heights with a sign-definite outer factor. W_k does not have that form: its weights
are cross-correlations of two kernels, which change sign with n. This is the precise construction problem left by H-1.

## 5. Checks (run after sections 1–4 were written). Predictions written first, here:
(C1) W_k on V_k from the existing matrices: W_k ≥ κ_min (P1, must hold) and W_k ≥ λ_min(G_k)-type pair bound for the on-line
     pairs (P2a); I predict W_k exceeds the two-zero κ₂ by 5–30%. Impostor quartet: W > 0 at L = 1.70 (forced by P1:
     κ_min = 0.041), and W < 0 at L = 1.72 with W ∈ [−0.3, 0].
(C2) Kernel formula 3.3 on the diagonal: ½∫_1^∞ |R_N(ρ)|² dN/N against the measured K_D(γ) at three zeta zeros and the
     L-independence claim (K_D(111.03) is 1.342 at L = 1 and 1.705 at L = 1.25 in my logs, which already contradicts strict
     L-independence). I predict (ADM) fails visibly: formula/measured outside [0.5, 2] for at least one zero.
