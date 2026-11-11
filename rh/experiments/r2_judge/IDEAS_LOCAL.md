<!-- local-idea-log owner=R2-judge -->
# Local idea log of R2-judge

Private working log of agent `R2-judge`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-judge/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Feasible interval of the weight at 6 (L=1): upper end is set by the even block, lower end by the odd block
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j12.log: even block [-8.81e-12, 1.824e-14], odd block [-1.250e-13, 5.94e-11]; intersection [-1.2504e-13, 1.8239e-14]
- log:

## #2 · Lead's 0.362 for the background sign change is an interpolation across two parity blocks; the odd block crosses near 0.372
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j1_J1.log: odd +0.0103/+0.0075 at 0.370 (N=30/60), -0.0039/-0.0066 at 0.375; even block 0.00106 throughout. 1/N extrapolation at 0.370 gives +0.0047 (HEURISTIC)
- log:

## #3 · Process: typed clock stamps ran ahead of the system clock for at least three agents (me included); certify prediction order with a command-written time or a git snapshot, not typed times
- status: open
- source: R2-judge
- date: 2026-11-11
- log:

## #4 · Raw eigenvalues of the three Bochner pieces depend on the normalisation (full matrix -1.569, restricted to f(x)=0: -0.052); only Gamma-normalised constants are canonical
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j3_J5.log, j5b.log
- log:

## #5 · Two seats proved the same factor-2 lemma independently: curv Theorem C2 (lambda/2)(1+2 min pi) = cubic's 1/2 + 1/m; CD(rho,n) constant is 1/2 - 2/n + (1+2/n)/m
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: PROVED by hand in JUDGEMENT.md section 2; COMPUTED j2.log
- log:

## #6 · Suzuki 2606.09096 p.2 and p.5 (read in PDF text): Yoshida 1992 Prop. 1 = one parity block suffices; Yoshida Thm 2 = RH iff non-degeneracy on every window (the first-failure template's existence half)
- status: open
- source: R2-judge
- date: 2026-11-11
- log:

## #7 · Observation: under refinement the worst Bakry-Emery site is not the edge box but the box at x = log 7 - L (-0.946 at L = 1)
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j15b.log: minimum at site 4 of 160 (x=-0.944) and site 9 of 320 (x=-0.941); identification with log 7 - L is HEURISTIC (two data points, zeta and Beurling alike)
- log:

## #8 · Toy check of the negative-index count: negative eigenvalues on small windows are below 1e-8 of the top eigenvalue; any count with a coarse threshold undercounts
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j13.log vs j13b.log: (0,0),(1,0),(2,2),(1,1) at threshold 1e-8 against (2,2) at every L at threshold 1e-45
- log:

## #9 · The global count kappa = number of distinct zeros with Re > 1/2 (seat parity Theorem 4, total count) is printed, with the same hyperbolic-pair proof, in an unrefereed Anthropic-hosted account of an agent run; it credits Bombieri 2000 with the upper-bound half for large truncations. Per-parity-block count not found there (no parity hits in the text)
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: READ: about 150 of 5400 lines of the PDF text; primary Bombieri 2000 still not opened by anyone in the project
- log:

## #10 · Lead's e10 row L=1.25 (one positive eigenvalue, second -2.451e-47) reproduced by implementation B; in the half lattice -2.610e-47; Beurling control has 9 positive eigenvalues there
- status: open
- source: R2-judge
- date: 2026-11-11
- claim: COMPUTED j16_int.log, j16_half.log, j16_b.log
- log:

## #11 · Process: the committed snapshot 1e3f60a (22:47:54) is the only hard evidence of prediction order; it holds curv's 22:38/22:44/22:47 prediction blocks with no result sections, and cubic's P1-P7. Suggest the lead snapshot PROGRESS.md by command right after each prediction block
- status: open
- source: R2-judge
- date: 2026-11-11
- log:
