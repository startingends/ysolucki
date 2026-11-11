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
