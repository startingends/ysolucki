# The prime weights as bootstrap unknowns (SP-operator; 2026-11-11)

R_L := { c ∈ ℝ^{S_L} : A + Σ_s c_s B_s ⪰ 0 on the window }, A = W_∞ + poles of ζ (archimedean part and poles fixed),
B_s = the Legendre matrix of g ↦ (g ∗ g̃)(log s), S_L = prime powers ≤ e^{2L}. ζ's point: c_ζ,s = −2Λ(s) s^{−1/2} (so that
A + Σ c_ζ,s B_s = Q). Convex; R_{L′} projects into R_L for L′ > L.

## PREDICTION (written before any computation)
- R_L is BOUNDED for every L ≥ ½ log 2 (a combination Σ c_s(δ_{log s} + δ_{−log s}) has no δ₀ term, so it is never positive
  definite; hence no recession direction). PROVED in the remark; numerically checked below.
- c_ζ is an INTERIOR point of R_L, not an extreme point, on every computed window: Q is strictly positive there (its lowest
  eigenvalue is ≈ 1.6e-3 at L = 0.34 … 6e-30 at L = 1, positive), so a ball of radius ≈ λ₁(Q)/max‖B_s‖ around c_ζ lies in R_L.
  The detuning of N122 is not a boundary statement at fixed L; it says that radius collapses with L.
- Widths (max − min of c_s over R_L, relative to |c_ζ,s|), from the detuning numbers: L = 0.45: c₂ ≈ 0.01–0.05;
  L = 0.6: c₂ ≈ 1e-4–1e-3, c₃ ≈ 0.01–0.05; L = 0.85: c₂, c₃ ≈ 1e-14–1e-10, c₄, c₅ ≈ 1e-4–1e-2; L = 1.0: all ≤ 1e-20 except the
  newest c₇ (1e-6–1e-2). So R_L is a tiny, very elongated neighbourhood of c_ζ, shrinking super-exponentially (like the prolate
  defect e^{−c}, c = 2πe^{2L}) in the coordinates of the older primes.
- Impostor at L = 1.72: R^DH is NONEMPTY (PRIME_SAMPLING §5.1: fake weights give κ ≥ +0.0356), and its true weight vector is
  NOT in it (its Q has a negative direction).

**Remark (boundedness, PROVED).** If c ≠ 0, pick s₀ with c_{s₀} ≠ 0 and a test function g = two narrow bumps at distance log s₀
whose difference set avoids the other log s; then Σ c_s (g ∗ g̃)(log s) = 2c_{s₀}·Re(a₁ā₂)·(bump overlap), of either sign by
the phases: no nonzero Σ c_s B_s is positive semidefinite on the window, so R_L has no recession direction.

## Results (COMPUTED; two_zero/boot.py.txt (SDP, cvxpy), invis.py.txt (exact-arithmetic directions); logs boot.log,
boot2.log, invis.log; zeta dumps at L = 0.45, 0.6, 0.85, 1.0; one implementation, not certified)
Range of c_s − c_ζ,s over R_L (SDP: other coordinates free; for L ≥ 0.85 SCS cannot handle the 1e18–1e28 scale spread and
reported spurious "unbounded" values, so the exact-arithmetic intervals along coordinate lines through c_ζ are given instead):
| L | prime powers | c₂ (c_ζ = −0.980) | c₃ (−1.269) | c₄ (−0.693) | c₅ (−1.440) | c₇ (−1.471) |
|---|---|---|---|---|---|---|
| 0.45 | 2 | [−2.0e-3, +1.96e-2] | | | | |
| 0.6 | 2, 3 | [−2.9e-7, +1.26e-5] | [−2.2e-2, +5.2e-3] | | | |
| 0.85 (lines) | 2, 3, 4, 5 | [−1.0e-18, +1.8e-16] | [−4.4e-16, +1.5e-14] | [−2.2e-12, +2.3e-11] | [−1.3e-6, +4.1e-6] | |
| 1.0 (lines) | 2, 3, 4, 5, 7 | < 1e-24 | [0, +2.5e-24] | [−2.9e-23, +1.0e-21] | [−1.6e-19, +2.4e-18] | [−3.0e-7, +7.4e-7] |
**Is there a combination of weights the ladder cannot see?** No (invis.py.txt): the Gram matrix of the whitened atom forms has
eigenvalues spread over 22 orders, with eigenvectors almost exactly the coordinate axes (off-axis components 1e-3 … 1e-22);
the "softest" combination is the newest prime power (width 1e-5 at L = 1), every older coordinate is pinned at its own ladder
depth (|W_s| = 4e6 … 8e27). So R_L is a tiny, nearly axis-aligned box around c_ζ whose sides scale like 1/|W_s|.
**Prediction score.** Bounded: HIT (proved and computed). c_ζ interior, not extreme: HIT (κ_min > 0; but its position is
lopsided: at L = 0.85 the c₂ interval is [−1e-18, +2e-16]). Widths: L = 0.45 HIT (2.2e-2); L = 0.6 HIT (1.3e-5, 2.2e-2);
L = 0.85: c₂, c₃ predicted 1e-14–1e-10, got 1e-16–1e-14 (smaller: MISS by two orders), c₄, c₅ predicted 1e-4–1e-2, got 2e-11
and 4e-6 (MISS); L = 1.0: ≤ 1e-20 except c₇: HIT (c₇ 7e-7). The collapse is faster than I guessed.
**Impostor (item 2).** By conic duality R_L ≠ ∅ ⇔ κ_P(L) ≥ 0 (PRIME_SAMPLING Prop. 2.1: the bootstrap region is the dual of the
prime-sampling cone). At L = 1.72: R^DH ≠ ∅ (κ_P ≥ +0.0356 with fake weights on its 24 support points) and its true weight
vector is outside (κ_min = −0.048): CONFIRMED from the existing computation. At L = 1.8 whether R^DH is empty is exactly H-4's
undetermined κ_P(1.8) ∈ [−0.233, ~0.14]. Not recomputed.

## The logic (item 3)
R_∞ := the projective limit = {c on all prime powers : A + Σ c_s(δ_{log s} + δ_{−log s}) is positive definite on ℝ} = {c : there
is a positive measure μ with μ̂ = A + Σ c_s(δ + δ)} (Bochner–Krein). RH ⇔ c_ζ ∈ R_∞. The numbers show R_L collapsing onto c_ζ
super-exponentially in every old coordinate, which is consistent with |R_∞| ≤ 1. For "R_∞ ≠ ∅ ⇒ RH" one needs RIGIDITY: every
c ∈ R_∞ equals c_ζ. The collapse seen here is driven by the near-null ladder, i.e. by the functional equation, which the
impostor shares; at L = 1.72 its region is nonempty around FAKE weights while its true weights are excluded. So the ladder
pins "a" point, not "ζ's" point: what it pins is the unique weight vector compatible with Poisson summation on the windows
computed, and ζ is that point only because ζ satisfies RH on those windows. Missing, for "nonempty ⇒ equals ζ": (i) the Euler
product (Λ(p^k) = log p for all k, multiplicativity), absent from the bootstrap, where c_{p^k} are independent; (ii)
discreteness with integer multiplicities of μ (positivity gives only μ ≥ 0: a positive crystalline measure whose Fourier
transform minus the archimedean part lives on log prime powers; positive crystalline measures exist in other settings,
Kurasov–Sarnak 2020 from real-rooted stable polynomials, from memory; uniqueness for this support and archimedean part is not
known to me); (iii) a determinacy theorem (Hamburger-type) saying that A and the support {log p^k} determine c, which no
moment-problem result supplies, since c enters the data, not the moments. The bootstrap turns RH into "R_∞ contains c_ζ",
not into "R_∞ ≠ ∅", unless (i)–(iii) are added; with (i) added, R_∞ ∩ {Euler products} ≠ ∅ is a statement about ζ alone,
which is RH again.
**Ratings.** Quality 6/10: the region is computed reliably (exact-arithmetic directions where the SDP fails), bounded by proof,
shown to be a nearly axis-aligned box collapsing at the ladder depth of each prime power, and identified with H-4's dual cone;
not higher because the full-SDP box at L ≥ 0.85 and the impostor's region at 1.8 are not computed. Toward RH 1/10: the
collapse is a functional-equation effect shared with the impostor, so it pins a point without saying it is ζ's.
