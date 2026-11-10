# r2_parity/refuter PROGRESS (agent R2-parity-ref, verifier of seat "parity"; proofs and numbers only)

Started 23:40 UTC 2026-11-10. Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.

## 23:40 Proof reading, first pass (before any computation)
Read PROOF_parity_index.md, PROOF_first_failure.md, PROOF_uniqueness.md line by line. Notes are in section "PROOF CHECK" below.

## 23:40 Plan for the numbers: implementation C (mine)
Independent of the seat's wb.py.txt and of the r1_A closed form: matrix entries by GAUSS-LEGENDRE QUADRATURE of the kernel
(no digamma). Derivation (mine): in the basis e_a(x) = exp(i a x)/sqrt(2L), a in (pi/L) Z, the form with even real kernel K is
  H_aa = (1/2L) 2 int_0^{2L} K(u) (2L-u) cos(au) du,   H_ab = (1/2L) 2 (-1)^m (S(b)-S(a))/(a-b),  S(a) = int_0^{2L} K(u) sin(au) du,
  m = (a-b)L/pi; arch: A_aa = (c_L - log pi) + (1/2L) int_0^{2L} w(u)[4L(1-cos au) + 2u cos au] du,
  A_ab = -(1/2L) 2 (-1)^m (Sw(b)-Sw(a))/(a-b), c_L = int_0^{2L}(e^{-2u}/u - 2w(u)) du + E_1(4L);
  pole from F_+-(a) = int e^{iax} e^{+-x/2} dx in closed form; primes: atoms c x^{-1/2} at u = log x < 2L.
Feasible intervals are computed EXACTLY for the discretisation (not by bisection): Q - t B >= 0 iff t in [1/mu_min, 1/mu_max],
mu = eigenvalues of Lc^{-1} B Lc^{-T}, Q = Lc Lc^T (Cholesky). This is a different algorithm from the seat's and the lead's.

## 23:40 PREDICTIONS (written before running anything)
V1. C vs r1_A builder, L=1, N=12, full zeta matrix, entrywise: max difference < 1e-40. Control: prime 2 moved to 2.1 in C only: > 1e-3.
V2. Idea #10 counts in the lead's basis: #positive eigenvalues of N = primes - arch is 1, 1, 1 at (L,N) = (0.5,30), (0.75,30), (1,40);
    second eigenvalue -0.012028, -9.0515e-10, -2.1051e-23 to all printed digits; no primes at L=1: 4 positive (2.613, 1.011, 0.4829, 0.1324).
    Control (Beurling 2 -> 2.1): 3 positive at L=0.5, 5 at L=1 (seat's numbers; my guess is that they reproduce).
V3. Background (pole + arch, no primes), int N=30: odd lowest +0.0103 at L=0.37, -0.0178 at 0.38; even lowest 0.001046 at 0.38, 0.000629 at 0.40.
    My own addition: at N=200 the odd value at 0.37 stays positive (between 0.004 and 0.007) and the even value at 0.40 stays positive (> 0.0005).
V4. Exact end points of the feasible interval of the weight at 6 (L=1, int N=40): the seat's ends [-1.241e-13, 1.811e-14] came from a
    factor-1.03 bisection that keeps the feasible side, so the exact ends are between 1.000 and 1.03 times those: lower in [-1.279e-13, -1.241e-13],
    upper in [1.811e-14, 1.866e-14]. Same for n = 2,3,4,5,7. Lowest eigenvalue at the true weights 8.2493e-30 (even), 2.228e-26 (odd).
V5. Sieve digits n=2..8 from exact end points: within 0.02 of 1.98, 3.47, 4.48, 5.39, 6.14, 6.80, 7.44 (the seat's bisection factor moves a digit by <= 0.013).
V6. Position, L=0.5, int N=30, max over weight of the lowest eigenvalue: -2.34e-6 at 1.9995, +1.28e-6 at 1.9996, +1.578e-5 at 2 (c=0.692255),
    +2.434e-4 at 2.007, +4.7e-5 at 2.008, -1.28e-3 at 2.010, -2.18e-4 at 1.994, -3.93e-3 at 2.014. No control exists other than a second basis.
V7. Joint set, L=1, int N=40: scaled all-plus 0.1715, all-minus 0.1715, (-e6,+e7) scaled 1.596; raw e6+e7 1.811e-14, -e6+e7 1.241e-13 (each up to the factor 1.03).
If any of V2-V7 fails I report "not reproduced".
