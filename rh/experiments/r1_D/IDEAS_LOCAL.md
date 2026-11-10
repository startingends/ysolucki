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

## #2 · D2 Pencil lab
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Off-line zeros of every member of the pencil Z_1 + lam Z_2 are counted by critical values of rho = -Z_1/Z_2.
- first test: Done up to 200 (4/4).
- kill line: Killed if a known off-line zero is not matched by a critical value.
- evidence: COMPUTED (section 2, `python3 pencil.py.txt 200 0.01`): lam_DH = 1.000000000000000 (Davenport-Heilbronn = Z_1 + Z_2); critical points of rho with value between 0 and 1 at t_c = 85.89903, 114.33826, 166.50471, 176.96664, predicting 4 off-line pairs below 200, matching lane A's known 0.808517+85.699348i, 0.650830+114.163343i, 0.574356+166.479306i, 0.724258+176.702461i (4/4). Interlacing fails in 65 of 258 gaps.
- log:

## #3 · D3 Shape of Phi cannot be the mechanism
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Shape of Phi cannot be the mechanism.
- first test: Tested, DH shares all.
- kill line: This is itself a kill.
- evidence: COMPUTED (section 3, `python3 kernel.py.txt`): on the grid u = 0.02..1.98 both Phi_zeta and Phi_DH are positive, log-concave and satisfy the Csordas-Varga condition; Turan inequalities hold for m = 1..40 for both (ratio at m = 40: 1.01098 zeta, 1.01430 DH). Conclusion in file: none of the pointwise shape properties tested separates zeta from a function with zeros off the line; kills the family 'RH from positivity + log-concavity type properties of Phi'.
- log:

## #4 · D4 Threshold law in the pencil
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: lam_plus(T), lam_minus(T) -> 0 like a power of the zero count.
- first test: Fit on T = 4000.
- kill line: Killed if the thresholds stop decreasing.
- evidence: COMPUTED so far (section 2): first off-line zero on the negative side appears at lam = -0.027 below height 200, -0.074 below 100, -0.109 below 50; member Z_1 + 0.17 Z_2 already has an off-line pair below 200. Section 2b (T = 1000 / 4000 runs) was never filled in: the file says '(see end of file)' and nothing is there.
- log:

## #5 · D5 Totally positive density from Moebius
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: The inverse Laplace transform g of xi(1/2)/xi(1/2+sqrt w), computed on Re w = c > 1/4 from the Dirichlet series of 1/zeta only, is PF_infinity iff RH.
- first test: Compute PF_2, PF_3 minors for zeta and DH.
- kill line: Killed if no minor up to order 6 separates DH from zeta.
- log:

## #6 · D6 Carry deformation
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: Z_tau(s) = sum_n (2^{floor(log2 n)})^{-(1-tau)s} n^{-tau s} joins the zeta function of F_2[T] (tau = 0, no zeros) to zeta (tau = 1).
- first test: Track the zeros in tau.
- kill line: Killed if the zeros do not arrive along identifiable curves or no monotone quantity appears.
- log:

## #7 · D7 Discrepancy formulation
- status: open
- source: R1-D (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- claim: The deletion cost is a discrepancy lower bound on homogeneous progressions.
- first test: Integer programme for S at X <= 1e5.
- kill line: Killed if the optimum stays bounded as X grows.
- log:
