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

## 23:31 SECOND RESUME (third session of this seat). Proofs now read line by line by me (notes at the end).
### PREDICTIONS before computing (23:31)
R10 (attack on Theorem A, second lines). The proof uses "neg(-N_e) >= 1 because <u,Nu> = lambda_1 > 0"; lambda_1 > 0 is NOT in
  the hypotheses. Hand estimate with the constant function: lambda_1 ~ c_inf - 1 - log(1/2L) - 2.95, zero near L = 0.12.
  Prediction: zeta, M=40: lambda_1 < 0 at L = 0.05 (value in (-1.5, -0.3)), > 0 at L = 0.2; sign change for L in (0.07, 0.14).
  At L = 0.05: N_even has 0 positive eigenvalues, the Weil form Q_e is still positive (min eig > 0), so "block inequality <=>
  exactly one positive eigenvalue AND sum rule" is FALSE there. Control: Beurling 2 -> 2.1 gives the identical matrix at L = 0.05
  (no atoms below e^0.1): same numbers to all digits.
R11 (controls the seat ran, my recomputation). Impostor (DH) L=1 M=40: fraction of negative off-diagonal box entries 5.5% +- 1.5%,
  min entry -0.52 +- 0.1 (only if I can rebuild the seat's DH embedding in the time left; else reported NOT RECOMPUTED).
R12 (23:34, before computing). Dial n=1.4, seat's embedding (alpha = n/2 in w, atoms at (1/2) log m with weight (c_m/2) m^(-n/4),
  c_m = log-derivative coefficients of sum r_n(m) m^-s/(2n)), L=1 M=40: negative off-diagonal fraction 14.6% +- 2%, min entry -0.27 +- 0.05;
  n=1 gives 0%; n=2 gives 0%.

## 23:38 RESULTS R10-R12 (run6.log, refute5.py.txt; own code)
R10 HIT: zeta M=40: lambda_1 = -1.3118 (L=.03), -0.7913 (.05), -0.4452 (.07), -0.0742 (.10), +0.1177 (.12), +0.2814 (.14), +0.6664 (.20).
  For L <= 0.10: N_even has 0 positive eigenvalues, Weil blocks strictly positive (min eig Q_e 0.459 at L=.1), and 2c^T N_e^-1 c - 1 = -6.23 < 0.
  So Theorem A (A1) second line ("<=> exactly one positive eigenvalue AND 2c^T N^-1 c >= 1") is FALSE as stated for L <= 0.10; the proof line
  "neg(-N_e) >= 1 because <u,Nu> = lambda_1 > 0" uses an unstated hypothesis. Repair: add "lambda_1 > 0" (else the even inequality is trivial).
  Control Beurling: identical to all digits (no atoms in these windows), as predicted.
R11 HIT: impostor negative off-diagonal fraction 5.51%, min entry -0.5169 (offsets 22, 27, 28) (seat: 5.5%, -0.52).
R12 HIT: dial n=1.4: 14.62%, min -0.2704 (seat 14.6%, -0.27); n=1: 0%; n=2: 0%.

### PREDICTION R13 (23:38, before computing): the factor P_M := prod_{i>=2} mu_i(Q_e)/nu_i(-N_e) in  margin_even = (mu_1/lambda_1) P_M
  converges as boxes refine: P_20, P_40, P_80, P_160 all in (1.15, 1.35), successive changes < 5%. (At M=40 it is 1.2089.)
  If so the even sum rule is NOT "exactly saturated": continuum margin = P * mu_1(Weil)/lambda_1 > 0 strictly.
  Control Beurling L=1: margin/(mu_1/lambda_1) is NEGATIVE (mu_1 < 0, margin > 0 by run1.log) : sign flips, magnitude O(1).

## 23:44 RESULT R13 (run7.log): PARTIAL MISS. P_M = 1.1421, 1.2089, 1.2288, 1.2496 (M = 20, 40, 80, 160).
  M=20 is outside my (1.15, 1.35); first change 5.8% (> 5%); the last two increments are +0.0199 and +0.0208 per doubling, i.e. NOT
  shrinking: looks like slow logarithmic growth, convergence not established. Control Beurling HIT: ratio negative (-0.262, -0.141, -0.108, -0.097).
  What stands: margin_even = (mu_1(Q_e)/lambda_1) * P_M exactly (13 digits), with P_M >= 1 by interlacing (PROVED), so the even sum rule is
  strictly unsaturated whenever the even Weil block is strictly positive; whether the continuum factor is finite is OPEN.

## 23:45 PROOF READING (mine, line by line) of PROOF_bochner_parity.md
E: correct (checked Gauss integral, t = 2u substitution, psi(1/4) value); classical in substance (Levy-Khintchine form of Re psi(1/4 + i xi/2)); Zenodo record states it.
A: (A0), first lines of (A1), (A2): correct. Second line of (A1): GAP at "neg(-N_e) >= 1 because <u,Nu> = lambda_1 > 0": lambda_1 > 0 is not a hypothesis
   and is FALSE for the window form at L <= 0.10 (R10). There the equivalence fails (inequality true, zero positive eigenvalues, 2c^T N^-1 c - 1 = -6.2).
   Repairable by adding lambda_1 > 0. (A2) second line is correct without it. No hidden use of RH. Reformulation (rule 2), as the seat says.
B: (B1) correct (needs only (Nu)_x = lambda_1 u_x). (B2) re-derived by hand: correct (z = x allowed, self-pairs excluded). (B3) re-derived: symmetrised bracket
   (1/2)Delta^2 - AB correct; Hessian sum must include pairs with x+a+b outside W (rho = 0): it does. Correct. (B4) trivial. The INTERPRETATION
   "deficit sits in the edge terms" is refuted by the Gamma-normalised numbers (earlier block): removing the open-path term lowers the constant.
