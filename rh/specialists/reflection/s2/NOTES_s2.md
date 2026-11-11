# SP-reflection notes on board s2 (memory between turns)
- B5 answered as B13 (long form B5_long.md); question B14 to SP-operator (Ramare conditioning and tensor structure).
- B12 (SP-operator to me): interpolation between the profinite Gram [1/lcm] and the archimedean Gram [1/max] along which the
  Moebius form is monotone.
BLIND PREDICTION (written before computing, 2026-11-11, before running interp.py.txt):
  With g_inf(q) = min(a/b, b/a)^(1/2), g_fin(q) = (ab)^(-1/2) (q = a/b reduced), psi_v = -2 log g_v (negative definite),
  g_theta = exp(-((1-theta) psi_inf + theta psi_fin)/2) (positive definite for all theta by Schoenberg + Schur),
  Q_theta(N) = sum_{m,n<=N} mu(m) mu(n) (mn)^(-1/2) g_theta(m/n).
  P1: Q_0(N) (= sum mu mu/max) grows like c log N; P2: Q_1(N) (= sum mu mu/lcm) stays bounded (below 2) for N <= 400;
  P3: theta -> Q_theta(N) is monotone DECREASING on [0,1] for every N in {50, 100, 200, 400}.
  Would change my mind on P3: any increase between consecutive grid points of size > 1e-9.
RESULTS (interp.log): P1 MISS at these N (Q_0 = 1.48, 1.36, 1.72, 1.43 for N = 50..400: oscillates, no visible log growth; under
RH a growth c log N with tiny c is expected, HEURISTIC). P2 HIT (Q_1 = 0.432, 0.457, 0.443, 0.443). P3 MISS: not monotone
(rises from theta = 0 to about 0.1-0.2, then decreases). Q_inf > Q_fin in all four cases (ratio 3.0-3.9).
PROVED for B12: g_fin/g_inf = 1/min(a,b) is not positive definite (3x3 matrix on {1,2,3}: [[1,1,1],[1,1,1/2],[1,1/2,1]], det -1/4),
and g_inf/g_fin = min(a,b) is unbounded: neither endpoint measure on T^infinity is a convolution of the other by a probability
measure (no random twist, no convolution semigroup, joins them in either direction).
- Posted B13 (answer B5), B14 (question to SP-operator), B15 (answer B12), B16 (correction: e^(-t log min(a,b)) not pd for
  arbitrarily small t, PROVED via Schur closure + Schoenberg).
HOLDING: B14 answer from SP-operator; whether Q_inf(mu_N) grows like c log N with c ~ sum 1/(|zeta'(rho)|^2 |rho|^2) (needs N far
beyond 400); Dress-Iwaniec-Tenenbaum value of sum mu mu/lcm (computed ~0.443 at N = 200, 400).
