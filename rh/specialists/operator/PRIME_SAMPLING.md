# H-4, the prime-sampling cone C_P(L) (SP-operator, one-object seat, session 6; 2026-11-11)

Read: NOTEBOOK N94 (whole, incl. H-4), CORE.md. Sections 1–4 were written before any computation of this session.
Labels: PROVED, HEURISTIC, KNOWN (from memory), OPEN.

Notation. g ∈ L²[−L, L] real, ĝ(z) = ∫ g(u) e^{izu} du, h = g ∗ g̃ (h(x) = ∫ g(u + x) g(u) du), so ĥ(z) = ĝ(z)·ĝ(−z)‾ and
ĥ = |ĝ|² on ℝ. By Krein's theorem (dimension 1), every continuous positive-definite h supported in [−2L, 2L] is a sum
(integral) of such g ∗ g̃, so the pd cone in h-space ↔ PSD "matrices" H = Σ g_i g_iᵀ in g-space, linearly: h is LINEAR in H.
S_L := {log n : n a prime power, n ≤ e^{2L}}, m := |S_L| ≈ e^{2L}/(2L). B_s(g) := (g ∗ g̃)(s) (a symmetric bilinear form in g,
indefinite). A := W_∞ + poles (the archimedean + pole distribution); Weil: Q(g) = A(h) − 2 Σ_{s∈S_L} Λ(e^s) e^{−s/2} B_s(g).
C_P(L) = {h pd, supp ⊂ [−2L, 2L], h(±s) = 0 ∀ s ∈ S_L} = {Σ g_i ∗ g̃_i : Σ_i B_s(g_i) = 0 ∀ s}. On C_P: Z(h) := Σ_ρ ĥ(γ_ρ) = A(h).

