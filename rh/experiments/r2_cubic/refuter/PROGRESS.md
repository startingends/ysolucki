# r2_cubic/refuter  (agent R2-cubic-ref)  VERIFIER of seat "cubic": proofs and numbers only

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE.  I do not judge ideas (owner, 2026-11-10).
Own implementation: scripts ref_*.py.txt in this folder; none imports the seat's scripts.
I read the seat's box.py.txt / sdp.py.txt only to learn DEFINITIONS (Beurling weights, what "margin" means).

## 1. Proofs, line by line (started 23:29 UTC by `date`)
(see section at the end, filled as I go)

## 2. Numbers

CLOCK NOTE (honesty): the times 23:33 / 23:36 / 23:38 / 23:45 / 23:47 typed below were my ESTIMATES, not read from the clock.
`date -u` read 23:29 when this file was created and 23:34 after the last SDP run, so all of those entries were in fact written
between 23:29 and 23:34. The ORDER is as stated: each expectation was appended to this file in the same shell command that
then started the run (heredoc first, python after), so each was on disk before its computation began.
Expectation written 23:33 UTC before my first run (ref_p1): if the seat's box builder is right, my own builder
(scipy quad; arch entries cross-checked against the digamma frequency-side formula, which the seat never did)
gives for zeta L=1 n=12: eigenvalues of Ntilde 5.306, -0.0018, -0.035; Beurling (2 -> 2.1): 5.287, +0.020.
Control: #pos(Ntilde) = 1 + #neg(Q) in every case (Lemma A), zeta 1, Beurling 2 at L = 1 and at L = 0.5 n = 14.
Result ref_p1 (23:36 UTC), COMPUTED, `python3 tools/memcap.py 3 python3 ref_p1.py.txt`, double precision:
- arch box entries, my kernel form vs the digamma frequency-side form (different formula, same box functions), L=1 n=12:
  |i-j| = 0, 1, 2, 5, 11: 0.3352170104, -0.7340679170, -0.3015429935, -0.1361215850, -0.0684553171 on BOTH routes (10 digits).
  This is the exact same-function check of the arch part of the box assembly that the seat lists as not done.
- zeta L=1 n=12: Ntilde eigs 5.305946, -1.811519e-3, -3.467240e-2 (seat: 5.306, -0.0018, -0.035). AGREE.
- Beurling L=1 n=12: 5.286899, +1.995303e-2 (seat 5.287, +0.020). AGREE. min eig Q -2.48e-2.
- Beurling L=0.5: min eig Q = -2.98e-3 (n=12), -1.366e-2 (n=14) (seat -3.0e-3, -1.4e-2). AGREE. L=0.4 n=12: not detected. AGREE.
- #pos(Ntilde) = 1 + #neg(Q) in all 12 cases (Lemma A numerically).

Expectation written 23:38 UTC before ref_be: seat's numbers should reproduce: T^BE built from Gamma_2 by definition is
symmetric (< 1e-12) and equals formula F5; rho_BE zeta L=1: 0.5902, 0.5280, 0.4816 (n=12,24,48); Beurling 0.5863, 0.5230,
0.4825; gap 1.00034/1.00015/1.00005 vs 0.99623/0.95387/0.92808; resampling 1/2+1/m; cone rho 1.0005 (n=12), 0.45 (n=24, L=1);
Theta_t best t=0.05 worst -0.047 (zeta L=1 n=12), BE worst -4.138. Control: Beurling Theta_t -0.048.
Result ref_be / ref_fam2 (23:45 UTC), COMPUTED: see section 4 table. All seat numbers reproduced to the digits printed, EXCEPT
"Theta_t best t = 0.05, worst -0.047": the seat scanned t in steps of 0.05; on a 0.001 grid the optimum is t = 0.014, -0.0184
(zeta L=1 n=12); t = 0.034, -0.0379 (n=24); t = 0.057, -0.0217 (L=0.5 n=12); Beurling L=1 n=12: t = 0.014, -0.0239.
At the seat's own grid points (t = 0, 0.05, 1/2) my values agree to 4 digits. "No t works" stands.

Expectation written 23:47 UTC before ref_sdp (my SDP uses PSD variables P_k, not tensor entries; own formulation):
sign-constrained margin t*: zeta L=0.5 n=8 0.785, Beurling L=0.5 n=8 0.776, Beurling L=0.3 n=8 1.300 (a = Perron);
Beurling L=1 n=8 infeasible. Locality (zeta L=1, forbid box triples with index spread > n-2): max slack t = -5.80, -3.19,
-2.30, -1.43, -0.82 for n = 2,3,4,6,8; full support t = 0. Degree family: tau*(1) = 1.442e-2 (L=1 n=12), 3.573e-2 (L=0.5 n=12);
degree 2: certificate exists. My sharper test for existence: since P_k a = 0 always, ask for P_k >= t (I - a a^T/|a|^2) and
maximise t; "exists robustly" iff t* > 0 by a clear margin. I do not know what t* will be; if t* <= 1e-9 the seat's
"exists" (lambda_min = 1e-12 with status optimal_inaccurate) is not established in floating point.

