<!-- local-idea-log owner=r1_judge -->
# Local idea log of r1_judge

Private working log of agent `r1_judge`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `r1_judge/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Two-regime visibility law: a window sees a far-from-the-line zero much higher than 4 pi e^{2L}
- status: open
- source: judge r1, from lane A critic's surgery/garbage tests + lane C critic's trivial horizon T0(X)
- date: 2026-11-10
- tags: instrument,B3,B4
- plain english: A window of half-width L was thought to see bad zeros only up to height about 12.6 times its largest prime. That is right only for bad zeros very close to the line. A bad zero far from the line (distance delta) can be caught by a short wave tuned to its height, and that works up to height about 6.3 x exp(sinh(2 delta L)/delta - 2L). Example: at L = 3 (primes up to 403, old horizon 5070) one bad zero at height 15000 with delta = 0.49 already gives energy -2.48 on a wave I wrote down.
- wall: none: instrument. It kills lane-A critic's horizon lemma in its stated form (C <= 1.5) and corrects what the verified height 3e12 can buy: windows up to about L = 3 to 3.6 (primes up to about 400 to 1300), not primes up to 1e11.
- claim: For zeta's zeros with one pair near height T replaced by an off-line quartet at offset delta, the window form on [-L,L] has a negative direction as soon as sinh(2 delta L)/(2 delta) - L > c (1/2) log(T/2 pi) with c in [0.3, 1.3] (c depends on the local zero spacing), in addition to the ladder regime 4 pi e^{2L} > T + 0.9 log T ln(1/delta). Equivalently delta_min ~ log(2 delta log T)/log X, the classical scale X = (log T)^{1/(sigma-1/2)}.
- first test: Reproduce with Arb; scan T at fixed (L, delta) to measure c; calibrate on the lane-D pencil's quartets (real Dirichlet series).
- kill line: A second implementation (full eigenproblem or Arb) finds the form positive for the L=3, T=15000.37, delta=0.49 configuration; or 5 of 10 further configurations disagree in sign with the criterion at c in [0.3,1.3].
- evidence: COMPUTED (judge, double precision): wavepacket.py.txt 3.0 0.49 15000 -> Rayleigh quotient -2.4776 (taper 2), -5.62 (taper 1); quartet at 2.96 x 4 pi e^{2L}; all zeros below it on the line. Unmodified Q_zeta(f)/||f||^2 = 5.1696 from zeros and 5.1695 from the prime side (wp_primeside.py.txt, primes <= 403): two routes. Controls: L=3.2, T=30000: +2.23; L=3.0, delta=0.3: positive. HEURISTIC: mean-field formula.
- log:

## #2 · The theta dial is functional-equation-rigid for 0<n<8, yet loses RH: a control for every uniqueness argument
- status: open
- source: judge r1, cross-link of lane C critic N1 with idea #9, KEY_LEMMA S1, lane D pencil
- date: 2026-11-10
- tags: control,B1,B10
- plain english: For zeta the mirror symmetry alone already determines the function (Hamburger 1921). One might hope that this uniqueness is what forces the zeros onto the line. The dial of lane C's critic says no: for every setting n below 8 the dial function is also the only function with its mirror symmetry (Hecke's count: 1 + [n/8] solutions), and at n = 1.4 it has already lost the pair of zeros near height 21.
- claim: For every real n in (0,8) the Dirichlet series of theta^n is the unique Hecke series of signature (2, n/2, 1) up to scaling, and for every n in (1,2) it has zeros off its critical line; so no argument that uses only uniqueness of the solution of the functional equation (plus analytic conditions) can prove RH. Idea #9 (bootstrap) and KEY_LEMMA S1 must be run on the dial.
- kill line: The dimension of the solution space is > 1 for some n in (1,2) under the conditions used in idea #9; or the missing pair is found on the line by a finer scan.
- evidence: COMPUTED (two implementations: critic's cosine transform, judge's incomplete-gamma series thetadial.py.txt): on-line zeros in (18.3,24): n=1.3: 18.5362, 20.8981, 21.3598, 23.9828; n=1.4, 1.5, 1.8: the middle pair is absent; n=2: 21.0220, 21.4506, 23.2784. Dimension formula 1+[k/4] for G(2): from memory, consistent with a search snippet of arXiv 2007.13844 quoting Berndt; not read in full. Exact: normalised coupling at m=3 is (2/3)(n-1)(n-2) log 3 < 0 for 1<n<2, so idea #10's sign fact fails at once off n=1.
- log:

## #3 · One price list for missing primes: lane B's staircase and lane D's deleted primes are the same functional
- status: open
- source: judge r1, cross-link lane B critic C-1 with lane D D4 / second critical line
- date: 2026-11-10
- tags: B10,create
- plain english: Lane B found that leaving a prime q out of the recipe costs a fixed fee of about 1/(2 q^2). Lane D asks what it costs the whole numbers when a thin set of primes is deleted. Both are the same question: how uneven must a count along 1,2,3,... be when it is only allowed to depend on a restricted set of primes. Example: leaving out every prime above 3 costs 0.04996, against a fee total of 0.0438.
- claim: Define C(S) = squared Nyman-Beurling distance using only dilations k coprime to the prime set S. Then C(S) >= local(S) := critic's three-interval bound (PROVED for the complementary formulation), RH <=> C({p>P}) -> 0, and CONJECTURE: C(S) <= kappa local(S) with one constant kappa < 1.3 for every S (finite, cofinite or thin). Lane D's D4 is the statement that for thin S the fixed choice A = 1/zeta_S cannot be regular, while this conjecture says the optimal choice is as regular as the local fee allows.
- first test: Compute C({q}) for single missing primes q = 2,3,5,7,11 (y-space least squares, all k coprime to q up to N), compare with the local bound and test additivity C({q,q'}) vs C({q})+C({q'}).
- kill line: C({q})/local({q}) is not bounded (grows with N beyond 1.5) for a single missing prime: then the cost is not local and the law of lane B's critic is a small-P accident.
- log:
