# Ideas

The hub of the project. Every idea gets the next number the moment it comes up, with its source, a single
testable claim, the first test, and a kill line fixed **before** the test is run. Each idea opens with a
**plain english** line (no jargon, one concrete example) so the owner can steer; owner replies are logged
under the idea with `ideas.py note N "owner: ..."`. Refer to ideas by number.
Edit through `python3 tools/ideas.py` (add / note / status / list / check) so the format stays parseable.

Statuses: `open` recorded, untested · `testing` · `alive` survived a real test · `parked` blocked on a named
wall · `killed` kill line hit (reason in the log; never deleted, because why an idea died is reusable).

When a line of attack hits a wall: write the wall into the idea's log as an exact statement, then reread this
file from the top before choosing what to do next.

## #1 · Control-group lab: run every criterion on zeta AND on a function known to fail
- status: testing
- source: lead (pre-seminar)
- date: 2026-11-10
- tags: infra,B1,B2
- plain english: Before trusting any test that says 'the zeros behave', we run the same test on an impostor: the Davenport-Heilbronn function, which looks like zeta in almost every way but is known to have zeros off the line. Like testing a metal detector on a known coin before trusting its silence on the beach. If a test cannot tell zeta from the impostor, it cannot be the heart of a proof; where the two first differ is where the primes are doing the work.
- claim: For each RH-equivalent positivity quantity (Li coefficients, Weil form eigenvalues, Nyman-Beurling distances) there is a smallest index or scale at which the Davenport-Heilbronn analogue turns negative, and that scale can be computed.
- worth if true: A diagnostic that points to the exact place the Euler product is needed in each route (answers B1, B2 concretely).
- first test: Compute the Davenport-Heilbronn zeros (including the off-line ones) to height ~1000 and its Li-type coefficients; find the first negative one.
- kill line: If the first negativity for the impostor only shows up at indices beyond what we can compute (n > 10^6), the lab is useless as a diagnostic and is dropped.
- evidence: none yet
- log:
  - 2026-11-10: status -> testing: lead ran the first test analytically while round 1 runs
  - 2026-11-10: COMPUTED+HEURISTIC (lead): the impostor's off-line zero 0.808517+85.699348i contributes 4 - 2(|w|^n + |w|^-n)cos(n arg w) to its Li-type coefficient, |w| = 0.99995800, so the negative swing grows like exp(4.2e-5 n) and first beats the smooth growth (n/2)log n near n ~ 3.3e5 (inside the kill line of 1e6, so the lab stays). Li's test is very short-sighted: index n only sees zeros up to height about sqrt(n). Scaled to zeta, an off-line zero just above the verified height 3e12 would first show at n ~ 1e27. Consequence: Li-coefficient numerics can never be evidence, and a proof through Li positivity must control the prime part at n ~ (height)^2. Smooth main term used is the leading asymptotic only (unreviewed).

## #2 · Truncated Weil positivity: watch the lowest eigenvalue as the window opens
- status: open
- source: lead (pre-seminar), after Yoshida 1992 and Connes-Consani / Connes-van Suijlekom (from memory)
- date: 2026-11-10
- tags: laneA,E4,B6
- plain english: RH is the same as saying a certain energy is never negative, for every possible test signal. For signals confined to a short window it is known to be positive. Picture a drum whose lowest note must stay above zero; as we widen the drum the lowest note sinks toward zero. RH says it never crosses. We measure exactly how it sinks, and what shape the lowest vibration takes, hoping the shape is something we can recognise and control. Example: for a window containing only the prime 2, the energy is a small explicit matrix whose lowest eigenvalue we can simply compute.
- claim: The lowest eigenvalue mu(L) of the Weil quadratic form restricted to test functions supported in [-L, L] (log scale) is positive for all computable L and decays in a regular law that can be fitted; its minimiser converges to an identifiable function.
- worth if true: A regular law for mu(L) plus an identified minimiser would turn 'positivity for all windows' into one asymptotic statement about one function.
- first test: Discretise the Weil form on [-L, L] for L up to log 50 or so, compute mu(L) and the minimiser, check against known small-support positivity, fit the decay.
- kill line: If mu(L) shows no regular decay law (fit residuals not shrinking with resolution) and the minimiser has no stable shape, park the idea.
- evidence: none yet
- log:

## #3 · Split the Li coefficients into a smooth part and a prime part; bound the prime part
- status: open
- source: lead (pre-seminar), after Bombieri-Lagarias, Maslanka, Voros (from memory)
- date: 2026-11-10
- tags: laneA,E3
- plain english: There is a list of numbers lambda_1, lambda_2, ... and RH is true exactly when none is negative. Each number is a sum of two pieces: a smooth piece that grows steadily like (n/2) log n, coming from the Gamma factor, and a wobbling piece coming from the primes. RH holds exactly when the wobble never beats the growth. Example: lambda_1 = 0.0231, and the first several are all positive. We measure how big the wobble really gets compared with what any proof would need.
- claim: The prime part of lambda_n is O(sqrt(n) log n)-small numerically out to n ~ 10^4, far below the smooth part ~ (n/2) log n, and its size is governed by a computable sum over prime powers with n-dependent Laguerre-type weights.
- worth if true: Shows how much room there is (a lot at each fixed n) and isolates the single oscillatory prime sum that must be bounded.
- first test: Compute lambda_n to n = 2000 via zeros and via the arithmetic formula; plot prime part / sqrt(n).
- kill line: This is a measurement, not a proof route by itself; kill as a route if no bound better than the trivial one on the prime sum can even be formulated.
- evidence: none yet
- log:

## #4 · Zeros as particles: follow them under the de Bruijn-Newman heat flow
- status: open
- source: lead (pre-seminar), after Rodgers-Tao 2018, Polymath15 (from memory)
- date: 2026-11-10
- tags: laneB,E6,B3
- plain english: Imagine the zeros as beads on a wire that repel each other. Turn a dial t (think: temperature). For large t every bead sits on the wire. RH says they are all still on the wire at t = 0, and it is known they fall off for any t below 0. So RH is true only by a hair. We simulate the beads to see how they arrange themselves at t = 0 exactly, looking for a conserved quantity or a one-way (monotone) quantity that forbids two beads colliding and leaving the wire before t reaches 0.
- claim: There is a functional of the zero configuration of H_t that is monotone in t and whose finiteness at t = 0 forbids a double zero at any t > 0.
- worth if true: A monotone quantity for the flow is the standard way such 'no collision' statements get proved (cf. Dyson Brownian motion).
- first test: Numerically evolve the first ~500 zeros of H_t for t in [0, 0.5]; compute candidate functionals (log-energy, minimum gap, Fisher-type information) and check monotonicity.
- kill line: If every natural candidate functional is non-monotone numerically, park and record which ones failed.
- evidence: none yet
- log:

## #5 · Nyman-Beurling as least squares: read the structure of the optimal approximants
- status: open
- source: lead (pre-seminar), after Baez-Duarte 2003, Burnol 2002 (from memory)
- date: 2026-11-10
- tags: laneB,E5
- plain english: RH is the same as saying a simple step function can be approximated as closely as we like by mixing sawtooth waves of the form frac(1/(k x)), k = 1, 2, 3, ... It is a least-squares fit, exactly like fitting a line through points, only with infinitely many ingredients. Example: with only k = 1 and 2 the best fit already has a definite error we can compute by hand. We compute the best fit with N ingredients and study the recipe (the coefficients): if the recipe follows a recognisable rule, we can try to prove the error goes to zero by writing the recipe down directly.
- claim: The optimal coefficients c_k(N) of the Baez-Duarte approximation converge, after normalisation, to an explicit arithmetic function (close to mu(k) times a smooth cutoff), and the distance d_N^2 follows 2*lambda_1/log N to within computable corrections.
- worth if true: An explicit near-optimal recipe reduces RH to one explicit estimate; the 1/log N rate also explains why brute force cannot see convergence (B6).
- first test: Build the Gram matrix exactly (closed form in zeta values / Vasyunin formulas) for N up to 2000, solve, compare d_N^2 log N with 0.0462, and compare c_k with mu(k)(1 - log k / log N).
- kill line: If d_N^2 log N does not approach a constant near 0.046 by N = 2000 in our implementation, the implementation is wrong; fix before interpreting.
- evidence: none yet
- log:
