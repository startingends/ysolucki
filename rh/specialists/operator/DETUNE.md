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

## Results (COMPUTED; two_zero/detune.py.txt, log two_zero/detune_scan.log; 13 new zeta dumps at L = 0.36 … 0.90 (degree
40–70, 400 bits) plus L = 1.0; D_L-whitened, arb for the atom matrices, float eigenvalues; one implementation, not certified)
First window in the grid {0.36, 0.38, 0.40, 0.45, 0.56, 0.58, 0.60, 0.65, 0.70, 0.81, 0.83, (0.85, 0.90 not needed), 1.0} at which
κ_min < 0 (κ_min(0) = 0.33 … 0.31 throughout):
| ε | p = 2 (enters at 0.347) | p = 3 (0.549) | p = 5 (0.805) | combined 2, 3, 5 |
|---|---|---|---|---|
| +0.30 | 0.38 | 0.58 | 0.81 | 0.38 |
| −0.30 | 0.40 | 0.58 | 0.81 | 0.40 |
| +0.10 | 0.40 | 0.58 | 0.83 | 0.40 |
| −0.10 | 0.45 | 0.58 | 0.83 | 0.45 |
| +0.03 | 0.45 | 0.58 | 0.83 | 0.45 |
| −0.03 | 0.45 | 0.60 | 0.83 | 0.45 |
| +0.01 | 0.45 | 0.60 | 0.83 | 0.45 |
| −0.01 | 0.56 | 0.60 | 0.83 | 0.56 |
Every detuning of either sign breaks positivity, 0.005–0.21 in L after the prime power first enters the window, and the
breakage is catastrophic one window later (κ_min ≈ −2e2 … −8e5 at L ≈ 0.56–0.58; −1e16 … −2.5e27 at L = 1.0, linear in ε).
**The negative direction is always a bottom LADDER rung, never a closest-pair direction:** D(v)/‖g‖² = 2e-4 … 6e-30 (the
deepest rung: 6e-30 for ε > 0, the second rung 2e-26 for ε < 0 at L = 1), i.e. the prolate near-null vectors.
**Scoring.** (a) both signs break in range: HIT. Lag growing slower than log(1/|ε|) (about log log): consistent with the coarse
grid (lag for p = 2: 0.03 at ε = +0.3, 0.21 at ε = −0.01). The numerical forms: within 0.15 of entry for ε = ±0.01: HIT for
p = 3, 5 and +0.01 at p = 2, MISS for −0.01 at p = 2 (0.21); within 0.05 for ±0.3: HIT except p = 2, −0.3 (0.053, marginal).
Ladder direction: HIT. (b): refuted in range.
**Reading.** ζ's prime weights are pinned not by the bulk (the closest-pair constant κ ≈ 0.3) but by the near-null ladder,
which exists only because the archimedean term, the poles and the TRUE weights Λ(p^k) cancel on Poisson images of prolates
(plank 5, the functional equation). Any relative change ε of one prime's weight is seen at once by the ladder, whose Q and D
are of size e^{−c}, c = 2πe^{2L}, so the window at which an ε-detuning shows is where the prolate defect falls below ε: a
log log(1/|ε|) law. In "music" terms (N120): the instrument is not tuned at an isolated stable point of the bulk; it is held
by the functional equation, and a detuned string is heard first in the overtones (the ladder), not in the closest pair of
resonances. Since the detuned object has no functional equation, this says nothing about RH; it says the window form's
positivity is exactly tight in every prime-weight direction, at the ladder level.
