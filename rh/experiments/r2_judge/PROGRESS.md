# PROGRESS (R2-judge, verification track: proofs and numbers only)

Start 23:51 UTC 2026-11-10. Read: preamble, brief, UNDERSTANDING, KEY_LEMMA_SHAPE, ideas #8-#11 (claims and logs),
notebook N27, all six PROOF files of the three seats line by line (23:51-23:55), lead's e10 logs.
I do not rank or assess ideas. The idea verdicts of the "curv" checker are ignored; only its proof and number findings are used.

## Predictions written BEFORE computing (written 23:56 UTC by the system clock; my first typed stamp 23:59 was an estimate and is corrected here). Each has a control.

J1 background (pole + arch, no primes), lead's Arb builder r1_A/weil.py.txt, N = 30 and 60, per parity block.
   Predict: lowest eigenvalue POSITIVE at L = 0.362 and at L = 0.370 (odd block +0.004..+0.011 at 0.370), NEGATIVE at
   0.375 (odd block -0.003..-0.010) and at 0.38 (-0.0178 at N = 30, the lead's own number); even block positive (about
   0.001) at 0.38. So the lead's "negative from about L = 0.362 on" should come out wrong by about 0.01 in L.
   Control: with the true prime 2 present the lowest eigenvalue at 0.38 is +4.10e-4 (lead's test_c.log).
J2 position of one atom, L = 0.5, N = 30 (lead's golden-section harness): x = 2.0080 feasible (+4.7e-5), x = 2.0085
   infeasible (about -2.9e-4), x = 1.9996 feasible (about +1.3e-6). At N = 60, x = 2.0080: sign uncertain, value in
   (-2e-5, +5e-5). Control: x = 1.994 gives -2.3e-4 (lead's test_d.log); x = 2.000 gives +1.578e-5.
J3 Theorem A needs lambda_1 > 0: top eigenvalue of N = primes - arch at L = 0.10 (Fourier N = 30) is NEGATIVE, in
   (-0.09, -0.04); at L = 0.12 positive (+0.05..+0.20). Lowest Weil eigenvalue at L = 0.10 positive, in (0.3, 0.5).
   Control: none possible with primes (no prime power in the window at L = 0.10); the toy 2x2 matrix [[-10,1],[1,-10]] is the control.
J4 Theta_t, zeta L = 1 n = 12, my own box matrix, grid step 0.001: best t in [0.010, 0.020], worst lambda_min(P_k) in
   (-0.020, -0.017); at t = 0.05: -0.047. Control Beurling: best about -0.024 near t = 0.014; no t gives >= 0.
J5 Bochner pieces, zeta L = 1 M = 40, centre site, Gamma-normalised constant / lambda_1: squares+Hessian 0.24 +- 0.01,
   squares+open 0.20 +- 0.01, all three 0.522. Raw smallest eigenvalues: Hessian piece -0.034, open-path piece -1.57.
   Control Beurling centre, all three: 0.50..0.54 (same as zeta; my guess, not in any report).
J6 per-site negative index of Gamma_2 - lambda_1 Gamma equal to 1: zeta 38/40, 50/80, and at M = 160 between 0 and 12
   sites (checker: 4); Beurling 32/40, 24/80, 0..4 at 160. Threshold for "negative": < -1e-9.
J7 Theorem F on random symmetric H (mixed signs), a > 0 with Ha > 0, m = 7: tensor from the definition of Theta, from
   formula F5, and from Gamma_2 by definition agree to < 1e-11; |T.a - H| < 1e-11. Control: replace the coefficient
   1/4 of [g,f,h] by 0.3: |T.a - H| becomes O(0.05..1).
J8 Lemma C: with l = Ha >= 0, 0 violations in 300 random Lorentzian H; with some l_k < 0, at least 10% of instances
   have a slice with two positive eigenvalues.
J9 CD(rho, n) on the resampling chain, m = 40: best rho = 0.13500, 0.28125, 0.42750 for n = 5, 8, 20 (formula
   1/2 - 2/n + (1 + 2/n)/m, which I rederived by hand before computing). Control m = 1000, n = 5: 0.1014.
J10 determinant identity: 2 c^T N_e^-1 c - 1 = det(Q_e)/|det N_e| in my box basis, L = 1, M = 40: both 5.59e-4, equal to
   1e-9 relative. Control Beurling: ratio negative.
J11 my box matrix (third implementation: diagonal from Theorem E with a closed form for the tail integral) against the
   seats: zeta L = 1 M = 40: lambda_1 = 4.303094, gap/lambda_1 - 1 = 3.36e-3, BE worst 0.4963, centre 0.5222;
   Ntilde n = 12: 5.305946, -1.8115e-3. Beurling L = 1 M = 40: 5 positive eigenvalues, gap/lambda_1 = 0.9141, BE 0.4989.

J12 (written 00:02 UTC 11-11, before computing) feasible interval of the weight at 6, L = 1, N = 40, lead's Arb builder,
   end points from the generalised eigenvalues of (shift form at 6, Weil form), no bisection, 90 digits.
   Predict: [-1.250e-13, +1.824e-14] in units of c_6 (the checker's exact values; lead recorded [-1.15e-13, 1.78e-14],
   seat [-1.241e-13, 1.811e-14]); lowest Weil eigenvalue 8.2493e-30.
   Control (named in the seat's P5 but without a log line, per the checker): with the prime 2 moved to 2.1 no value of
   the weight at 6 makes the form non-negative; predicted best lowest eigenvalue below -0.01.

J13 (written 00:04 UTC 11-11, before computing) toy sanity check of Theorem 4's count on the zero-side form alone:
   zero set = 40 real ordinates +-(14 + 3j), j = 0..19, plus quartets at a + ib = 20.5 + 0.3i and 33.3 + 0.2i; Fourier
   basis with 81 modes on [-L, L], L = 0.5, 1, 2, 4; count eigenvalues below -1e-8 in each parity block.
   Predict: (even, odd) = (2, 2) at every L, never 3; with one quartet only (1, 1); quartet multiplicity 3 changes
   nothing. Control: both quartets moved onto the line (b = 0): (0, 0).

J14 (written about 00:05 UTC 11-11 by the system clock, before computing), my box matrix, L = 1, M = 40:
   Hankel (reflection) matrix K(x_i + x_j) on the 20 positive boxes: arch part 0 negative eigenvalues; with zeta atoms
   smallest -1.1227 and 9 of 20 negative; Beurling smallest -1.1725. Odd sum-rule margin 1 - 2 s^T(-N)^-1 s = 3.2074e-2.
   Calibrated Bakry-Emery, sup over (c, c') of the pointwise constant / lambda_1: zeta 0.7923, Beurling 0.7694.
   (All are the seat's and the checker's common values; the control is the Beurling column.)

## Results (all COMPUTED; commands: python3 tools/memcap.py 3 python3 <script> ; each run under 1 minute)
Implementations used: (i) the lead's Arb builder r1_A/weil.py.txt through my own harness j1.py.txt / j12.py.txt (40 and
90 digits); (ii) my own box matrix jbox.py.txt (double precision; diagonal from Theorem E with the closed form
int_h^inf w = atanh(e^{-h/2}) + atan(e^{-h/2}); no seat or checker code imported); (iii) plain numpy algebra (j2.py.txt).

| id | result | hit? |
|---|---|---|
| J1 | background lowest eigenvalue, odd block: +0.0332 / +0.0217 / +0.0103 / -0.0039 / -0.0178 at L = 0.362 / 0.366 / 0.370 / 0.375 / 0.380 (N = 30); +0.0305 / +0.0190 / +0.0075 / -0.0066 / -0.0206 (N = 60). Even block 0.00107..0.00105 on the whole range, 0.00063 at 0.40. Control with true primes at 0.38: +4.101e-4. | HIT. Lead's "negative from about 0.362" is wrong: the change is in (0.370, 0.375), in the odd block. |
| J2 | L = 0.5, N = 30: x = 1.994 -2.18e-4; 1.9996 +1.304e-6; 2.0000 +1.578e-5; 2.0075 +2.579e-4; 2.0080 +4.744e-5; 2.0085 -2.86e-4; 2.0100 -1.284e-3. N = 60: 1.9996 +4.15e-7; 2.0000 +1.498e-5; 2.0075 +2.578e-4; 2.0080 +9.99e-6; 2.0085 -3.235e-4. | HIT. The seat's right end "about 2.0085" is infeasible; the right end is at 2.0080 or just below. |
| J3 | top eigenvalue of N = -arch: -0.790 (L = 0.05), -0.0728 (0.10), +0.119 (0.12), +0.668 (0.20); lowest Weil eigenvalue at 0.10: 0.4572. Toy 2x2: N_even = -9, 2c^T N^-1 c - 1 = -1.444. | HIT. Theorem A's stated equivalence fails at L = 0.10. |
| J4 | Theta_t on a 0.001 grid: best t = 0.014, -0.01836 (zeta L = 1 n = 12); t = 0.034, -0.03794 (n = 24); t = 0.057, -0.02170 (L = 0.5); Beurling t = 0.014, -0.02389. At t = 0.050: -0.04694. BE cubic: symmetric to 2e-16, |T.a - H| 7e-16, 2 positive eigenvalues per slice, worst P_k -4.138 / -6.148 / -2.215. | HIT. The seat's "best t = 0.05, -0.047" is a grid artefact; "no t works" stands. |
| J5 | zeta centre: S+H+O = Gamma_2 to 2e-14; constants / lambda_1: S 0, S+H 0.2405, S+O 0.1999, all 0.5222; edge site: 0, 0.0056, -0.2269, 0.4963; site 5: 0, 0.3002, 0.1103, 0.5269. Raw full-matrix eigenvalues: Hessian piece -0.0343 .. 3.2386, open-path piece -1.5691 (centre); -0.3740, -2.7908 (edge). Restricted to f(x) = 0 the raw minima are -0.0337 and -0.0515. Beurling centre: 0.2523, 0.2058, 0.5244. | HIT (control 0.5244 in the predicted 0.50..0.54). |
| J6 | index = 1 at: zeta 38/40, 50/80, 4/160 (histogram at 160: 4, 116, 34, 4, 2 sites with index 1..5); Beurling 32/40, 24/80, 0/160. | HIT. |
| J7 | 40 random mixed-sign H: definition vs F5 1.4e-14; vs Gamma_2 by definition 2.1e-14; |T.a - H| 2.3e-14; asymmetry 3.6e-15. Control coefficient 0.3: |T.a - H| 0.10..0.60. | HIT. |
| J8 | cone certificate: l >= 0: 0 violations of 300; some l_k < 0: 300 of 300 have a slice with two positive eigenvalues. | HIT. |
| J9 | m = 40: 0.135000, 0.281250, 0.427500 (n = 5, 8, 20) = formula; times n/(n-1): 0.16875, 0.32143, 0.45000 against the seat's bound 0.125, 0.2857, 0.4211. n = infinity: 0.525, 0.7 (m = 5), 0.6 (m = 10). Control run at m = 200 instead of 1000 (my script built a 7.6 GB list at m = 1000 and was stopped by the memory cap): 0.107000 = formula. | HIT (control size changed, stated). |
| J10 | 2c^T N_e^-1 c - 1 = 5.592234356886e-4; det(Q_e)/|det N_e| = 5.592234356884e-4; mu_1(Q_e) = 1.990533e-3, so P = 1.2089. Beurling: margin +1.137e-2 with mu_1 = -0.344 (ratio -0.141). | HIT. |
| J11 | zeta L = 1 M = 40: lambda_1 4.303094, one positive eigenvalue, gap/lambda_1 - 1 = 3.3586e-3, BE worst 0.4963 (site 0), centre 0.5222. Beurling: 4.280512, 5 positive, gap/lambda_1 0.9141, BE 0.4989. Ntilde n = 12: 5.305946, -1.811519e-3, -3.467240e-2; Beurling 5.286899, +1.995303e-2. lambda_1 at M = 20/80/160: 4.302810 / 4.304310 / 4.305238; total rates 5.1654, 5.8713, 6.5719, 7.2690. | HIT (every digit). |
| J12 | lowest Weil eigenvalue 8.2493e-30 (even), 2.228e-26 (odd). Feasible c_6 change: even block [-8.81e-12, +1.8239e-14], odd block [-1.2504e-13, +5.94e-11]; intersection [-1.2504e-13, +1.8239e-14]. Control: Beurling base has lowest eigenvalue -0.503; best over the weight at 6 is -0.434. | HIT. |
| J13 | first run (threshold 1e-8 relative, 40 digits): two quartets (0,0), (1,0), (2,2), (1,1) at L = 0.5, 1, 2, 4. MISS against "(2,2) at every L". Reason: the negative eigenvalues on small windows are far below 1e-8 of the largest one, and my threshold hid them. Second run (60 digits, threshold 1e-45): (2,2) at every L; one quartet (1,1); multiplicity 3 (1,1); control on the line (0,0). Never more than the number of quartets in either run. | first run MISS (my threshold), second run HIT |
| J14 | Hankel: arch 0 negative of 20; zeta min -1.1227, 9 of 20 negative; Beurling -1.1725. Odd margin 3.207444e-2. Calibrated constant: zeta plain 0.4963, c = lambda_1/4 only 0.4555, sup 0.7923 at (0.299, 0.210), 0.7897 of own gap; Beurling 0.4989, 0.4403, 0.7694, 0.8417 of own gap. | HIT. |

Score: 14 predictions written before computing; 13 hit at first run, 1 (J13) missed at first run for a reason in my own
test and hit on the corrected rerun. Most were reproductions of values on which seat and checker already agreed, so those
hits carry little information; the ones that settled something are J1, J2, J3, J4, J5, J6, J9.

## Literature read by me (rule 5)
- Braenden-Leake, arXiv 2304.13203v2: PDF fetched, text extracted; read page 8 (Lemma 2.8, its proof, the credit line) and
  reference [17]. Nothing else.
- Suzuki, arXiv 2606.09096v3: PDF fetched, text extracted; read the introduction lines on Yoshida and Bombieri (pp. 2-3),
  Theorem 1.1, Corollary 1.2, the remark after Theorem 1.3, Theorem 1.4, and the domain remark on p. 14 (about 5% of the text).
  Searched the whole text for "negative square", "Pontryagin", "monoton": no hits.
- One web search (query in JUDGEMENT.md section 6), result summaries only.

J15 (written about 00:07 UTC 11-11 by the system clock, before computing) Bakry-Emery constant / lambda_1 under refinement,
   zeta L = 1, my box matrix. Predict M = 160: centre 0.4965, worst (edge) 0.4415 (the common values of seat and checker);
   M = 320 (nobody has computed it): centre in (0.488, 0.494), worst in (0.425, 0.433), i.e. the centre value is below
   1/2 and still falling. Control: Beurling M = 160 worst 0.4435 (checker's value).

J15 result (j15.log, j15b.log): centre 0.5061 (M = 80), 0.4965 (160), 0.4908 (320). Global minimum over sites: 0.4415 at
site 4 (M = 160), 0.4302 at site 9 (M = 320; sites 0..39 searched); the edge site itself gives 0.4483 and 0.4405.
Beurling M = 160: minimum 0.4435 at site 4, centre 0.4959. Values HIT (M = 320 inside both predicted ranges).
MISS on one word: I wrote "worst (edge)"; from M = 160 on the worst site is not the edge box but the box containing
x = -0.944 (M = 160) and x = -0.941 (M = 320). OBSERVATION (COMPUTED, two refinements; the identification is HEURISTIC):
that is x = log 7 - L = -0.9459 up to one box, the point from which the largest jump in the window (log 7 < 2L) just
reaches the far edge. Final score: 15 predictions, 13 clean hits, J13 missed at first run (my threshold) and hit on the
rerun, J15 hit on values and missed on the location of the worst site.

## Session 2 of this seat (the first session stopped at 00:08 before JUDGEMENT.md was written; its logs were re-read and spot-checked: j1_J1, j1_J2, j1_J3, j12, j13, j13b, j15b all match the table above)
In this session I re-read all six PROOF files line by line and redid every displayed computation by hand (notes in JUDGEMENT.md).

J16 (written 00:18:21 UTC by the system clock, command-written, before computing). The lead's fourth row in e10 test_a.log
   (zeta L = 1.25, N = 56: one positive eigenvalue of N = primes - arch, largest 5.66836, second -2.451e-47, third -3.773e-44)
   was not redone by seat or checker. I redo it with the seat's implementation B (wb.py.txt: mpmath, digamma formula; independent
   of the lead's Arb builder), 110 digits. Predict: 'int' lattice N = 56 (same subspace as the lead): #pos = 1, largest 5.66836,
   second -2.451e-47, third -3.773e-44 to the printed digits. 'half' lattice N = 56 (a different subspace): #pos = 1, second
   within a factor 0.7..1.4 of -2.45e-47. Control Beurling (2 -> 2.1), int lattice: between 5 and 12 positive eigenvalues,
   second eigenvalue of order +0.3..+1.

J16 result (j16_int.log, j16_half.log, j16_b.log; 5 s each, 110 digits, implementation B = r2_parity/wb.py.txt, written 00:22:25 UTC):
   int lattice N = 56: #pos = 1, largest 5.668358, second -2.4514e-47 (even block), third -3.7731e-44 (top of the odd block). HIT, digit for digit.
   half lattice N = 56: #pos = 1, largest 5.644365, second -2.6099e-47 (factor 1.065). HIT.
   Control Beurling (2 -> 2.1): 9 positive eigenvalues, top three 5.6334, 0.9099, 0.8679. HIT (predicted 5..12 and +0.3..+1).
   So the lead's fourth row is reproduced by a second implementation. Final score of this seat: 16 predictions written before
   computing, 14 clean hits, J13 missed at first run (my threshold) and hit on the rerun, J15 hit on values and missed on location.

Literature, session 2 (rule 5):
- Re-read with my own eyes in the text extracted by session 1: Braenden-Leake arXiv 2304.13203v2, Lemma 2.8 with its proof and
  credit line (about 50 lines); Suzuki arXiv 2606.09096v3, lines on Yoshida Prop. 1 / Thm 2 / Bombieri (p. 2), Theorem 1.1,
  the text around (1.7), Corollary 1.2, Theorem 1.3 and the paragraph after it (about 80 lines of about 2100).
- Three web searches (one refused: weekly search limit): queries in JUDGEMENT.md section 6. Result summaries only.
- One document opened from a search hit: "How the two-thirds argument was found: two agent runs and their literature"
  (PDF on www-cdn.anthropic.com, hash d7f3ecf1...; its own first page says the mathematics in it is not independently verified).
  Read about 150 of about 5400 text lines: the passages around its "Theorem 1 (global signature)" and its statements about Bombieri 2000.
