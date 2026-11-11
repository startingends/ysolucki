# HUNCH1.md  (seat S1-parity; plank zero of Hunch 1, rh/HUNCHES.md part E; requested by the lead after seminar S1 closed)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Scripts and logs: this folder (h1_*.py.txt, h1_*.log). Floats (numpy) unless said.

## 0. Definitions used in this file

Coordinates. Put v = L - u, so the window is v in [0, l], l = 2L (only the LENGTH of the window matters: PROVED, translation).
For a coefficient sequence c (c(1) = 1) let
    (C_l f)(v) = sum over m with log m <= v of c(m) m^(-1/2) f(v - log m),     v in [0, l],
a causal (lower-triangular) sum of shifts. Z_l is c = 1; its inverse M_l is c = mu (Moebius), because the cut is compatible with
Dirichlet convolution. For another Dirichlet series F = sum a(n) n^-s the pair is c = a and c = b, b = Dirichlet inverse of a.
G_a(L) := operator norm of M_l on L^2[0, l].
G_K(L) := sup of |M_l f| / |f| over the trigonometric polynomials f(v) = sum_{|k| <= K/2} x_k e^(2 pi i k v / l) (K + 1 modes; K = 8, 16, 32).
S(L) := sum_{m <= e^(2L)} |c(m)| m^(-1/2), the trivial bound for both.
Systems: zeta (c = mu); impostor (c = b_DH, inverse of the period-5 coefficients 1, kappa, -kappa, -1, 0); F_d = zeta(s-d) zeta(s+d),
d = 1/4 (c = (mu n^d) * (mu n^-d)); its base point F_0 = zeta^2 (c = mu * mu); one-prime system (c(1) = 1, c(2) = -1, nothing else).

## 1. PREDICTIONS, written 01:52:19 UTC 2026-11-11, before any code for this file exists

P1 (G_a, the L^2 norm). It CANNOT see RH: I expect G_a(L) to be a fixed fraction (0.5 to 1) of the trivial bound S(L) for every
   system, growing like e^L for zeta too. Reason (HEURISTIC, Kronecker): L^2 contains e^(itv) with p^(-it) close to -1 for all
   p <= e^(2L), on which every term mu(m) m^(-it) is positive. So the rates 0 / 0.62 / 0.5 are NOT the rates of definition (a).
   Numbers expected for zeta at L = 0.25, 0.5, 0.75, 1.0, 1.25, 1.5: 1.0, 1.5, 1.9, 2.6, 3.0, 3.7, each +-30% (S = 1, 1.71, 2.28, 3.52, 4.13, 5.41).
   The lead's blind prediction 'zeta's G(2L)/G(L) < 4 on [0.25, 0.75]' will hold (I expect 1.4 to 2.0), for a trivial reason.
P2 (G_K, smooth class). zeta: between 1 and 2 at every L <= 1.5 and K <= 32, rising slowly with K, no visible growth in L.
   Impostor: NOT larger than zeta's (its coefficients at 2 and 3 are +-0.284 instead of -1): G_K within [0.6, 1.3] x zeta's; no trace
   of e^(0.62 L). F_{1/4}: larger than zeta's by 1.5 to 3 (coefficients -(p^d + p^-d)), but against its own base point zeta^2 the ratio
   stays in [1.0, 1.5] on L <= 1.5: no visible e^(0.5 L) either. One-prime system: G <= 1 + 2^(-1/2) = 1.707 for every L (bounded).
P3 (when the impostor's pole shows). In the smooth class: only when y^0.3085 exceeds about 85.7 |f'(rho_0)| (y = e^(2L)), i.e. L between
   6 and 8. At the resonant frequency t = 85.7 (not in the class for K <= 32 on these windows): the partial sums of 1/f_DH exceed
   zeta's at the same t by a factor 3 somewhere between y = 100 and y = 3000 (L = 2.3 to 4). So the lead's expectation (invisible up
   to the first failure of the form at L = 1.71) is what I expect to find.
P4 (doubling as mathematics). I expect an EXACT identity M_2l = [[M_l, 0], [H R, M_l]] with H the Hankel (mirror) operator of the
   Moebius measure on (0, l]^2, and H = - M_l H_1 M_l^# with H_1 the mirror operator of the integer comb; hence only the QUADRATIC bound
   G(2L) <= G(L) + |H_1| G(L)^2. To be derived and checked numerically below.
