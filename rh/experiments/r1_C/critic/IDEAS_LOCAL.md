<!-- local-idea-log owner=r1_C_critic -->
# Local idea log of r1_C_critic

Private working log of agent `r1_C_critic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `r1_C_critic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Theta-power dial: Z_n(s) = sum r_n(m) m^-s for real n joins zeta(2s) (n=1) to zeta(s)L(s,chi4) (n=2) with a functional equation throughout
- status: open
- source: r1_C_critic (lane C critic, idea N1, found while refuting R1-C/#4); second implementation and location of the off-line zeros by r1_judge (JUDGEMENT.md 1.2)
- date: 2026-11-10
- tags: control,instrument,B1,B2,WJ1
- plain english: A knob n that changes zeta smoothly while keeping its mirror symmetry exact at every setting. At n = 1 the function is zeta itself (with the variable doubled), at n = 2 it is another well-behaved function built from primes; in between, the prime structure is switched off. Example: at n = 1.3 two zeros sit on the line at heights 20.90 and 21.36. At n = 1.4 they have collided and stepped off the line: one sits 0.019 to the side at height 21.146. At n = 1.5 it is 0.18 off. At n = 2 the pair is back on the line at 21.02 and 21.45. So this is a factory of impostors that has zeta itself as one of its settings: any proposed argument can be tried at n = 1.4, where it must fail.
- wall: none: instrument (a control family), not a route. It serves the work on W2 and WJ1 by supplying impostors arbitrarily close to zeta: an argument that still works at n = 1.4 is wrong. Caution from the judge, under the owner's rule on look-alikes: a theorem about the dial is a theorem about impostors, not progress toward L4.
- new input: none: instrument. What it adds to the control group (#1): a one-parameter family with an exact functional equation at every setting that passes THROUGH zeta (n = 1); the Davenport-Heilbronn function does not.
- claim: Z_n(s) = sum r_n(m) m^-s, r_n the coefficients of theta^n for real n, has an exact functional equation on the line Re s = n/4 for every n; n = 1 is 2 zeta(2s), n = 2 is 4 zeta(s) L(s, chi_4). Claim (critic, verbatim): There is a first collision value n_c(T)>1 for zeros below height T, with n_c(T)->1 as T grows; the law of n_c(T)-1 measures how the Euler product at n=1 protects the line.
- prediction: Judge (JUDGEMENT.md 1.2): the critic's prediction n_c(40) in (1.3, 1.5) was confirmed by the second implementation (collision near n_c = 1.399, a heuristic extrapolation). Auditor's caveat: in the critic's files the bracket comes from its own single run at n = 1.3 and n = 1.5 and no number is recorded before that first run, so it was blind only for the judge's finer computation at n = 1.4. Registered for round 2 before computing (judge): n_c(200) - 1 < 0.15 on the n > 1 side. Impostor contrast: the settings 1 < n < 2 ARE the impostors; n = 1 (zeta) and n = 2 keep the pair on the line.
- smallest: Judge: Z_n has a zero off the line Re s = n/4 for every 1 < n < 2 (looks provable; it would be a theorem about the impostors, not about zeta).
- worth if true: The only control family with zeta as an interior point: arguments built on uniqueness, on a bootstrap (#9) or on signs of couplings (#10) can be tested on it in minutes before anyone invests in them.
- first test: Done: on-line zero counts below height 40 for n = 1, 1.02, 1.1, 1.3, 1.5, 1.8, 2 (critic) and location of the off-line zeros at n = 1.4, 1.5, 1.8 (judge). Next (judge, round-2 'dial battery'): bisect n_c(T) for the first ten collisions up to T = 200 on both sides of n = 1; run idea #9's feasible-set test, idea #10's sign test and the first-failure window (#8) along the dial; heat-flow the located pair at n = 1.4 back to the line for a lower bound on the de Bruijn-Newman constant of the n = 1.4 member; read the Berndt-Knopp dimension formula in full text.
- kill line: Judge: n_c(T) stays above 1.2 up to T = 500 on both sides (then the dial says nothing local about zeta and is only another impostor); or the solution space of the functional equation turns out not to be one-dimensional under the conditions idea #9 uses.
- novelty: SEARCHED by the critic (1 web query, summaries only, 2026-11-10): the Dirichlet series of real powers of theta is a studied object (arXiv 2304.09545, arXiv 2401.02813: Hardy-type theorems, infinitely many zeros ON the line Re s = alpha/4 for related combinations). Judge (web search, summaries only): those summaries show no result on zeros leaving the line as alpha varies. NOT found: tracking zeros that leave and return between n = 1 and n = 2. No paper was read in full. Status: not found in what was read; NOT established as new.
- evidence: COMPUTED, two independent implementations, mpmath, single runs, not interval-certified. Critic (cosine transform of theta^n, 45 digits): on-line zeros below height 40: 21 at n = 1, 1.02, 1.1 and 1.3 (pair 20.90, 21.36 closing); 19 at n = 1.5; 18 at n = 1.8; 20 at n = 2 (pair back at 21.02, 21.45). Judge (incomplete-gamma series, 70 digits, no numerical integration): n = 1.3 on-line zeros 20.8981, 21.3598; off-line zeros 0.368894 + 21.146073i at n = 1.4 (offset 0.0189), 0.557087 + 21.161908i at n = 1.5 (offset 0.1821), 0.614261 + 21.206138i at n = 1.8 (offset 0.1643), |Lambda| < 1e-72 at each; n = 2: 21.0220, 21.4506. Validation: n = 1 gives 7.0674, 10.5110, 12.5054 (zeta ordinates halved). Exact, by hand (judge): the normalised coupling at m = 3 is (2/3)(n-1)(n-2) log 3, negative for 1 < n < 2, so idea #10's sign fact fails at once off n = 1 and holds again at n = 2.
- log:
  - 2026-11-10: promoted to main #12 by R1-AUD
  - 2026-11-10: auditor R1-AUD replaced the 'source' field before promotion; the agent's original text was: r1_C_critic
  - 2026-11-10: auditor R1-AUD replaced the 'plain english' field before promotion; the agent's original text was: Raise the theta function to a real power n. At n=1 and n=2 the zeros are on the line; in between a pair near height 21 leaves (gone at n=1.5) and comes back by n=2.
  - 2026-11-10: auditor R1-AUD replaced the 'claim' field before promotion; the agent's original text was: There is a first collision value n_c(T)>1 for zeros below height T, with n_c(T)->1 as T grows; the law of n_c(T)-1 measures how the Euler product at n=1 protects the line.

## #2 · Unconditional Fejer theorem: S_X(t)>=0 for all t and all X<=X0 from verified zeros plus the trivial large-t bound
- status: open
- source: r1_C_critic
- date: 2026-11-10
- log:
  - 2026-11-10: audit: not promoted: merged into main #1
