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
- wall: none: this is an instrument, not a route. It exists to enforce the prediction rule (every idea is run on the impostor).
- new input: not a reformulation; a control experiment.
- claim: For each RH-equivalent positivity quantity (Li coefficients, Weil form eigenvalues, Nyman-Beurling distances) there is a smallest index or scale at which the Davenport-Heilbronn analogue turns negative, and that scale can be computed.
- prediction: Stated after an analytic estimate, so not blind: impostor's Li-type coefficients first negative near n = 3.3e5; zeta's never.
- smallest: none sought; it is a measuring device.
- worth if true: A diagnostic that points to the exact place the Euler product is needed in each route (answers B1, B2 concretely).
- first test: Compute the Davenport-Heilbronn zeros (including the off-line ones) to height ~1000 and its Li-type coefficients; find the first negative one.
- kill line: If the first negativity for the impostor only shows up at indices beyond what we can compute (n > 10^6), the lab is useless as a diagnostic and is dropped.
- novelty: UNSEARCHED for Li coefficients of Davenport-Heilbronn. SEARCHED 2026-11-10 (web search + full-text fetch of arXiv 2606.09096, 2607.24830, 2511.23257): none of those three papers runs any control without Euler product (one paper only partly read).
- evidence: none yet
- log:
  - 2026-11-10: status -> testing: lead ran the first test analytically while round 1 runs
  - 2026-11-10: COMPUTED+HEURISTIC (lead): the impostor's off-line zero 0.808517+85.699348i contributes 4 - 2(|w|^n + |w|^-n)cos(n arg w) to its Li-type coefficient, |w| = 0.99995800, so the negative swing grows like exp(4.2e-5 n) and first beats the smooth growth (n/2)log n near n ~ 3.3e5 (inside the kill line of 1e6, so the lab stays). Li's test is very short-sighted: index n only sees zeros up to height about sqrt(n). Scaled to zeta, an off-line zero just above the verified height 3e12 would first show at n ~ 1e27. Consequence: Li-coefficient numerics can never be evidence, and a proof through Li positivity must control the prime part at n ~ (height)^2. Smooth main term used is the leading asymptotic only (unreviewed).

## #2 · Truncated Weil positivity: watch the lowest eigenvalue as the window opens
- status: parked
- source: lead (pre-seminar), after Yoshida 1992 and Connes-Consani / Connes-van Suijlekom (from memory)
- date: 2026-11-10
- tags: laneA,E4,B6
- plain english: RH is the same as saying a certain energy is never negative, for every possible test signal. For signals confined to a short window it is known to be positive. Picture a drum whose lowest note must stay above zero; as we widen the drum the lowest note sinks toward zero. RH says it never crosses. We measure exactly how it sinks, and what shape the lowest vibration takes, hoping the shape is something we can recognise and control. Example: for a window containing only the prime 2, the energy is a small explicit matrix whose lowest eigenvalue we can simply compute.
- wall: FAILS RULE: attacks no wall. It only measures the quantity whose positivity is RH.
- new input: FAILS RULE: none; Weil positivity restated on windows.
- claim: The lowest eigenvalue mu(L) of the Weil quadratic form restricted to test functions supported in [-L, L] (log scale) is positive for all computable L and decays in a regular law that can be fitted; its minimiser converges to an identifiable function.
- prediction: FAILS RULE: none stated before computing.
- smallest: none new: continuity of the lowest eigenvalue in the window size is already proved (Suzuki 2026, Thm 1.3).
- worth if true: A regular law for mu(L) plus an identified minimiser would turn 'positivity for all windows' into one asymptotic statement about one function.
- first test: Discretise the Weil form on [-L, L] for L up to log 50 or so, compute mu(L) and the minimiser, check against known small-support positivity, fit the decay.
- kill line: If mu(L) shows no regular decay law (fit residuals not shrinking with resolution) and the minimiser has no stable shape, park the idea.
- novelty: SEARCHED 2026-11-10 (web search + full-text fetch of arXiv 2606.09096, 2607.24830, 2511.23257): ALREADY KNOWN. Yoshida 1992 (positivity for small windows; RH fails iff the lowest eigenvalue is negative for some window); Connes-Consani arXiv 2106.01715; Suzuki arXiv 2606.09096 (operator constructed; lowest eigenvalue continuous in a for all a, positive/simple/even ground state for small a, all unconditional); Kim et al. arXiv 2607.24830 (numerics: positive, decays faster than exponentially, measured only to a = 0.6); Connes-van Suijlekom arXiv 2511.23257 (simple lowest eigenvalue with even eigenfunction implies its transform has only real zeros).
- evidence: none yet
- log:
  - 2026-11-10: status -> parked: rejected as an idea under the owner's rules 1, 2 and 5: no wall attacked, no new input, already in the literature. Kept only as the laboratory for idea 8.

## #3 · Split the Li coefficients into a smooth part and a prime part; bound the prime part
- status: killed
- source: lead (pre-seminar), after Bombieri-Lagarias, Maslanka, Voros (from memory)
- date: 2026-11-10
- tags: laneA,E3
- plain english: There is a list of numbers lambda_1, lambda_2, ... and RH is true exactly when none is negative. Each number is a sum of two pieces: a smooth piece that grows steadily like (n/2) log n, coming from the Gamma factor, and a wobbling piece coming from the primes. RH holds exactly when the wobble never beats the growth. Example: lambda_1 = 0.0231, and the first several are all positive. We measure how big the wobble really gets compared with what any proof would need.
- wall: FAILS RULE: attacks no wall.
- new input: FAILS RULE: none; Li's criterion with its terms regrouped.
- claim: The prime part of lambda_n is O(sqrt(n) log n)-small numerically out to n ~ 10^4, far below the smooth part ~ (n/2) log n, and its size is governed by a computable sum over prime powers with n-dependent Laguerre-type weights.
- prediction: FAILS RULE: none.
- smallest: none identified.
- worth if true: Shows how much room there is (a lot at each fixed n) and isolates the single oscillatory prime sum that must be bounded.
- first test: Compute lambda_n to n = 2000 via zeros and via the arithmetic formula; plot prime part / sqrt(n).
- kill line: This is a measurement, not a proof route by itself; kill as a route if no bound better than the trivial one on the prime sum can even be formulated.
- novelty: UNSEARCHED; from recall this split is standard (Bombieri-Lagarias 1999, Maslanka, Voros).
- evidence: none yet
- log:
  - 2026-11-10: status -> killed: pure reformulation (owner rule 2), and idea 1 showed Li numerics are blind until index ~ height^2, so the measurement cannot even serve as evidence.

## #4 · Zeros as particles: follow them under the de Bruijn-Newman heat flow
- status: open
- source: lead (pre-seminar), after Rodgers-Tao 2018, Polymath15 (from memory)
- date: 2026-11-10
- tags: laneB,E6,B3
- plain english: Imagine the zeros as beads on a wire that repel each other. Turn a dial t (think: temperature). For large t every bead sits on the wire. RH says they are all still on the wire at t = 0, and it is known they fall off for any t below 0. So RH is true only by a hair. We simulate the beads to see how they arrange themselves at t = 0 exactly, looking for a conserved quantity or a one-way (monotone) quantity that forbids two beads colliding and leaving the wire before t reaches 0.
- wall: W1 in its heat-flow form (the limit t -> 0). FAILS RULE as written: does not say why a monotone quantity would survive the limit, given Lambda >= 0 means zero margin at t = 0.
- new input: a dynamical structure (the zeros obey an ODE in t) that the static statement lacks.
- claim: There is a functional of the zero configuration of H_t that is monotone in t and whose finiteness at t = 0 forbids a double zero at any t > 0.
- prediction: FAILS RULE: none stated. Pending lane B results.
- smallest: a functional of the zero configuration proved monotone in t for t > 0 (no such functional is known to me; unsearched).
- worth if true: A monotone quantity for the flow is the standard way such 'no collision' statements get proved (cf. Dyson Brownian motion).
- first test: Numerically evolve the first ~500 zeros of H_t for t in [0, 0.5]; compute candidate functionals (log-energy, minimum gap, Fisher-type information) and check monotonicity.
- kill line: If every natural candidate functional is non-monotone numerically, park and record which ones failed.
- novelty: UNSEARCHED. From recall: Rodgers-Tao 2018 and Polymath15 use energy-type functionals of the zeros; exact overlap unknown.
- evidence: none yet
- log:

## #5 · Nyman-Beurling as least squares: read the structure of the optimal approximants
- status: open
- source: lead (pre-seminar), after Baez-Duarte 2003, Burnol 2002 (from memory)
- date: 2026-11-10
- tags: laneB,E5
- plain english: RH is the same as saying a simple step function can be approximated as closely as we like by mixing sawtooth waves of the form frac(1/(k x)), k = 1, 2, 3, ... It is a least-squares fit, exactly like fitting a line through points, only with infinitely many ingredients. Example: with only k = 1 and 2 the best fit already has a definite error we can compute by hand. We compute the best fit with N ingredients and study the recipe (the coefficients): if the recipe follows a recognisable rule, we can try to prove the error goes to zero by writing the recipe down directly.
- wall: FAILS RULE: W1 in the form d_N -> 0; proposing an explicit near-optimal recipe is the same convergence question.
- new input: FAILS RULE unless the optimal coefficients show a structure not already in the literature; pending lane B.
- claim: The optimal coefficients c_k(N) of the Baez-Duarte approximation converge, after normalisation, to an explicit arithmetic function (close to mu(k) times a smooth cutoff), and the distance d_N^2 follows 2*lambda_1/log N to within computable corrections.
- prediction: d_N^2 log N tends to 2*lambda_1 = 0.0461914 (a literature conjecture, so not our prediction). Impostor version: not formulated.
- smallest: none identified yet.
- worth if true: An explicit near-optimal recipe reduces RH to one explicit estimate; the 1/log N rate also explains why brute force cannot see convergence (B6).
- first test: Build the Gram matrix exactly (closed form in zeta values / Vasyunin formulas) for N up to 2000, solve, compare d_N^2 log N with 0.0462, and compare c_k with mu(k)(1 - log k / log N).
- kill line: If d_N^2 log N does not approach a constant near 0.046 by N = 2000 in our implementation, the implementation is wrong; fix before interpreting.
- novelty: UNSEARCHED; from recall heavily studied (Baez-Duarte, Balazard, Landreau, Saias, Burnol, Bettin-Conrey-Farmer).
- evidence: none yet
- log:

## #6 · Lee-Yang in Bohr's variables: approximants whose zeros are pinned to the line by a stability property
- status: parked
- source: lead, notebook N2-N4, after the Lee-Yang move in KNOWLEDGE section 6
- date: 2026-11-10
- tags: laneD,B1,B5,W1
- plain english: Physicists have a theorem (Lee-Yang) saying that for magnets, a simple qualitative property forces all the special points of the system onto a circle, without computing them. I checked that the same property decides whether a zeta look-alike has all its zeros on the line. Treat each prime as its own independent dial. Example: the sum 1 + 1/2^s passes (its only cancellation point needs the dial for 2 turned beyond its range), and all 5833 of its zeros up to height 20000 are on the line. Add the term 1/3^s and it fails, because 1/sqrt(2) + 1/sqrt(3) = 1.28 is bigger than 1 so the terms can cancel the leading 1; and indeed 1120 of 7975 zeros (14 percent) leave the line. Products over primes always pass, because each factor is harmless on its own. So we look for a family of look-alikes that passes at every stage AND provably closes in on the real zeta.
- wall: W1. FAILS RULE as written: it proposes more look-alikes with zeros on the line and does not say why their convergence would avoid W1. Rejected on sight by owner rule 1; recorded by the lead against the lead's own idea.
- new input: the Lee-Yang stability criterion in Bohr's variables as the test for a look-alike (classical in substance: Hermite-Biehler).
- claim: There is a family A_N of Dirichlet polynomials, defined from primes only, whose Bohr lifts are zero-free in the open unit polydisc for every N and whose symmetrisations converge locally uniformly to xi(1/2+it) by an argument that uses no information about zeros.
- prediction: Made by hand BEFORE the count: sharp cut at 2 keeps every zero, sharp cut at 3 loses some (because 1/sqrt2 + 1/sqrt3 > 1). Came out 0 missing and 1120 of 7975 missing. Impostor version: not formulated.
- smallest: none new: the mechanism is classical.
- worth if true: Convergence plus Hurwitz would give RH; even a proof for one family that convergence is equivalent to a statement about primes in short intervals would be a new reduction (question Q1).
- first test: For 4 candidate families (smooth-cut sums, Euler-shaped products, exp of truncated prime sums, optimal Nyman-Beurling recipes) measure (i) the stability margin min|lift| on the polydisc and (ii) distance to Z(t) on a fixed range, as N grows; look for a family where both behave and identify what controls the distance.
- kill line: If in every family the distance to Z(t) stops shrinking exactly where a zero-density input would be needed (i.e. the error term is literally a sum over zeros), record wall W1 as confirmed for this route and park.
- novelty: UNSEARCHED. From recall: symmetrised finite Euler products with zeros on the line are in Gonek 2012; Lee-Yang lifts of real-rooted exponential sums in Kurasov-Sarnak 2020 and Alon-Cohen-Vinzant 2023.
- evidence: COMPUTED rh/experiments/u1_understanding/leeyang.log: sharp cuts at 3,5,10,30 lose 14-21% of zeros; smooth log-cut N=3,10,30 and Euler-shaped products p<=3,7,13 lose none on 0<t<20000; margins 0.124, 0.043, 0.026 for the products. Mechanism PROVED (notebook N2, classical).
- log:
  - 2026-11-10: status -> testing: first test run by lead; mechanism proved, convergence untested
  - 2026-11-10: status -> parked: owner rule 1: another look-alike family with no account of why it escapes W1. What survives is the understanding (UNDERSTANDING U-3) and question Q1.

