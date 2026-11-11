# Footholds

A track with one job (owner, 2026-11-10): **find any nontrivial case that is actually provable, however small,
plus a mechanism that could spread it.** Status when this file was created: we have none.

A foothold is not a reformulation and not a numerical observation. It is a statement of the same kind as the
goal, restricted (a range of windows, a class of test functions, a family member, a finite set of primes),
with a complete proof that an independent verifier has checked, and a named operation that could enlarge the
restriction. Each entry:

| field | meaning |
|---|---|
| statement | exact, with its restriction |
| status | candidate / proved (file) / checked (by whom) / formal / already in the literature (citation) |
| why nontrivial | what it would not follow from |
| spreading mechanism | the operation that would enlarge the case, and what blocks it now |
| theory entries | the T-numbers in `rh/THEORY.md` it rests on |

## Entries

Written by seat FH (2026-11-11). FH-1 and FH-2 were checked by the independent verifier V-FH
(`rh/experiments/foothold/verifier/VERDICT.md`: both "VERIFIED AS STATED", no gap; lemmas re-derived by hand, the
certificates rerun, the numbers recomputed by a route sharing no code; trust base Arb / python-flint, not
formalised). The verifier's own caution stands: neither is a step towards RH by itself. FH-3 is NOT a foothold
(float numbers, one implementation). Proof files and scripts: `rh/experiments/foothold/`.

### FH-1 · The Weil form is positive on every window that contains only the prime 2
| field | |
|---|---|
| statement | For every f in L^2[-L, L] with L <= (1/2) log 3 = 0.5493: Q(f) >= 9.9998e-9 ‖f‖² (even f), >= 3.9999e-6 ‖f‖² (odd f), Q = geometric side of the explicit formula (Gamma factor + pole - the prime 2). Restriction: half-width up to (1/2) log 3, the whole range where 2 is the only prime present. |
| status | **checked** (by V-FH, 2026-11-11, `verifier/VERDICT.md`); proof `PROOF_window_prime2.md`; certificate `cert.py.txt`, log `cert_log3_R40_n56.log`; computer-assisted: 812 integrals and one LDL^T per parity in Arb balls, the infinite-dimensional remainder by a written bound (Lemma 4). Not formal. **Not new as a claim:** X. Zhu, arXiv 2608.24827 v2 (Sep 2026, unrefereed, v1 retracted a stronger claim) states certified positivity for L <= 0.8 by the same kind of reduction; found by search after I had designed it; only its section 1 was read. Classical before that: "sufficiently small a" (Yoshida 1992, Lemma 2, as quoted by Suzuki), and a = (1/2) log 2 on the subspace where the transform vanishes at +-i/2 (Yoshida; Connes-Consani arXiv 2006.13771). |
| why nontrivial | It is the first window where a prime is needed: without the atom at log 2 the form is negative in both parity blocks (FH-2 (iii), certified). It does not follow from the classical range, from RH being verified to height 3e12 (off-line zeros far up are not excluded by that), or from an estimate: the margin is 1e-8 against entries of size 1. It supplies, at this L, the "certified lower bound on all of L^2[-L, L]" that atlas F21 lists as needed (wall WP4). |
| spreading mechanism | Operation: enlarge L (window after window: 3, then 4, 5, ...). The same proof runs for any L with the cap R chosen so that a(R) > A_L = sum_{log n < 2L} 2Λ(n)/√n. **Blocked by** (wall W-FH1, PROGRESS.md 11; Zhu Thm 1.4): R > 2π exp(A_L) with A_L ~ 4e^L, and the margin to be resolved falls like exp(-c e^{2L}) (1e-17 at 0.8, 6e-30 at 1): doubly exponential cost on both counts. Candidate operation that removes the first count (idea FH/#2, HEURISTIC, not worked out): in the band below the verified height of RH use the zeros themselves as the positive measure instead of bounding the prime comb pointwise; it cannot go past L of about 1.9 without RH itself. The second count needs an identity (a sum of squares), not an estimate. |
| theory entries | T1/T7 (explicit formula, known) only to identify Q with the sum over zeros; T35 (monotone in the window, checked) = Lemma 1; T26 (parity) = Lemma 2. Proposed new entry for the keeper: "Theorem A (FH)". |

### FH-2 · On a window that sees one prime, positivity forces that prime: position within 0.4% and weight within 4.5% (L = 1/2), 0.06% and 0.5% (L = 0.54)
| field | |
|---|---|
| statement | Keep zeta's Gamma factor and pole; replace the prime term by ONE atom at log-position y > 0 with weight m >= 0. (i) y = log 2, m = log 2/√2 is feasible (form >= 0) on every window L <= (1/2) log 3 (FH-1). (ii) L = 1/2: if the form is >= 0 on all real polynomials of degree < 28 then 1.999585 < e^y < 2.008058 and 0.488558 <= m <= 0.510367. L = 27/50: degree < 32, 1.999917 < e^y < 2.001069, 0.489943 <= m <= 0.492420. (iii) With no atom the form is negative in both parity blocks (Rayleigh quotients -0.0324 and -0.3222 at L = 1/2). Restriction: one atom, two windows, outer bounds. |
| status | **checked** (proof `PROOF_forcing_prime2.md`; script `forcing.py.txt`, logs `forcing_half.log`, `forcing_0p54.log`; 7 s and 12 s). Exact rational polynomials + Arb balls for about 100 transcendental constants; no infinite-dimensional remainder (a refutation needs one test vector). **Checked** by V-FH (`verifier/VERDICT.md`; the covering was replayed with exact rationals, no gap or overlap; the box is an outer bound and is not tight). Not formal. Literature: the phenomenon is a published numerical observation (Connes-Consani arXiv 2106.01715 section 2.3: negative at p = 1.9999 and 2.0005 for mu = 3, weight tied to p, no error analysis) and an unreviewed outer bound of seminar S1-parity ((1.9996, 2.0080) at L = 1/2, reproduced). As a theorem: not found in what was read (3 queries; PROGRESS.md sections 2, 5, 8). It is the first certified instance of the open theory entry T47 kind (there: weights at L = 1, COMPUTED only), with the position free as well. |
| why nontrivial | It is a statement about the Gamma factor that produces the number 2 and the number log 2/√2 from positivity alone; it is false without m >= 0 (a negative atom near 0 is feasible), and it is the control the barriers ask for (B1, B10, B11): a displaced first prime or a rescaled local weight is refuted by an explicit vector. It does not follow from theorem U (atlas F21), which assumes RH and the whole line. |
| spreading mechanism | Operation 1 (same window family): the residual interval shrinks fast as the window grows (width 8.5e-3 at L = 0.5, 1.15e-3 at 0.54). Operation 2 (next primes): fix the atom at log 2, free a second atom, windows (1/2) log 3 < L <= log 2; then T47 at L = 1. The refutation side is cheap at every stage (test vectors; the script takes any rational L, but needs working precision of the order of the margin, about 30 digits at L = 1). **Blocked by** (wall W-FH2): rigidity is the converse direction. Every stage needs the INNER statement "the true primes are feasible on this window", which is FH-1 on that window and hits W-FH1; and the residual set is an interval, never a point, on any single window (T44). What would unblock it: the one-step extension with a sign (idea FH/#3): show that a non-negative window form can always be continued to a slightly larger window with NON-NEGATIVE new prime-side mass; with uniqueness (this entry, pushed to every step) that would be RH. Not precise yet. |
| theory entries | T7, T26, T45 (the caps of Lemma 8 are T45 with a free position); atlas F21 (this is its certified first step); T47 (open; same kind at L = 1). Proposed new entry for the keeper: "Theorem B (FH)". |

### FH-3 · (NOT a foothold: computed, float, one implementation) The comparison Q >= kappa D_L of bridge plank 8 on all polynomials of degree < 28, three windows
| field | |
|---|---|
| statement | D_L = least out-of-band energy (band [-e^L, e^L]) of a companion g supported in [-e^L, e^L] with E(g) = f on the window, free on (0, e^-L), with BOTH pole conditions imposed as continuous functionals (int g = 0 and int over the band of ghat = 0). COMPUTED: on all polynomials of degree < 28 (both parities together) 0.3317 D <= Q <= 2.48 D at L = 17/50 (no prime), 0.3307 D <= Q <= 2.32 D at L = 1/2, 0.3281 D <= Q <= 2.33 D at L = 27/50, while the bottom of Q goes from 1.6e-3 to 1.1e-7. The lower constant is stable in the degree; the upper one grows like the log of the degree. |
| status | **candidate** (computed; float `pencil.py.txt` for L <= 0.54 with Q from the checked exact matrix of FH-2; multiprecision `pencil_mp.py.txt` with its own builder of Q for L = 0.65, 0.75, 0.85, 1.0: kappa_min = 0.3279, 0.3265, 0.3018, 0.2978 at degree < 68, 80, 96, 116, stable to 3 digits in the degree; the two builders agree to 6 digits at L = 1/2). Not certified, not reproduced by another seat. The minimiser is a ladder/bulk mixture whose leak is half a cross term (PROGRESS.md 20), not a ladder vector. kappa_max is unbounded in the degree (Q grows like a log, D is bounded): the upper comparison is false on the whole space. Damped kernel (session 4, `pencil_eps.py.txt`, PROGRESS.md 22): the bottom of Q_eps rises like 0.10 eps at L = 0.5 and 0.75, kappa_min moves only between 0.33 and 0.28 for eps in [0, 1/2] and is not monotone: the constant belongs to the bulk, not to the ladder. Session 5 (`pencil_dh.py.txt`, PROGRESS.md 23-25): the zero side of the explicit formula shows WHERE the minimiser sits: on the closest pair of zeros the window resolves (zeta, L = 1: 80% of Q(v) on 59.35/60.83; impostor, L = 1.5: 99% on its close pair 40.16/40.68). Impostor: kappa_min = 0.549 (L = 1.0), 0.431 (1.3), 0.157 (1.4, the close pair enters), 0.138 (1.5-1.6), then the off-line quartet at 85.70 takes over: <= 0.121 (1.65), 0.051 (1.68), 0.041 (1.70), -0.048 (1.72), while its lowest eigenvalue still follows the prolate law at 1.70. Control L(s, chi_5): 0.399 -> 0.325 over L = 1.0-1.6, no fall. Zeta at L = 1.25 (degree < 200): kappa_min = 0.2046, minimiser 97% on the pair 111.03/111.88 (predicted before reading). CONSEQUENCE (HEURISTIC): kappa_min is set by close pairs of zeros, so for zeta it should go to 0 along ever closer (Lehmer) pairs: the comparison with a constant bounded below is not expected to hold. Two corrections to the definition in notebook N40 came out of it (PROGRESS.md 15): without the two conditions as continuous functionals the upper comparison fails by 1e7 to 1e10; D_L is not parity-diagonal. |
| why nontrivial | It is the form-level statement of plank 8 on 28 directions instead of 4, across the entry of the prime 2, with one constant. |
| spreading mechanism | To a theorem at these windows: the cap certificate of FH-1 applied to Q_R - kappa D_up with an explicit linear choice of companion (PROGRESS.md 16 A): finite, of the size of FH-1, not done. To larger windows: NOT by that certificate. Its cost explodes exactly as for FH-1 (PROGRESS.md 17): the cap is forced by the band 2 pi e^(2L) < r < 2 pi e^(A_L), where D is not small. What would spread it is an estimate, and it needs plank 5 (relative accuracy on the ladder and the coupling bound) plus a lower bound of order 1 for Q off the ladder, which is where wall W-FH1 sits. |
| theory entries | FH-2's exact form (checked); N40 (heuristic); bridge planks 3, 6, 8 |

### Candidates examined without a result (no claim)
| candidate | status | what is missing |
|---|---|---|
| inner bound for FH-2 (a certified open set of feasible (y, m) around the true prime) | open | run the FH-1 certificate with ball-valued (y, m); not done |
| two free atoms on (1/2) log 3 < L <= log 2; certified T47 at L = 1 | open | the FH-2 script with irrational atom positions and about 2000-bit balls; not done |
| function fields F_q(t): a window statement provable directly | not attempted | - |
| theta dial at n = 2; semi-local versions with finitely many primes | not attempted | - |
| "zeros as the cap" (idea FH/#2) | HEURISTIC | the splitting lemma written in full with explicit constants |
| certified enclosures of the lead's kappa_K on the span of K explicit prolate vectors (e27 form_0.5.log) | not done | needs rigorously enclosed prolate functions and the exact form on piecewise exponential-polynomials; I computed the stronger whole-space pencil in float instead (FH-3) |
| Connes-Consani 2006.13771 Thm 1 as plank 8 on the no-prime window | does not give it as it stands | an inequality "Sonin trace (cutoff 1) >= kappa D_L (c = 2 pi e^(2L))", the codimension-2 conditions, and non-certified numerics in its proof (PROGRESS.md 16 B) |


## Verification (V-FH, 2026-11-11, `rh/experiments/foothold/verifier/VERDICT.md`)
**FH-1 (Theorem A) and FH-2 (Theorem B): verified as stated** by an independent verifier: every lemma re-derived,
certificates rerun, matrices recomputed by a second route, the covering of the complement of the box replayed in
exact rationals (complete, not sampled). No gap. One false remark outside the theorems was found and corrected
(two quoted "Rayleigh–Ritz bottoms" had been computed at 0.693147 instead of log 2). Trust base: Arb / python-flint;
nothing formalised. Novelty: FH-1 is contained, with a weaker constant, in Zhu's unrefereed claim for L ≤ 0.8;
a certified region for the position and weight of the first prime (FH-2) was not found in three searches and the
papers read: "not found", not "new". Both are now the project's first CHECKED unconditional statements about
windows that contain a prime. Neither is a step towards RH by itself.
