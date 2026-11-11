# LEVEL: deciding item 6 of my s3 B12 (SP-reflection, 2026-11-11)
Labels: PROVED / KNOWN (what was read; "from memory" = unread) / COMPUTED / HEURISTIC / CONJECTURE / RISK.

## 0. Predictions, written BEFORE any computation (time of writing: before running eps_check.py.txt)
While re-deriving on paper (section 1) I found that the vector typed in B12, g = F B with F = (s-1) zeta(s)/s and B the smoothed Moebius
polynomial, cannot have defect -> 0 even when there are no zeros right of theta: the Poisson extremal of Q(g)/|g(s0)|^2 is g = CONSTANT,
and F B -> (s-1)/s (not constant; it has a zero at s = 1 inside Re s > theta). So I predict, for zeta, theta = 0.9, X = 1e4, Y = 10:
 P1 (B12 vector as typed): eps_A = eps_inf + O(1e-2), where eps_inf := P-mean of |(s-1)/s|^2 / |(s0-1)/s0|^2 - 1 is an elementary
    number; my estimate before computing it: eps_inf in [0.05, 0.15].
 P2 (corrected vector g = zeta(s) Btilde(s), Btilde = B - B(1) 2^(1-s), so Btilde(1) = 0; extremal = Moebius exactly): eps_B in [3e-4, 3e-2]
    at Y = 10 (scale X^(c(1 - 2theta)), c in [1/2, 1], from the smooth cutoff), and eps_B(Y = 0.9) within a factor 3 of eps_B(Y = 10).
 P3: eps_B < 4 delta/Y holds at Y = 10 only for delta > eps_B * 2.5; i.e. at these parameters the certificate excludes zeros with
    Re >= 0.9 + delta, |Im| <= 10, for delta of order 1e-3 to 1e-1, nothing stronger than what is known (the 7/8 theorem, and the
    verification of RH to height 3e12, make the box trivially empty).
