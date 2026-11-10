<!-- local-idea-log owner=R1-B -->
# Local idea log of R1-B

Private working log of agent `R1-B`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R1-B/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · B-1 Semilocal Nyman-Beurling: filter by primes, not by size
- status: open
- source: R1-B (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: The usual recipe mixes the first N sawtooth waves frac(1/(kx)), k = 1..N, and the error shrinks painfully slowly, like 0.046/log N. Instead allow only waves whose k is built from a few small primes, but as many of those as we like. Example: with primes 2 and 3 only (k = 1, 2, 3, 4, 6, 8, 9, 12, ...) the error settles at exactly 0.04996, better than using every k up to 4. With 2, 3, 5 it settles near 0.0289; with 2, 3, 5, 7 below 0.0184 (as good as every k up to 15, although 11 and 13 are missing). RH says these numbers go to zero as primes are added. The slow 1/log N law is a proven floor for the first-N recipe; no such floor is known for the prime-by-prime recipe, and the numbers hint it falls faster.
- claim: D_P^2 * log P -> 0; precisely L(P,u) = D_P(P^u)^2/d_{P^u}^2 -> 1 as P -> infinity for each fixed u (CONJECTURE B1).
- first test: Converge D_P for P = 7, 11, 13 (needs Gram entries for smooth k up to ~1e7; O(k) per entry, parallel), extend L(P,2) to P ~ 200 (needs G up to N = 40000); compute the exact Szego/Wiener-Hopf value for S = {2} and compare with 0.1247227.
- kill line: If D_P^2 log P levels off at a positive constant for N-converged values up to P = 31, or L(P,2) stops decreasing above 1.1 by P = 200, the 'beats the floor' claim is dead (the object stays a valid reformulation).
- novelty: One web search for Nyman-Beurling restricted to smooth numbers / a prime-generated semigroup found nothing. Also checked: Bettin-Conrey-Farmer arXiv:1211.5191, Balazard-de Roton, Darses-Hillion arXiv:1805.06733, Baez-Duarte arXiv:math/0505453.
- evidence: COMPUTED (Step 4): D_S(N)^2 at N = 2000: S={2} 0.1247227 (converged ~6 digits); {2,3} 0.04996061 (limit 0.04996047, N=1.0e6, 7 digits); {2,3,5} 0.02900279 (0.02889735 at N=2.56e5, not converged); {2,3,5,7} 0.01874684 (0.01833983 at N=6.4e4, not converged). Loss factor L(P,2) for P = 5,7,11,...,43: 1.92, 1.70, 1.66, 1.49, 1.46, 1.36, 1.31, 1.31, 1.26, 1.25, 1.22, 1.20, decreasing monotonically in P. Agent's caveat: four converged-or-nearly-converged values (P = 2,3,5,7) cannot separate c/log P from P^{-a}. Heuristic mechanism unproved (errors adding orthogonally gives ~1/P, coherently gives no saving).
- log:
  - 2026-11-10: audit: not promoted: merged into main #14

## #2 · B-2 The explicit recipe misses by 3.55/log^2 N; find the recipe with no second-order term
- status: open
- source: R1-B (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: Everyone uses the recipe 'Moebius sign times a straight-line fade-out'. At N = 2000 its error is 0.067, eleven times the best possible 0.0061. The gap follows a clean law: best = 0.046/log N, textbook = 0.046/log N + 3.55/log^2 N. Replacing the straight line by a cubic curve (4 numbers) closes most of the gap: 0.0072. So the shape of the best recipe is simple; it is just not the straight line.
- claim: There is an explicit curve P* (and a short boundary correction at k ~ N) with Q[-mu(k) P*(log k/log N)] = C/log N + o(1/log^2 N), and its coefficients are stable in N.
- first test: Fit the degree-3 and degree-5 optimal polynomials at N = 250, 500, 1000, 2000 and check the coefficients converge; derive A[P] (the 1/log^2 N coefficient as a functional of P) from Vasyunin's formula and minimise it.
- kill line: If the fitted polynomial coefficients drift by more than 10% per doubling of N, there is no limiting shape.
- evidence: COMPUTED (Step 3, float64, cond(G_2000) = 1.5e7, no Arb cross-check): Q[V_N] = C/log N + A/log^2 N with A = 3.55 +- 0.02 over 50 <= N <= 2000 (C = 0.0461914179); at N = 2000 the textbook recipe is 11x worse than the optimum (0.0674 vs 0.0061). Cubic polynomial in log k/log N times mu(k) (4 numbers) is within 18% of the optimum (times log N: 0.0546 vs 0.0465); linear recipe 0.204.
- log:
  - 2026-11-10: audit: not promoted: merged into main #5

## #3 · B-3 Zoomed control-group test with Dirichlet-polynomial targets
- status: open
- source: R1-B (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: The impostor function has a bad zero at height about 86, but the standard test looks at the whole line through a lens that dims everything above height 1, so the bad zero costs only 0.00017 and would show only for N beyond e^300. We want a magnifying glass placed at height 86. The obvious one (twist the target) provably fails (error stuck at 0.42). A target built from a few step functions chi(0,1/j) can do it.
- claim: For target B(s)/s, B a Dirichlet polynomial peaked at height T, d_N^2 log N -> sum_rho |B(rho)|^2/|rho|^2 for zeta, while for Davenport-Heilbronn with T = 85.7 the distance stops decreasing at N of a few hundred.
- first test: Gram matrix for the DH step function (5-periodic; closed form with digamma sums) to N = 500; B of length 30.
- kill line: If no B of length <= 100 makes the DH floor exceed its on-line part by N = 2000, the lab is dropped for lane B.
- evidence: PROVED lemma (Step 5): an off-line zero rho0 forces ||chi - sum c_k e_k||^2 >= (2beta-1)/(|rho0|^2(1 + (2beta-1)/|rho0-1|^2)); for DH (zero near 0.8085+85.699i) floor ~1.7e-4 (HEURISTIC estimate, DH zero from memory). COMPUTED negative: the twisted-target zoom x^{-iT} chi fails, d_N(T)^2 = 0.439, 0.422, 0.416 at N = 100, 500, 2000 for T = 5 (0.97 for T = 85.7); proved reason: on (1/2,1) every e_k equals a/x + b.
- log:
  - 2026-11-10: audit: not promoted: merged into main #1

## #4 · B-4 Heat flow: use the imaginary-part energy, the one functional defined when zeros are off the line
- status: open
- source: R1-B (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: Beads on a wire repel; a bead pair that is off the wire falls onto it. The sum of squared heights of the off-wire beads can only go down, and it goes down at least 4 units of 'height squared' per unit time for every off-wire pair. Example: one pair at height 0.3 lands after time 0.3^2/2 = 0.045. So 'total time spent off the wire' is at most a quarter of the starting sum of squared heights, a quantity about zeta itself at t = 0.
- claim: For H_t restricted to a height window with a smooth weight w, Y_w(t) = sum w(x_k) y_k^2 obeys dY_w/dt <= -4 #pairs_w + (boundary flux), and the real zeros add dissipation ~ 2 pi y * (density) per pair.
- first test: Verify the identity numerically on degree-50 polynomials with planted non-real pairs; then on the Davenport-Heilbronn function near height 85.7 (predict the landing time of its off-line pair).
- kill line: If the boundary flux is not controllable (same size as the main term for windows of length log T), park.
- evidence: PROVED for finite systems (polynomials under the same flow, simple zeros): d/dt sum_k y_k^2 = -4 sum_{j<k} (y_j - y_k)^2/|z_j - z_k|^2 <= -4 * #(conjugate non-real pairs); known in spirit (de Bruijn 1950). COMPUTED (Step 6): the 40-zero window functionals are all monotone in the direction that does not help (min gap 1.690 -> 2.445, sum 1/gap^2 2.210 -> 1.857 for t in [0, 0.5]); forward in t the gas relaxes (Rodgers-Tao, from memory).
- log:
  - 2026-11-10: audit: not promoted: merged into main #4
