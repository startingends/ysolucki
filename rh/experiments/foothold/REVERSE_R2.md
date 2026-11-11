# R2 (rh/REVERSE.md): "the archimedean local Riemann-Roch is a prolate count", made precise

Seat FH, 2026-11-11. Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Script `reverse_r2.py.txt`, logs `reverse_r2_*.log`.

## 0. Predictions (written before any computation of this file)
- P1 (identity, asymptotic): with c = 2 pi e^(2L)/q, deg := cL/pi, h0 := (1/2) Tr_par(P_1 Phat_c) (time-band limiting on
  [-1, 1] at band c, restricted to the parity of the Gamma factor), the quantity h0 - (deg + pole - N(c) + S(c)) is O(1/c):
  below 0.01 in absolute value at all nine (family, window) pairs, and it oscillates like -+cos(2c)/(8 pi c).
- P2 (constant): the Riemann-von Mangoldt constant 7/8 splits as +1 (the two conditions g(0) = ghat(0) = 0, i.e. the pole)
  minus 1/8 (half the parity part Si(2c)/(2 pi) -> 1/4 of the prolate trace); for an odd Gamma factor the sign of the 1/8
  flips (Stirling: arg Gamma(3/4 + it/2) has +pi/8) and the odd prolate trace gives +1/8: the parity of the prolates is the
  parity of the Gamma factor.
- P3 (non-tautological): the number of eigenvalues of the actual window Weil form Q_L below eps equals the number of prolate
  indices of the matching class with 1 - chi_n(c) < eps, within +-1, for eps = 1e-6 and 1e-3, at two windows each for zeta
  (class: even n >= 4), chi_5 (even n >= 0) and the impostor (odd n >= 1).
- P4 (locality): the window's own prime terms (n <= e^(2L)) do NOT reproduce S(c): |S_L(c) - S(c)| > 0.2 at one window
  at least.
