# Reverse engineering the proof (bridge 2, built backwards from the island)
Owner, 2026-11-11: "assume it was solved by how you think it would be solved, and then work your way through that."
Lead's assumption (from the end of the session, N92–N110 and the answer to the owner): the proof is Weil's proof for
curves transported to ℚ, i.e. Riemann–Roch on a "square" ⇒ Hodge index ⇒ Weil positivity ⇒ RH. This file works
BACKWARDS from RH, one link at a time, and asks at each link: what must be true, does it exist, and what is the first
thing the project can construct or test. Each link is a plank (rule 12); confirmations as in `BRIDGE.md`.

## The chain, read backwards (status of each link over ℚ)
- **L0. RH.** ⇐ L1 (Weil 1952: equivalent).
- **L1. Weil positivity** I(f, f) ≥ 0 for test functions f on ℝ₊* orthogonal to the "fibres" (f̂(±i/2) = 0).
  ⇐ L2 by Lemma 2.1 of Connes' essay: I(x, x) ≤ 2 I(x, ξ₀) I(x, ξ₁). Status: equivalent to RH; the target.
- **L2. Hodge index on the square:** D·D ≤ 0 for divisors D = D(f) = ∫ Ψ(λ) f(λ) d*λ of degree zero, where Ψ(λ) is
  the Frobenius correspondence (the scaling action, idele class action) and D(f)·D(f) = 2 I(f, f) (Connes'
  normalisation, sign convention to be fixed). ⇐ L3 + L4 + L5 (Mattuck–Tate–Grothendieck argument).
- **L3. Riemann–Roch inequality on the square:** Dim H⁰(D) + Dim H⁰(−D) ≥ ½ D·D (Connes' hoped form, enough for
  the argument). Status: **MISSING** ("what is missing is an intersection theory and a Riemann–Roch theorem on the
  square of the arithmetic site", Connes 2015). Curve-level Riemann–Roch EXISTS (scaling-site orbits C_p 2016;
  Spec ℤ-bar over S[±1] 2022; over S 2023).
- **L4. Effectivity:** Dim H⁰(D) > 0 ⇒ D is linearly equivalent to an effective (strictly positive) divisor.
  Status: needs a definition of "effective" on the square; in function fields effective = made of points.
- **L5. Positive degree of effective classes:** D > 0 ⇒ D·ξ₀ + D·ξ₁ > 0 (ξ₀, ξ₁ the fibre classes; for D(f) these
  are the pole terms ∫ f(λ) λ^(±½) d*λ). Status: in function fields this is "points are counted positively".

## What the backwards reading teaches (lead)
- **The mechanism of the function-field proof, in this session's language.** Riemann–Roch (L3) is the AMPLIFIER: if
  D·D > 0, then h⁰(nD) or h⁰(−nD) grows like n² D·D/2, so some multiple is effective. Positivity of counts (L5) is the
  FIXED BOUND. So the function-field proof is exactly an "amplifier + fixed bound" argument (N86–N87, N105), with the
  amplifier quadratic in n and the bound coming from points, not from coefficients of a series. That is how it
  escapes N84: coefficient positivity is applied to EFFECTIVE DIVISORS produced by Riemann–Roch, not to test
  functions, so oscillation never enters.
- **Where the Euler product must act: L4–L5.** The impostor has the same archimedean data and the same functional
  equation; if L3 held for it with the same definition of H⁰, then L4–L5 must FAIL for it (it violates L1). So the
  Euler product is the reason "effective ⇒ positive degree" holds: effective classes are built from periodic orbits
  of the scaling flow, which are the primes (lengths log p with multiplicity log p), and counts of orbits are ≥ 0.
- **Where ∞ must act: L3.** The archimedean place contributes to Riemann–Roch through the uncertainty principle: on
  the window [−L, L] with band c the number of degrees of freedom is the Landau–Pollak–Slepian count 2Lc/π + O(log),
  and bridge 1's near-null ladder (prolate defects 1 − χ_n at c = 2πe^(2L)) is precisely the transition between
  "sections" and "non-sections" at ∞. So the archimedean local Riemann–Roch is a prolate count (HEURISTIC, to be
  made a plank). This turns N90's "uncertainty principle as obstacle" into "uncertainty principle as the ∞-local
  Riemann–Roch".

## Planks, in the order they can be attacked now
| # | plank | status | confirmation demanded |
|---|---|---|---|
| R1 | **Solve for H⁰ from the constraints.** Construct candidate definitions of Dim H⁰(D(f)) on the window machinery (positive spectral projections of window operators built from f; Sonin/prolate subspaces; continuous dimensions in Connes–Consani's sense) and test, for zeta and the impostor, (C1) the inequality L3, (C2) "Dim H⁰ > 0 ⇒ L5-positive", (C3) the impostor must break C1 or C2, and say which | open (SP-operator, construction first) | a candidate satisfying C1 and C2 for zeta on all computed windows, and failing C2 (not C1) for the impostor exactly at L ≥ 1.72, would be the first sign the bridge points the right way |
| R2 | **Archimedean Riemann–Roch = prolate count.** Make precise: the ∞-local h⁰ − h¹ on a window is the prolate count, and with the prime-local terms it reproduces the Riemann–von Mangoldt count N(T) (degree + 1 − g form) | open | the identity checked numerically for zeta and for χ₅ at three windows |
| R3 | **Quadratic amplification.** In any candidate of R1, for the impostor's negative direction v (D·D > 0 there), Dim H⁰(±nD(v)) must grow like n²; for zeta no such growth | open, after R1 | blind prediction of the growth exponent before computing |
| R4 | **Effectivity from orbits.** Show that a candidate "effective" class (L4) is a positive combination of periodic-orbit classes (primes) and that its degree (L5) is a sum of log p's: this is where the Euler product would be used, structurally | open, after R1 | the impostor's version has a negative orbit weight exactly where its form goes negative |
Ratings now: Quality 3 (a chain whose missing link is named by Connes himself), Toward RH 3 if R1 gives a candidate
with the predicted split (C1 universal, C2 Euler-product-dependent); 2 otherwise.