## 3. Proof verdicts (read every line of PROOF_trickle.md and PROOF_BE_cubic.md; algebra redone by hand, then numerically)
| statement | verdict | detail |
|---|---|---|
| Lemma A (fibre classes) | correct, known | Every line checks. It is Haynsworth's inertia additivity (Schur complement w.r.t. the block [[0,1],[1,0]]; from memory) = Hodge index picture, as the seat says. COMPUTED: 2000 random (N,p,q), 0 violations; 12 box cases. |
| Lemma B (trickle-down, negative diagonal) | correct, KNOWN | Identical in hypotheses and proof to Braenden-Leake, arXiv 2304.13203v2, Lemma 2.8, case d = 3 (their (1) d_i f(x) > 0 = seat's s_k > 0; (2) = B3; (3) = B1; their inequality (d-1) Hess <= Hess Lambda Hess = seat's H <= HDH). They credit Cordero-Erausquin-Klartag-Merigot-Santambrogio 2019, Prop. 3. I read pp. 6-9 of the PDF text. The seat wrote "relation unchecked / probably folklore". |
| Lemma B remark 1 (LMI form, convexity) | correct | elementary |
| Lemma C + vacuity corollary | correct | Every line checks (contraction, slice decomposition, Weyl). Hypothesis l >= 0 is really used: with some l_k < 0, 1272 of the random instances have a slice with 2 positive eigenvalues. Not found in what I read; elementary. |
| Lemma D (D1-D4), Lemma E | correct | D4 bounds the QUADRATIC value vt^T P_k vt; the vector T_k vt is only controlled at the sqrt(mu) scale (seen: 4e-8 vs 1.2e-4). The "Meaning" paragraph about the continuum ladder (6e-30) is an extrapolation, not part of the lemma: on box spaces mu is 1e-2 .. 1e-3. |
| Theorem F (F1-F5) | correct | Recomputed F1, F2 (all four collected lines), F3, F5 (all three entry types) by hand; COMPUTED: T built from Gamma_2 by definition = Theta by definition = formula F5 to 6e-15, also for mixed-sign H and non-Perron a. Not found in 2 searches + Braenden-Leake sec. 2 + a machine summary of Shenfeld-van Handel 1811.08710 (which has no Markov chain / Gamma_2). Known part: the ancestor of Lemma B is itself a Bochner/Lichnerowicz argument (Alexandrov-Fenchel). |
| Sec. 2 model (Gamma, Gamma_2 on resampling chain) | correct | and rho = 1/2 + 1/m (seat: COMPUTED) is PROVED in two lines: ratio (3<f^2>+f_k^2)/(2(<f^2>+f_k^2)), f_k^2 <= (m-1)<f^2> by Cauchy-Schwarz for mean-zero f, equality at f = e_k - 1/m. |
| Sec. 3 (U), (V) | correct | Normalisation: formulas with <g> = mean need total mass of pi equal to 1; otherwise a factor Z = a^T H a. COMPUTED: extreme certificates of a rank-one H differ from l l l/s^2 by 2e-9. |
| CD(rho, n) remark (PROGRESS.md only, no PROOF file) | gap as stated in the report | Exact constant on the resampling chain: rho = 1/2 - 2/n + (1 + 2/n)/m (COMPUTED m=40: 0.135, 0.28125, 0.4275 for n=5,8,20). So "at most (n-4)/(2(n-1))" holds only as m -> infinity; counterexample at m=40, n=5: Lichnerowicz bound 0.16875 > 0.125. "< 1/2" needs m > 2(n+2)/3. PROGRESS.md does say "up to O(1/m)"; the report sentence drops it. |
No proof uses RH or anything equivalent: all statements are finite-dimensional linear algebra.