## #7 · One prime at a time: an 'adjoin p' operation that preserves real zeros
- status: open
- source: lead, notebook N5, after the Asano-contraction move behind Lee-Yang
- date: 2026-11-10
- tags: laneD,B3,B10
- plain english: Instead of proving the property for the finished object, build the object in steps and show no step breaks it, the way you check a tower by checking each brick as it is laid. Each step would add one prime and at the same time adjust the smooth, non-prime part to keep the balance. Example of the shape we want: start with a function with all zeros on the line that knows about no primes; apply the step for 2, then for 3, then 5; after each step count the zeros on the line and check none has left.
- wall: W1. Intended escape: no limit of approximants is taken if each step is an exact identity; but the infinite product over primes is still a limit, so as written this FAILS RULE until the limit step is shown to be harmless.
- new input: the classification of zero-preserving operators (Polya-Schur, Borcea-Branden), which the bare statement of RH does not use.
- claim: There is an explicit operator T_p acting on real entire functions of order 1 with real zeros, which preserves real-rootedness (provably, as a multiplier or differential operator of Laguerre-Polya type), such that the ordered product of T_p over primes p <= P applied to a fixed archimedean seed converges to xi as P grows.
- prediction: FAILS RULE: none stated.
- smallest: one explicit operator T_2 proved to preserve real zeros and proved to move a named seed toward xi in a stated norm.
- worth if true: Would replace one infinite positivity statement by infinitely many identical finite ones, each of a kind that is routinely provable (zero-preserving operators are classified: Polya-Schur, Borcea-Branden).
- first test: Numerically: pick candidate T_p (multiplication by the Euler factor followed by symmetrisation; convolution with a p-dependent kernel in the Fourier variable), apply for p = 2,3,5,7 to a Gaussian-type seed, count real zeros and compare with zeta zeros. Run the same on a non-multiplicative control.
- kill line: If no candidate T_p both preserves real zeros numerically and moves the zeros toward the zeta zeros for the first 4 primes, kill; record which half failed for each candidate.
- novelty: UNSEARCHED.
- evidence: none yet
- log:

## #8 · First-failure window: study the exact moment positivity would break, as an equation
- status: testing
- source: lead, working backwards from the barriers (rh/KEY_LEMMA_SHAPE.md); move borrowed: Fermat's descent / minimal counterexample
- date: 2026-11-10
- tags: W1,W2,B3,rule3
- plain english: Instead of trying to show a quantity stays positive forever, suppose it does not, and look at the very first moment it touches zero. At that moment there must be one special vibration with exactly zero energy, and it must satisfy a precise equation: its smooth part exactly equals a sum of copies of itself shifted by the logarithms of the primes, only finitely many of them. Then show the primes cannot produce such a vibration. Like proving a bridge never collapses by showing that the first crack would need to have an impossible shape. Example: for the impostor function the first crack really exists; I predict it appears when the window is wide enough to see whole numbers up to about 270, and that the cracking vibration oscillates about 86 times per unit, the height of the impostor's bad zero.
- wall: W1 (convergence). It does not hit W1 because no limit is taken: the argument lives at one finite window a0 where finitely many primes appear and nothing is approximated. The zero margin (B3) is the hypothesis, not an obstacle. It meets a different wall, W2: vanishing of the zero-side sum on an interval does not determine its coefficients because the zeros are too dense.
- new input: An equation instead of an inequality: the extremal vector's Euler-Lagrange equation (W*psi = 0 on the window) with explicit finite prime shifts. Weil's criterion contains no such object. Also uses continuity of the lowest eigenvalue in the window size (Suzuki 2026, verified by search), which Weil's criterion does not have.
- claim: For the Davenport-Heilbronn function the lowest eigenvalue of the windowed Weil form crosses zero at a finite half-width a0 with a null vector concentrated at frequency near 85.7; for zeta the ratio R(a) = -lambda'(a)/lambda(a) stays bounded on every finite range and grows roughly linearly in a.
- prediction: BLIND, stated 2026-11-10 before any windowed computation on the impostor was seen by the lead: impostor's first-failure half-width a0 = 2.8 +- 0.5 in logarithmic units (window sees integers up to e^(2 a0), between 100 and 700); null vector has dominant frequency 85.7 +- 1 and an odd envelope. Zeta: no crossing at any computable a. From a crude estimate: negative term 2*(2(cosh(0.3085 a)-1)/0.3085)^2 against positive background 8.4 a. If a0 comes out below 1.5 or above 5 the lead's picture of how an off-line zero creates negativity is wrong.
- smallest: A Hadamard-type formula for d(lambda_a)/da in terms of the boundary behaviour of the ground state, proved for the windowed Weil operator (its archimedean part is a logarithmic-Laplacian-type operator). Not found in the three papers read; a proved formula would be a new unconditional statement, small but real.
- worth if true: Turns RH into the non-existence of one explicit object satisfying a finite equation; gives a single number per L-function (a0) that separates true from false cases.
- first test: 1) Windowed Weil form for the impostor: find a0 and the null vector; compare with the blind prediction. 2) For zeta compute lambda_a and R(a) as far as stable; compare finite-difference lambda'(a) with a boundary-trace expression to guess the Hadamard formula. 3) Inspect the impostor's null vector equation term by term to see which of P1-P4 (KEY_LEMMA_SHAPE) it violates.
- kill line: If the impostor's null vector equation shows no structural difference from what zeta's near-null ground state satisfies (all of P1-P4 play no visible role), the template has no purchase: park and record.
- novelty: SEARCHED 2026-11-10: web search + fetch of arXiv 2606.09096 (Suzuki), 2607.24830 (Kim et al.), 2511.23257 (Connes-van Suijlekom). Found: continuity of lambda_a (Suzuki Thm 1.3) and 'RH fails iff lambda_a < 0 for some a' (Yoshida 1992). NOT found in the text read: any first-failure/null-vector argument, any derivative formula in a, any control without Euler product. Limits: each paper only partly read (about 40k characters verbatim each); Yoshida 1992 and Bombieri's paper not read; logarithmic-Laplacian Hadamard formulas (Chen-Weth and followers) not yet searched. Status: not found, NOT established as new.
- evidence: none yet
- log:
  - 2026-11-10: status -> testing: blind prediction checked against lane A's independent computation
  - 2026-11-10: PREDICTION RESULT (rule 4): MISSED on the size, right on the place. Predicted impostor first-failure half-width a0 = 2.8 +- 0.5; lane A measured a0 in (1.70, 1.72] (rh/experiments/r1_A/PROGRESS.md, same convention: f supported in [-L, L]; not yet reproduced by a second implementation). Predicted dominant frequency 85.7 +- 1: measured 84.3 on a grid of spacing 1.65, with 93 percent of the mass in 81-89, so consistent within resolution. Envelope parity not determined (negative eigenvalues appear in both even and odd blocks).
  - 2026-11-10: WHY THE PREDICTION MISSED (the useful part): I assumed the off-line zero has to out-shout an order-one positive background from all other zeros, which made a0 depend on how far off the line the zero is. Wrong. The background is not order one: lane A finds the form has a ladder of astronomically small eigenvalues (zeta: 6e-30 at L = 1, 4e-167 at L = 1.75), so any negative contribution wins as soon as the window can resolve the zero's HEIGHT. Empirical law from one data point (lane A idea A2): failure when 4 pi e^(2 a0)/q is about the height T of the first off-line zero (impostor: 75-78 against 85.7). The distance off the line does not enter. Corrected picture: a0 = (1/2) log(q T / 4 pi) approximately.
  - 2026-11-10: CONSEQUENCES of the corrected picture: (1) For zeta, zeros verified to height 3e12 would give positivity for half-widths up to about (1/2) log(3e12/4 pi) = 13.1, i.e. windows seeing primes up to about 2.4e11. HEURISTIC, rests on one data point. (2) The window test is exponentially sharper than Li's test (index ~ height squared). (3) The ratio R(a) = -lambda'/lambda is not gentle: with -ln(lambda) ~ 4 pi e^(2a), R(a) ~ 8 pi e^(2a); still locally integrable, so the Gronwall form of the template survives, but any proof must be exact at precision exp(-4 pi e^(2a)): an identity, not an estimate (agrees with lane A's wall and with S3). (4) Lane A also found that below a0 the impostor's ground state behaves exactly like zeta's (its transform has real zeros that reproduce the impostor's on-line zeros), so nothing visible in the ground state warns of the failure; what breaks must be found in what ENTERS as the window grows (the new coefficients), which points at lane A's idea A4 (kicks at each prime power).
