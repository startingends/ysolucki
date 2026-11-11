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
