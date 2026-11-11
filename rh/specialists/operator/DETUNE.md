# Detuning the prime weights of the window Weil form (SP-operator; 2026-11-11)

Question (lead, after N120–N121): is ζ's tuning an isolated stable point? Detuned form
Q_ε = Q − Σ_{k} ε_p · 2 Λ(p^k) p^{−k/2} · B_{p^k}, B_n = the Legendre matrix of g ↦ (g ∗ g̃)(log n) (the prime-atom matrix of
the foothold code), archimedean and pole parts unchanged. κ_min(ε, L) = lowest value of the pencil (Q_ε, D_L).

## PREDICTION (written before any run)
The two alternatives offered: (a) every detuning of either sign breaks positivity at some L in range, with L*(ε) growing like
log(1/|ε|); (b) some sign stays positive throughout. My prediction is (a) in a SHARPER form, for a structural reason:
Q's near-null ladder (prolate defects, ~1e-3 at L = 0.34 down to 1e-30 at L = 1) exists only because W_∞ + poles and the prime
sum cancel EXACTLY on Poisson images of prolates (plank 5: the functional equation with the true Λ). The atom forms B_{p^k} are
O(1) on ladder vectors and indefinite there. So a detuning by ε changes Q by O(ε) on directions where Q and D are of size
λ₁(L) ≈ (prolate defect), and **κ_min turns negative as soon as ε·|B| exceeds the defect, for BOTH signs**, at
L*(ε) ≈ ½ log(log(1/|ε|)/const) + (log p)/2-type threshold, i.e. like log log(1/|ε|), faster than log(1/|ε|); and the
first negative direction is a LADDER (bottom-rung, prolate) direction, NOT a closest-pair direction. Probability 0.7.
Numerical form: for ε = ±0.01 the first failure within 0.15 of the window where p first enters (L = ½ log p: 0.347, 0.549,
0.805 for p = 2, 3, 5); for ε = ±0.3 within 0.05 of it.