## 4. Number table (mine vs seat). All double precision; every script 1-60 s under memcap 3.
| quantity | seat | mine | |
|---|---|---|---|
| Ntilde eigs, zeta L=1 n=12 | 5.306, -0.0018, -0.035 | 5.305946, -1.811519e-3, -3.467240e-2 | AGREE |
| Beurling L=1 n=12 | 5.287, +0.020 | 5.286899, +1.995303e-2 | AGREE |
| Beurling L=0.5 min eig Q, n=12 / 14 | -3.0e-3 / -1.4e-2 | -2.9802e-3 / -1.3656e-2 | AGREE |
| cone certificate rho, L=1 n=12 / n=24 | 1.0005 / 0.45 | 1.0005 / 0.4503 (0.9755, 0.6092, 0.4274, 0.4214 at L=0.5, 0.75, 1.25, 1.5) | AGREE |
| share of negative distinct box triples, L=1 n=12 | 0% | 0.000 (n=24: 16.3%) | AGREE |
| sign-constrained t*: zeta L=0.5 n=8 / Beurling L=0.5 / L=0.3 / zeta L=1 n=10 | 0.78540 / 0.77629 / 1.29951 / 0.65847 | 0.78540 / 0.77629 / 1.29951 / 0.65847 (2 solvers) | AGREE |
| same, zeta L=1 n=8 and L=0.75 n=8, a = Perron | solver failed | 0.73877 / 0.67750 (2 solvers) | filled |
| Beurling L=1 n=8 | infeasible | infeasible (2 solvers) | AGREE |
| locality slack, n=2,3,4,6,8 (L=1) | -5.800, -3.190, -2.300, -1.434, -0.8209 | -5.8002, -3.1905, -2.3004, -1.4338, -0.82092 | AGREE; seat's "two solvers" holds for n=2,3,4 only (their CLARABEL failed at 6 and 8; mine succeeded at 6, failed at 8) |
| locality slack L=0.5 n=8, zeta / Beurling | "infeasible" | -0.0690 / -0.0694 (2 solvers) | AGREE, margin is small |
| D3 identity, L=1 n=8 | 1.321e-2 | 1.321418e-2 (both sides) | AGREE |
| P6 singular form: max |T_k vt|, max |vt T_k vt| | 1.07e-4, 9.5e-9 | 1.23e-4, 3.7e-8 (other objective) | same size; both above the predicted 1e-4 |
| T^BE symmetry / formula F5 | 7e-16 / 4e-15 | 9e-16 / 6e-15 | AGREE |
| rho_BE zeta L=1, n=12,24,48 | 0.5902, 0.5280, 0.4816 | 0.5902, 0.5280, 0.4816 | AGREE |
| rho_BE Beurling | 0.5863, 0.5230, 0.4825 | 0.5863, 0.5230, 0.4825 | AGREE |
| gap zeta / Beurling | 1.00034, 1.00015, 1.00005 / 0.99623, 0.95387, 0.92808 | identical | AGREE |
| slices of T^BE: positive eigenvalues | 2 | 2 (all slices, all 6 cases) | AGREE |
| rho_BE resampling m=5,10,20,40 | 0.7, 0.6, 0.55, 0.525 | 0.700000, 0.600000, 0.550000, 0.525000 | AGREE (and proved) |
| rho_BE zeta L=0.5 n=12 | 0.65 | 0.6498 | AGREE |
| Theta_t at t=0.05 (L=1 n=12 / n=24 / L=0.5 / Beurling) | -0.047 / -0.052 / -0.032 / -0.048 | -0.04694 / -0.05181 / -0.03157 / -0.04795 | AGREE at that t |
| Theta_t BEST t | 0.05 (grid step 0.05) | 0.014: -0.0184; 0.034: -0.0379; 0.057: -0.0217; Beurling 0.014: -0.0239 (grid 0.001) | seat's "best" is a GRID ARTEFACT; "no t works" stands |
| Bakry-Emery worst lambda_min(P_k), L=1 n=12 / 24 | -4.1 / -6.1 | -4.1380 / -6.1482 | AGREE |
| degree-1 tau* (L=1 n=12 / L=0.5 n=12 / L=1 n=20) | 0.014 / 0.036 / 0.073 | 0.014424 / 0.035727 / 0.072570 (2 solvers) | AGREE |
| degree-2 certificate exists (zeta L=0.5 n=12, L=1 n=12, L=1 n=20; Beurling L=0.5 n=8) | lambda_min(P_k) = 1e-12, -3e-15; 5e-6 | margin on a-perp: 1.19e-3, 4.6e-4, 2.6e-4, 6.7e-3 (2 solvers, returned tensor rechecked) | REPRODUCED and strengthened |
| Beurling L=1 n=12, degree 2 | tau* = 5e-3 (one solver, residual 1e-3) | 5.992e-3 (2 solvers) | same size, third digit differs |
| random Lorentzian Metzler, degree 2 | 12 of 12 | 12 of 12 on my own 12 instances, margins 1.8e-3 .. 0.29 | AGREE |
| random, degree 1 | works for 11 of 12 | works for 7 of 12 on mine (fails when eig2 > about -0.28) | instance-dependent; NOT a stable count |
| product cubic slices | 11 of 12 positive | 11 of 12 (k = 0, 5) | AGREE |
| CD(rho,n) | <= 1/2 - 2/n up to O(1/m) | 1/2 - 2/n + (1+2/n)/m exactly | AGREE with the O(1/m) term made explicit |
Not recomputed: the seat's smooth-function validation value 1.558525793986 and its box-convergence errors (I replaced them by the
digamma check of section 2); the "all entries but T_iii >= 0" mode; chain-degree 3; L = 2 rows of p7.log.

