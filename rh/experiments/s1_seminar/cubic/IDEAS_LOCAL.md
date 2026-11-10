<!-- local-idea-log owner=S1-cubic -->
# Local idea log of S1-cubic

Private working log of agent `S1-cubic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `S1-cubic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Pair obstruction (E'): a pair of boxes with no third box forces G = HDH - H >= (a_i/s_i) v_i v_i^T + (a_j/s_j) v_j v_j^T; a one-parameter convex test, no SDP
- status: open
- source: S1-cubic
- date: 2026-11-10
- plain english: A certificate lists a number for every three scales. Question: can two scales do without any third one? Answer: never, for any of the pairs tried. Example: 6 boxes on the window of half-width 1; remove all triples containing boxes 2 and 3 (neighbours in the middle): the search fails by 1.21; remove those containing boxes 0 and 5 (the two ends): fails by 1.43. The ends are not special.
- claim: PROVED (TURN1.md 3b). COMPUTED: fails for every pair (15/15, 28/28, 120/120) on zeta L=1 n=6,8,16, zeta and Beurling L=0.5 n=8. So every coupled pair needs a third box; R*=n-1 was not a statement about the window ends.
- log:

## #2 · Direction: the mirror squares enter the Weil form with a MINUS sign. Q = pole + E_w + (theta(e^2L) - c_inf)|f|^2 - sum_p log p q_p(f), q_p = Poisson-kernel form >= (1-r)/(1+r)|f|^2
- status: open
- source: S1-cubic
- date: 2026-11-10
- plain english: The mirror test shows that each prime contributes a positive amount. But in Weil's inequality those positive amounts are SUBTRACTED: the inequality says the primes together are not too big. Example on the window of half-width 1: the primes 2, 3, 5, 7 together contribute 6.4132, and what they are subtracted from is 6.4170; the difference 0.0037 is all that is left.
- claim: PROVED identity (TURN1.md 2). The one-variable mirror theorem gives LOWER bounds on q_p; Weil positivity is an UPPER bound on sum log p q_p. On the lowest eigenvector (L=1, 24 boxes) q_p(f) = 1.964, 1.317, 1.030, 1.000 for p=2,3,5,7.
- log:

## #3 · Mirror form of the fibre-extended matrix: the pole fibre completes the m=0 note of the Gamma kernel to a square. Hankel(Ntilde)(phi,alpha) = primes_H(phi) + sum_{m>=1}(int phi e^{-(2m+1/2)x})^2 + (alpha + int phi e^{-x/2})^2
- status: open
- source: S1-cubic
- date: 2026-11-10
- claim: PROVED (TURN1.md M1), COMPUTED: PSD to 5e-18 without primes with F1 on the positive side; -0.53 with F2. So with the pole included the no-prime system is mirror positive in the continuum, yet its Weil form is negative from L = 0.38.
- log:

## #4 · Reweighting test for any mirror bridge: mirror positivity is a cone (c_p >= 0 per prime), window positivity pins the weights; the hypothesis of a bridge must break at c_2 = 1.03, at c_2 = 0 and for the no-prime system
- status: open
- source: S1-cubic
- date: 2026-11-10
- claim: COMPUTED (TURN1.md M2, M3): L=1, 48 boxes, lowest eigenvalue of Q: c_2 = 0.97: -7.8e-3; 1.00: +1.2e-3; 1.03: -2.2e-2.
- log:

## #5 · OPEN: 'no two close' locality. Zeroing the distinct triples with min gap > r: n=12 r=4 harmless (margin unchanged), r=3 infeasible -0.21; n=8 r=2 already infeasible -0.17. Which triples of pairwise far scales are forced, and is it the cone certificate's sign change (rho = 1.0005 at n=12) that makes the 4 extreme ones dispensable?
- status: open
- source: S1-cubic
- date: 2026-11-10
- log:

## #6 · QUESTION to self: the factor 2 has two descriptions (mine: Bakry-Emery pieces are a non-trivial decomposition of ZERO at mean field; R2-curv B3: the deficit sits in the open-path window-edge term). Same term or two? The resampling chain has no edge.
- status: open
- source: S1-cubic
- date: 2026-11-10
- log:
