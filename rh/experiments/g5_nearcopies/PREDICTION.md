# G5 plank zero (lead, 2026-11-11), written before computing. Analogue over Q with quadratic twists.
A_d(D) = Σ_{n ≤ D} μ(n) χ_d(n) W(n/D), χ_d(n) = (d/n) Jacobi-Kronecker for odd n (n even dropped), W smooth bump on [1/2, 1].
Family: d = 1..H. Exact copies: d = k² (twist = principal mod k).
Prediction: (P1) the d with |A_d − A_1| ≤ 0.1·|A_1| + 2√D are exactly the perfect squares with small k, plus at most
a few non-squares (≤ 2% of the family); (P2) for non-squares |A_d| is of size √D (median within a factor 3 of √(Σ W²μ²));
(P3) no non-square d has corr(A-vector over D-windows) > 0.5 with A_1 across 5 lengths D.
A surprise (approximate copies of intermediate density) would be ≥ 5% of non-squares within that tolerance.

## Run 1 was ill-posed (recorded, not a result)
With a smooth weight W the smoothed Möbius sums cancel to O(1) (A₁ = −0.22 against rms 0.77 at D = 2·10⁴), so a tolerance
of 2·rms accepts everything (99% "near copies"). Run 2, prediction unchanged in substance, tolerance tightened BEFORE
looking: sharp cutoff n ≤ D (Mertens-type sums), tolerance |A_d − A₁| ≤ 0.1·rms where rms = √(#squarefree odd n ≤ D);
baseline = the same statistic for |A_d − A_{d'}| over random pairs of non-squares. P1': near copies are the squares
(and possibly d = 4k² variants), non-square fraction within tolerance ≤ 2× the random-pair baseline.
