# e27 (lead, 2026-11-11). Written BEFORE computing.
Question: is the "prolate law" a statement about ONE eigenvalue per window (idea 2) or about the whole near-null
ladder with ONE constant? Compute the lowest three eigenvalues of each parity block of the window form at
L = 0.5, 0.75, 1.0 and the defects 1 - chi_n(c), c = 2 pi e^(2L), of the time-and-band limiting operator
(kernel sin(c(x-y))/(pi(x-y)) on [-1, 1]).
Blind predictions:
 P1. Matching is by index: k-th even eigenvalue <-> 1 - chi_(2k+2) (k = 1, 2, 3: indices 4, 6, 8);
     k-th odd eigenvalue <-> 1 - chi_(2k+3) (indices 5, 7, 9).
 P2. With that matching the six ratios kappa = eigenvalue / defect at L = 1.0 lie within a factor 4 of each other
     (all between 2 and 30).
 P3. Between L = 0.5 and L = 1.0 each ratio changes by less than a factor 5.
 Would surprise me: ratios spread over more than a factor 100 at fixed L (then the law is a coincidence of the
 bottom rung and idea 27 has no form-level support), or a better match with a different index shift.

## Outcome of the first runs (L = 0.5, 0.75), written 2026-11-11 before the second experiment
P1 MISSED: the matching is NOT (even block <-> 4, 6, 8; odd block <-> 5, 7, 9). The merged ladder
(even 1, odd 1, even 2, odd 2, even 3, ...) follows 1 - chi_n for n = 4, 6, 8, 10, 12, ...: even prolate indices
only, n = 0 mod 4 in the even block and n = 2 mod 4 in the odd block (the Fourier-eigenvalue parity; this is the
heuristic of Connes-Consani 2106.01715 section 3, which I should have used).
With the corrected matching the ratios are: L = 0.5: 2.67, 1.87, 1.33, 1.07, 0.88; L = 0.75: 4.68, 3.10, 2.10, 1.45,
1.65. So P2's CONTENT (one constant up to a small factor along the whole ladder) holds with the right indices;
as predicted with my indices it missed. P3 holds for the bottom rung (2.67 -> 4.68).

## Second experiment, prediction written BEFORE computing
Test vectors: v = window truncation of e^(u/2) sum_n g(n e^u / lambda), g = phi_n - (phi_n(0)/phi_b(0)) phi_b,
phi_n the prolate functions (n = 4 with b = 0 for the even block; n = 6 with b = 2 for the odd block).
 P4. The Rayleigh quotient of v in the Weil form is within a factor 3 of the true lowest eigenvalue of its block at
     L = 0.5 and within a factor 30 at L = 0.75 (so the Poisson images of prolates are near-null to the right ORDER,
     but not exact).
 P5. Overlap deficiency 1 - <v, psi_1>^2 with the true ground state is between 1e-12 and 1e-3 at L = 0.5.
 Would surprise me: Rayleigh quotient larger than the eigenvalue by more than 1e4 (then the heuristic vectors are
 not near-null at the needed level and a comparison form built from them fails), or equal to 4 digits (then there
 is an exact formula hiding here).

## Outcome of the second experiment (vec_*.log)
P4 HIT, P5 HIT. Rayleigh quotient of the explicit vector over the true lowest eigenvalue of its block:
L = 0.5: 1.22 (even), 1.10 (odd); L = 0.75: 1.36, 1.16; L = 1.0: 1.38, 1.22 (against the eigenvalue in the same
truncated basis N = 34, which is itself about 1.5 times the converged value). Second rungs: 1.11, 1.07; 1.41, 1.32;
1.23, 1.22. Overlap deficiency with the true ground state: 7.5e-6, 4.2e-7, 7.2e-8.

## Third experiment, prediction written BEFORE computing
Form-level test on the span of the first K explicit vectors per parity (K = 1..4; prolate indices 4, 8, 12, 16 even
block; 6, 10, 14, 18 odd block), with D = lambda * [diag(1 - chi_n) + r r^T (1 - chi_b)], the EXACT Gram matrix of the
out-of-band parts (the band-limiting defect), and M = Weil form on the same vectors:
kappa_K(L) = lowest eigenvalue of D^(-1/2) M D^(-1/2).
 P6. kappa_1 = 0.99, 1.92, 2.70 at L = 0.5, 0.75, 1.0 (already implied by the logs above; not blind).
 P7 (blind). kappa_K >= 0.3 * kappa_1 for K = 2, 3, 4 at every L: adding more vectors does not collapse the ratio.
 P8 (blind). kappa_4(L) increases with L across the three windows.
 Would kill idea 27 in this form: kappa_K falling by orders of magnitude as K grows (cross terms between rungs
 not controlled by the defect).

## Outcome of the third experiment (form_*.log)
kappa_4 = 0.35 / 0.68 / 1.02 (even), 0.22 / 0.55 / 0.91 (odd) at L = 0.5 / 0.75 / 1.0. P7: 5 of 6 hit (miss: odd,
L = 0.5, 0.22 < 0.30). P8 HIT.

## Fourth experiment: a formula for the constant. Prediction written BEFORE computing.
Derivation (lead, notebook N41, HEURISTIC): in the reflected log variable the tail is F = 1_{v>L} sum_m m^(-1/2)
psi(v + log m), psi(w) = e^(w/2) phi(e^w), phi = out-of-band part of ghat (one side, xi > lambda). On the half line
v > L the one-sided prime shifts never meet the cut, so the prime term is exactly prime-free:
primes(F) = 2 <F, sum_m m^(-1/2) log m psi(. + log m)>. Treating the dilates as orthogonal chirps of local frequency
2 pi lambda m e^v (archimedean density = log of that over 2 pi) and dropping the pole term gives
   W(F) ~ int_{w>L} |psi(w)|^2 K_L(w) dw,   K_L(L + a) = sum_{m <= e^a} (2L + a - 2 log m)/m  >= 2L.
So the comparison constant should be about 2L plus an average of log(xi/lambda) over the leak.
 P9 (blind). kappa_pred := int |phi|^2 K / int |phi|^2 for the bottom rungs (n = 4 even, n = 6 odd) is within a
     factor 0.6 to 1.6 of the measured one-sided constant 2 kappa_1 (= 1.99, 3.85, 5.41 even; 2.00, 3.22, 4.86 odd)
     at each of L = 0.5, 0.75, 1.0.
 Would surprise me: agreement to 2 digits (then the cross terms vanish for a reason), or a factor above 3 off
 (then the mechanism is wrong and plank 8 has no heuristic).

## Plank 10 outcome (intruder_*.log) and plank 12 prediction, written 2026-11-11 before the scan
Plank 10: (a) FAILED at L = 1.5 (no level without a rung below the bulk); an extra level appears only in the
transition region just below the bulk at L = 1.65-1.70 (0.72, 0.55; 0.43, 0.65), not deep in the ladder; the ladder
is regular with ratios of order 1 down to the bottom rung at L = 1.70, 0.01 before the failure. So the intruder
picture as I wrote it is WRONG: there is no level descending through the rungs before failure.
What the same logs show instead: the impostor's bottom-rung ratio (eigenvalue / defect n = 1) is 3.15, 2.71, 4.37,
3.38, 3.26, 2.14, 4.48 at L = 1.2, 1.4, 1.5, 1.6, 1.65, 1.68, 1.70: it wobbles.
PLANK 12, blind prediction. An off-line zero z = gamma_0 + i beta enters the form of a real even f through
Re[fhat(z)^2], whose phase turns like 2 gamma_0 L, while an on-line zero enters through |fhat(gamma)|^2 with no
phase. So the bottom-rung ratio of the impostor, as a function of the window, should be a slowly varying positive
part plus an oscillation of period pi / gamma_0 = pi / 85.699 = 0.03666 in L.
 P10. On the grid L = 1.200, 1.208, ..., 1.312 (15 points; even block, bottom level over defect n = 1) the ratio is
      fitted by a + b cos(2 * 85.699 * L + phi) with |b| / a >= 0.10 and residual below 30% of |b|.
 P11. The first failure at L = 1.71 is a minimum of that oscillation: 2 * 85.699 * 1.71 + phi is within 0.6 rad of
      an odd multiple of pi (using phi fitted at L near 1.25, far from the failure).
 Would end this line: no oscillation (|b|/a < 0.03), or a different period.
