# PREDICTIONS of SP-operator for planks 5 and 7, written BEFORE any computation
Time (UTC): 2026-11-11T01:26:21

Test function (chosen before computing; smooth enough that every sum converges absolutely):
  L = 0.5, lambda = e^L, G(s) = s^2 (1 - 7 s^2)(1 - s^2)^8 on |s| <= 1, g(y) = G(y/lambda).
  g(0) = 0 exactly; ghat(0) = 0 exactly (kappa = (2K+5)/3 = 7 for K = 8); g is C^7 at the endpoints.
  F = E(g), f = F on the window [1/lambda, lambda], T = F on x < 1/lambda.
All forms evaluated on the PRIME side (pole + arch - primes) in closed form on the pieces of F (exponential
sums), 50+ digits; no zeros of zeta used anywhere.

P1 (plank 5). |Q_L(f) - W(T)| / |Q_L(f)| < 1e-10. I expect agreement to the accuracy of the evaluator
   (about 1e-15 or better). If they differ at 1e-6 or worse, the identity as I proved it is wrong or the
   evaluator is.
P2 (null vector). W(F) for the whole F = f + T is 0: |W(F)| < 1e-14 ||F||^2.
P3 (sizes). Q_L(f)/||f||^2 lies between 1e-5 and 1e-1 (g is a generic low-degree function, so its leak is
   small but not on the bottom rung); W(T)/||T||^2 lies between 0.5 and 6 (a high-frequency tail: the form is
   about (log(frequency) - log 2 pi) per unit energy, frequency >= 2 pi e^(2L) = 17).
P4 (plank 7, prime-free prime term). Pi(T) := sum_n Lambda(n) n^(-1/2) 2 <T, S_{log n} T> equals
   2 <T, T_log>, T_log(x) = x^(-1/2) sum_m (log m) ghat(m/x), with NO boundary term:
   relative difference < 1e-9 (limited by the quadrature of the second expression).
P5 (evaluator). My closed-form evaluator on the constant function reproduces lane A's matrix entry
   2L q_00 at L = 0.5 to 1e-12.
