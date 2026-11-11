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

### Step 4. Filtration by primes instead of by size: D_S  (COMPUTED + small PROVED lemmas)
Definition. For a finite set of primes S, <S> = integers all of whose prime factors lie in S.
D_S(N) = dist(chi, span{e_k : k in <S>, k <= N}), D_S = lim_N D_S(N). For S = {p <= P} write D_P.
- PROVED (trivial): d_infinity <= D_P <= d_P, D_S decreases as S grows, and RH <=> D_P -> 0 (Baez-Duarte 2003).
- PROVED: closed span{zeta(s)k^{-s}/s : k in <S>} = closed span{zeta^{(S)}(s)k^{-s}/s : k in <S>}, where
  zeta^{(S)} = zeta * prod_{p in S}(1-p^{-s}) (multiply by the finite Dirichlet polynomial prod(1-p^{-s}) one way and by
  sum_{k in <S>} k^{-s}, absolutely convergent on Re s = 1/2 for finite S since dilation by k has norm k^{-1/2}, the
  other way). In x-space: D_S = distance from the unit step to the S-smooth dilates of the LEGENDRE SIEVE REMAINDER
  E_S(y) = y*prod_{p in S}(1-1/p) - #{n <= y : gcd(n, prod S) = 1}, a bounded periodic function of period prod S.
- Burnol's lower bound C/log N uses finite length (dilations >= 1/N); it does not apply to D_S (unbounded length).
- COMPUTED (`nb_smooth.py.txt` from G2000; `nb_smooth_big.py.txt 2,3 1024000`, `2,3,5 256000`, `2,3,5,7 64000`,
  a second code path with lru-cached coprime Vasyunin entries; the two paths agree to 1e-8 at N = 2000):

| S | D_S(N)^2 at N = 2000 | at largest N | converged? | compare |
|---|---|---|---|---|
| {2} | 0.1247227 | (11 functions) | yes, ~6 digits | d_2^2 = 0.2900, d_3^2 = 0.0938 |
| {2,3} | 0.04996061 | 0.04996047 (N = 1.0e6) | yes, 7 digits | d_4^2 = 0.0651, d_5^2 = 0.0361 |
| {2,3,5} | 0.02900279 | 0.02889735 (N = 2.56e5) | no; last decrement 8e-6 per doubling | d_6^2 = 0.0360, d_7^2 = 0.0243 |
| {2,3,5,7} | 0.01874684 | 0.01833983 (N = 6.4e4) | no; decrement 6e-5 per doubling | d_10^2 = 0.0238, d_15^2 ~ 0.0183 |

- COMPUTED loss factor L(P,u) = D_P(P^u)^2 / d_{P^u}^2 (`nb_loss.py.txt`): the price of using only P-smooth k <= P^u.
  u = 1.5: 1.53, 1.28, 1.33, 1.26, 1.22, 1.16, 1.15, 1.15, 1.12, 1.12, 1.11, 1.10 for P = 5,7,11,13,17,19,23,29,31,37,41,43
  u = 2.0: 1.92, 1.70, 1.66, 1.49, 1.46, 1.36, 1.31, 1.31, 1.26, 1.25, 1.22, 1.20 (same P; at u = 2 only ~42% of k are used)
  u = 2.5: 2.53, 2.03, 2.00, 1.79, 1.72, 1.56 (P = 5..19)      u = 3: 3.02, 2.43, 2.35 (P = 5, 7, 11)
  At each fixed u the loss decreases monotonically in P (L-1 roughly like P^{-0.6} at u = 2).
- CONJECTURE B1 (new): L(P,u) -> 1 as P -> infinity for each fixed u. Together with d_N^2 ~ C/log N this gives
  D_P^2 log P -> 0: the prime filtration beats the 1/log rate that is forced on the size filtration.
- HEURISTIC mechanism: under the weight dt/|s|^2 only |t| <~ 1 matters, so n^{-s} for a "missing" n (a prime factor > P)
  can be replaced by m^{-s} with m a nearby P-smooth integer, at cost ||e_n - e_m|| ~ |n-m|/n. If these errors add
  orthogonally the total is ~ sum_{n > P} 1/n^2 ~ 1/P (power saving); if coherently, there is no saving. Unknown which.
- Honest caveat: four converged-or-nearly-converged values (P = 2,3,5,7) cannot separate c/log P from P^{-a}.

### Step 5. Off-line zero floor, and the control group in this lane  (PROVED lemma + HEURISTIC estimate + COMPUTED negative)
- PROVED: if zeta(rho0) = 0 with beta = Re rho0 > 1/2, then for every N and every c,
  ||chi - sum c_k e_k||^2 >= (2beta-1) / ( |rho0|^2 (1 + (2beta-1)/|rho0-1|^2) ).
  Proof. f = chi - sum c_k e_k equals -lambda/x on x > 1 with lambda = sum c_k/k. For 0 < Re s < 1 the Mellin transform of
  f is 1/s + zeta(s)A(s)/s, A(s) = sum c_k k^{-s}; at s = rho0 it is 1/rho0. Split: int_0^1 f x^{rho0-1} dx =
  1/rho0 - lambda/(rho0-1). Cauchy-Schwarz on (0,1) with int_0^1 x^{2beta-2} dx = 1/(2beta-1), plus ||f||^2 =
  ||f||^2_(0,1) + lambda^2, then minimise over lambda. (Standard "necessity" direction made quantitative.)
- HEURISTIC consequence for idea #1: for the Davenport-Heilbronn function the first off-line zero is near
  0.8085 + 85.699i (from memory), floor ~ 2*(0.617)/7345 ~ 1.7e-4 for the conjugate pair, while on-line zeros keep
  the distance at ~ C_DH/log N. The impostor is exposed only when log N ~ C_DH/1.7e-4, i.e. N > exp(several hundred).
  => In the size filtration the control-group lab hits its kill line (cannot compute that far). It needs a zoom.
- COMPUTED negative (`nb_zoom.py.txt`): the cheapest zoom, target x^{-iT} chi (Mellin 1/(s-iT)), same Gram matrix and
  b_k(T) = -zeta(1-iT)k^{iT-1}/(1-iT) + i/(kT), FAILS: d_N(T)^2 = 0.439, 0.422, 0.416 at N = 100, 500, 2000 for T = 5
  (0.97 for T = 85.7). PROVED reason: on (1/2,1) every e_k equals a/x + b, so span{e_k} restricted there is
  2-dimensional and cannot follow x^{-iT}. A zoom must use targets B(s)/s with B a Dirichlet polynomial.

### Step 6. de Bruijn-Newman flow at low height  (COMPUTED; `dbn.py.txt 40`, `dbn_ana.py.txt`)
- H_t(z) = int_0^inf e^{t u^2} Phi(u) cos(zu) du, composite Gauss-Legendre (30 panels x 48 nodes on [0,1.3]), mpmath dps = 90.
  Check: H_0(z) = xi(1/2+iz/2)/8 to 20 digits at z = 3, 20, 60. First 40 zeros for t = 0, 0.05, ..., 0.5 (8.5 min).
- ODE dz_k/dt = 2 sum'_{j}(1/(z_k - z_j)) (all zeros +-z_j, first 20000 zeros of zeta + smooth tail) against a 5-point
  finite difference at t = 0: agreement 7e-9 ... 2.5e-6 for k = 1,5,...,37 (e.g. k=1: -0.5796306 both sides).
- Functionals on the 40-zero window, all strictly monotone on the 11-point grid t in [0, 0.5]:
  min gap 1.690 -> 2.445 (up); var(gap)/mean^2 0.1949 -> 0.1663 (down); sum 1/gap^2 2.210 -> 1.857 (down);
  window log-energy -1.92243 -> -1.92293 (down). Individual gaps: only 17 of 39 are monotone.
- Meaning: forward in t the gas relaxes (known: Rodgers-Tao 2018, from memory). Every functional found is monotone in
  the direction that does NOT help: RH needs control going backward from t > 0 to t = 0, where gaps shrink.
- PROVED (finite systems, i.e. polynomials under the same flow, zeros simple): with z_k = x_k + i y_k,
  d/dt sum_k y_k^2 = -4 sum_{j<k} (y_j - y_k)^2/|z_j - z_k|^2 <= -4 * #(conjugate non-real pairs).
  (y_k' = -2 sum_j (y_k - y_j)/|z_k - z_j|^2; symmetrise.) So Y(t) = sum y_k^2 is a Lyapunov function that is defined
  for non-real zeros and whose dissipation counts them: int_0^inf #pairs(t) dt <= Y(0)/4. Known in spirit (de Bruijn 1950).

## Ideas

### B-1 · Semilocal Nyman-Beurling: filter by primes, not by size
- plain english: The usual recipe mixes the first N sawtooth waves frac(1/(kx)), k = 1..N, and the error shrinks
  painfully slowly, like 0.046/log N. Instead allow only waves whose k is built from a few small primes, but as many of
  those as we like. Example: with primes 2 and 3 only (k = 1, 2, 3, 4, 6, 8, 9, 12, ...) the error settles at exactly
  0.04996, better than using every k up to 4. With 2, 3, 5 it settles near 0.0289; with 2, 3, 5, 7 below 0.0184 (as
  good as every k up to 15, although 11 and 13 are missing). RH says these numbers go to zero as primes are added.
  The slow 1/log N law is a proven floor for the first-N recipe; no such floor is known for the prime-by-prime
  recipe, and the numbers hint it falls faster.
- claim: D_P^2 * log P -> 0; precisely L(P,u) = D_P(P^u)^2/d_{P^u}^2 -> 1 as P -> infinity for each fixed u.
- first test: converge D_P for P = 7, 11, 13 (needs Gram entries for smooth k up to ~1e7; O(k) per entry, parallel),
  extend L(P,2) to P ~ 200 (needs G up to N = 40000); compute the exact Szego/Wiener-Hopf value for S = {2} and
  compare with 0.1247227.
- kill line: if D_P^2 log P levels off at a positive constant for N-converged values up to P = 31, or L(P,2) stops
  decreasing above 1.1 by P = 200, the "beats the floor" claim is dead (the object stays a valid reformulation).

### B-2 · The explicit recipe misses by 3.55/log^2 N; find the recipe with no second-order term
- plain english: Everyone uses the recipe "Moebius sign times a straight-line fade-out". At N = 2000 its error is 0.067,
  eleven times the best possible 0.0061. The gap follows a clean law: best = 0.046/log N, textbook = 0.046/log N +
  3.55/log^2 N. Replacing the straight line by a cubic curve (4 numbers) closes most of the gap: 0.0072.
  So the shape of the best recipe is simple; it is just not the straight line.
- claim: there is an explicit curve P* (and a short boundary correction at k ~ N) with
  Q[-mu(k) P*(log k/log N)] = C/log N + o(1/log^2 N), and its coefficients are stable in N.
- first test: fit the degree-3 and degree-5 optimal polynomials at N = 250, 500, 1000, 2000 and check the coefficients
  converge; derive A[P] (the 1/log^2 N coefficient as a functional of P) from Vasyunin's formula and minimise it.
- kill line: if the fitted polynomial coefficients drift by more than 10% per doubling of N, there is no limiting shape.

### B-3 · Zoomed control-group test with Dirichlet-polynomial targets
- plain english: The impostor function has a bad zero at height about 86, but the standard test looks at the whole line
  through a lens that dims everything above height 1, so the bad zero costs only 0.00017 and would show only for
  N beyond e^300. We want a magnifying glass placed at height 86. The obvious one (twist the target) provably fails
  (error stuck at 0.42). A target built from a few step functions chi(0,1/j) can do it.
- claim: for target B(s)/s, B a Dirichlet polynomial peaked at height T, d_N^2 log N -> sum_rho |B(rho)|^2/|rho|^2 for
  zeta, while for Davenport-Heilbronn with T = 85.7 the distance stops decreasing at N of a few hundred.
- first test: Gram matrix for the DH step function (5-periodic; closed form with digamma sums) to N = 500; B of length 30.
- kill line: if no B of length <= 100 makes the DH floor exceed its on-line part by N = 2000, the lab is dropped for lane B.

### B-4 · Heat flow: use the imaginary-part energy, the one functional defined when zeros are off the line
- plain english: Beads on a wire repel; a bead pair that is off the wire falls onto it. The sum of squared heights of
  the off-wire beads can only go down, and it goes down at least 4 units of "height squared" per unit time for
  every off-wire pair. Example: one pair at height 0.3 lands after time 0.3^2/2 = 0.045. So "total time spent off
  the wire" is at most a quarter of the starting sum of squared heights, a quantity about zeta itself at t = 0.
- claim: for H_t restricted to a height window with a smooth weight w, Y_w(t) = sum w(x_k) y_k^2 obeys
  dY_w/dt <= -4 #pairs_w + (boundary flux), and the real zeros add dissipation ~ 2 pi y * (density) per pair.
- first test: verify the identity numerically on degree-50 polynomials with planted non-real pairs; then on the
  Davenport-Heilbronn function near height 85.7 (predict the landing time of its off-line pair).
- kill line: if the boundary flux is not controllable (same size as the main term for windows of length log T), park.

## Notes for the critic
- `nb_coef.py.txt` has the WRONG sign for the explicit recipes (c = +mu...); its first table is void. Use `nb_coef2.py.txt`.
- All Gram entries are float64; cond(G_2000) = 1.5e7. No Arb cross-check of the solve was done (not enough time).
- Data: `rh/data/r1_B/` (G2000.npy 32 MB, gitignored; logs smooth_23.log, smooth_235.log, smooth_2357.log, dbn.log, dbn_zeros.json).
- Literature checked by web search: Bettin-Conrey-Farmer arXiv:1211.5191 (V_N optimal under RH + a bound on sum 1/|zeta'(rho)|^2;
  Balazard-de Roton (log log N)^{5/2+eps}/sqrt(log N) under RH alone); Darses-Hillion arXiv:1805.06733; Baez-Duarte
  arXiv:math/0505453. One search for Nyman-Beurling restricted to smooth numbers / a prime-generated semigroup found nothing.
- Runtimes: Gram 36 s; solves < 10 s; smooth runs 21 s / 62 s / 92 s; dbn 8.5 min; dbn_ana 2 min (Arb zeros).
