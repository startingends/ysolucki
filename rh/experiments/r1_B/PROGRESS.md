# r1_B PROGRESS (Lane B proposer, round 1: approximation and deformation)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Citations are "(from memory)" unless a URL is given.

## Log

### Step 1. Gram matrix of e_k(x) = frac(1/(kx)), validation  (COMPUTED)
- Code: `nb_gram.py.txt`. Vasyunin's formula (written from memory), for gcd(h,k)=1:
  G[h,k] = (log 2pi - gamma)/2 (1/h+1/k) + (k-h)/(2hk) log(h/k) - pi/(2hk) (V(h,k)+V(k,h)),
  V(h,k) = sum_{m=1}^{k-1} frac(mh/k) cot(pi m/k);  G[h,k] = G[h/g,k/g]/g for g = gcd;  b_k = (1-gamma+log k)/k.
- Command: `python3 nb_gram.py.txt validate` compares with an independent exact piecewise integration of
  frac(t/h)frac(t/k)/t^2 over [0, 20000*lcm] + mean-value tail, all 78 pairs h<=k<=12.
  Result: worst |diff| = 2.1e-10 (the (1,1) entry: 1.260661401508 = log 2pi - gamma exactly; diff is the
  tail-truncation error of the direct integral, O(1/T^2)). The from-memory formula is therefore correct.

### Step 2. Least squares for all N <= 2000  (COMPUTED)
- `python3 nb_gram.py.txt build 2000 rh/data/r1_B/G2000.npy` (36 s, float64), then `python3 nb_solve.py.txt`
  (Cholesky; d_N^2 = 1 - sum_{k<=N} y_k^2 with y = L^{-1} b; cross-checked by direct `solve` at N=100,1000,2000).
- cond(G_2000) = 1.5e7, min eigenvalue 3.8e-7, so float64 gives d_N^2 to about 1e-9 absolute.
- C = 2*lambda_1 = 2+gamma-log(4 pi) = 0.0461914179.

|   N  | d_N^2        | d_N^2 log N |
|------|--------------|-------------|
|    1 | 0.8582120514 | -           |
|    2 | 0.2899645737 | 0.2010 |
|   10 | 0.0237718656 | 0.0547 |
|   50 | 0.0118690489 | 0.0464 |
|  100 | 0.0101887625 | 0.0469 |
|  200 | 0.0089207254 | 0.0473 |
|  500 | 0.0074198580 | 0.0461 |
| 1000 | 0.0065559639 | 0.0453 |
| 1500 | 0.0062441245 | 0.0457 |
| 2000 | 0.0061141004 | 0.0465 |

  d_N^2 log N sits in [0.044, 0.048] for 50 <= N <= 2000, i.e. within 5% of C with NO visible 1/log N drift.
  Kill line of idea #5 ("not near 0.046 by N=2000 => implementation wrong") is passed.

### Step 3. The optimal coefficients vs explicit recipes  (COMPUTED; `nb_coef.py.txt`, `nb_coef2.py.txt`)
- Sign: sum_k mu(k) frac(1/(kx)) = -chi formally, so the recipe is c_k = -mu(k) * cutoff(k).
- V_N: c_k = -mu(k)(1 - log k/log N). Q[V_N] = ||chi - sum c_k e_k||^2:

|   N  | d_N^2 (opt) | Q[V_N]    | Q[V_N] log N | (Q log N - C) log N |
|------|-------------|-----------|--------------|------|
|   50 | 0.0118690   | 0.2432006 | 0.951 | 3.54 |
|  100 | 0.0101888   | 0.1784753 | 0.822 | 3.57 |
|  200 | 0.0089207   | 0.1346807 | 0.714 | 3.54 |
|  500 | 0.0074199   | 0.0990006 | 0.615 | 3.54 |
| 1000 | 0.0065560   | 0.0812900 | 0.562 | 3.56 |
| 2000 | 0.0061141   | 0.0674211 | 0.512 | 3.54 |

  FINDING 1 (COMPUTED): Q[V_N] = C/log N + A/log^2 N with A = 3.55 +- 0.02 over 50 <= N <= 2000. The textbook
  recipe is 11x worse than the optimum at N = 2000 although it is asymptotically optimal (Bettin-Conrey-Farmer
  2013, conditional, from memory). The optimum itself shows no 1/log^2 N term of that size (|A_opt| < 0.02).
- Optimal c_k(2000): c_1=-0.982, c_2=+0.970, c_3=+0.967, c_5=+0.906, c_6=-0.824, c_7=+0.860, ...; on
  non-squarefree k mostly |c_k| < 0.1 for small k, but a boundary layer near k = N: c_2000 = +0.739, c_1000 = -0.184.
  Binned -c_k/mu(k) against u = log k/log N is NOT 1-u: 0.97, 0.79, 0.60, 0.48, 0.39, 0.30, 0.22, 0.19 at
  u = 0.1, 0.3, 0.5, 0.65, 0.75, 0.85, 0.925, 0.975 (roughly 1 - 0.8u, not vanishing at u = 1), std 0.05-0.08 in a bin.
- Best Q inside explicit low-dimensional families at N = 2000 (each a tiny linear solve), times log N:
  {mu}: 0.494 · {mu, mu log k}: 0.204 (alpha=1.150, beta=0.808) · {mu log^j k, j<=2}: 0.0598 ·
  {mu log^j k, j<=3}: 0.0546 · optimum: 0.0465.
  FINDING 2 (COMPUTED): a cubic polynomial in log k / log N times mu(k) (4 free numbers) is within 18% of the
  optimum over 2000 free numbers; the linear recipe is not.
- Innovations delta_N = d_{N-1}^2 - d_N^2: share of total gain from squarefree N is 0.67 / 0.58 / 0.57 on
  (100,300], (300,1000], (1000,2000] (density of squarefree = 0.608). NEGATIVE RESULT: the gain from adding the
  N-th function is not concentrated on squarefree N; the hypothesis "delta_N ~ mu(N)^2 /(N log^2 N)" is dead.
