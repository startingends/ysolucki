<!-- local-idea-log owner=SP-sieve -->
# Local idea log of SP-sieve

Private working log of agent `SP-sieve`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `SP-sieve/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Sparse-family Vaughan = zero-density, never exclusion: every bounded-coefficient inequality is attained in the copy direction
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: Bombieri-Vinogradov-type averaging can tell you that MOST of the twisted Moebius sums in a family are small, but it can never tell you that one particular sum (the untwisted one) is small. Example: in the sextic family with 22 rows of conductor about D^(1/2), the Vaughan method shows the rows of conductor near D^(1/5) average D^(4/5) instead of D, yet the row u = 1 and its copies u = p^6 stay exactly as large as the untwisted sum.
- claim: PROVED in sieve/S2_B10d.md sec 2: L2 Type II bound never below D^2 at any (M,N); L1 Type II total D^(7/6) at H = D^(1/2) (per-row D^(2/3)), = D for H <= D^(1/5); copies excluded
- log:

## #2 · Siebert-Granville shape of the wall: a fixed improvement of a sharp general inequality, at an arithmetic sequence, excludes zeros
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: For the linear sieve it is known that improving the constant 2 in Brun-Titchmarsh by any fixed amount would rule out Siegel zeros, because the only sequences attaining 2 look like a character that pretends to be the Moebius function. Our wall has the same shape one level up: the mean square of twisted Moebius sums is sharp for 'copy' vectors, and a power improvement at the Moebius vector in a short family would rule out a half-plane of zeros.
- claim: HEURISTIC analogy, sources read: FI 2022 survey sec 1,3,10; open: is there a Siebert-type theorem converting a CONSTANT-factor improvement of the short-family mean square into a narrow zero-free region (de la Vallee Poussin width)?
- log:

## #3 · Order stratification of the sextic rows: copies (order 1, H^(1/6)), quadratic rows u = w^3 (H^(1/3)), cubic rows u = w^2 (H^(1/2)), sextic rows (H)
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: The rows of the family are characters of different orders. Only rows whose character is real (quadratic) can carry a Siegel-type zero, which is where the parity barrier lives. Example: u = 8 = 2^3 gives the quadratic symbol (2/n). Asking which strata get the Moebius-absorbing Gauss-sum identity after Poisson tells where the short-family wall really sits.
- claim: RISK: question for SP-modular
- log:

## #4 · Impostor's Dirichlet inverse has poles in Re s > 1 (Saias-Weingartner): first false line of the Vaughan route is the coefficient normalisation, not the identity
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: The fake zeta function is a sum of two L-functions; such sums always have zeros a little to the right of 1. So its 'Moebius function' grows like n^(beta-1) with beta > 1, and every large-sieve bound, which assumes coefficients of size about 1, fails at the first line. Vaughan's identity itself holds for any Dirichlet series.
- claim: PROVED (identity, algebra) + KNOWN (Saias-Weingartner 2009, abstract and citing summary read)
- log:
