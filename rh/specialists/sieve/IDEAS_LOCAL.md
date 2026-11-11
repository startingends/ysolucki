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
- wall: Short-family wall (N53-N58): shows the Vaughan/BV route stops at the copies for a proved reason (extremal vectors).
- new input: (auditor R3-AUD) Exact book-keeping of the copies (rows u = w^6 times units, about H^(1/6) of them, on which the sextic twist is principal): any inequality valid for ALL bounded coefficient vectors is attained in the copy direction, so over all rows the general norm is >= H^(1/6) D^2 and no L^2 Type II / large-sieve bound goes below D^2; the L^1 (Bombieri-Vinogradov) count is zero-density information and never sees the copies. It names the near side of the S2 wall as a statement about extremal vectors.
- claim: PROVED in sieve/S2_B10d.md sec 2: L2 Type II bound never below D^2 at any (M,N); L1 Type II total D^(7/6) at H = D^(1/2) (per-row D^(2/3)), = D for H <= D^(1/5); copies excluded
- prediction: (auditor R3-AUD) None blind for the impostor: FAILS RULE 4 (it is a barrier, not a route). Computed exponent bookkeeping (typeII_exponents.log): L^2 Type II never below D^2 at any (M, N); L^1 Type II total D^(7/6) at H = D^(1/2) (per row D^(2/3)), and D for H <= D^(1/5). Impostor: its Dirichlet inverse has poles up to Re s ~ 1.12 (SP-modular B27, computed; Saias-Weingartner 2009), so it is excluded at the first line by coefficient size before the mechanism starts.
- smallest: (auditor R3-AUD) Done for the Vaughan / Bombieri-Vinogradov mechanism (S2_B10d.md sections 0-2). The smallest open statement on the route is the seat's own SP-sieve/#2 (merged here): a Siebert-type theorem in which a CONSTANT-factor improvement of the short-family mean square at the copies, for H < D, gives a narrow zero-free region of de la Vallee Poussin width. Scope: quasi-RH, not RH.
- first test: (auditor R3-AUD) Write the Siebert / Granville / Friedlander-Iwaniec 2022 argument (exceptional character 'pretends to be mu'; sections 1, 3, 10 read by the seat) one level up for the sextic family, and check whether its exceptional-character step has an analogue in the copy direction.
- kill line: (auditor R3-AUD) A bounded-coefficient inequality over all rows with S(D^(1/2), D) << D^(2 - delta) (then the barrier statement is false as stated); for mu alone such a bound would already give Re s > 23/24 - delta/2.
- novelty: Searched 2026-11-11: 'Bombieri-Vinogradov type theorem power residue symbols Mobius large sieve sparse family Type II Vaughan'; 'large sieve sixth order residue symbols Mobius ... zero-free region' (summaries only: nothing combining sparse residue-symbol families with Vaughan). Statement is standard in type (large values / zero density); the copy-multiplicity point is in N49/N56 in other words.
- evidence: (auditor R3-AUD) PROVED in rh/specialists/sieve/S2_B10d.md: Vaughan's identity holds for any invertible Dirichlet series (so the impostor has it verbatim); Type I negligible off the copies at H = D^(1/2) (smoothed Polya-Vinogradov over Z[omega]); conjugate characters of a single row already reach D^2 in L^2. Not checked by a second seat. Seminar S2 closing (board s2 B25, notebook N59, N60): four seats in four languages name the near side as parity / averaged Chowla / Type II at power strength specific to mu.
- log:
  - 2026-11-11: promoted to main #32 by R3-AUD

## #2 · Siebert-Granville shape of the wall: a fixed improvement of a sharp general inequality, at an arithmetic sequence, excludes zeros
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: For the linear sieve it is known that improving the constant 2 in Brun-Titchmarsh by any fixed amount would rule out Siegel zeros, because the only sequences attaining 2 look like a character that pretends to be the Moebius function. Our wall has the same shape one level up: the mean square of twisted Moebius sums is sharp for 'copy' vectors, and a power improvement at the Moebius vector in a short family would rule out a half-plane of zeros.
- claim: HEURISTIC analogy, sources read: FI 2022 survey sec 1,3,10; open: is there a Siebert-type theorem converting a CONSTANT-factor improvement of the short-family mean square into a narrow zero-free region (de la Vallee Poussin width)?
- log:
  - 2026-11-11: audit: not promoted: merged into main #32

## #3 · Order stratification of the sextic rows: copies (order 1, H^(1/6)), quadratic rows u = w^3 (H^(1/3)), cubic rows u = w^2 (H^(1/2)), sextic rows (H)
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: The rows of the family are characters of different orders. Only rows whose character is real (quadratic) can carry a Siegel-type zero, which is where the parity barrier lives. Example: u = 8 = 2^3 gives the quadratic symbol (2/n). Asking which strata get the Moebius-absorbing Gauss-sum identity after Poisson tells where the short-family wall really sits.
- claim: RISK: question for SP-modular
- log:
  - 2026-11-11: audit: not promoted: merged into main #32

## #4 · Impostor's Dirichlet inverse has poles in Re s > 1 (Saias-Weingartner): first false line of the Vaughan route is the coefficient normalisation, not the identity
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: The fake zeta function is a sum of two L-functions; such sums always have zeros a little to the right of 1. So its 'Moebius function' grows like n^(beta-1) with beta > 1, and every large-sieve bound, which assumes coefficients of size about 1, fails at the first line. Vaughan's identity itself holds for any Dirichlet series.
- claim: PROVED (identity, algebra) + KNOWN (Saias-Weingartner 2009, abstract and citing summary read)
- log:
  - 2026-11-11: audit: not promoted: merged into main #32

## #5 · Bettin-Gonek dictionary is an equivalence at BOUNDED height; the T-coupled form needs a weighted zero-density bound beyond DH
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: Knowing there are no zeros right of 7/8 tells you exactly how fast the mollified integral at low height can grow with the mollifier length N (like N^(3/4)), and conversely. It tells you nothing about the same integral up to height T with N = T^(4/3), because a few zeros just left of 7/8 at large heights would each cost about T there.
- claim: PROVED (bounded-height equivalence); HEURISTIC (what the coupled form needs); TRANSPORT.md sec 1
- log:

## #6 · Copies need a homomorphic family parametrisation with kernel of intermediate density (m-th powers); t-family kernel trivial, depth family kernel positive density (circular)
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: In the sextic family the rows that copy the untwisted sum are the sixth powers: rare but not too rare. In the height family no row is a copy; in the family of all characters mod p^k the copy is exact but the family is a finite group, and then the copy argument gives back only the trivial bound.
- claim: PROVED (orthogonality for depth family; Kronecker for t); TRANSPORT.md sec 3
- log:

## #7 · Copy barrier theorem: general sieves pay for copies; kernel copies of local multiplicative families are squarefull (density <= H^(1/2)); copy amplifier with diagonal mu-mean square at H >= D stops at 3/4
- status: open
- source: SP-sieve
- date: 2026-11-11
- plain english: If a family of twists contains many exact copies of the untwisted sum, any inequality that works for all coefficient sequences must already be large, so the copies help only through an inequality special to the Moebius function. And in families built multiplicatively from residue symbols the copies are the squarefull rows, at most about the square root of the family (squares for quadratic symbols, sixth powers in the October family): so this trick alone can never beat Re s > 3/4.
- claim: PROVED: COPY_BARRIER.md Thms 1-3; COMPUTED squarefull counts to 1e12; Lean cores L1-L5
- log:
