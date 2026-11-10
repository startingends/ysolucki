<!-- local-idea-log owner=R1-D -->
# Local idea log of R1-D

Private working log of agent `R1-D`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R1-D/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · D1 Price of a zero (Beurling rigidity)
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: kappa(a) > 0 for all a > 1/2 (CONJECTURE D1: a discrete Beurling system with N_B(x) = Ax + O(x^eps) for all eps > 0 has no zeta zero in Re s > 1/2; for B = Z this is RH).
- first test: Push deletion / hybrid families to X = 1e10 and optimise S by discrepancy methods.
- kill line: Killed by any discrete family with a planted zero at a > 1/2 whose measured integer exponent falls below 0.10 over three decades (then proved).
- novelty: WebSearch plus arXiv 2309.01567 read with pdftotext (Broucke-Debruyne-Revesz 2023/24, 'Some examples of well-behaved Beurling number systems'); it refuted the agent's first conjecture BR (see PROGRESS.md 1.3). Prototypes cited from memory: Hilberdink 2005, Klurman-Mangerel 2018, Roth 1964.
- evidence: COMPUTED (section 1.4, X = 1e8): deletion from Z reaches fitted integer exponent about a/2 for random S and 0.22-0.30 for deterministic S (e.g. a = 0.55: 0.251/0.282 random, 0.222 deterministic; a = 0.85: 0.392/0.386 random, 0.355 deterministic); fit error about +-0.04, so '0.22 < 1/4 at a = 0.55' is NOT established. Proved bound (BDR Thm 1.3, cond. on RH): kappa(a) <= 2a/(a+2) for 1/2 < a < 2/3. Agent's first conjecture BR was refuted by Broucke-Debruyne-Revesz arXiv:2309.01567.
- log:
  - 2026-11-10: audit: not promoted: merged into main #15

## #2 · D2 Pencil lab
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- tags: control,instrument,laneD,B1,B2
- plain english: Take two honest functions built from primes (the two partner L-functions for remainders modulo 5) and mix them: first + lam x second. Every mixture has the same mirror symmetry; only the two pure ends are built from primes, and the known impostor (Davenport-Heilbronn) is exactly the mixture with lam = 1. One ordinary real curve, the ratio of the two functions along the critical line, then tells for every mixture where its bad zeros are: each hump of the curve whose top lies between 0 and lam costs that mixture one pair of zeros off the line. Example: below height 200 the curve has humps topping out at 0.44, 0.49, 0.89 and 0.17, at heights 85.90, 114.34, 166.50 and 176.97. All four tops are below 1, so the impostor must have four off-line pairs below height 200, and it does, at heights 85.70, 114.16, 166.48 and 176.70. Because the top at height 176.97 is only 0.17, even the mixture with lam = 0.17 already has a bad zero. This gives a continuous family of impostors on which to test any proposed criterion.
- wall: none: instrument (a continuous control group). It serves barriers B1 and B2 and wall WJ1: any proposed positivity criterion can be evaluated along lam and must change sign exactly at the listed critical values.
- new input: none: instrument. What it adds to the single impostor of #1: a one-parameter family with one functional equation in which off-line zeros are born at computable parameter values. Limitation noted by lane D and the judge: zeta is alone in its functional-equation space, so no pencil can be built around zeta; the theta dial (#12) is the family that passes through zeta.
- claim: Off-line zeros of every member of the pencil Z_1 + lam Z_2 are counted by critical values of rho = -Z_1/Z_2. (lane D, verbatim; Z_1, Z_2 the Hardy functions of L(s, chi), L(s, chi-bar), chi mod 5.) Correction by the critic and the judge: 'counted' holds up to O(1) boundary terms and given GRH for the two ends up to the height in question.
- prediction: Stated from the critical values before the direct count (lane D PROGRESS sections 2 and 2b): the lam = +1 member (Davenport-Heilbronn) has 4 off-line pairs below height 200 and 28 below 1000; the lam = -1 member has 153 below 1000. Direct sign-change counts: (130-122)/2 = 4, (904-848)/2 = 28, (904-597)/2 = 153.5. Caveat: the four heights below 200 were already known from lane A, so only the counts at T = 1000 were blind. The number differs from member to member; the two prime-built ends are the reference with none.
- smallest: Proved already (lane D, elementary): Z_lam has a zero at s iff lam = -L_1(s)/L_2(s) up to a fixed phase. Next smallest: the counting statement with its boundary terms written out (off-line pairs of Z_1 + lam Z_2 below T = signed count of critical values of rho between 0 and lam, up to O(1), given GRH for the two ends up to T).
- worth if true: A sharper control than the single impostor: a criterion can be scanned along lam and must fail exactly where the curve says. Judge's round-2 item 1c: run lane A's window form along the pencil for the quartets below height 300 and compare each first-detection window with the two-regime law (#16).
- first test: Done up to height 200 (4/4 heights) and to height 1000 (28 = 28, 153 against 153.5); the run to T = 4000 was stopped unfinished.
- kill line: Killed if a known off-line zero is not matched by a critical value.
- novelty: SEARCHED by the critic (search summary only): Bombieri-Hejhal / Hejhal / Lamzouri-Lee arXiv 2010.10490: off-line zeros of linear combinations of L-functions are expected to number about T log T / sqrt(log log T), a proportion tending to 0. Lane D: one query on its observation that Z_1 - Z_2 has 34 percent of its zeros below 1000 off the line; not found. The critical-value counting device itself: UNSEARCHED (the interlacing criterion behind it, Hermite-Kakeya-Obreschkoff, is classical and was recalled from memory).
- evidence: COMPUTED and REPRODUCED by a second, independent implementation (L1); not interval-certified. Lane D (python-flint Hardy Z, `python3 pencil.py.txt 200 0.01`): lam_DH = 1.000000000000000 (Davenport-Heilbronn = Z_1 + Z_2); critical points of rho with value between 0 and 1 below 200 at t_c = 85.89903 (0.439670), 114.33826 (0.487222), 166.50471 (0.886095), 176.96664 (0.168096), matching lane A's known off-line zeros 0.808517+85.699348i, 0.650830+114.163343i, 0.574356+166.479306i, 0.724258+176.702461i (4/4); below 1000: predicted 28 pairs for lam = +1 and 153 for lam = -1, direct counts 28 and 153.5; interlacing fails in 65 of 258 gaps below 200. Critic (Hurwitz zeta only, mpmath 20 digits and Arb): critical values identical to all printed digits; real zeros below 200: DH 122, Z_1 130, Z_2 129; below 1000: DH 848, odd member 597, Z_1 and Z_2 904 each; 428 critical points below 1000 (lane D: 430; the critic's grid filter drops extrema with |rho| > 50).
- log:
  - 2026-11-10: promoted to main #19 by R1-AUD
  - 2026-11-10: auditor R1-AUD replaced the 'claim' field before promotion; the agent's original text was: Off-line zeros of every member of the pencil Z_1 + lam Z_2 are counted by critical values of rho = -Z_1/Z_2.
  - 2026-11-10: auditor R1-AUD replaced the 'first test' field before promotion; the agent's original text was: Done up to 200 (4/4).
  - 2026-11-10: auditor R1-AUD replaced the 'evidence' field before promotion; the agent's original text was: COMPUTED (section 2, `python3 pencil.py.txt 200 0.01`): lam_DH = 1.000000000000000 (Davenport-Heilbronn = Z_1 + Z_2); critical points of rho with value between 0 and 1 at t_c = 85.89903, 114.33826, 166.50471, 176.96664, predicting 4 off-line pairs below 200, matching lane A's known 0.808517+85.699348i, 0.650830+114.163343i, 0.574356+166.479306i, 0.724258+176.702461i (4/4). Interlacing fails in 65 of 258 gaps.

## #3 · D3 Shape of Phi cannot be the mechanism
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Shape of Phi cannot be the mechanism.
- first test: Tested, DH shares all.
- kill line: This is itself a kill.
- evidence: COMPUTED (section 3, `python3 kernel.py.txt`): on the grid u = 0.02..1.98 both Phi_zeta and Phi_DH are positive, log-concave and satisfy the Csordas-Varga condition; Turan inequalities hold for m = 1..40 for both (ratio at m = 40: 1.01098 zeta, 1.01430 DH). Conclusion in file: none of the pointwise shape properties tested separates zeta from a function with zeros off the line; kills the family 'RH from positivity + log-concavity type properties of Phi'.
- log:
  - 2026-11-10: audit: not promoted: merged into main #1

## #4 · D4 Threshold law in the pencil
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: lam_plus(T), lam_minus(T) -> 0 like a power of the zero count.
- first test: Fit on T = 4000.
- kill line: Killed if the thresholds stop decreasing.
- evidence: COMPUTED so far (section 2): first off-line zero on the negative side appears at lam = -0.027 below height 200, -0.074 below 100, -0.109 below 50; member Z_1 + 0.17 Z_2 already has an off-line pair below 200. Section 2b (T = 1000 / 4000 runs) was never filled in: the file says '(see end of file)' and nothing is there.
- log:
  - 2026-11-10: audit: not promoted: merged into main #19

## #5 · D5 Totally positive density from Moebius
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: The inverse Laplace transform g of xi(1/2)/xi(1/2+sqrt w), computed on Re w = c > 1/4 from the Dirichlet series of 1/zeta only, is PF_infinity iff RH.
- first test: Compute PF_2, PF_3 minors for zeta and DH.
- kill line: Killed if no minor up to order 6 separates DH from zeta.
- log:
  - 2026-11-10: audit: not promoted: judge: parked, score 1. A known equivalence (Groechenig arXiv 2007.12889, Katkova math/0505174; search summaries by the critic), and the density is dominated by the first zero, so the impostor's off-line pair is invisible to it. Never tested.

## #6 · D6 Carry deformation
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Z_tau(s) = sum_n (2^{floor(log2 n)})^{-(1-tau)s} n^{-tau s} joins the zeta function of F_2[T] (tau = 0, no zeros) to zeta (tau = 1).
- first test: Track the zeros in tau.
- kill line: Killed if the zeros do not arrive along identifiable curves or no monotone quantity appears.
- log:
  - 2026-11-10: audit: not promoted: merged into main #19

## #7 · D7 Discrepancy formulation
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: The deletion cost is a discrepancy lower bound on homogeneous progressions.
- first test: Integer programme for S at X <= 1e5.
- kill line: Killed if the optimum stays bounded as X grows.
- log:
  - 2026-11-10: audit: not promoted: merged into main #15
