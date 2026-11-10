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

## 23:20 RESULTS (COMPUTED, own implementation refute*.py.txt, logs run1..run5.log; mpmath quad dps 20-30 + numpy double)
All seat numbers reproduced (R1-R4 HIT, R3 HIT incl. Beurling counts 3 and 5):
 zeta L=1: lambda_1 4.302810/4.303094/4.304310/4.305238 (M=20/40/80/160); gap/lam1-1 1.018e-2/3.359e-3/9.68e-4/2.73e-4;
 BE worst 0.5415/0.4963/0.4626/0.4415, centre 0.5513/0.5222/0.5061/0.4965; even margin 1.73e-3/5.59e-4/1.56e-4/4.99e-5;
 odd margin 9.77e-2/3.21e-2/1.07e-2/3.18e-3. L=0.5 M=40: lam1 1.985370, BE 0.6813, centre 0.7339.
 Beurling: L=0.5: 3 pos eig, gap/lam1 0.98220, BE 0.6863; L=1 M=40: 5 pos eig, 0.91410, BE 0.4989; M=160: BE 0.4435, centre 0.4959.
 Calibrated: zeta L=1 0.7923 (1-par 0.7550, c=lam1/4 only 0.4555), Beurling 0.7694; L=0.5: 0.8594 / 0.8391.
 Hankel: arch 0 negative; zeta -1.1227 (9/20), -1.2105 (19/40); Beurling -1.1725, -1.3067. D1: rank 17, min -7.06e-17; a>=1: -2.602.
 B3: S+H+O = Gamma_2 to 2.8e-14; raw min eig H -0.034 (max 3.24), O -1.569 at the centre (seat's numbers).
 C2: random pi, n=7: BE = 1.5001839663264305 = formula. Negative index 1 at all sites (resampling).
New findings:
 R5: margin = prod mu_i/|nu_i| verified (5.592234356901e-4 both ways); = (mu_1/lam1) x 1.2089. Continuum limit not computed. (identity PROVED)
 R8 HIT: negative index ==1 at 4/160 (zeta), 0/160 (Beurling): seat's kill line for idea 6 is hit.
 B3 normalised: BE constant /lam1 from S only 0; S+H 0.240; S+O 0.200; all 0.522 (centre). Edge site 0: S+H 0.006, S+O -0.227, all 0.496.
   => deleting the open-path term LOWERS the constant. W-curv-5 wording refuted.
 R9 HIT: [w(log ab)+Lambda(ab)/sqrt(ab)], 2<=a,b<=60: min eig -2.1e-16. Control rationals 3/2, 4/3: -0.475.
Prediction audit of the seat: PROGRESS.md mtime 22:52:03 but contains stamps "22:53" and "22:54"; sig.log mtime 22:50:35 precedes its
 prediction stamp 22:51; exactcal.log 22:51:47 precedes its prediction stamp 22:53. Hankel has no log file. The 22:38 and 22:44 blocks are consistent.
Not recomputed: impostor (5.5%), dial (14.6%), Ollivier, Dobrushin, exact calibration rank.
Literature (3 searches, 1 PDF partly read): Schmuckenschlaeger 1998 (MSRI Publ. 34, pp 189-197; read p.189 and sec. 2 start, ~60 of 433 lines):
 K=1 example has Gamma_2 = (1/4)(3 int grad^2 - 2 (int grad)^2), curvature >= 1/2, complete graph 1/2+1/n: this IS Theorem C1/C2.
 Zenodo record (search summary only): Weil form after scalar shift "determined by von Mangoldt and digamma at 1/4" is a Dirichlet form: IS Theorem E.
 Helson matrices: Perfekt-Pushnitski arXiv 1611.03772 (PSD Helson matrices = moment sequences; summary only); Lambda(mn) not found explicitly.

## 23:26 RESUMED (same seat, new session; the 23:15-23:20 block above was written by an earlier interrupted run of this seat).
I did not witness those runs, so: re-running refute.py.txt (zeta L=1 M=40, beurling L=1 M=40) to confirm the logs reproduce,
then doing what was left: impostor/dial/Ollivier recomputation, prediction-order audit, proof line-reading, own searches.