## 5. Predictions: were they written first? (facts from file times and git)
- git commit 1e3f60a (22:47:54) holds a PROGRESS.md with P1-P7 and NO results table. small.py.txt/small.log (22:49) and p5.log, p6.log
  (23:02) are later: P5 and P6 are VERIFIED as written before their computations.
- P1-P4 (stamp 22:39): tests.py.txt 22:40:34, tests.log 22:44:58, sdp_main.log 22:45:23: consistent, but that commit already
  contains these logs, so the order is not independently provable.
- P7 (stamp 22:47): more.py.txt 22:47:27, p7.log 22:47:30, same commit: order not provable (same minute).
- P8-P12 (stamps 22:52, 22:57, 22:59, 23:00, 23:02): no intermediate snapshot. Scripts are 0-4 min OLDER than the stamps (be 22:51:57,
  be2 22:54:00, fam 22:55:43, poly2 22:56:43, rand 22:59:51); the kept logs are from one batch at 23:01:58-23:02:13 (poly2.log
  23:04:04) and be.log was overwritten then (P9's text already cites its result). Consistent with "prediction first", not provable.
  Four of these five predictions are reported as misses, which a back-dated prediction would not be.
- Controls actually computed: Beurling in P1b, P3, P5, P9, P10, P11 (logs present; I reproduced each). P12 is a random-matrix
  control. No control for P2, P4, P6, P7. Impostor and theta-dial: not run (stated by the seat).

## 6. End-to-end check of the box matrix against the zeros (extra; the seat lists "exact same-function check" as not done)
Expectation written before the run (clock 23:40 by `date`): by the explicit formula (unconditional; the zeros used are the
first 20000, all on the line), Q(e_i, e_j) = 2 sum_{gamma>0} (4 sin^2(gamma h/2)/(h gamma^2)) cos(gamma d_ij). With 20000 zeros
(T about 1.8e4) plus the smooth tail (2/(pi h)) (log(T/2pi) + 1)/T on the diagonal (about 1.9e-3), this should equal
2 p_i q_j-type pole + arch - primes from my builder to about 1e-4 (error from the oscillating tail). If the prime weights or
the pole normalisation in the box builder (mine = the seat's) were off by a factor, the mismatch would be of order 0.1 to 1.
Control: dropping the prime atoms from the builder must break the agreement by about N-prime entries (0.1 or more).
Result (`python3 tools/memcap.py 3 python3 ref_zeros.py.txt 20000`, 2 s), COMPUTED, L = 1, n = 12, 20000 zeros (T = 18046.46):
| entry | zeros sum + smooth tail | builder | diff | builder without primes (control) |
|---|---|---|---|---|
| Q[0,0] | 0.666847 + 0.001897 = 0.668744 | 0.668743 | 6e-7 | 0.668743 (no prime power within one box of 0) |
| Q[3,4] | -0.398435 (+ tail -0.000949 = -0.399384; I had forgotten that adjacent boxes also have a smooth tail, -1/2 of the diagonal one) | -0.399383 | 1e-6 after the tail | same |
| Q[0,2] | 0.036627 | 0.036626 | 3e-7 | same |
| Q[0,5] | 0.148905 | 0.148905 | 1e-7 | 0.226778 (prime 2) |
| Q[2,9] | -0.086620 | -0.086620 | 3e-8 | 0.288669 (prime 3) |
| Q[0,11] | 0.176596 | 0.176596 | -4e-8 | 0.415289 (prime 7) |
HIT (better than the 1e-4 I expected), with one MISS of mine: I predicted no tail off the diagonal; adjacent boxes have one.
Control HIT: without the prime atoms the three entries that see a prime are off by 0.08 to 0.37.
So the box matrix (identical in the seat's builder and mine to all printed digits) is confirmed end to end against the zeros:
pole normalisation, Gamma kernel with its constant, and prime weights.
