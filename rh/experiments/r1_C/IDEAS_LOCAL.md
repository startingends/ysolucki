<!-- local-idea-log owner=R1-C -->
# Local idea log of R1-C

Private working log of agent `R1-C`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R1-C/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · C1 Fejer-window test
- status: open
- source: R1-C (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: Add up one cosine wave per prime power, quieter for bigger primes, faded out linearly up to a cutoff X. RH says this sum never rises above an explicit smooth ceiling. Example: with cutoff 50 the gap to the ceiling at t = 0 is 0.0206, and it is 3.95 at the first zero t = 14.135. For the impostor the sum breaks through the ceiling once X reaches 70.
- claim: RH <=> S_X(t) >= 0 for all t, X (Lemma F, PROVED short; critic please check). Claim to test: min_t S_X(t) log X stays in (0, 0.185] for zeta for all X <= 1e8, and for every degree-1 impostor the first failure X* satisfies log X* <= 1.3 * 2 L* (lane A's window).
- first test: Rerun with interval arithmetic for X <= 1e4; three more impostors (mod 5 second function, mod 7, mod 11).
- kill line: An impostor whose X* is more than 10 times lane A's e^{2L*} (then the cheap test is not a usable detector).
- novelty: WebSearch 2026-11-10, one query: Fejer/triangle test functions in Weil's criterion; only general Weil-positivity sources (Burnol math/9809119, math/0101068). No hit for Lemma F as stated; short corollary of Weil 1952, so 'variant of known'.
- evidence: COMPUTED (E3): prime side validated against 20000 zeros to 8 digits. For zeta, min_t S_X(t) = +0.033377 (X=10), +0.014718 (100), +0.010570 (1e3), +0.008703 (1e4), +0.007019 (1e5), +0.005356 (1e6), never negative, min*log X ~ 0.075. DH control: min_t S_X = +0.195, +0.139, +0.090, +0.085, +0.091 for X = 5, 10, 20, 30, 50, then -0.132 (X=70, at t=84.455), -0.421 (100), ... -4.785 (3000); fails at X* in (50, 70], vs lane A's e^{2L*} in (30, 31.2].
- log:

## #2 · C2 Prime-side Pick pencil and the negative-square count
- status: open
- source: R1-C (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: From measurements taken safely to the right, where the prime formula converges, build a table of numbers. If all zeros are on the line the table is 'positive' (like a table of distances that could come from real points). Each zero off the line produces exactly one 'impossible' direction. Example: 48 measurements for the impostor give one negative number, -5.3e-6, and return the offending zero 0.808517182457 + 85.699348485 i to 12 digits.
- claim: For nodes on Re s = 1.25, t in [T-15, T+15], spacing <= 0.65, the number of negative eigenvalues of A equals the number of off-line zero pairs with ordinate in [T-8, T+8], for zeta (always 0) and for DH-type functions.
- first test: Slide the window over DH up to height 200 (off-line zeros at 85.70, 114.16, 166.48, 176.70) and over zeta at heights 1e3, 1e4.
- kill line: A window containing an off-line DH zero with A PSD at spacing 0.3, or a negative eigenvalue for zeta above the rounding level.
- evidence: COMPUTED (E2): zeta, A PSD in every run (N = 12, 24, 36; min eig 2.8e-7, 1.8e-17, 2.1e-41); N=36 first 20 Ritz values <= 4.1e-8. DH with 48 local nodes in [70,100]: exactly one negative eigenvalue (-5.3e-6) and one non-real Ritz pair at 85.6993484854 -+ 0.308517182457 i = the off-line zero to 12 digits. With 64 global nodes the impostor PASSES (A PSD) until the nodes resolve height 85. Truncating primes (<= 1e5) at sigma0 = 2.5 gives a negative eigenvalue -6.6e-12 for zeta. Arb eigen-solver failed (nan) at N=48 / N=110 global; not repaired. Number of negative squares as invariant is HEURISTIC as a general statement.
- log:

## #3 · C3 Shadow pairs
- status: open
- source: R1-C (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: Draw the wave built from the first primes and mark where it crosses zero. For zeta each crossing settles on a true zero. For the impostor two crossings appear where there is no zero on the line at all, at 85.26 and 86.11, and creep toward each other (85.57 and 85.82 with primes up to 3000): the picture is trying to show a zero that sits off the line.
- claim: In the real-rooted Euler family F_X, an off-line pair at height T with offset b appears as two real zeros whose gap is ~ c(b)/log X -> 0, while a genuine close pair of on-line zeros keeps a fixed gap; so 'RH and simple zeros <=> no pair of zeros of F_X closes up as X -> infinity'.
- first test: Gap * log X for the DH pairs at 85.70 and 114.16 for X up to 1e5 against the closest zeta pair below 1e4 (a Lehmer-type pair).
- kill line: Gap law for DH not monotone, or a zeta pair whose gap in F_X keeps shrinking through X = 1e6.
- evidence: COMPUTED (E1): zeta, F_X recovers all 20 zeros below height 78.2 for every X from 3 up, max error of the first 20 = 0.692, 0.170, 0.080, 0.060, 0.0239, 0.0155, 0.0089, 0.0069 for X = 3, 10, 30, 100, 1e3, 1e4, 1e5, 1e6 (~1.2/log^2 X). DH control (formal coefficients): near 85.699 the real pair (85.262, 86.113), (85.474, 85.917), (85.573, 85.822) for X = 30, 300, 3000; gap 0.851, 0.443, 0.249. Agent notes the fake-primes control (p + 1/2) is weak.
- log:

## #4 · C4 Fractional-multiplicity Eisenstein series (new object)
- status: open
- source: R1-C (transcribed from PROGRESS.md by the lead's transcriber, 2026-11-10)
- date: 2026-11-10
- plain english: There is one place where geometry already proves a statement of RH type for zeta: a sound wave sent into the modular surface comes back with all its energy, and 'energy cannot be negative' forces zeta to have no zeros on or right of the line Re = 1. That is the prime number theorem, half a unit away from RH. The surface has a cusp shaped like a circle (dimension 1). If the cusp could have dimension k between 0 and 1, the same energy argument would push the zero-free line to (1+k)/2; k -> 0 is RH. At each single prime and at infinity the 'dimension k' mathematics exists (trees with p^k + 1 branches make sense as algebra). What is missing is the global space gluing them.
- claim: The kernel K^{(k)}_Y(z,z') obtained from the Maass-Selberg formula by replacing phi = xi(z)/xi(z+1) with c_k = xi(z)/xi(z+k) is PSD on Re z > (1-k)/2 exactly when zeta has no zero with Re w > (1+k)/2, and for every k in (0,1] the LOCAL ingredients exist with proved positivity (Macdonald spherical functions with t = p^k at p, Jacobi functions of multiplicity k at infinity). RH would follow from a global Hilbert space realising K^{(k)} as a Gram kernel for all k > 0.
- first test: (i) Verify numerically PSD of K^{(k)} for zeta, k = 1, .8, .5, .2, and its failure for DH when (1+k)/2 < 0.8085; (ii) for k = 1 reproduce K from an actual truncated Eisenstein series; (iii) try to build T_p^{(k)} on functions of the lattice-like set {y = m/n} and test commutation with a Jacobi-type Laplacian numerically.
- kill line: The product of the local Plancherel measures for non-integer k admits no discrete 'lattice' (no k-deformed Poisson summation), e.g. if a putative k-theta function with Euler product prod_p (1 - p^{-w})^{-1}(1 - p^{-w-k}) and the Jacobi-k gamma factor fails the functional equation numerically.
- novelty: WebSearch 2026-11-10, one query: Heckman-Opdam / Macdonald c-functions with real multiplicity are standard locally (Opdam, Stokman); no hit for a GLOBAL Eisenstein series with xi(z)/xi(z+k), non-integer k. Agent: 'One search is not a literature review.' Agent's wall W-C3: could not write down any global object with scattering coefficient xi(w)/xi(w+k), 0 < k < 1; global geometric positivity over Spec Z controls only xi(w)/xi(w+1) (HEURISTIC).
- log:
