# Refuter of seat curv (agent R2-curv-ref) PROGRESS

## 23:15 start. Proof reading done by hand first (notes below), then own implementation.

### PREDICTIONS before my own recomputation (written before running refute.py.txt)
Own implementation: Toeplitz box matrix N_ij = k(|i-j|), k(0) = c_inf - 2 int_0^d w(u)(u/d)du - 2 int_d^inf w,
k(m) = int w(u) tent(u - m d) du + sum Lambda(n)/sqrt(n) tent(log n - m d). mpmath quad, then numpy.
R1. zeta L=1 M=40: lambda_1 = 4.3031 +- 0.001 (seat 4.30309); 1 positive eigenvalue; gap/lambda_1 - 1 = 3.4e-3 +- 0.3e-3.
R2. BE worst-site rho/lambda_1 = 0.496 +- 0.005, centre 0.522 +- 0.005 (seat). If my Gamma_2 differs I say so.
R3. Beurling 2->2.1: positive eigenvalues 3 (L=.5), 5 (L=1); gap/lambda_1 0.982, 0.914; BE 0.499 at L=1. I half expect a
    discrepancy in the COUNT at L=0.5 (3 seems high for one moved atom): my guess 60% it reproduces.
R4. even margin 5.6e-4, odd margin 3.2e-2 at M=40.
R5 (mine, new): the even margin does NOT tend to 0: seat says "saturated / exactly 1/2". I predict the continuum limit of
    2 c^T N^-1 c - 1 is strictly positive but below 1e-5 (Richardson from M=40,80,160 cannot distinguish from 0);
    control Beurling: not defined (several positive eigenvalues).
R6 (mine): Theorem C2 check on a random pi with n=7: BE constant = (lambda/2)(1+2 min pi) to 1e-10.
R7 (mine): D1: Hankel form of prime atoms restricted to phi supported on integer-log positions is PSD, but on box
    functions indefinite: min eig -1.12 +- 0.05 at M=40 (seat). 
R8 (mine, attack on idea 6): per-site negative index for zeta at M=160: fraction of one-direction sites < 50%
    (i.e. the seat's own kill line is hit); Beurling at M=160 < 25%.

## 23:20 PREDICTION R9 (new, attack on W-curv-3) before computing
Claim: the total inversion x -> -x is reflection positive for BOTH parts at once on measures supported on logs of
integers >= 2: matrix [w(log ab) + Lambda(ab)/sqrt(ab)]_{2<=a,b<=60} is PSD. Predicted min eigenvalue >= -1e-12.
Control (positions moved off the integers: a in {2.5, 3.5, ..., 60.5} with the prime measure evaluated by a narrow tent
of width 0.02 in log): prime part alone indefinite or zero; I predict exactly zero matrix for the prime part at
half-integers (no product of two half-integers within 1% of a prime power? (2.5*3.5=8.75, 2.5*2.5=6.25: none exactly;
with tolerance some hits) so the test is weak; the decisive control is the seat's own D4.
