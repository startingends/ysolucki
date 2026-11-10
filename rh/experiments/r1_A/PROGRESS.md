# r1_A  Lane A (Positivity) -- proposer, round 1

Conventions. f in L^2[-L, L] (log variable), fhat(r) = int f(x) e^{irx} dx, Q(f) = sum over all zeros rho = 1/2 + i gamma
of fhat(gamma) conj(fhat(conj gamma))  (= sum |fhat(gamma)|^2 when the zeros are on the line).
g = f * f~ is supported in [-2L, 2L], so the prime powers n <= e^{2L} enter. (Connes' lambda = e^L.)
mu(L) = lowest eigenvalue of Q on L^2[-L, L].

## Step (a): explicit formula as a matrix, validated  [COMPUTED]
Basis e_k = exp(i pi k x/L)/sqrt(2L). Closed form of the matrix (docstring of weil.py.txt). Derivation: Gauss' integral for
psi gives the archimedean kernel w(u) = e^{u/2}/(2 sinh u) = sum_m e^{-(2m+1/2)u}; the correlations c_jk(u) of the basis are
exponentials, so every entry is a digamma value plus a geometrically convergent sum. No quadrature anywhere.
Command: `python3 validate.py.txt` (0.2 s). Prime+arch+pole side vs sum over the first 5000 zeros (rhlib.zeros), four
smooth-periodic test functions (even, odd, non-symmetric), L = 0.3, 0.8, 1.5, 2.2: relative agreement 1e-13 .. 2e-15 in all
16 cases (limited by double precision / the r^-6 tail of the zero sum).

## Step (b): lowest eigenvalue mu(L)  [COMPUTED]
Command: `python3 mu.py.txt zeta <prec_bits> L:N ...` (inverse iteration on the even and odd blocks, Arb midpoints).
Logs: mu_zeta_a.log, mu_zeta_b.log, mu_zeta_c.log. Convergence in N is geometric until pi N/L ~ 6 e^{2L}, then a slow
algebraic tail (the periodic basis forces f'(+-L) = 0); values below are the largest N run, upper bounds for mu(L)
(Rayleigh-Ritz), last digit(s) still drifting down by a few percent.

| L | e^{2L} | N | mu_even(L) | mu_odd(L) | -ln mu_even | 4 pi e^{2L} |
|---|---|---|---|---|---|---|
| 0.25 | 1.649 | 160 | 3.3365e-2 | 4.10e-1 | 3.40 | 20.7 |
| 0.50 | 2.718 | 160 | 9.344e-7 | 2.00e-4 | 13.88 | 34.2 |
| 0.75 | 4.482 | 160 | 3.68e-15 | 3.57e-12 | 33.24 | 56.3 |
| 1.00 | 7.389 | 160 | 6.31e-30 | 1.51e-26 | 67.24 | 92.9 |
| 1.25 | 12.18 | 240 | 5.02e-55 | 3.60e-51 | 125.0 | 153.1 |
| 1.50 | 20.09 | 320 | 4.51e-97 | 9.71e-93 | 221.8 | 252.4 |
| 1.75 | 33.12 | 400 | 3.98e-167 | 2.66e-162 | 383.2 | 416.1 |

Every eigenvalue found is positive. The decay is DOUBLY exponential in L.

### Zeros of the transform of the minimiser (reproduces the Connes et al. phenomenon)  [COMPUTED]
Command: `python3 minzeros.py.txt zeta 500 1.0 160 110`. L = 1 (only the prime powers 2,3,4,5,7 enter).
All 31 zeros of fhat_min found in (0,110) by sign changes are real. zero #1 = gamma_1 to 3e-26, #5 to 1e-17,
#10 to 1e-10, #15 to 1e-5, #20 to 2.5e-2; beyond height ~ 85-90 (about 4 pi e^{2L} = 93) the zeros decouple from zeta's.
