# STRUCTURE of the theory document (K-theory, 2026-11-11; revised after the round-2 judgement and the readers' addenda)

Source of truth: `rh/THEORY.md` (125 entries). Commands run: `records.py theory check` (0 errors), `tree`
(saved as `tree_2026-11-11.txt` in this folder), `frontier`. Counts: **9 formal, 53 checked, 13 known** (75 established),
**24 proved**, **24 open**, **2 refuted**. Sections (a) to (e) were written at 81 entries; Revisions 2, 3 and 4 at the end
take precedence (Revision 4: 125 entries). Labels below: everything is a statement about the record, not new mathematics.

Nothing in the established part is a case of RH. It consists of (i) dictionaries (what a signature or a null vector
means), (ii) finite linear algebra about certificates and chains, (iii) statements that are conditional on RH,
(iv) literature inputs. No entry uses the Euler product together with the positions of the integers.

## (a) The dependency picture in words

**Three roots carry almost everything.** T7 (explicit formula in the project's normalisation, 20 entries rest on it),
T8 (classical facts about the zeros, 11) and T10 (the window form as an operator: closed, discrete spectrum, 9).
All three are literature inputs and are `known` because a text was read (T7 and T10: Suzuki's paper, now read in
full by a reader seat; T8: a tertiary source only, see MEMORY). With T1 (Weil's criterion), T2 (continuity of the
lowest eigenvalue) and T9 (Selberg, distinct zeros) they are the whole base.

**Three layers above the base.**
1. *Arithmetic-side algebra, no input at all*: T26 (parity blocks, pole = +2<f,cosh>^2 / -2<f,sinh>^2), T27
   (negative squares of Q against positive squares of N), T4 (sign of the kernel), T49 (arch = constant minus a
   Dirichlet form), T74 (even minus odd block = 4 x mirror form), T60 (per-prime Poisson decomposition), and the
   finite linear algebra of the cubic and curvature seats (T50 to T59, T63 to T69, T32 to T34).
2. *Zero-side statements, resting on T8 only*: T29 (exact negative index: the number of negative squares on large
   windows is the number of off-line zeros, per parity block) and T43 (under RH the weights are isolated on the
   whole line).
3. *Bridges between the two sides, resting on T7 and T1*: T5 (block form of RH), T28, T30 (one parity block
   suffices; known: Yoshida), T31 (one positive direction of N gives at most one quartet), T61 (the signature of
   the fibre-extended form Ntilde counts the off-line zeros exactly), T75 (block inequalities as a two-sided bound
   on the mirror form).

**Four clusters hang off these layers, one per idea.**
- *First failure (#8)*: T35 -> T36 -> T37 -> T38, T39, ending in the open T40, T41, T42.
- *Bootstrap (#9)*: T43, T44, T45, ending in the open T46, T47, T48.
- *Certificates (#10, parked) and curvature (#11, killed)*: T50 (fibre classes) and T51 (trickle-down) feed
  T52 (vacuity), T53 to T58, T61; T63 to T69; they end in the open T62.
- *Mirror (#21, killed)*: T70, T71 -> T73, T74 -> T75, with T76, T77 (the criterion), T79 (tilt identity), ending
  in the REFUTED T6.

**One crack in the base found today.** T36 (no null vector under RH) uses the zero-side formula on the whole form
domain. A reader who read all of Suzuki's paper reports that the paper states that formula without a class of
functions and uses it only on H_0^1. It is now the open entry **T80**, and T36, T37, T39, T44 dropped from
`checked` to `proved`. The first-failure cluster therefore stands on T80.

**Two seeds were wrong.** T3 (symmetrisation lemma, notebook N2) is false as stated: counterexample
A(s) = 2^-s + 4^-s, w = log 2, f = sqrt 2 + cos(t log 2) (found by K-theory; repaired statement T25 is open, its
proof is a sketch). T6 (the bridge of idea #21) is refuted by zeta(s-d) zeta(s+d).

## (b) Islands, and what would connect them

An island here = an entry that uses nothing and is used by nothing (21 of 81). Grouped:

| islands | why they are isolated | a statement that would connect them |
|---|---|---|
| T20 (D_S > 0), T21 (off-line zero floor) [both checked]; T13 (Burnol, open) hangs on T12 beside them | lane B (Nyman-Beurling) has no stated link to the window form | An identity between the Nyman-Beurling Gram form and the Weil form on a window (both are quadratic forms whose kernels are made of zeta on the line). None is recorded. A weaker link inside the lane: "D_S^2 <= kappa x local fee" (wall WJ4), which would connect T20 to RH-with-a-rate. |
| T22 (dissipation for the heat flow) [checked] | idea #4 has only this lemma | A functional F with F(t) <= F(0), bounded by arithmetic, excluding a double real zero for t > 0 (wall WJ10). |
| T33, T34 [checked] (sum rules); T32 (exact inertia, now checked: seat, judge and K-theory agree) is used only by the open T81 | stated in an abstract finite setting; nothing proved cites them | They become part of the main body the moment someone states them for the window form in infinite dimension: "kappa_+(N_L,e) = kappa_-(Q_L,e) + [t_e(L) > 1]" needs Q_L,e^-1 cosh to make sense on the window (T10 gives a bounded inverse when lambda_L > 0). That statement would join T32 to T27, T29 and T31 and decide wall WP1 (when is one quartet invisible to N). |
| T45 (first-order caps) [checked] and T46 (positive folded ground states) [open], T47 (certified box) [open] | the bootstrap's window statements are not tied to anything proved on the window | T46 itself is the connector: with it T45 gives the sign pattern of every feasible interval (even block caps the increase, odd block the decrease) through the mirror part of T74. So "T46 for every L" joins T45, T74 and T44. |
| T59 (one fibre field) [checked] | an alternative to T50 that nobody uses yet | "T52/T55 for the doubled matrix [[N', E],[E, E]]": S1-cubic says the lemmas apply unchanged; nobody computed that chain's constant. |
| T72 (primes not mirror positive on L^2) [checked] | a negative statement | It is the other half of T70; the connector would have been a pairing between L^2(0, L] and atoms at log-integers, which is exactly what the refuted bridge T6 lacked. |
| T76, T77 (mirror criterion) [proved], T19 [known] | idea #21's criterion, with no consumer after the kill | Only a statement that uses "local roots real and of modulus exactly 1" (barrier B11) would give them a consumer; none is stated. |
| T14, T15 [open, from memory], T17 [open, unreviewed preprint], T24 [open]; T16, T18 [known since the readers' digests] | cited in discussions, used by no proved lemma | Reading the sources for T14, T15. T18 now supports idea #13's control in its exact form (unique once the poles are prescribed). T17 must not be connected to anything until a human has checked the preprint. |
| T25 (repaired symmetrisation) [open], T3 [refuted] | idea #6 is parked | Writing the Nevanlinna-factorisation step. |
| T4 is no longer an island (it feeds T62). | | |

The two largest *connected* pieces (the zero-side/bridge layer and the certificate layer) are joined only by T61
(Ntilde's signature = 1 + number of off-line zeros). The first-failure cluster and the bootstrap cluster are
joined only by T36 (strict positivity under RH), which is the entry that just lost its `checked`.

## (c) The live ideas: chain from what is established to what the idea needs, and the first open link

Main-log statuses on 2026-11-11: #8 testing, #9 testing, #21 killed, #10 parked, #11 killed.

**Idea #8 (first-failure window).**
T1, T2, T7, T8, T9, T10 (known) -> T35 monotonicity (checked) -> **T80 zero-side formula on the form domain (OPEN)**
-> T36 no null vector under RH (proved) -> T37 first-failure equivalence (proved; an equivalent form of "RH is
false") -> T38 equation of the null vector (checked) -> T39 reality, parity, full support, transform (proved)
-> T40 end-point regularity (OPEN), T41 simplicity and parity (OPEN), T42 derivative formula (OPEN, not yet a
precise statement) -> [the key lemma "no null vector exists for zeta" = RH; **no lemma using arithmetic is even
stated**].
*First open link: T80.* It is a gap in a cited input, probably short to close (a sampling bound in the
logarithmic Sobolev space). After it, the first mathematically open link is T40/T41, and the honest end of the
chain is that nothing in T35 to T39 uses the Euler product (all of it holds for the Davenport-Heilbronn form,
where the null vector exists): the idea has a template and no step yet that distinguishes zeta.

**Idea #9 (bootstrap).**
T7, T8 (known) -> T43 isolation on the whole line under RH (checked) ; T10, T36 -> T44 interior on one window
under RH (proved, behind T80) ; T45 first-order caps (checked) -> **T46 positive folded ground states (OPEN)**
gives the sign pattern of the caps ; **T47 certified finite box at L = 1 (OPEN, computational)** is the idea's own
"smallest" ; T48 prime-free dual inequality (OPEN; RH implies it in one line) ; T17 (Johns's duality and conductor
threshold: OPEN, unreviewed, must not be used).
*First open link: T47.* It needs no theory at all: one rigorous eigenvalue enclosure of a finite matrix pencil per
integer (infeasibility on a subspace is infeasibility on the window), and three implementations already agree on
the numbers. What it does not give: feasibility of the true weights, which is window positivity for zeta at L = 1
and is proved by nothing in the project. The first open link that is mathematics rather than certification is
T46. Everything established on this route is conditional on RH (T43, T44) or a one-line bound (T45); the route
has no unconditional statement yet.

**Idea #21 (mirror positivity), killed.**
T4, T70, T71 (checked) -> T73 (checked) -> T74 parity difference = mirror form (checked) -> T75 two-sided bound
(checked) ; T19 (known), T76, T77 (proved) -> **T6 the bridge: REFUTED** by T79 (tilt identity, checked) with
zeta(s-d) zeta(s+d).
*First open link: none; the chain ends in a refuted entry.* What survives as established: T70, T71, T73, T74, T75,
T79. What they say for any successor: window positivity is an equality-sharp two-sided bound on the mirror form
(T75), and a sign for the mirror form gives neither side.

**Idea #10 (certificates), parked**, for completeness: T4, T50, T51 (checked) -> T52 vacuity (checked) -> T53 to
T58 necessary conditions (checked) -> **T62 a structured certificate given by a rule (OPEN, not precise)**.
*First open link: T62*, and T52 says that without extra structure it is a reformulation.

## (d) The three open lemmas whose proof would most enlarge the established part

1. **T80 (zero-side formula on the form domain).** Restores `checked` to T36, T37, T39, T44 at once (four entries,
   the whole first-failure cluster and one bootstrap entry) and is the base of T41. Probably a page: the paper
   proves Dom_a inside H^log; what is missing is a bound sum_gamma |vhat(gamma)|^2 <= C ||v||^2 in that space.
2. **T47 (certified box at L = 1).** It would be the first unconditional, zero-free, certified statement on a live
   route (ladder level L3 in the brief's sense is for the lead to judge), and a natural entry for
   `rh/FOOTHOLDS.md`. Cost: interval arithmetic on 6 matrix pencils; no new idea.
3. **T46 (positive folded ground states).** Connects the islands T45 and T47 to the mirror identity T74 and turns
   the computed sign pattern of idea #9 into a theorem. Unlike 1 and 2 it needs an idea (Perron-Frobenius is not
   available for Q), and it is COMPUTED at two windows only.

Not "open" but unestablished, and cheap: an independent check (or Lean) of **T76/T77** (mirror criterion; one
seat), **T68** (integrated open path), **T23** (Fejer equivalence; the limiting step). One literature entry would
become `known` by reading one source: T13 (Burnol's theorem, full text).

A fourth open lemma was added from the round-2 judgement: **T81** (does "N has at most one positive direction on
every window" imply RH?). It is the open half of the parity seat's C2; the judge's surgery computations find three
positive directions with one quartet. It would decide whether idea #10's signature claim is equivalent to RH; the
idea is parked, so it is not in the top three.

## (e) What to formalise first (lemmas a LIVE route depends on), with difficulty

Live routes are #8 and #9. The formal seat's first five files (D1 = T70, C1 = part of T65, Lemma A = T50 without
the count, Lemma C = T52, reverse Cauchy-Schwarz = Step 2 of T51) serve #21 (killed), #11 (killed) and #10
(parked). They are sound choices as finite algebra, but none lies on a live route. For the live routes:

| order | entry | used by | difficulty in Lean 4 + mathlib | note |
|---|---|---|---|---|
| 1 | T45 first-order caps | #9 | trivial (one bilinear expansion) in the finite-matrix form | state it for a real symmetric matrix Q and a perturbation -2 delta n^-1/2 G |
| 2 | T32 exact inertia (and with it T33, T34); now `checked` on paper (judge J18) | #9, #10 | easy to medium: one polynomial identity (board B92) plus Sylvester's law of inertia; the count needs "largest dimension of a positive definite subspace", which mathlib has only in part | nominated by S1-parity; would also give T50's missing count and so T61 |
| 3 | T74 parity difference = mirror form, finite folding identity | #9 (through T45, T46), all window work | easy as a matrix identity (board B92 gives the finite form); the exponential-sum part (m = 0 cancellation) is a scalar identity | the continuum version needs integrals: medium |
| 4 | T26 parity decomposition and the pole | #8, #9 | easy for matrices; medium with integrals over C_c^inf | |
| 5 | T27 kappa inequalities | #10, T31 | medium: subspace-dimension arguments | |
| 6 | T44 interior under RH | #9 | easy GIVEN T10 and T36 as hypotheses (one Cauchy-Schwarz) | the inputs are not formalisable soon |
| 7 | T35 monotonicity | #8 | trivial GIVEN the nested domains | input T10 is deep literature |
| 8 | T43 isolation under RH (Theorem U) | #9 | hard: Schwartz decay, dominated convergence, means of almost periodic functions, a sum over zeros | |
| 9 | T29 exact negative index | #8 (T37), #10 | hard: Paley-Wiener bounds, an explicit multiplier, sums over zeros | the linear-algebra core (Steps 1, 2 and the Gram-matrix argument of Step 4) could be split off and is medium |
| 10 | T36, T37, T38, T39 first-failure cluster | #8 | hard: Jensen's formula, Selberg's theorem as an axiom, unbounded forms, distributions | formalise only after T80 is settled on paper |
| - | T7, T8, T9, T10, T1, T2 | everything | not to be formalised now: `known` literature (explicit formula, zero counting, Selberg, operator theory); (from memory, not checked against mathlib:) mathlib has little on the zeros beyond non-vanishing on Re s = 1 | the owner rule allows `known` instead of `formal` |

A statement is `formal` only when its file is imported from `rh/formal/RHFormal.lean`, the full build succeeds
and the formal seat's MEMORY.md lists it; on 2026-11-11 00:33 UTC none met all three (files checked singly only).

## Revision note (after rh/experiments/r2_judge/JUDGEMENT.md and the readers' addenda in rh/library/)
- The judge re-derived every round-2 statement by hand; his verdicts are now in the `checked by` fields. No status
  fell. One rose: T32 (the judge derived the same signature identity independently, J18).
- Gaps the judge names are carried as follows: Theorem A's missing lambda_1 > 0 -> T34 is stated with the hypothesis,
  the counterexample is in its note; C2's "cannot be improved" -> new open T81; Theorem U's "false on every window"
  -> T44 (the checker's one-line proof), which stays `proved` only because of T80.
- T80 is NOT in the judge's file: he accepted "the domain facts" as cited. It comes from READER-1's full reading.
- Entries that are both proved here and in print (T51 = Braenden-Leake Lemma 2.8; T53 (D3) = Braenden-Huh Lemma
  2.15; T30 (2) = Yoshida 1992 Prop. 1 via Suzuki p. 2; T65 (C1, C2) = Schmuckenschlaeger 1998) keep the status
  `checked`, with the citation in `source`: the tool's `known` means "not reproved here".
- T16 and T18 became `known` with exact statements from papers read in full by the reader seats.

## Revision 2 (third batch: rh/formal, the foothold seat, seminar turns 2-3, specialists, ideas #22-#26)

**Formal.** Two entries are `formal`: T70 (mirror Gram identity D1; the formal seat reports no difference in content)
and T32 (exact inertia; the entry was REWRITTEN to the Lean statement, which is more general: any dimension, no
invertibility, boundary cases covered). Both files are in the recorded full build of 00:52 UTC. Sixteen other
entries have Lean coverage that differs from the written statement (finite form only, deduction only, part of the
entry, or a stronger hypothesis-free variant); they stay `checked` with the difference in the note: T26, T27, T29
(Step 2), T33, T35, T44, T45, T50, T51 (Step 2), T52, T63, T64, T65, T74, T75, T77.
**A machine check found a false sentence in a `checked` entry (T33):** "when a Weil block is positive definite the
margin is strictly positive" fails for the even block (zeta itself at L = 0.05, 0.10). K-theory had copied it from the
seat and passed it in its own check C3. The sentence is corrected; nothing downstream used it.

**New established entries.** T84 (odd fold of the background lowers under absolute values; three seats, checked by
K-theory), T87 (unconditional uniqueness of the weights: any summable atomic perturbation makes the form negative on
some window; from T43 and T29), T93 (Schur ray in the damping parameter).

**New `proved` entries waiting for a verifier.** T82 and T83 (foothold seat, computer-assisted; V-FH running): the
Weil form is >= 9.9998e-9 |f|^2 on every window L <= (1/2) log 3, and on L = 1/2, 27/50 positivity confines one atom
to a certified box around (log 2, log 2/sqrt 2). T85, T86 (first-prime lemma), T88 (rank-one pole algebra), T90
(bracket given (F)), T91, T92 (SP-reflection), T94 to T97 (SP-operator), T98 (dial coefficients). New open: T89
(candidate (F)).

**Frontier now** (open, all dependencies established): T13, T14, T15, T17, T24, T25, T40, T42, T46, T47, T48, T62,
T78, T80, T81. (T89 is open but hangs on the unchecked T88.)

**Islands now (22):** T3, T14, T15, T16, T17, T18, T19, T20, T21, T22, T24, T25, T33, T34, T45, T46, T47, T59, T72,
T93, T97, T98. New connectors since section (b): T82/T83 are the first statements that tie the bootstrap cluster to
something unconditional, but they are not yet declared dependencies of T47 (different window, one atom).

**First open links, revised.**
- *#8 (first failure):* unchanged, T80. New on the route: T82 (pending verification) gives lambda_L > 0 for
  L <= (1/2) log 3 without RH, so a first failure can only lie beyond that; T94 (window space is a de Branges space
  when lambda_L > 0) does not need T80; T97 is the nearest proved relative of the open derivative formula T42.
- *#9 (bootstrap):* still T47 as stated (six weights at L = 1), but the route now has its first unconditional
  statements, both waiting for the verifier's verdict: T82 (the true weights are feasible up to (1/2) log 3) and
  T83 (a certified box for one atom). The first link that is open as mathematics is still T46; T85 proves its
  odd half on windows with no atom, and S1-parity (B169 (d)) names the exact step that breaks when the atom at 2
  enters. T87 settles the limit of all windows: the feasible set in the l^1 class is {Lambda} or empty, so
  existence is RH.
- *#21 (killed):* unchanged. T91 gives the exact form of barrier B11 (modulus one = positivity for the other
  involution).
- *#10 (parked):* T62, with T81 beside it; new on the route: T88 (proved), T89 (open candidate (F)), T90 (bracket
  given (F)). Ideas #22 to #26 are linked in the `routes` fields: #22 -> T29, T30, T31; #23 -> T32, T50, T61, T81;
  #24 -> T51, T53, T55, T65; #25 -> T56, T62; #26 -> T18, T98.

**The three open lemmas that would most enlarge the established part: unchanged (T80, T47, T46).** Larger than any
of them, and not an open lemma: the verifier's verdict on T82/T83, which would turn two computer-assisted theorems
on a live route into checked ones.

**What to formalise first, revised.** Done on the live routes: T32 (formal); deduction-only or finite-form Lean
files exist for T45, T26, T27, T74, T44, T35. Next, in this order: (1) a full build that includes files 17 to 22
and a rewritten rh/formal/MEMORY.md (several entries are one recorded build away from a firmer note); (2) T84 in
its finite form (already in Perron_GroundState.lean as form_abs_le) and the finite Perron step for T85; (3) T87's
two-case deduction (easy given T43 and T29 as hypotheses); (4) T88 (secular equation of a rank-one perturbation,
finite, medium). T82/T83 are interval-arithmetic certificates: a Lean formalisation is hard; an independent
re-run with a second ball-arithmetic implementation is the realistic check.

## Revision 3 (fourth batch: V-FH's verdict, the formal seat's end of session, READER-3, the bridge)

**The main line is now the bridge (rh/BRIDGE.md, idea #27): the Weil form is comparable to the least band-limiting
leak.** Its chain in the theory document:

    T1, T7 (known)   T99 (known: Connes-Consani, no-prime window, archimedean place)   T82 (checked: L <= (1/2) log 3)
    T100 plank 7 (checked: Moebius inversion removes Lambda; elementary)
        -> T101 plank 5 (OPEN, heuristic): Q_L(f) = W(tail)                      <- FIRST OPEN LINK
        -> T102 plank 6 (OPEN): the form D_L on the whole window space; Q <= C D
        -> T103 planks 7b, 7c (OPEN, heuristic model for the constant; computed comparisons only)
        -> T104 plank 8a (OPEN): cross + pole terms <= constant x leak
        -> T105 plank 8 (OPEN, the span): Q_L >= kappa D_L on all directions   => RH by T1

What is established on the bridge: only T100 (a change of variable) and the two base cases T99 and T82, neither of
which is yet an inequality against D_L. Everything that carries the hunch (planks 1 to 3, 7b, 7c) is COMPUTED by one
implementation in truncated bases; plank 4 (second implementation) is open. *First open link: T101.* It is not a
hard-looking statement but it is not yet precise: the Weil form has to be defined on functions without compact
support, with the pole bookkeeping. After it T102 (that D_L is a densely defined quadratic form) is the next
bookkeeping link; the first link that is the actual mathematics is T104/T105. Plank 9 (which plank breaks for the
controls) has no entry: nothing is stated yet.

**Statuses changed.** T82, T83 -> `checked` (verifier V-FH: verified as stated; trust base Arb / python-flint,
nothing formalised; Theorem A not new as a claim (Zhu, unrefereed, weaker constant on these windows), Theorem B's
type not found). T27, T50 -> `formal` after rewriting their statements to the machine-checked wording (T27: real,
abstract forms; T50: subspace-dimension count, any dimension). Formal now: T27, T32, T50, T70, all in the full
build of 01:06 UTC (26 files, axioms audit). T100 `checked` (K-theory re-derived N41 (a), (b); absolute convergence
added as a hypothesis in (b)).

**In print, per READER-3 (digests checked):** T35 (Bombieri 2000 Thm 5; CCM (3.27)); T10 (1), (3) (Bombieri Thm 3);
T38 (Bombieri Lemma 1); T29 for FINITE zero sets (Bombieri Thm 9; not for zeta); one implication of T37 (CCM Cor
3.8). Not supplied by Bombieri: T80. T41 is "missing step 1" of Connes-Consani-Moscovici.

**Frontier now:** T13, T14, T15, T17, T24, T25, T40, T42, T46, T47, T48, T62, T78, T80, T81, T101, T103.
**Islands (22):** T3, T14 to T22, T24, T25, T33, T34, T45, T46, T47, T59, T72, T93, T97, T98.

**First open links, all ideas:** #27 (main line) -> T101; #8 -> T80; #9 -> T47 (then T46), with T82, T83 now
checked; #10 (parked) -> T62; #21 (killed) -> refuted T6.

**The three open lemmas that would most enlarge the established part, revised for the main line:**
1. T101 (plank 5), with T102: until they are precise, T104 and T105 are not statements one can prove.
2. T80: still restores four entries on the first-failure route.
3. T104 (plank 8a), as a measurement first: it decides whether the span has the shape "a constant against 2L".
T47 and T46 remain the next ones on route #9.

**Formalise first, revised.** For the main line the only proved link is T100: its part (a) is a finite identity
(Moebius inversion on a finite triangular sum, Lambda * 1 = log; mathlib has both) and is EASY; do it first, with
the numerical check the bridge demands. Then the finite model of T102/T105 once defined. Still pending from before:
the eigenvalue bridge (spectral theorem) that would let T32, T50, T27 be read with "eigenvalues", T34 from T32 +
T33, and confirmation of T33's corrected wording.

## Revision 4 (fifth batch: the copy barrier, the bounded-height equivalence, the short-family items, ideas #28-#34)

**A second cluster now exists, on the analytic side of the short-family wall (idea #34).** It is joined to the Weil-form
part of the document only through T12 (Nyman-Beurling) and T8:

    T106 Thm 1 over Q (FORMAL)  ->  T107 Thm 1 over K (checked, corrected)      T109 squarefull count (FORMAL)
    T106 -> T108 Corollary 1 (checked)                                            T109 -> T110 kernel lemma + count over N (FORMAL)
                                                                                  T110 -> T111 Thm 2 corrected (checked)
    T108, T111, T112 amplifier arithmetic (FORMAL)  ->  T113 Thm 3 corrected: copy amplification stops at 3/4 - eps0/4 (checked)
    T114 character orthogonality (FORMAL; island)
    T115 bounded powers of zeta (OPEN, cited from memory) + T116 Bettin-Gonek Thm 1 (known) -> T117 bounded-height
         equivalence (proved; becomes checked once T115 is read in a text)
    T12 -> T118 bounded Nyman-Beurling (OPEN, sketch), T120 window identity (checked) -> T121 Buchstab recursion (checked)
    T8 -> T119 one-sided psi bound implies RH (checked; Landau)
    T122 defect function (proved) -> T123 Szego-Krein limit (proved) -> T124 e^(2 Dfc) - 1 = NB distance for zeta_K (proved)
    T125 Rankin-Selberg identity of the cubic theta (proved; island)

The copy barrier (T106-T113) is the most solidly established new block: four of its entries are formal (over Q / N),
the rest checked by an independent verifier who also corrected Theorem 1 over number fields (refuted as written:
Q(sqrt -163), D = 41) and supplied Theorem 3's optimality step. It is a barrier for one class of arguments (the copy
amplifier of the October 2026 quasi-RH papers), not a statement about zeros.

**T33** is corrected (fourth batch) and the author has accepted it (B198); B28(1) on the append-only board carries the
same even-block error and is to be read with "lambda_1 > 0".

**Ideas linked:** #28 -> T84, T85, T86, T46; #29 -> T88, T89, T90; #30 -> T47, T87, T17 (nearest entries; its own
conjectures V1-V4 are not entered); #31 -> T122, T123, T124, T125; #32 -> T106, T107, T108, T113; #33 -> NO entry
(SP-modular's family (1 -+ K_w)/w, NOTES D12, has not been entered); #34 -> T12, T13, T20, T21, T106, T108-T121, T123,
T124.

**Frontier now (19):** T13, T14, T15, T17, T24, T25, T40, T42, T46, T47, T48, T62, T78, T80, T81, T101, T103, T115, T118.
**Islands (24):** the 22 of Revision 3 plus T114, T125.

**First open links:** #27 (bridge, main line) -> T101; #34 (short-family wall) -> T115 (bookkeeping: a textbook lemma to
be read; it upgrades T117), then T118 (the bounded Nyman-Beurling equivalence: its direction RH => bounded approximants
has no argument in the record); #31 -> nothing open is stated (T122-T124 are proved, unchecked; the specialist's rate
conjectures are not entered); #8 -> T80; #9 -> T47, then T46.

**Top open lemmas, revised:** (1) T101 with T102 (bridge); (2) T80 (four first-failure entries); (3) T115 (one
textbook lemma; cheapest upgrade in the document). Independent checks most worth having: T122-T124 and T125 (one seat
each, several cited-from-memory inputs), T76/T77, T85.

**Formalise first, revised:** the copy-barrier cores are done (T106, T109, T110, T112, T114). Next on live routes: T100 (a),
T120 (i) and T121 (finite Moebius identities: easy), then T117's Perron step (hard: complex analysis).

## Revision 4a (sixth batch)
T115 is `checked` (K-theory, line by line, LEMMA_T115.md; the +1 power is restricted to |t| >= 2 because of the pole; impostor-blind,
the Euler product enters only on Re s > 1). T117 (bounded-height equivalence) is `checked`. Counts: 9 formal, 55 checked, 13 known,
23 proved, 23 open, 2 refuted. Frontier: T13, T14, T15, T17, T24, T25, T40, T42, T46, T47, T48, T62, T78, T80, T81, T101, T103, T118.
First open link for #34 is now T118 (the bounded Nyman-Beurling equivalence).
