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

### The law for mu(L): prolate leakage  [COMPUTED fit; mechanism HEURISTIC; qualitative link is known (Connes-Consani)]
Prediction made before looking: truncating Phi (the Fourier transform of Xi) to [-L, L] gives mu(L) <~ exp(-2 pi e^{2L}).
The data are SMALLER than that; they follow exp(-4 pi e^{2L}) x power, i.e. the leakage 1 - chi_n(c) of the prolate
(time-and-band limiting) operator with c = 2 pi e^{2L}:
Command: `python3 prolate.py.txt` (log: prolate.log; 1 - chi_n computed from the Legendre/Bouwkamp expansion in 1400-bit Arb;
sanity: 1 - chi_0(10) = 4.409e-8 vs asymptotic 4 sqrt(pi c) e^{-2c} = 4.62e-8).

| L | c = 2 pi e^{2L} | ln(1-chi_4) | ln mu_even | difference | ln(1-chi_6) | ln mu_odd | difference |
|---|---|---|---|---|---|---|---|
| 0.25 | 10.36 | -4.158 | -3.400 | 0.76 | -0.775 | -0.891 | -0.12 |
| 0.50 | 17.08 | -14.829 | -13.883 | 0.95 | -9.040 | -8.519 | 0.52 |
| 0.75 | 28.16 | -34.506 | -33.235 | 1.27 | -27.413 | -26.360 | 1.05 |
| 1.00 | 46.43 | -68.664 | -67.235 | 1.43 | -60.424 | -59.452 | 0.97 |
| 1.25 | 76.55 | -126.578 | -125.029 | 1.55 | -117.257 | -116.151 | 1.11 |
| 1.50 | 126.20 | -223.597 | -221.845 | 1.75 | -213.231 | -211.868 | 1.36 |
| 1.75 | 208.07 | -385.061 | -383.151 | 1.91 | -373.668 | -372.040 | 1.63 |

Over 165 orders of magnitude, mu_even(L) = kappa(L) (1 - chi_4(2 pi e^{2L})) with kappa between 2.1 and 6.8, and
mu_odd = kappa'(L) (1 - chi_6). The whole ladder matches at L = 1 (even block, N = 80):
ln eigenvalues -67.18, -52.05, -38.66, -27.14 vs ln(1 - chi_n), n = 4, 8, 12, 16: -68.66, -52.89, -39.41, -27.63.
Why n = 4, 8, ... (HEURISTIC): near-null vectors are f(u) = e^{u/2} sum_n phi(n e^u) with phi concentrated in [-e^L, e^L] in
both position and frequency (Poisson summation makes the sum vanish outside [-L, L] up to the leakage); even f <-> phi = phihat
(prolate psi_0, psi_4, psi_8, ...), one linear condition phi(0) = 0 removes one, leaving leakage 1 - chi_4. Odd f <-> phihat = -phi
(psi_2, psi_6, ...), leaving 1 - chi_6.
Consequence: lowest eigenvalue is simple and even in every case computed (mu_odd/mu_even from 12 to 6.7e4; second even
eigenvalue 4e6 times the first at L = 1).

### Extremal-measure weights (partial)  [COMPUTED, not exact at finite N]
Command: `python3 weights.py.txt zeta 400 1.0 60`. Least-squares fit of Q_even - mu = sum_i m_i v(r_i) v(r_i)^T over the 58 real
zeros r_i of fhat_min in (0, 191.6): relative residual 5.8e-2 (two nodes short of the rank; the finite-N problem is not exactly
of Caratheodory-Fejer type), all 58 weights positive, weights of the 23 tracked zeros in [0.992, 1.08] (first 18: 1.000-1.008),
later weights scatter around the smooth prediction log(r/2pi)/(2L).

## Step (c): control group, Davenport-Heilbronn  [COMPUTED]
f(s) = 5^{-s}[zeta(s,1/5) + xi zeta(s,2/5) - xi zeta(s,3/5) - zeta(s,4/5)], Lambda(s) = (5/pi)^{s/2} Gamma((s+1)/2) f(s) = Lambda(1-s).
`python3 dhzeros.py.txt 200` (3 min): 122 on-line zeros below 200 + 4 off-line (0.808517+85.699348i, 0.650830+114.163343i,
0.574356+166.479306i, 0.724258+176.702461i); count 130 vs main term 129.67+1. FE check 1e-25.
Weil form: same code, alpha = 3/2, c0 = log(5/pi), no pole, c_n = coefficients of -f'/f (Dirichlet-convolution recursion; they are
NOT supported on prime powers). `python3 validate_dh.py.txt`: matrix side vs sum over the DH zeros (off-line quartets included as
fhat(gamma)^2), 16 cases, L = 0.5..2.0: relative agreement 1e-14 .. 1e-16.
`python3 spec.py.txt dh 500 L:100 ...` (full diagonalisation of even and odd blocks, 500-600 bit Arb midpoints):

| L | e^{2L} | negative eigenvalues (even ; odd) | smallest positive (even) |
|---|---|---|---|
| 1.5 (N=120) | 20.1 | none ; none | 3.1e-18 |
| 1.6 | 24.5 | none ; none | 5.2e-23 |
| 1.7 | 29.96 | none ; none | 1.1e-28 |
| 1.72 | 31.2 | -7.9e-30 ; none | 2.4e-22 |
| 1.74 | 32.5 | -1.8e-23 ; -2.1e-26 | 1.5e-30 |
| 1.76 | 33.8 | -1.6e-18 ; -8.5e-21 | 1.8e-32 |
| 1.78 | 35.2 | -4.8e-11 ; -1.0e-15 | 3.6e-34 |
| 1.8 | 36.6 | -2.4e-7 ; -6.3e-9 | 1.1e-35 |
| 1.9 | 44.7 | -0.263, -2.2e-44 ; -0.248, -1.9e-41 | 1.5e-36 |
| 2.0 (N=160) | 54.6 | -0.712, -4.3e-17 ; -0.763, -2.1e-18 | 3.4e-55 |

Positivity for the impostor first fails at L* in (1.70, 1.72] (upper end rigorous up to midpoint arithmetic, by Rayleigh-Ritz; the lower
end is only as good as N = 100). It fails first by 8e-30: one rung of the tiny ladder crosses zero. Within 0.2 in L it is -0.26.
Heuristic reading: the ladder "tracks" zeros up to height ~ 2c = 4 pi e^{2L}/q (q = conductor; for zeta at L = 1 the minimiser's
zeros follow zeta's up to ~ 85-90 and 4 pi e^2 = 93). For DH, 4 pi e^{2L*}/5 = 75-78, the first off-line zero is at 85.7.
One data point; needs more counterexample functions.

## Structural identity found on the way  [PROVED by direct computation (derivation above); numerically validated to 1e-15]
Let X = e^{2L}, Lambda_X(s) = pi^{-s/2} Gamma(s/2) exp(sum_{n<=X} Lambda(n) n^{-s}/log n) (completed zeta with the Euler product
truncated at X), G(w) = 2 (Lambda_X'/Lambda_X)(1/2 + i w) = psi(1/4 + i w/2) - log pi - 2 sum_{n<=X} Lambda(n) n^{-1/2 - i w},
V = Re G, T = (1/2) Im G - (the explicit geometric sum in weil.py.txt). Then on the lattice w_k = pi k/L:
  Q(e_j, e_k) = (-1)^{j-k} (T(w_j) - T(w_k)) / (L (w_j - w_k)),   Q(e_j, e_j) = V(w_j) + T'(w_j)/L,   + rank-2 pole term.
I.e. up to the pole and the geometric sum, the kernel is  Im[ e^{iL(w-w')} (G(w) + conj G(w')) ] / (2L (w - w'))  restricted to
the lattice: a windowed boundary Pick/Loewner matrix of the log-derivative of the TRUNCATED completed zeta. (General off-lattice
formula: HEURISTIC, only the lattice case is checked.)

## What would turn the numbers into a theorem
T1 [PROVED, classical, from memory: Krein 1940 extension theorem]: mu(L) >= 0  <=>  the Weil distribution restricted to (-2L, 2L)
   (which contains only primes <= e^{2L}) is the restriction of the Fourier transform of SOME positive measure on R.
T2 [cited: Connes-van Suijlekom arXiv 2511.23257, read only in abstract]: if the bottom of the spectrum of Q_L is a simple isolated
   eigenvalue with even eigenvector, all zeros of fhat_min are real.
Conditional lemma (sketch, to be written out; HEURISTIC until then). Let theta_L be an explicit even trial vector with
theta_L-hat -> Xi locally uniformly in |Im z| < 1/2 + delta. Davis-Kahan: sin^2 angle(theta_L, f_min) <= (R(theta_L) - mu_1)/(mu_2 - mu_1),
R = Rayleigh quotient, mu_1 < mu_2 the two lowest eigenvalues of Q_L on all of L^2[-L, L]. |fhat(z)| <= sqrt(2L) e^{L|Im z|} ||f||.
So if for a sequence L -> infinity   (R(theta_L) - mu_1(L)) / (mu_2(L) - mu_1(L)) = o(e^{-(1+2 delta) L} / L)   (GAP)
then fhat_min -> Xi locally uniformly in the strip, T2 gives real zeros, Hurwitz gives RH.
Numerically (L = 1): mu_1 = 6.3e-30, mu_2 (odd) = 1.5e-26, (even) 2.5e-23; the prolate law says mu_2/mu_1 ~ (32/15) c^2 grows like e^{4L}.
WALL W1: a lower bound mu_2(L) - mu_1(L) >= K L e^{(1+2 delta)L} (R(theta_L) - mu_1(L)) without assuming RH. The DH form violates (GAP)
for L >= 1.72 (mu_1 = -0.71, mu_2 = -4e-17 at L = 2), so any proof of W1 must use the Euler product; I do not know where.
WALL W2: T2 and W1 are statements at accuracy exp(-4 pi e^{2L}); no estimate of the prime sum can be that sharp, so the lower
bound has to come from an identity (a sum of squares / positive extension built from primes <= e^{2L}).

## Not done
Li coefficients (idea #3) were not touched. No interval certification (midpoints only). Legendre basis not implemented (periodic
Fourier basis converges algebraically in the last digits). DH negative eigenvector not localised in frequency. Weights test not exact.

## Ideas  (title . claim . first test . kill line)
A1 Prolate law. mu_even(L)/(1 - chi_4(2 pi e^{2L})) and mu_odd(L)/(1 - chi_6) stay in [1, 20] for all L <= 2.5 and the j-th even rung
   follows 1 - chi_{4j}. First test: L = 2.0, 2.25, 2.5 with a Legendre basis and interval arithmetic. Kill: ratio leaves [0.1, 100].
A2 Detection height. For a degree-1 function with conductor q and first off-line zero at height T, the truncated Weil form first turns
   negative at L* with 4 pi e^{2L*}/q in [0.6 T, 1.2 T]. First test: the second DH-type function mod 5 and combinations mod 7, 11, 13.
   Kill: two of four outside the band.
A3 One-gap reduction. RH follows from (GAP) for a sequence L -> infinity. First test: write the lemma in full; compute
   R(theta_L) for the prolate trial vector and the three numbers in (GAP) for L = 0.5..1.75, for zeta and for DH. Kill: (GAP) fails
   numerically for zeta, or the lemma needs positivity of Q_L as an extra hypothesis.
A4 Kicked Krein system. Between consecutive prime powers the window form changes only through explicit smooth terms; at L = (1/2) log n
   it receives a rank-structured kick of strength Lambda(n)/sqrt(n). RH <=> the Krein function a(L) (continuous Verblunsky coefficient)
   has no pole. First test: compute a(L) (or d^2/dL^2 log det) for zeta and DH across L in [0.3, 1.9]; look for a quantity that is monotone
   between kicks for zeta and see what it does for DH before L* = 1.71. Kill: no computed quantity separates zeta from DH before L*.
A5 Windowed Pick matrix. The lattice identity above extends to all real frequencies, giving a de Branges-type kernel
   Im[e^{iL(w-w')}(G(w) + conj G(w'))]/(w-w'). First test: check off-lattice numerically. Kill: fails at 1e-10.

## Addendum: the impostor's minimiser  [COMPUTED]  `python3 dhmin.py.txt 500 1.6 100 0 60` and `python3 dhmin.py.txt 500 1.9 100 -0.263 1`
- L = 1.6 (before L*): mu_DH = 5.2e-23; all 27 zeros of the transform of the minimiser in (0,60) are real and sit on the on-line DH
  zeros: #1-#5 to < 1e-15 (float limit of the comparison), #10 to 8e-11, #15 to 5e-7, #20 to 5e-4, #27 to 0.25. Tracking is lost near
  height 55-60; 4 pi e^{2L}/5 = 61.7. So "the minimiser's transform has real zeros that reproduce the zeros" also holds for a function
  that violates RH, as long as the window is below L*. The phenomenon by itself does not see the Euler product (B1, B2).
- L = 1.9 (after L*): the eigenvector of the eigenvalue -0.263 has 74% of its mass on the single mode k = 51 (frequency 84.3) and
  93% within frequencies 81-89: it is a wave packet sitting at the height 85.70 of the first off-line zero.
Literature checked by web search (abstract level only): Connes-Consani, Spectral triples and zeta-cycles, arXiv 2106.01715 (tiny
eigenvalues of the truncated Weil form, prolate functions, first 31 zeros reproduced); Connes-van Suijlekom, arXiv 2511.23257 (real
zeros of the transform of a simple even ground state); Connes, arXiv 2602.04022; Connes-Consani-Moscovici, arXiv 2310.18423.
I did not find the DH/control-group computation or the quantitative law mu ~ 1 - chi_4(2 pi e^{2L}) stated; two searches only.
