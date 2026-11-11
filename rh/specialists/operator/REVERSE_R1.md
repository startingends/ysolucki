# R1: solving for H⁰ from the constraints (SP-operator, session 7; 2026-11-11)

Read: rh/REVERSE.md (whole), rh/library/connes-essay-1509.05576.md (whole digest; §2–5 of the essay through it).
Sections 0–3 written before any computation. Labels: PROVED, HEURISTIC, COMPUTED.

## 0. PREDICTION (before construction and before any run)
(a) The predicted split (C1 universal, C2 Euler-product-dependent) will NOT come out as a property of a natural
definition: I expect that once C2 holds, C1 restricted to degree-zero divisors IS Weil positivity, so whichever of C1/C2
"carries RH" is decided by how H⁰ is defined, not by the mathematics.
(b) Numerically: the D·D form on the window (D·D := 2ab − Q) has exactly ONE positive square for zeta at L = 1.0 and 1.25
(Hodge index type (1, n)), and for the impostor (no pole, so no hyperbolic plane) ν₊ = ν₋(Q): 0 below 1.70, 1 at 1.72,
2 at 1.8.

## 1. Conventions (PROVED: bookkeeping from the explicit formula)
Window function g ∈ L²[−L, L] (log variable), ĝ(z) = ∫ g e^{izu} du, Q(g) = Σ_ρ ĝ(γ_ρ) conj ĝ(γ̄_ρ) = (pole) + W_∞ − (primes).
- Fibre classes: **D·ξ₀ := a(g) = ĝ(i/2) = ∫ g e^{−u/2} du, D·ξ₁ := b(g) = ĝ(−i/2) = ∫ g e^{u/2} du.** The pole term of Q is
  2ab (signature (1, 1); PRIME_SAMPLING §0).
- **Self-intersection: D(g)·D(g) := 2ab − Q(g) = −(W_∞ − primes)(g*g̃).** This is Lemma 2.1's form: Hodge index
  "x·x ≤ 2(x·ξ₀)(x·ξ₁)" for x = D(g) is exactly Q(g) ≥ 0, i.e. Weil positivity with the poles included. (Connes writes
  "½D·D = I(f, f)" with the opposite sign convention for I; what matters is D·D = 2ab − Q.)
