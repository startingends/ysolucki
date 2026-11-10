# e21_reflection: first test of idea #21 (lead)

Grows from: seat R2-curv's Theorem D (the prime kernel is a Gram matrix on prime powers; the Gamma kernel is
reflection positive), the lead's sign fact (idea #10), the theta-power dial (ideas #12, #13).

Object: for a Dirichlet series F with -F'/F = sum c_n n^(-s), the "mirror matrix" M_F = [ c(ab) ], a, b = 2..12.
(Dividing by sqrt(ab) is a diagonal rescaling and does not change signs of eigenvalues.)

BLIND PREDICTIONS (written 2026-11-10 before any of these matrices was computed):
- zeta: smallest eigenvalue 0 to rounding (>= -1e-12), rank exactly 5 (one per prime up to 12: 2, 3, 5, 7, 11).
- impostor (Davenport-Heilbronn): smallest eigenvalue below -0.5.
- theta dial n = 1.4: smallest eigenvalue negative, between -0.5 and -0.01.
- theta dial n = 2 (zeta times L(chi_4)): >= -1e-12.
- theta dial n = 1 (zeta(2s)): >= -1e-12.
- L(s, chi_4) alone, a real character whose couplings are NOT all positive (c_3 = -log 3): >= -1e-12.
  This is the prediction that matters: the sign condition of idea #10 rejects this function, the mirror
  condition should accept it.
If L(chi_4) fails, the mirror condition is no better than the sign condition and idea #21's criterion is wrong.
