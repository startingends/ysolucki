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

### 5.1 Outcomes (COMPUTED 2026-11-11; scripts two_zero/wk.py.txt, kformula.py.txt, kcross.py.txt; matrices in
rh/data/operator_two_zero/; one implementation, floats after multiprecision whitening; nothing certified)

**(C2) The kernel formula 3.3 HOLDS (prediction MISSED: I expected (ADM) to fail).** Diagonal, ½∫_1^∞ |R_N(ρ)|² dN/N
against the measured K_D(γ):
| zero | formula | measured (L) |
|---|---|---|
| 14.135 | 0.3976 | 0.3935 (1.0) |
| 21.022 | 0.5759 | 0.5717 (1.0) |
| 59.347 | 0.7436 | 0.7442 (1.0) |
| 60.832 | 1.2386 | 1.2370 (1.0) |
| 111.030 | 1.7100 | 1.705 (1.25); 1.342 (1.0) |
| impostor 40.163 / 40.683 (A(x) periodic, NO pole term) | 1.1920 / 1.1021 | 1.1891 / 1.0992 (1.5) |
| impostor 22.160 / 23.345 | 1.1039 / 1.1652 | 1.1014 / 1.1626 (1.5) |
Off-diagonal: zeta 59.35/60.83: formula K12 = 0.0537 + 0.6025i, measured 0.0519 − 0.6021i (complex conjugate: a convention);
impostor 40.16/40.68: 0.6941 + 0.6874i vs 0.6921 − 0.6854i; 22.16/23.35: −0.1279 + 0.6070i vs −0.1274 − 0.6045i.
Agreement 0.1–0.7% wherever the zero lies below the pinning height T_D(L); it fails above it (111.03 at L = 1: 1.71 vs
1.34), which is where (ADM) should fail. L-independence of the diagonal below T_D confirmed (111.03: 1.705 at L = 1.25
against the L-free formula 1.710). 98–99% of the integral comes from N < γ/2π, where by the approximate functional
equation R_N(ρ) ≈ −χ(ρ) Σ_{m ≤ γ/(2πN)} m^{ρ−1}: **the D-Gram at the zeros is the matrix of mean squares (and cross
correlations) of the DUAL Dirichlet polynomials Σ_{m≤M} m^{−½+iγ} over the length M, evaluated at the zeros**, i.e. a
discrete-moment object of Gonek type, with no μ and no Λ in it. Status of 3.3: CONJECTURE → COMPUTED to 3 digits on 9
kernel entries, two functions (proof would need (ADM): density of admissible leaks below T_D; not attempted).

**(C1) W_k on the kernel span (prediction PARTLY MISSED).**
| case | W_k | pair bound 2λ_min(G) | κ_min |
|---|---|---|---|
| zeta L = 1, 59.35/60.83 | 0.431 | 0.336 | 0.298 |
| zeta L = 1.25, 111.03/111.87 | 0.375 | 0.230 | 0.205 |
| impostor L = 1.5, 40.16/40.68 | 0.622 | 0.169 | 0.138 |
| impostor L = 1.70, quartet 85.70 | +0.480 | — | +0.041 |
| impostor L = 1.72, quartet 85.70 | **+0.428** | — | **−0.048** |
(P1) and (P2a) hold (W_k ≥ pair bound ≥ 0 on-line; W_k ≥ κ_min). The excess over the pair bound is 28%, 63%, 270% (I
predicted 5–30%). **Decisive: at the impostor's failed window L = 1.72 the quartet's own W is +0.43 while Q is
indefinite.** So H-1(a) "W < 0 for the off-line pair" is FALSE there: SEP fails by a wide margin, the negative direction of
Q is not in the span of the quartet's kernels (it lies in combinations with the neighbours and the ladder, as the foothold
seat's decomposition showed: on-line part +5.8 Q(v), quartet −4.9 Q(v)). The quartet sits at 2.2× the band edge, far above
T_D(1.72) ≈ 1.55 × 39.4 = 61, i.e. outside the pinned range where kernels are local. W_k is therefore not a detector of
off-line zeros at the windows where they first matter.

## 6. Verdict on H-1 after this session, and ratings
- The geometric half of H-1 is real and now exact: below T_D the D-kernels at the zeros have a closed formula (3.3,
  checked to 0.1–0.7%), the pair part λ_min(G_k) is collision-tight (TWO_ZERO 3.4), and W_k ≥ λ_min(G_k) ≥ 0 on the line.
- The arithmetic half fails: the kernel is μ-free and Λ-free (Euler–Maclaurin remainders of the L-function's own
  coefficients; for the impostor, its periodic summatory function), and in the 2×2 inequality Λ multiplies weights of no
  sign (3.4). The Euler product is present but not active, pair by pair.
- The W-criterion is a pure reformulation of Weil's criterion under SEP, and SEP fails at the one off-line case on record
  (L = 1.72: W = +0.43, κ_min = −0.048). As a pair-local criterion H-1(a) is refuted on the impostor.
- New object worth keeping (for the next resume): the D-Gram at the zeros = Gram of R_N(ρ) over N, i.e. a discrete
  moment of dual Dirichlet polynomials over the zeros. κ_min ≈ (0.82–0.89) × the pair part of its bottom eigenvalue.
  The open construction problem is now precise (section 4, last paragraph): a pair-local quantity whose prime side is
  Σ Λ(n) n^{−1/2} ω(n) with ω of FORCED sign.
**Quality 6/10**: one exact, checked formula (two functions, 9 entries) and two clean refutations, with short proofs; not
higher because (ADM) is unproved and everything is one implementation. **Toward RH 2/10**: the object does not let the
Euler product act pair by pair, and the pair-local criterion misses the impostor's off-line zero; not lower because the
kernel formula turns the pinning into an explicit discrete-moment object that a sign-definite construction could use.

## 7. Session 5: the kernel formula (T131) PROVED as an upper bound with an exact error term; (ADM) is false and not needed

Setting (foothold definition of D = D_L, plank 6). λ = e^L, c = 2πλ². 𝒢 := even g ∈ L²[−λ, λ] with ∫g = 0 and
∫_{−λ}^{λ} ĝ = 0 (ĝ(ξ) = ∫ g e^{−2πiyξ} dy). Each g ∈ 𝒢 gives the window function f_g = E(g) on [1/λ, λ],
E(g)(x) = x^{1/2} Σ_n g(nx) (a finite sum there), every f arises this way (Möbius on [1/λ, λ], free part on (0, 1/λ)), and
D(f) = min{ ‖(1 − B)ĝ‖² : g ∈ 𝒢, f_g = f } (B = restriction to |ξ| ≤ λ). Leak k := (1 − B)ĝ, 𝒦 := (1 − B)ĝ(𝒢) ⊂ L²_even(|ξ| > λ).
For a zero ρ = ½ + iγ put R_N(s) := Σ_{n≤N} n^{−s} − N^{1−s}/(1 − s) and τ_γ(ξ) := ξ^{−½+iγ} R_{ξ/λ}(ρ) on ξ > λ (even extension).

**Lemma A (leak representation of evaluation at a zero; PROVED).** For every g ∈ 𝒢 and every zero ρ = ½ + iγ on the line,
  F_g(γ) = ∫_{1/λ}^{λ} g(y) y^{−½+iγ} ζ_{λy}(½ + iγ) dy = − ∫_λ^∞ ĝ(ξ) ξ^{−½−iγ} R_{ξ/λ}(½ − iγ) dξ = −½⟨k, τ_γ⟩_{L²(ℝ)}.
Proof. (1) First equality: Σ_n ∫ g(nx) x^{iγ−½} dx, substitute y = nx; only n ≤ λy survive. (2) For g ∈ C_c^∞(−λ, λ) ∩ 𝒢:
the Mellin transform of E(g) on (0, ∞) is ζ(s + ½)·Mg(s + ½) for Re s > ½; Poisson summation gives, for x < 1/λ,
E(g)(x) = x^{½}[−g(0)/2 + x^{−1} Σ_{m≥1} ĝ(m/x)] (ĝ(0) = ∫g = 0), so E(g)(x) = O(x^{½}) at 0 and the transform continues
analytically to Re s > −½, where the pole of ζ at s = ½ is cancelled by Mg(1) = ½∫g = 0. At s = iγ it vanishes (ρ is a zero),
and E(g) = 0 for x > λ, so F_g(γ) = −∫_0^{1/λ} E(g)(x) x^{iγ−1} dx. (3) For x < 1/λ every m/x exceeds λ, so only the leak k
appears; and g(0) = ∫ĝ = ∫_band ĝ + ∫k = ∫k = 2∫_λ^∞ k by the second pole condition. Insert, substitute ξ = m/x, sum over
m ≤ ξ/λ: the Σ_m term gives −∫_λ^∞ k(ξ) ξ^{−½−iγ} ζ_{ξ/λ}(½ − iγ) dξ, the g(0) term gives
+∫_λ^∞ k(ξ) λ^{−½−iγ}/(½ + iγ) dξ = +∫_λ^∞ k(ξ) ξ^{−½−iγ} N^{1−s̄}/(1 − s̄) dξ with N = ξ/λ, s̄ = ½ − iγ. **The pole subtraction
in R_N is the companion's value g(0), forced by the two pole conditions; it is not put in by hand.** (4) Both sides are
continuous in g ∈ 𝒢 (left: finite sums of L² pairings; right: k depends continuously on g and τ_γ ∈ L², because
R_N(ρ) = (½ − {N})N^{−ρ} + O(|ρ|² N^{−3/2}) for large N, so |τ_γ(ξ)|² = O(ξ^{−2})); smooth g are dense in 𝒢 (two continuous
constraints). ∎

**Theorem B (the kernel formula with exact error; PROVED from Lemma A and plank 6).** Let P be the orthogonal projection
of L²_even(|ξ| > λ) onto 𝒦̄ and P_⊥ = 1 − P. For zeros γ, γ′ on the line,
  K_D(γ, γ′) = ¼⟨Pτ_γ′, Pτ_γ⟩_{L²(ℝ)},   K_T131(γ, γ′) = ¼⟨τ_γ′, τ_γ⟩_{L²(ℝ)}  (= ½∫_λ^∞ τ_γ′ conj τ_γ dξ; in the log
variable ξ = e^w this is T131's ½∫_1^∞ e^{−i(γ−γ′)(L+log N)} conj R_N(ρ) R_N(ρ′) dN/N), hence
  **K_T131(γ, γ′) − K_D(γ, γ′) = ¼⟨P_⊥τ_γ′, P_⊥τ_γ⟩_{L²(ℝ)}**, a positive
semidefinite matrix over the zeros. In particular
  0 ≤ K_T131(γ) − K_D(γ) = ¼ ε_γ²,  |K_T131(γ, γ′) − K_D(γ, γ′)| ≤ ¼ ε_γ ε_γ′,  ε_γ := dist_{L²(ℝ)}(τ_γ, 𝒦̄).
Proof. D is bounded, closed and strictly positive (plank 6, Prop 6.1), so f ↦ (its minimal leak) is an isometry Φ of
(H_L, D) onto a closed subspace of 𝒦̄. By Lemma A, F(γ) = −½⟨k, τ_γ⟩ for EVERY leak of f (all companions give the same F);
for leaks of companions of f = 0 the left side is 0, so τ_γ is orthogonal to them and the representer of evaluation at γ in
Φ(H_L) is the projection of τ_γ onto Φ(H_L), which equals Pτ_γ. Kernel = inner product of representers; T131 is the same
expression with τ in place of Pτ (the normalisation ½ of T131 is k even: ‖k‖² = 2∫_{w>L}|𝒦|²). ∎
(The normalising constants above were checked against T131's ½ only through the numbers of section 5.1, which match to
0.1–0.7%; the form of the identity does not depend on them.)

**What 𝒦̄ is, and why (ADM) is false (PROVED).** (1 − B) restricted to L²[−λ, λ] is bounded below:
‖(1 − B)ĝ‖² = ⟨g, (1 − A_c) g⟩ ≥ (1 − χ₀(c))‖g‖², A_c = time–band limiting (prolate) operator. So its range is CLOSED:
𝒦̄ = (1 − B)ĝ(𝒢), the out-of-band parts of time-limited functions, up to the two constraint directions. Its orthogonal
complement in the out-of-band space is 𝒜 ⊕ (≤ 2 dims), 𝒜 := {a out-of-band with ǎ = 0 on [−λ, λ]}. 𝒜 is infinite
dimensional: otherwise TL + BL (time-limited + band-limited, a closed sum since ‖Π_λ B‖ < 1) would have finite codimension,
and the restrictions of band-limited functions to |x| > λ (real-analytic) would be of finite codimension in L²(|x| > λ),
false. So the session-3 hypothesis (ADM) "leaks dense in the pole-orthogonal space" is FALSE. It is not needed: Theorem B
holds with the error ε_γ² = dist(τ_γ, 𝒦̄)². Equivalently (dual form, PROVED by Hilbert-space duality):
  ε_γ² = ‖τ_γ‖² − ⟨ẽ_γ, (1 − A_c)^{−1} ẽ_γ⟩·(norm.), e_γ(y) = y^{−½−iγ} ζ_{λy}(½ − iγ) 1_{[1/λ, λ]}(|y|),
ẽ_γ = e_γ corrected by its optimal component along the two constraint functionals: the exact kernel is the
minimum-norm out-of-band extension of e_γ, and T131 is one particular extension, namely the one Poisson summation provides.
**Why ε_γ is small but never 0.** τ_γ ∈ 𝒦̄ exactly would make τ_γ the restriction to |ξ| > λ of an entire function of
exponential type 2πλ; but R_{ξ/λ}(ρ) jumps by (ξ/λ)^{−ρ}-sized amounts at ξ = nλ (each partial sum gains a term), so
τ_γ is not analytic and ε_γ > 0 strictly. The jumps have size n^{−½}, the part of τ_γ they generate at ξ ≥ nλ is
weighted by |R|² ~ 1/N, and only the components of these jumps that look like functions vanishing on [−λ, λ] in time
(the 𝒜-part) are lost. That 𝒜-part is what the measured 0.1–0.7% is. A bound of the form ε_γ² ≤ C(L)·Σ_n n^{−1}·(prolate
leakage at nλ) is the natural next statement; NOT proved here. Above the pinning height the dual sum region N < γ/2π
reaches ξ beyond the resolved band and the measured gap grows (111.03 at L = 1: 1.71 vs 1.34, i.e. ε² ≈ 0.74): consistent
with Theorem B (the error is a distance, which the theorem does not claim small).
**Status for T131:** "K_D = T131 formula" is replaced by **"K_D = T131 formula − ½·Gram(P_⊥τ) (exact), with the diagonal
error ¼ε_γ² ≥ 0"**: PROVED (Lemma A rests on Poisson summation and Mellin continuation for smooth compactly supported g,
written above; Theorem B on plank 6's Prop 6.1). The smallness of ε below T_D is COMPUTED (0.1–0.7%), not proved. Consistency
with section 5.1: Theorem B predicts K_D ≤ K_T131 on the diagonal; measured: 8 of 9 entries obey it, the ninth
(59.347: 0.7442 vs 0.7436) exceeds by 8e-4, inside the discretisation error of the finite Legendre/free-part basis.

**The Euler product: where it goes (one paragraph, for CORE).** In the final expression K_D(γ, γ′) = K_T131 − E, both
terms are built from: the coefficients of ζ as a Dirichlet SERIES (all equal to 1, in ζ_N and in R_N), the pole term
N^{1−s}/(1−s), the window/band geometry (λ, B, the prolate operator A_c), and the zero positions. By the approximate
functional equation, at a zero and for N ≲ γ/2π, R_N(ρ) = −χ(ρ) Σ_{m ≤ γ/(2πN)} m^{ρ−1} + O(N^{−½} + (γ/N)^{−½}), and this
range carries 97–99% of K_T131, so K_D(γ, γ) ≈ ½ ∫_1^{γ/2π} |Σ_{m≤M} m^{−½+iγ}|² dM/M (|χ| = 1 on the line): the
functional equation (Poisson in Lemma A, χ in the AFE) appears explicitly inside an object defined from μ. **The Euler
product does not survive anywhere.** μ, Λ, multiplicativity and the support on prime powers are all absent. The reason is
structural, not accidental: μ enters D only as the convolution inverse of the coefficient sequence (Möbius inversion, i.e.
μ ∗ 1 = δ), and the kernel of a norm ‖M f‖² built from an invertible operator M is the Gram of M^{−1*} applied to the
evaluation vectors; M^{−1} = E has coefficients 1. So the kernel sees the coefficients of the series, never the inverse
coefficients, and the only arithmetic fact used anywhere in the proof is μ ∗ 1 = δ, which every Dirichlet series with
a₁ ≠ 0 satisfies (the impostor: b ∗ a = δ, with its periodic summatory function in place of −{x} and no pole). Information
for CORE: **a quadratic object built from μ LINEARLY (norms, kernels, Grams of Möbius-inverted functions) cannot see the
Euler product; the inversion cancels it exactly. Multiplicativity can only enter through something nonlinear in the
coefficients, or through the values of μ (signs, support), never through μ's role as an inverse.**

**Ratings (this section).** Quality 7/10: T131 is now a theorem in its corrected form (an exact identity with a PSD error,
and a proved upper bound), the false hypothesis is identified and replaced; not higher because the smallness of the error
below T_D is computed, not proved, and the constants were matched numerically rather than re-derived by a second hand.
Toward RH 1/10: the proof shows exactly why this object is impostor-blind (only μ ∗ 1 = δ is used), which closes it as a
route for the Euler product; not lower because it pins the functional equation inside a μ-object exactly.

**Check of Lemma A (the one numerical check of this session; two_zero/ident.py.txt, numpy, Gauss–Legendre).** L = 0.5,
companion g = combination of three C^∞ bumps in (0, λ) with both pole conditions imposed (residuals 0). Window side
∫_{1/λ}^{λ} g y^{−½+iγ} ζ_{λy}(½+iγ) dy against the leak side −∫_λ^{Ξ} ĝ ξ^{−½−iγ} R_{ξ/λ}(½−iγ) dξ, Ξ = 40, 80, 160:
γ = 14.1347: |diff| = 2.5e-8 to 4.8e-8 against |F| = 3.05e-2 (relative 1e-6, quadrature level); γ = 21.0220: 8e-8 to 1.1e-7
against 3.67e-2. Control at the non-zero t = 17.5: the two sides differ by 9.2e-2 (larger than |F| = 6.7e-2), as they must
(the identity uses ζ(ρ) = 0). Lemma A is confirmed to 6 digits at two zeros and fails off the zeros.