- **Degree zero: a(g) = b(g) = 0** (ĝ(±i/2) = 0: Weil's two codimension conditions). On degree zero, D·D = −Q, and
  Hodge index D·D ≤ 0 is Q ≥ 0. Total degree deg D := D·ξ₀ + D·ξ₁ = a + b = 2∫ g cosh(u/2) du.
- For the impostor: no pole, so no fibre classes: its D·D = −Q_DH on the whole window space, and "degree" is not defined
  by its own formula (C2 then says: Dim H⁰ > 0 never, since there is no positive class to compare with).

## 2. What the constraints force: the solution set is determined by RH (PROVED, elementary)
**Prop. R1.1.** Let h be any functional on the window space with h ≥ 0 ("Dim H⁰(D(g))").
(i) If h satisfies C2 [h(g) > 0 ⇒ a(g) + b(g) > 0], then h(g) = h(−g) = 0 on degree zero, so C1 restricted to degree zero
    [h(g) + h(−g) ≥ ½ D·D(g)] is exactly D·D ≤ 0 there, i.e. Weil positivity (RH).
(ii) If h satisfies C1 for a function with an off-line zero (impostor), then h > 0 at some ±v with D·D(v) > 0; for the
    impostor this already violates C2 (no positive class); for a hypothetical ζ with an off-line zero, v can be taken of
    degree zero (Weil), so C2 fails there.
(iii) Solutions of C1 ∧ C2 exist iff RH; then they are exactly the h with h = 0 on {deg ≤ 0} and h(g) ≥ ½D·D(g) on
    {deg > 0}; the minimal one is **h_min(g) = (½ D·D(g))₊ · 1[a(g) + b(g) > 0].**
Proof. (i): one of ±g has deg ≤ 0 unless deg g ≠ 0; at deg g = 0 both have deg 0, so C2 forces h(±g) = 0 and C1 reads
0 ≥ ½D·D. (iii): for deg g ≠ 0 exactly one of ±g has positive degree and C1 asks h of it ≥ ½D·D; h_min does it. ∎
**Consequence.** "Solving for H⁰ from C1 and C2" determines nothing beyond Weil positivity: the constraints pin H⁰ only
up to the free region h ≥ h_min, and the existence of ANY solution is RH. Which constraint "carries RH" is a choice of
definition: an h for which C2 is built in (one-sided) puts RH into C1 at degree zero; an h for which C1 is provable puts
RH into C2 at degree zero. The predicted split (C1 universal, C2 Euler) is achievable only by an h for which C1 is a
THEOREM proved without the Euler product, and then C2 at degree zero is RH itself. So the split is a statement about where
a future proof would put its effort, not something a candidate can "confirm"; R1's success criterion ("C1 and C2 for zeta,
C2 fails for the impostor") is met by h_min trivially and therefore cannot by itself point the bridge.

**Lemma R1.2 (the amplifier is vacuous for continuous dimensions; PROVED).** In function fields Riemann–Roch is
h⁰(nD) + h⁰(−nD) ≥ ½n²D·D − O(n): integer dimensions with a LINEAR error term, beaten by the quadratic main term for large
n. If Dim H⁰ is a continuous dimension homogeneous of degree 2 under g ↦ ng (as it must be for C1 to survive scaling:
D(ng)·D(ng) = n² D·D, and bounded integer counts violate C1 for large n), then C1 for nD is n²·(C1 for D): the
amplification gives nothing new, and C1 must hold EXACTLY, with no lower-order term. Over ℚ in this setting the needed
inequality is an exact Hodge-type inequality, not an asymptotic Riemann–Roch. (R3 of REVERSE.md: the "n² growth" for the
impostor's negative direction is automatic for any degree-2 homogeneous candidate and carries no information.)

## 3. Candidates in my toolkit
**(K1) Krein positive part (even, spectral).** With respect to the D_L inner product, write 𝔇 := the Hermitian form
D·D = 2ab − Q, 𝔇 = 𝔇₊ − 𝔇₋ (spectral parts in the D-geometry); h₁(g) := ⟨g, 𝔇₊ g⟩_D.
- C1: PROVED universal: h₁(g) + h₁(−g) = 2⟨g, 𝔇₊g⟩ ≥ 2⟨g, 𝔇g⟩ ≥ ½D·D when D·D ≥ 0 (and trivially otherwise). Uses only that
  D·D is a bounded form: functional equation + ∞, no arithmetic.
- C2: FAILS for every function: h₁ is even (h₁(−g) = h₁(g)), so h₁(g) > 0 forces deg g > 0 and deg(−g) > 0. With RH,
  ν₊(𝔇) = 1 (the hyperbolic plane minus Q ≥ 0), so 𝔇₊ is rank one and h₁ > 0 on a dense set of both degree signs.
- Effective (L4) would have to mean "positive Krein part": not a cone, so L5 cannot hold. Lesson: **H⁰ must be one-sided.**
**(K2) One-sided spectral: h₂(g) := ⟨g, 𝔇₊g⟩ · 1[deg g > 0].** C2: built in. C1: for deg ≠ 0 from (K1); at degree zero it is
  D·D ≤ 0, i.e. RH (Prop. R1.1(i)). So K2 puts RH into C1, against the predicted split. For the impostor (no degree), C1
  fails at its negative direction (D·D = −Q > 0 there with h₂ = 0).
**(K3) Effective cone modulo principal divisors (my machinery's natural candidate).** Two identifications, HEURISTIC but
  concrete: (α) **principal divisors = the Poisson null vectors** E(φ)|_window (plank 5): their Mellin transform is
  ζ(s)·Mφ(s), so they are Weil-null at every zero ("numerically trivial"), and they are exactly bridge 1's near-null
  ladder; for the impostor the same with E_f (its Dirichlet coefficients). (β) **effective = g ≥ 0** (a positive
  combination of Frobenius graphs Ψ(λ)). Define h₃(g) := (½D·D(g))₊ if some g + N with N principal of degree zero is ≥ 0
  on the window, else 0.
- L5 is then TRIVIAL and archimedean: g′ ≥ 0, g′ ≠ 0 ⇒ a(g′) + b(g′) = 2∫g′ cosh(u/2) > 0 (positive kernels). So with
  "effective = g ≥ 0" the fixed bound L5 needs no Euler product at all.
- L4 ("sections ⇒ effective representative") is where arithmetic can enter: g + E(φ) ≥ 0 with E having coefficients 1
  (positivity-preserving) for ζ, and a_n of mixed signs (1, κ, −κ, −1, 0) for the impostor (E_f does not preserve
  positivity). This is a POSITIVITY-OF-COEFFICIENTS input, not multiplicativity (L(s, χ) has signed coefficients and
  satisfies GRH as far as known, so a_n ≥ 0 cannot be the whole story: HEURISTIC caveat).
- But at degree zero: g + N ≥ 0 with deg(g + N) = 0 forces g + N = 0 (L5), so h₃ > 0 at degree zero only for numerically
  trivial g, and C1 at degree zero is again D·D ≤ 0 = RH (Prop. R1.1). K3 places RH in "C1 at degree zero" like K2.
**Verdict of the construction:** my candidates CONTRADICT the predicted split as a property of definitions (K1: C1
universal, C2 false for all; K2, K3: C2 trivial or archimedean, C1 at degree zero = RH). What the window machinery does
supply is a precise dictionary: fibre classes = pole functionals ĝ(±i/2); degree zero = Weil's codimension-2 conditions;
principal divisors = Poisson null vectors (the ladder); effective = nonnegative g, for which L5 is a one-line archimedean
fact. In that dictionary the Euler product (or coefficient positivity) can only act in L4.

## 4. Test on the existing matrices (after 1–3). Quantities: ν₊(𝔇) (Hodge-index count), and on the extremal direction v
(the pencil minimiser; for the impostor its negative direction): a, b, deg, D·D(v), h₁(±v), and the C1/C2 verdicts of K1, K2.

### 4.1 Outcomes (COMPUTED; two_zero/hodge.py.txt (float, discarded: see below), hodge2.py.txt; existing matrices;
D_L-whitened; one implementation, not certified)
Numerical trap first: in D-whitened coordinates the pole functionals have norm |α| ≈ |β| ≈ 3e14 (L = 1) and 1e27 (L = 1.25),
so the rank-2 part of D·D has eigenvalue ~2e29 / 3e54 and swamps every O(1) eigenvalue in float (spurious "+4e13"
eigenvalues). The Hodge count is therefore computed by Haynsworth inertia: ν₊(D·D) = ν₋(Q) + ν₊(M) − 1, M = UᵀA⁻¹U − J (2×2,
U = [α, β], J the hyperbolic form), which is stable. The K1/K2 values on the minimiser (D·D ≈ 7e24, set by 2ab) are not
informative for the same reason.
| case | ν₋(Q) | ν₊(D·D) (Hodge count) | min Q/D, whole window | min Q/D, degree zero (a = b = 0) |
|---|---|---|---|---|
| zeta L = 1.0 | 0 | **1** (M eigenvalues 2.1e24, 2.5e29) | 0.297833 | 0.297967 |
| zeta L = 1.25 | 0 | **1** | 0.204610 | 0.204624 |
| impostor L = 1.70 | 0 | 0 (no pole: D·D = −Q) | 0.041237 | 0.041905 |
| impostor L = 1.72 | 1 | 1 | −0.047964 | **+0.031291** |
| impostor L = 1.80 | 2 | 2 | −0.304332 | **−0.290412** |
Prediction (b): HIT on all five counts.
**Reading.**
- Zeta: exactly one positive square, the Hodge index signature (1, n), on both windows; on degree zero D·D ≤ 0 with margin
  equal to the comparison constant. All candidates' C1, C2 hold there (K1's C2 fails structurally, as proved).
- The impostor has no pole, hence no hyperbolic plane: for L < 1.70 its D·D is negative DEFINITE (no positive class at
  all, no "ample" class), and positive classes appear exactly as its Weil form fails (1 at 1.72, 2 at 1.8).
- **New: at its first failing window L = 1.72 the impostor's negative direction is NOT of degree zero.** Imposing zeta's
  fibre conditions ĝ(±i/2) = 0 (Weil's two codimension conditions) makes its form positive again (+0.031). The failure
  becomes visible at degree zero only from L = 1.8 (−0.290). So for one-sided candidates (K2, K3), C1 at degree zero fails for
  the impostor from L = 1.8 on, not at 1.72: the impostor's first failure lives in the hyperbolic (fibre) directions, which
  for zeta carry the pole. (Same lag 1.72 → 1.8 as the prime-sampling cone of PRIME_SAMPLING §7: there the fake weights
  hid it at 1.72; here the degree conditions hide it at 1.72. HEURISTIC link: both are "two extra linear conditions"
  effects near the first failure.)

## 5. Verdict and ratings
- Solving C1 + C2 for H⁰ gives exactly h_min = (½D·D)₊·1[deg > 0], and solutions exist iff RH (Prop. R1.1): the constraints
  do not determine H⁰, they restate Weil positivity. For continuous (degree-2 homogeneous) dimensions the Riemann–Roch
  amplifier is vacuous and C1 must hold exactly (Lemma R1.2).
- The predicted split is CONTRADICTED as a property of definitions: even spectral candidates make C1 universal and C2 false
  for everyone; one-sided candidates make C2 trivial (with "effective = g ≥ 0", L5 is a one-line archimedean fact) and put RH
  into C1 at degree zero. The split survives only as a programme: "find an H⁰ for which C1 is a theorem", and then C2 at
  degree zero is RH.
- Dictionary gained: fibre classes = ĝ(±i/2); degree zero = Weil's codimension conditions; principal divisors = Poisson null
  vectors (bridge 1's ladder); effective = g ≥ 0; Hodge count ν₊(D·D) = 1 for zeta (checked at two windows), = ν₋(Q) for
  the impostor. In this dictionary the arithmetic can act only in L4 ("sections ⇒ an effective representative modulo the
  ladder"), through positivity of E's coefficients for ζ versus mixed signs for the impostor.
**Quality 5/10**: the reduction (Prop. R1.1, Lemma R1.2) is proved and short, the dictionary is concrete, and the Hodge count
and the degree-zero lag are computed; not higher because the candidates are elementary and K3's L4 statement is not
formulated precisely enough to test. **Toward RH 1/10**: the constraints determine H⁰ only through RH itself; the bridge's
first plank shows where an intrinsic H⁰ would have to come from (an L4 statement about the ladder and positivity), not that
it exists.
