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

## RESULTS (all COMPUTED with implementation C = wc.py.txt; commands: `python3 tools/memcap.py 3 python3 c1.py.txt`, `... c2.py.txt a|bg|iv 40 int|iv 60 half|sieve int|sieve half`, `... c3.py.txt <lattice> <N> x...`, `python3 c4.py.txt`)
V1 HIT. C (Gauss-Legendre quadrature of the kernel, dps 60) vs r1_A builder (digamma closed form), L=1, N=12, full zeta form:
   max entry difference 5.2e-60 in both blocks (pole alone 2.5e-61, arch alone 4.7e-60). Control (2 -> 2.1 in C only): 0.899. (c1.log)
V2 HIT, digit for digit (c2_a.log): #pos(N) = 1, 1, 1; second eigenvalue -0.012028 (L=0.5,N=30), -9.0515e-10 (0.75,30), -2.1051e-23 (1,40);
   half lattice N=40: -2.138e-23; int N=60: -1.7379e-23; no primes at L=1: 4 positive, 2.613, 1.011, 0.4829, 0.1324 (next -0.1144).
   Even block of N at L=1: 4.305408, -2.1051e-23; odd block top -1.0654e-20. Control Beurling: 3 positive at L=0.5 (1.9453, 0.043943, 0.037624),
   5 at L=1 (4.283, 0.49681, 0.48807); lowest eigenvalue of Q: -0.041582/-0.06619 and -0.48835/-0.50304. All identical to the seat's log.
V3 HIT (c2_bg.log). int/30: odd +0.01027 (0.37), -0.003868 (0.375), -0.01784 (0.38); even 0.001046 (0.38), 0.0006292 (0.40).
   half/60: odd +0.004651, -0.009496, -0.02348; even 0.00105, 0.0006788. int/200: odd +0.005482 (0.37), -0.008663 (0.375), -0.02265 (0.38); even 0.001058, 0.001057, 0.001046.
   So the odd block changes sign between 0.370 and 0.375 in all three bases (narrower than the seat's (0.37, 0.38)); my addition "odd at 0.37 stays in (0.004, 0.007) at N=200" HIT.
V4 HIT (c2_iv_int40.log). EXACT end points of the discretised feasible intervals, L=1, int N=40 (seat's bisected value in brackets):
   n=2 [-5.158e-26, 1.130e-28] (-5.14e-26, 1.114e-28); n=3 [-3.274e-24, 3.350e-26] (-3.22e-24, 3.338e-26); n=4 [-1.484e-21, 4.118e-23] (-1.459e-21, 4.068e-23);
   n=5 [-3.905e-18, 2.500e-19] (-3.854e-18, 2.458e-19); n=6 [-1.250e-13, 1.824e-14] (-1.241e-13, 1.811e-14); n=7 [-1.584e-6, 6.608e-7] (-1.568e-6, 6.494e-7).
   Every seat value is inside the exact interval by a factor between 1.003 and 1.02, as a feasible-side bisection must be.
   half N=60 (c2_iv_half60.log): n=6 [-1.051e-13, 1.520e-14] (seat -1.037e-13, 1.512e-14); n=2 [-4.330e-26, 9.478e-29]; n=7 [-1.390e-6, 5.537e-7].
   Lowest eigenvalue at the true weights 8.2493e-30 / 2.228e-26 (int 40), 6.9205e-30 / 1.8704e-26 (half 60); no weights -1.3152884, -1.3239606: identical.
V5 HIT (c2_sieve_*.log). digits from exact end points, int: 1.979, 3.456, 4.481, 5.384, 6.129, 6.782, 7.430 (seat 1.98, 3.47, 4.48, 5.39, 6.14, 6.80, 7.44);
   half: 2.032, 3.465, 4.399, 5.329, 6.105, 6.784, 7.490 (seat 2.05, 3.47, 4.41, 5.34, 6.11, 6.80, 7.50). Eigenvalue at the true weight identical (1.06e-5 ... 4.13e-35).
V6 HIT on every predicted value (c3_int30.log): -2.176e-4 (1.994), -2.338e-6 (1.9995), +1.305e-6 (1.9996), +8.56e-6 (1.9998), +1.578e-5 (2, c=0.692255),
   +1.518e-4 (2.004), +2.435e-4 (2.007), +4.745e-5 (2.008), -1.284e-3 (2.010), -3.933e-3 (2.014).
   NEW rows: int/30 x=2.0085: -2.86e-4 INFEASIBLE, 2.009: -6.19e-4. half/30: 1.9996 -3.53e-7, 1.9998 +6.99e-6, 2 +1.430e-5, 2.007 +2.435e-4, 2.008 +2.72e-4, 2.009 -1.04e-4, 2.010 -7.66e-4.
   int/120: 1.9995 -3.78e-6, 1.9996 -1.04e-7 INFEASIBLE, 1.9997 +3.57e-6, 1.9998 +7.22e-6, 2 +1.451e-5, 2.007 +2.435e-4, 2.0075 +2.578e-4, 2.008 -1.6e-6 INFEASIBLE, 2.0085 -3.35e-4.
   Since "infeasible in a subspace" is a true statement about the full window, the feasible positions lie inside (1.9996, 2.0080), not [1.9996, 2.0085].
   The seat's right end 2.0085 is NOT reproduced (infeasible in int/30 and int/120); everything else in the position claim is.
V7 HIT within the bisection factor (c2_iv_int40.log): scaled all-plus 0.1699, all-minus 0.1698 (seat 0.1715, 0.1715; the 1% is the seat's bisected r_n);
   (6+,7+) 0.5089, (6+,7-) 1.156, (6-,7+) 1.595, (6-,7-) 0.5085, (2+,3-) 1.002, (2-,7+) 1.488; raw e6+e7 1.824e-14, -e6+e7 1.250e-13, e2+e4 1.130e-28,
   -(e2+e4) 5.158e-26, all ones 1.126e-28, -all ones 5.078e-26. half N=60: 0.1700, 0.1697, 0.5093, 1.154, 1.556, 0.5085, 1.002.
C4 (c4.log): inequalities (3b), (3c), (3d) of Theorem 4 hold in 200 random cases (a, b, C, K); the bracket in (3d) turns positive from K = 56 (b = 0.01), 7 (b = 0.1), 3 (b = 0.4).

## PROOF CHECK (line by line; verdicts)
PROOF_parity_index.md
 * Lemma 1, Lemma 2: correct. Trivial (two lines each). Known: Yoshida 1992 Prop. 1 treats even and odd test functions separately (Suzuki 2606.09096 p.2).
 * Prop. 3 (a),(b),(c): correct. One unwritten step: kappa_-(Q) <= kappa_-(Q_e) + kappa_-(Q_o) (project a negative subspace on the two blocks and use
   Sylvester on the finite-dimensional sum); standard, not a gap of substance.
 * Theorem 4: correct; I checked every inequality of Steps 1-5 (the multiplier identities, |tau| < 0.06, the choice of t, the four cases of the Gram matrix,
   C_i != 0, the odd block). No use of RH or of anything equivalent. Numerical check of (3b)-(3d): c4.log.
 * C1, C4: correct. The last line of C1 and C4 ("one parity block suffices") is KNOWN: Yoshida 1992 Prop. 1 as reported by Suzuki p.2.
 * C2: correct as an implication. The sentence "cannot be improved by linear algebra alone" is an observation, not a theorem: no configuration with one
   quartet and kappa_+(N) = 1 is exhibited, and the file says so itself. The seat's summary words "PROVED; cannot be improved" overstate that half.
PROOF_first_failure.md
 * Lemma 1: correct; and unconditional (no CORE needed) by Suzuki Cor. 1.2 (lambda_a = infimum over C_c^infinity(-a,a)).
 * Lemma 2: the Jensen/Selberg argument is correct, with one unstated point: Selberg's count must be of DISTINCT zeros (it is: his method counts sign
   changes of Z(t)). Part (i) "lambda(L) > 0 strictly" also needs attainment of the infimum (CCM Thm 3.6) and the zero-side formula on the form domain;
   the label "PROVED" on Lemma 2 omits "given S1, CORE". Theorem 3 lists them, so the chain is intact.
 * Theorem 3, section 4, Prop. 5 (a)-(d): correct given S1, S3, S4, CORE. Attribution slip: closedness/lower bound is Connes-Consani Prop. 2.1 and
   discrete spectrum is Connes-Consani-Moscovici Thm 3.6 (quoted by Suzuki p.2 and p.4); Suzuki's Thm 1.1 is the Friedrichs-extension statement.
 * CORE checked against the PDF (pages 2, 4-5, 11-14 read, about 15% of the text): the form domain is D = {v in L^2(-a,a) : |Q_W(v)| < infinity} with
   Q_W^a the RESTRICTION of one form Q_W, so nestedness and translation stability hold; (3.1) is the zero-side formula used on it. The specific description
   "Dom = {int log(2+|r|)|fhat|^2 < infinity}" is NOT what Suzuki states: he proves only D subset H^log (p.13-14). That equality is not used by the proofs.
PROOF_uniqueness.md
 * Theorem U: correct, every step checked (Step 1 Fourier inversion, Step 2 scaling and dominated convergence, Step 3 means). Uses RH as a hypothesis, openly.
 * Scope item "false on every single window": true under RH, but the file supports it by a discretised example (an outer bound, by the seat's own WP4).
   One-line proof: |D(f*f~)| <= 2 sum|d_j| ||f||^2 and lambda(L) > 0 is attained, so Q_L + D >= 0 whenever 2 sum|d_j| <= lambda(L).

## PREDICTIONS OF THE SEAT: timing facts
 * The whole seat folder entered git in ONE commit (d401679, 23:20:42); PROGRESS.md has a single mtime 23:11:11. So file history cannot show that the
   prediction block existed before the logs. What can be said: the times written in the file are consistent with the mtimes. The folder refuter/ was
   created 22:34 (seat start); "T+08" is then about 22:42, and the first code/log files are wb.py.txt 22:57:43, v1.log 22:58:12, v2_a.log 22:59:38,
   v2_joint_int40.log 23:00:54, v2_bg.log 23:01:21, sieve logs 23:02; "T+31" is about 23:05, v3.py.txt 23:04:28, v3_half.log 23:05:42, v3_int60.log 23:07:31.
 * Internal evidence for "written before": five predictions are recorded as misses (P3b, P3c, P4 location, P7, P8), and P3 contains an unedited
   self-contradiction ("I say 2 ... recorded as a guess: 1").
 * v2_pos.log was last written 23:14:10, three minutes AFTER PROGRESS.md's last write; its last 12 rows (half/60) are not used in PROGRESS.md.
 * Controls actually computed: P1 (0.899, v1.log), P2 (1.0055, v1.log), P3 (Beurling counts, v2_a.log). NOT computed: the control named in P5
   ("at the Beurling-shifted base point there is no feasible interval at all") has no log line. P4, P6, P8 name no control; P7 says none exists.

## Late rows and searches
 * bg int/200, L=0.40: even 0.0006275, odd -0.0771 (my addition "even at 0.40 stays > 0.0005 at N=200" HIT).
 * First-failure Theorem 3 is KNOWN in substance: Suzuki p.5 (after Thm 1.3) derives "RH false => Q_W^a degenerate for some a" from continuity and
   small-a positivity, and attributes "RH <=> non-degeneracy of Q_W^a for every a" to Yoshida 1992 (Theorem 2). The seat's additions are the interval
   structure (trivial from monotonicity) and Prop. 5.
 * Searches run by me (4 queries, summaries; one PDF opened and partly read): (1) "Weil explicit formula hermitian form number of negative squares
   equals number of zeros off the critical line Bombieri"; (2) "Suzuki arXiv 2606.09096 ..." (PDF fetched, pages 2, 4-5, 11-14 read);
   (3) "Weil distribution negative squares OR Pontryagin space zeros off the critical line ..."; (4) "positive definite distribution discrete spectral
   measure atomic perturbation uniqueness almost periodic ...". Found: per off-line pair a signature (1,1) block (Sylvester) in unrefereed 2026 PDFs
   (not opened); no source stating the exact count with attainment; no source for Theorem U. Yoshida's paper (Project Euclid) and arXiv 2609.15329
   (abstract only: unrelated, Selberg's method) gave nothing; the Bombieri attribution stays unverified.
 * Not redone by me: the comparison of Q(f) with the sum over zeros (I matched the r1_A builder entrywise instead); the 26-pattern joint table beyond the 8
   patterns listed; the half-lattice Beurling counts; int/60 position rows.
