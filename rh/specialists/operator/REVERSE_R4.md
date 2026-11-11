# R4: the effectivity step E in K3's language (SP-operator, session 8; 2026-11-11)

Read: REVERSE.md (incl. N112 / K3 as main line), my REVERSE_R1.md. Sections 1–3 written before any computation.
Conventions of REVERSE_R1 §1: a(g) = ĝ(i/2), b(g) = ĝ(−i/2), D·D(g) = 2ab − Q(g), degree zero ⇔ a = b = 0.

## 1. E stated exactly on the window, and its status
**Principal divisors.** A divisor class is numerically trivial iff 𝔇(p, ·) = 0, 𝔇 = the bilinear form of D·D. On a finite
window 𝔇 is nondegenerate (the lowest eigenvalue of Q is ≈ 6e-30 at L = 1, not 0), so the only exact principal divisor is 0.
The natural near-principal space is
  P_ε(L) := Λ_ε(L) ∩ ker a ∩ ker b,  Λ_ε(L) := span of the L²-eigenvectors of Q with 0 ≤ eigenvalue ≤ ε
(bridge 1's ladder: Poisson images of prolates, Q(p) ≤ ε‖p‖², and degree zero imposed because numerically trivial classes
must have D·ξ = 0; ladder vectors themselves have a, b of size ‖p‖, so the two conditions are not automatic).
dim Λ_ε(L) ≈ #{prolate defects 1 − χ_n(c) ≲ ε} ≈ c/π − O(log c · log(1/ε)) = 2e^{2L} − O(L log(1/ε)) (HEURISTIC, plank 1's
index rule: one rung per n ≡ 0 mod 4 (even) and n ≡ 2 mod 4 (odd)); measured at L = 1: about 10 eigenvalues below 1e-5
(foothold §20). dim P_ε = dim Λ_ε − 2.
**E(L, ε).** For every g ∈ L²[−L, L] with a(g) = b(g) = 0 and D·D(g) = −Q(g) > 0, there is p ∈ P_ε(L) with g + p ≥ 0 on [−L, L].
**Prop. R4.1 (PROVED, one line).** E(L, ε) is equivalent to Weil positivity on degree-zero window functions at window L.
Proof. If g + p ≥ 0 and a(g + p) = ∫(g + p) e^{−u/2} = 0, then g + p = 0 a.e., so g = −p ∈ P_ε ⊂ {Q ≥ 0}, contradicting Q(g) < 0.
So E's conclusion can never be met, and E holds iff its hypothesis is empty, i.e. iff Q ≥ 0 on degree zero. ∎
So E is a PURE REFORMULATION of Weil positivity on the window (neither stronger nor weaker), exactly as in function fields,
where "nD ~ effective of degree 0 ⇒ nD ~ 0" is the contradiction that Riemann–Roch produces. **All the content is in a
mechanism that produces the effective representative without knowing in advance that none can exist.** Variants that are
not pure reformulations: (E′) drop the degree conditions on p (p ∈ Λ_ε): then g + p ≥ 0 has positive degree a(p) + b(p) > 0,
the statement becomes "every degree-zero class with D·D > 0 is a ladder vector plus an effective one", which is not
excluded by the degree argument and is a real statement about the ladder's shape; (E_δ) allow g + p ≥ −δ.

## 2. Mechanism candidates that use the Euler product
**(a) Positivstellensatz / Finsler certificate.** Q ≥ 0 on ker a ∩ ker b ⇔ ∃ u, w with Q + u⊗α + α⊗u + w⊗β + β⊗w ⪰ 0 (Finsler's
lemma for a codimension-2 subspace; PROVED, standard). Under RH u = w = 0 works for the full Q (Q ⪰ 0 with poles). A
certificate "modulo the effective cone" would be: Q(g) = σ(g) + Σ_k ⟨g, φ_k⟩·⟨g, ψ_k⟩ with σ ⪰ 0 and φ_k, ψ_k ≥ 0 (copositive
terms) — a copositive decomposition. The impostor breaks (a) only by being false (its Q is indefinite on degree zero from
L = 1.8, REVERSE_R1 §4.1); (a) contains no Euler product unless the copositive terms are the prime terms (then it is (b)).
**(b) "Points are counted positively" (PROVED for ζ, FALSE for the impostor).** For g ≥ 0 on the window, h = g ∗ g̃ ≥ 0
pointwise, so the prime side 2Σ Λ(n) n^{−1/2} h(log n) ≥ 0 and
  **Q(g) ≤ W_∞(g ∗ g̃) + 2a(g)b(g), i.e. D(g)·D(g) ≥ −W_∞(g ∗ g̃) for every EFFECTIVE D(g)** (g ≥ 0),
an archimedean lower bound for the self-intersection of effective classes (an "archimedean adjunction"). The defect is
exactly the positive point masses log p at log p^k. For the impostor the prime side is Σ c_n n^{−1/2} h(log n) with c_n of
both signs on all n ≢ 0 (5): the bound fails by Σ_{c_n<0} |c_n| n^{−1/2} h(log n). This is the cleanest place found so far
where Λ ≥ 0 acts POINTWISE: on effective classes, with no oscillation (h ≥ 0), escaping N84. Its limitation: it bounds D·D
of effective classes from BELOW; the Hodge-index direction needs D·D ≤ 0 for degree-zero classes, which are never effective.
To use (b) one needs E′: a degree-zero class with D·D > 0 written as effective + ladder, after which (b) applied to the
effective part, plus the ladder's near-nullity, would bound D·D. (HEURISTIC: this is the shape of an argument, not one.)
**(c) A non-continuous dimension (escaping Lemma R1.2).** Needs integer values with a LINEAR error under g → ng. The only
integral data in the explicit formula are multiplicities: zeros with integer orders, and orbit counts (the number of prime
powers ≤ x is an integer, the weights log p are not). Candidate: h⁰(D(g)) := #{lattice points of a region of area
∝ D·D(g)} in the (log n, frequency) plane, e.g. the number of prime powers n ≤ e^{2L} with (g ∗ g̃)(log n) above a threshold
scaled by n. OPEN; not formulated precisely enough to test. The impostor's orbit "counts" are its coefficients' supports
(all n ≢ 0 mod 5) with signed weights, so any count of SIGNED weights breaks integrality-positivity.

## 3. PREDICTION for the computation (written before any run)
LP: maximise t subject to g + Σ c_j p_j ≥ t on a grid of 2000 points, p_j a basis of P_ε (ε = 1e-6, degree zero imposed) or of
Λ_ε (variant E′), ‖c‖_∞ bounded.
(i) impostor L = 1.8, degree-zero negative direction g: E infeasible (t* < 0), as Prop. R4.1 forces (up to grid effects);
    E′ (p ∈ Λ_ε, any degree): also infeasible (probability 0.7): the ladder is too small (~2e^{3.6} ≈ 70 vectors at most,
    fewer below 1e-6) to fill the negative part of a wave packet.
(ii) zeta L = 1.0, 1.25: the direction maximising D·D/‖g‖² is ≈ (e^{−u/2}/‖·‖ + e^{u/2}/‖·‖), already ≥ 0: feasible with p = 0.
    The D-normalised top direction (D⁻¹(α + β)-type, ladder-heavy): I predict it changes sign and E′ is feasible at 1.25 but
    not at 1.0 (probability 0.5).
(iii) control: a degree-zero random combination of bulk eigenvectors (Q > 0): E infeasible (degree argument), E′ infeasible.