**Correction to N94 before anything else (PROVED, one line).** The pole term is NOT positive: for h = g ∗ g̃,
ĥ(i/2) + ĥ(−i/2) = 2∫ h(x) cosh(x/2) dx = 2ab, a = ∫ g e^{−u/2}, b = ∫ g e^{u/2}: an indefinite rank-2 form of signature (1, 1)
(the classical reason Weil positivity needs two codimension conditions, e.g. Connes–Consani's ĝ(±i/2) = 0). It is
negative whenever g has opposite-sign mass at the two edges, with size up to e^{L}·(edge mass)². In the full Weil form
this is compensated by the prime sum at x ≈ 2L (PNT makes the primes mimic the pole); on C_P the primes are gone, so
on C_P the pole must be controlled by the sampling constraints themselves (section 3).

## 1. (v) Object or shadow; is it known?
The trivialising object (N94's words, which I accept): a test class on which the prime side vanishes EXACTLY while it
still resolves single zeros in the bulk; then positivity is purely archimedean. C_P is the right shape for the first half
(the Euler product enters linearly, as the support of Λ, and the impostor is excluded by construction). It is a SHADOW
for a reason that the duality of section 2 makes exact: **"A ≥ 0 on C_P(L)" uses only the SET S_L, not the weights
Λ(n) = log p**; it is equivalent to "SOME weights on the prime powers make A + (prime-power-supported distribution)
positive on the window" (Prop. 2.1). So C_P-positivity forgets the values of Λ and keeps only its support. Whether the
support alone carries RH is exactly (Detect). And in the bulk, on C_P, A(h) = Z(h) is the zero sum itself, so proving
A ≥ 0 there is as hard as the zero statement (section 3).
Known? KNOWN (from memory, no search this session): Weil positivity for test functions with SUPPORT avoiding all prime
powers, i.e. supp h ⊂ (−log 2, log 2): Yoshida (1992, positivity for small support), Connes–Consani (2020/21, "Weil
positivity and trace formula, the archimedean place": positivity of the archimedean Weil functional for support in
[2^{−1/2}, 2^{1/2}] with two codimension conditions), Bombieri's notes on the Weil functional. The variant "vanishing AT
the log prime powers instead of support avoiding them" (C_P) I do not recall; not searched, so "not known to me".

## 2. (Detect)

**Prop. 2.1 (duality; PROVED, Hahn–Banach / conic duality, with closure).** For each L, with κ_P(L) := inf over h ∈ C_P(L),
D(h) = 1 of A(h) (D extended linearly to H: D(H) = Σ D(g_i)):
  κ_P(L) = sup_{c ∈ ℝ^{S_L}} λ_min( A + Σ_s c_s B_s ; D ),
i.e. the best comparison constant over ALL real weights on the prime powers ≤ e^{2L}. In particular
  A ≥ 0 on C_P(L)  ⇔  ∃ c (in the closure sense) with A + Σ_s c_s B_s ⪰ 0 on the window.
Proof. In h-space C_P(L) = K ∩ V, K = pd cone (closed, convex), V = ∩_s ker(δ_s) (finite codimension); (K ∩ V)* =
closure(K* + V^⊥), V^⊥ = span{δ_{±s}}; in g-language a functional is nonnegative on K iff it is a PSD quadratic form. ∎
Consequences. (i) RH ⇒ c_s = −2Λ(e^s)e^{−s/2} works (A + Σ c B = Q ⪰ 0), so A ≥ 0 on C_P(L) for every L, and κ_P(L) ≥ κ_min(L).
(ii) **(Detect) at window L ⇔ for EVERY choice of weights c on S_L, A + Σ c_s B_s has a negative direction.** So (Detect)
fails for all L iff every window admits FAKE prime-power weights (possibly L-dependent) restoring positivity: a "fake
explicit formula" with the true archimedean part, the true pole, primes at the true places, and different weights.
If such weights c^{(L)} stay bounded, a diagonal limit gives a positive measure μ ("real fake zeros") with μ̌ = A +
Σ_n c_n(δ_{log n} + δ_{−log n}) on ℝ. So (Detect) ⇐ (Rigidity): A admits no prime-power-supported correction with positive
Fourier transform other than (possibly) the true one, plus a boundedness clause. (Rigidity) is a uniqueness statement in
the Selberg-class spirit (degree 1, conductor 1, pole at 1 ⇒ ζ), but for positive measures with real masses and
arbitrary real weights it is NOT a known theorem (from memory). OPEN.

**The cone geometry (PROVED parts, HEURISTIC verdict).** By the Barvinok–Pataki rank bound the infimum defining κ_P is
attained (in finite dimensions) at H of rank r with r(r+1)/2 ≤ m + 1: the extremal elements of C_P are sums of
r ≈ (2m)^{1/2} ≈ e^{L}/√L autocorrelations, not one. Let λ₁ ≤ λ₂ ≤ … be the pencil (Q, D) eigenvalues at window L with
eigenvectors v_i. Then κ_P(L) ≤ λ_k as soon as some nonzero PSD H on span(v₁..v_k) satisfies the m constraints, and by the
Gordan/Finsler alternative that happens iff NO combination Σ c_s B_s is positive definite on span(v₁..v_k) (PROVED).
If RH fails, Q has ν_− ≤ 2N_off negative directions (Pontryagin count, TRIANGLE 2.1): a FIXED number, while m → ∞; generic
m ≥ 3 symmetric forms already have a positive-definite combination on any 2-dimensional space. So the negative
directions alone are never feasible; a detecting H must mix them with ~e^{L}/√L positive directions, and detection is a
contest: |λ_−| (which grows like e^{2βL} times local factors for a fixed quartet as L → ∞) against the cost of satisfying
m ≈ e^{2L}/(2L) autocorrelation constraints. The constraint functionals are autocorrelations at shifts s that are
e^{−2L}-close near the top of the window, i.e. nearly parallel: their conditioning can cost exponentially much. Since
e^{2βL} < e^{L} for every β < ½, **if the conditioning cost grows like a power of m, (Detect) FAILS for every quartet;
it holds only if the constraints can be met at sub-exponential cost.** HEURISTIC; the decisive quantity is the smallest
singular value of the m shifted-autocorrelation functionals restricted to the low pencil eigenspaces. OPEN.

## 3. The pole and archimedean terms on C_P; where the sampling density enters
- Consistency (PROVED): on C_P, A(h) = Q(g) (the prime sum vanishes), so A ≥ 0 on C_P(L) whenever the full Weil form is
  positive on window L. Hence A ≥ 0 on C_P(L) is a THEOREM for 2L ≤ log 2 (no constraint; Connes–Consani / Yoshida) and on
  the foothold seat's certified one-prime windows (PROOF_window_prime2.md, L ≤ 0.54). Nothing can be "false already for
  small L"; a negative number there would be an error in the machinery.
- Where the density enters (HEURISTIC, quantitative). (a) The pole: 2ab = 2∫ h(x) cosh(x/2) dx is dominated by x ≈ 2L
  (weight e^{L}), where h must vanish on S with spacing δ(x) ≈ x e^{−x}. Quadrature: if h has local frequency T near x, then
  |∫_J h·2cosh(x/2)| ≲ δ(x)·T·∫_J |h|·2cosh(x/2): the pole is suppressed unless the edges of g carry frequencies
  T ≳ 1/δ(2L) ≈ e^{2L}/(2L). (b) The archimedean density Ω(t) = Re ψ(¼ + it/2) − log π is negative only for |t| ≲ 6.3; low-
  frequency h (type ≲ 6.3) has at most ≈ 2 zeros per unit length, while S has density e^{x}/x > 2 beyond x ≈ 1.5, so
  low-frequency parts of g can only correlate over lengths ≲ 2, unless high-frequency parts cancel their autocorrelation
  at the sample points (h(s) = 0 is a condition on the TOTAL h, so this cancellation is allowed, and it is where a proof
  would have to work). (c) **The forced frequency is ≈ e^{2L}/(2L), a factor ≈ 4πL below the band edge 2πe^{2L}: that is
  INSIDE the bulk (below Montgomery's line, where the window resolves zeros), not the soft regime.** N94 named the risk
  "a factor L below the band edge, i.e. the soft regime"; the factor is right but the regime is the opposite one
  (soft = above the band edge). The consequence is worse, not better: in the bulk W_∞ is the smooth zero density and on C_P
  A(h) = Σ_ρ ĥ(γ_ρ) exactly, so "A ≥ 0" there is the zero statement itself; the uncertainty principle forces the test
  functions INTO the hard region instead of keeping them out of it.
- Degrees of freedom (for the record): window 2L, frequencies up to T ≈ e^{2L}/(2L): about e^{2L}/π dimensions; on-line
  zeros below T ≈ e^{2L}/(2π); prime constraints ≈ e^{2L}/(2L). Feasible by counting (as N94 said), so counting decides
  nothing.

## 4. Tightness and the impostor
- Tightness. "A ≥ 0 on C_P(L)" does not mention the zeros; it has no margin and so does not conflict with H10/H11. Its
  natural margin κ_P(L) ≥ κ_min(L) is a comparison constant; C_P should still contain functions vanishing at all zeros
  except a close pair (counting above), so κ_P(L) → 0 along Lehmer pairs is expected (HEURISTIC). Through a collision
  nothing changes in C_P-positivity itself (a double on-line zero contributes ĥ(γ) ≥ 0 twice): the criterion is blind to
  collisions; tightness is carried only by κ_P, as for κ_min.
- The impostor. Its explicit formula has W_∞^{DH} (Γ((s+1)/2), conductor 5), NO pole, and weights c_n of both signs on
  ALL n ≢ 0 (mod 5). Its prime side vanishes on C^{DH}(L) := {h pd, h(±log n) = 0 for 2 ≤ n ≤ e^{2L}, 5 ∤ n} (density
  ≈ (4/5)e^{x} instead of e^{x}/x: many more constraints), and there Z_DH = W_∞^{DH}. Its version of Prop. 2.1: W_∞^{DH} ≥ 0
  on C^{DH}(L) ⇔ some real weights on {n ≤ e^{2L}, 5 ∤ n} make W_∞^{DH} + Σ c B positive. It has off-line zeros, so its
  version fails at some L iff (Detect) holds for it; it can hold for all L only if fake weights exist at every window.
  The exact difference from zeta in this construction: the support set (prime powers, density e^{x}/x, versus all n prime
  to 5, density (4/5)e^{x}) and the pole (zeta's indefinite 2ab, absent for the impostor). The weights' signs (Λ ≥ 0 versus
  c_n of both signs) do NOT enter, by Prop. 2.1: C_P forgets the weights.

## 5. Computation (after 1–4). PREDICTIONS (written before running)
Quantity: κ_P(L) via Prop. 2.1's dual, maximised over c, restricted to the span of the K lowest pencil eigenvectors
(an UPPER bound for the true κ_P that decreases with K), and κ_min(L) ≤ κ_P(L) as the lower bound.
(P1) zeta L = 1.0 (m = 5): κ_P ∈ [0.298, 0.33] (near the 3rd pencil eigenvalue: r(r+1)/2 ≤ 6 ⇒ r ≤ 3).
(P2) zeta L = 1.25 (m = 8): κ_P ∈ [0.205, 0.26].
(P3) impostor L = 1.72 (24 constraints, n ≤ 31, 5 ∤ n, κ_min = −0.048 with ONE negative direction): the negative direction
     does NOT survive: κ_P^{DH}(1.72) > 0 (probability 0.65), i.e. (Detect) fails for the impostor at its first failing
     window, as section 2's contest predicts when |λ_−| is small.