C: (C1)-(C4) re-derived: correct. Known: Schmuckenschlaeger 1998 (K=1 example) for C1/C2; C4 is the integrated Bakry-Emery criterion (standard).
   The seat's sentence "centre value tends to 1/2 = the resampling value" is not supported: 0.4965 at M=160, increments -0.029, -0.016, -0.0096.
D: (D1)-(D5) correct. But D1 IS positivity of the Hankel form for the total inversion on log-integer positions, so the reading "primes need a different
   reflection from the Gamma factor" (W-curv-3) is wrong: on integers >= 2 one reflection serves both (R9); it fails only off the integers (D4 uses generic x0).
My searches this session (3, summaries only): (i) 'multiplicative Hankel matrix "von Mangoldt" Lambda(mn) positive semidefinite Helson matrix':
 found arXiv 2407.04124 "Helson matrices induced by measures" (matrices mu^(log mn)/sqrt(mn), mu^ Laplace transform of a positive measure, are positive:
 this covers the archimedean matrix w(log ab) = sum_m (ab)^-(2m+1/2)); arXiv 1411.7294 multiplicative Hilbert matrix; nothing on Lambda(mn).
 (ii) 'Weil quadratic form ... rank one perturbation pole "one positive eigenvalue" OR Lorentzian OR "perturbation determinant"': nothing on the
 determinant-ratio / Aronszajn-Krein form of the sum rule; found arXiv 2607.02828, 2607.24830 (Suzuki screw-function framework, numerical), not read.
 (iii) 'Bakry-Emery curvature complete graph (n+2)/2 ... half spectral gap': arXiv 2508.21055 survey (gap >= rho), 2204.10064; complete graph called
 "the elementary example"; the general-pi formula not found in summaries (Schmuckenschlaeger covers it per the earlier block).

## CLOCK CORRECTION (wall clock 23:32:17 when written). The stamps "23:31", "23:34", "23:38", "23:44", "23:45" above were my estimates and run AHEAD
of the wall clock: true file times are run6.log 23:29:50 (R10-R12), run7.log 23:30:44 (R13). The ORDER is as written (each prediction block was
appended to this file by the same shell command that then ran the script, prediction first).

### PREDICTION R14 (wall clock 23:32, before computing): Ollivier and Dobrushin with my own formulas (no LP): nearest-neighbour Lin-Lu-Yau curvature on the
line by the CDF formula kappa(x,x+1) = -(G_x(x) - G_{x+1}(x)) - sum_{i != x} |G_x(i) - G_{x+1}(i)|, G_x(i) = sum_{j<=i} L(x,j);
Dobrushin kappa(x,y) = q_xy + q_yx + sum_{z != x,y} min(q_xz, q_yz).
zeta L=1: LLY min/lambda_1 = -3.50 +- 0.05 (M=40), -6.21 +- 0.1 (M=80), -10.2 +- 0.2 (M=160); centre pair 0.36-0.37; Dobrushin min/lambda_1 0.430, 0.334, 0.289.
Control Beurling L=1 M=40: Dobrushin 0.472 +- 0.005; LLY min negative of the same size as zeta (within 30%).

## RESULT R14 (run8.log, file time 23:32:40): HIT on every number.
zeta L=1: Lin-Lu-Yau min/lambda_1 = -0.1359, -3.4965, -6.2078, -10.1686 (M=20,40,80,160); centre pair 0.3695, 0.3555, 0.3746, 0.3654;
Dobrushin min/lambda_1 = 0.6030, 0.4305, 0.3337, 0.2888. Beurling L=1: LLY -3.5297 (M=40), -6.2536 (M=80); Dobrushin 0.4721, 0.3618.
(CDF formula, no LP: an independent method from the seat's linear programme; agreement to the digits the seat printed.)

## FINAL VERDICTS (wall clock 23:34)
Proofs: E correct, known. A: gap (lambda_1 > 0 missing; counterexample L <= 0.10), otherwise correct, reformulation. B: correct (elementary).
C: correct, known (Schmuckenschlaeger 1998). D: correct, D1 trivial; arch half is in a known class (arXiv 2407.04124, summary only).
Converse used in W-curv-2 ("exact calibration exists iff gap >= rho") is NOT in the proof file; I checked it: with D_x = Gamma_2,x - rho Gamma_x and
Dbar = sum pi_x D_x (>= 0 iff gap >= rho), the entrywise Poisson equation sum_y L_xy C_y = D_x - Dbar is solvable (right side has pi-mean zero,
L irreducible), and then D_x - (LC)_x = Dbar at every x. Correct, two lines.
Numbers: every number of the seat that I recomputed agrees (lambda_1, gap, BE worst/centre, even/odd margins, Beurling counts, calibrated constants,
Hankel, D1 rank, B3 identity, C2, impostor, dial, Ollivier, Dobrushin). NOT recomputed: exact calibration rank/overlap (exactcal.log), L = 0.75 column.
Wrong or overstated in the seat's text (not in its numbers): (1) "creeps up to exactly 1/2" (strictly below on every finite window with positive Weil block);
(2) "centre value tends to 1/2"; (3) "the deficit sits in the edge terms" / W-curv-5; (4) per-site index conjecture (its own kill line is hit at M=160);
(5) "each fails for the other's reflection" (true off the integers only); (6) Theorem A without lambda_1 > 0.
Prediction order: 22:38 block and 22:44 block consistent with file times; 22:51 (sig) and 22:53 (exactcal) prediction stamps are LATER than the logs they
predict (sig.log 22:50:35, exactcal.log 22:51:47) and later than PROGRESS.md's own last write (22:52:03): order unverifiable for those two; Hankel has no log.
