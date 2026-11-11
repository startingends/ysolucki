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
