# r1_B critic PROGRESS

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.

## Plan (written before computing)
- Independent Gram matrix in the y = 1/x variable by exact piecewise integration on [0,Y) + mean-value tail
  (no Vasyunin formula), compare with proposer's G2000 block and d_N^2 at N = 50, 100, 200.
- Independent LOWER bound for D_S: y-space reformulation (see below), truncated to [0,Y) with lambda free.
  Proposer's numbers are upper bounds (finite N), so this gives a sandwich.
- B-2: cubic-fit coefficient stability across N (the proposer's own kill line, not run by them).
- B-4: check the dissipation identity on a random polynomial; recheck dz_1/dt and min gap from Arb zeros.

## Prediction stated before computing (rule 4), 2026-11-10
Critic's elementary lower bound (derived on paper, below) predicts D_P^2 >= about (1/2) * sum_{n>1, gcd(n,P#)=1} 1/n^2:
P=2: 0.095, P=3: 0.044, P=5: 0.025, P=7: 0.0152 (paper approximations), against proposer 0.1247, 0.04996, 0.0289, 0.0183.
If my truncated lower bounds come out ABOVE the proposer's upper bounds, one of us is wrong.

## Results (all float64; commands run from this folder)

### 1. Independent Gram matrix  (COMPUTED, `python3 indep_gram.py.txt 200 2e6`, 12 s)
Direct piecewise integration in y = 1/x on [0, 2e6) + mean-value tail; no Vasyunin formula.
- G[1,1] = 1.2606614008 (exact log 2pi - gamma = 1.2606614015); max |b - closed form| = 4e-12.
- max |G_critic - G_proposer| on the 200x200 block = 6.9e-10.
- d_N^2: N=10 0.0237718657, N=50 0.0118690489, N=100 0.0101887625, N=200 0.0089207254: equal to the proposer's to 10 digits.
- Q[V_N] = 0.2432006, 0.1784753, 0.1346807 at N = 50, 100, 200: equal to the proposer's 7 digits.

### 2. y-space reformulation of D_S and a sandwich  (PROVED reformulation, COMPUTED bounds; `smooth_lb.py.txt P Y...`)
With y = 1/x: f = chi - sum c_k e_k equals -lam*y on (0,1) and 1 - lam*y + F(n) on [n,n+1), lam = sum c_k/k,
F(n) = sum_k c_k floor(n/k) = sum_{j<=n} g(j_S), where j_S is the S-part of j and g = c*1 on <S>.
So D_S^2 = inf { lam^2 + sum_n int_n^{n+1} (1 + F(n) - lam y)^2 dy/y^2 }: a walk whose step at n depends only on the S-part of n
must stay near the level -1.  Truncating the integral to [0,Y) with lam free gives LB_Y <= D_S^2; the proposer's finite-N values are >= D_S^2.

| S | local bound (below) | LB_Y (critic) | proposer upper bound | status |
|---|---|---|---|---|
| {2} | 0.0935593 | 0.1247222 (Y=1e6) | 0.1247227 | agree to 6 digits |
| {2,3} | 0.0437872 | 0.0499603 (Y=1e6) | 0.04996047 | agree to 6 digits |
| {2,3,5} | 0.0249686 | ~0.02879 (Y=1e6, ill-conditioned solve, 3 digits) | 0.02889735 | consistent |
| {2,3,5,7} | 0.0151296 | ~0.01759 (Y=1e6, same caveat) | 0.01833983 | consistent, not converged |
| p<=11 | 0.0111043 | ~0.01281 (Y=1e5) | 0.0148051 (N=2000) | upper bound far from converged |
| p<=13 | 0.0082023 | ~0.00953 (Y=3e4) | 0.0122741 (N=2000) | same |
Caveat: for P >= 5 the normal equations are ill-conditioned (values move in the 3rd digit with rcond); the printed value is the cost of
an actual vector, hence >= the true relaxed minimum. Treat as approximate lower bounds.

### 3. D_S > 0 for every S that misses a prime  (PROVED; this removes the proposer's WALL 2)
Let q > 1 be coprime to every prime of S (q odd if 2 in S). The step at q is g(1), the same as the step at 1. Put u = 1 + g(1),
v = 1 + F(q-1). Then f = u - lam y on [1,2), v - lam y on [q-1,q), v + u - 1 - lam y on [q,q+1), and -lam y on (0,1). The quadratic
lam^2 + int_1^2 (u - lam y)^2 + int_{q-1}^{q} (v - lam y)^2 + int_q^{q+1} (v+u-1-lam y)^2 (measure dy/y^2) vanishes only if lam = 0, u = 0, v = 0
and v + u = 1, impossible; so its minimum m(q) > 0 and D_S^2 >= m(q). Using all such q at once (intervals [q-1,q+1) are disjoint):
local bound = min_{u,lam} [...] ~ (1/2) sum_{n>1, gcd(n,P#)=1} 1/n^2 ~ 1/(2 P log P)  (asymptotic: HEURISTIC, PNT; values: COMPUTED above).
Ratio LB_Y / local bound = 1.33, 1.14, 1.15, 1.16, 1.15, 1.16 for P = 2, 3, 5, 7, 11, 13.

### 4. Why the prime filtration does not escape the 1/log N floor  (PROVED, one line)
D_P(N) >= d_N for every N (smaller span), and d_N^2 >= (C + o(1))/log N (Burnol 2002). So any explicit approximant of length N has error
>= C/log N whatever S is; D_P^2 ~ 1/(2 P log P) can be approached only when log N >~ 2C P log P = 0.092 P log P.
The rate in P is a relabelling of the rate in log N. To beat the Davenport-Heilbronn floor 1.7e-4 one needs log N >~ 270 for every S.

### 5. B-2 kill-line test the proposer did not run  (COMPUTED, `python3 b2_stability.py.txt`, proposer's G2000)
Cubic fit -mu(k) sum a_j u^j, N = 125, 250, 500, 1000, 2000:
a_1 = 0.574, 0.559, 0.488, 0.434, 0.390 (-3%, -13%, -11%, -10% per doubling: at or over the 10% kill line);
P(1) = 0.110, 0.139, 0.072, 0.055, 0.048 (tends to 0); Q log N = 0.0573, 0.0553, 0.0550, 0.0552, 0.0546.
Degree 5: coefficients change sign between N (unstable). Linear fit: P(1) = 0.73 -> 0.34.
V_N + (t/log N)(-mu(k)): best t = 1.52, 1.53, 1.39, 1.51, 1.48; A drops from 3.54 to 1.29, 1.26, 1.24, 1.31, 1.32 (stable).
Optimum: (d_N^2 log N - C) log N = 0.003, -0.004, -0.000, -0.006, 0.002.

### 6. B-4 checks  (COMPUTED, `python3 b4_check.py.txt`)
Random system (20 real zeros + 5 pairs): dY/dt = -152.47633545 numeric vs -152.47633546 identity. Single pair y0 = 0.3 lands at t = 0.04500.
dz_1/dt at t=0 = -0.5796306; min gap of first 40 zeros 1.6902 (k = 34); var/mean^2 0.1949; sum 1/gap^2 2.2104. All equal to the proposer's.
The zeros of H_t for t > 0 were NOT recomputed.

### 7. Spectral scan of r(N) = d_N^2 log N - C  (COMPUTED, `python3 spec_scan.py.txt`; inconclusive)
Mean of r = 0.00006, rms 0.00093, mean of r*log N = -0.0004 on 60 <= N <= 2000. Peaks in omega (variable log N): 1.34 (amp 0.0012),
3.88, 7.16, 9.96 (amp 0.0005-0.0003); zero differences are 3.99, 6.89, 10.88; resolution 1.79. Suggestive only.

## Not done
nb_zoom numbers (0.439, 0.422, 0.416) and the t > 0 heat-flow zeros were not recomputed. N = 500..2000 values of d_N^2 rely on the
proposer's Vasyunin matrix (validated by me only on the 200x200 block). Literature: 4 web searches, BCF read through an ar5iv summary only.

## Ideas
- C-1 Missing-prime law: D_P^2 = kappa_P * (1/2) sum_{n>1, gcd(n,P#)=1} n^-2 with kappa_P bounded (1.14..1.2 seen for P = 3..13).
  First test: converge the upper bound for P = 11, 13 (N ~ 1e7). Kill: kappa_P > 1.5 at P = 11 or 13.
- C-2 The optimum has no 1/log^2 N term; residual frequencies are differences of zeros. First test: N = 2e4 (resolution 1.08).
  Kill: peaks not within 0.3 of zero differences, or mean of (d_N^2 log N - C) log N leaves [-0.05, 0.05].
