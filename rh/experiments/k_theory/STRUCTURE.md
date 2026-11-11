# STRUCTURE of the theory document (K-theory, 2026-11-11 00:40 UTC)

Source of truth: `rh/THEORY.md` (80 entries). Commands run: `records.py theory check` (0 errors), `tree`
(saved as `tree_2026-11-11.txt` in this folder), `frontier`. Counts: **43 checked, 9 known** (52 established),
**9 proved** (written proof, not independently checked or resting on an open input), **17 open**, **2 refuted**,
**0 formal**. Labels below: everything is a statement about the record, not new mathematics.

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

An island here = an entry that uses nothing and is used by nothing (22 of 80). Grouped:

| islands | why they are isolated | a statement that would connect them |
|---|---|---|
| T20 (D_S > 0), T21 (off-line zero floor) [both checked]; T13 (Burnol, open) hangs on T12 beside them | lane B (Nyman-Beurling) has no stated link to the window form | An identity between the Nyman-Beurling Gram form and the Weil form on a window (both are quadratic forms whose kernels are made of zeta on the line). None is recorded. A weaker link inside the lane: "D_S^2 <= kappa x local fee" (wall WJ4), which would connect T20 to RH-with-a-rate. |
| T22 (dissipation for the heat flow) [checked] | idea #4 has only this lemma | A functional F with F(t) <= F(0), bounded by arithmetic, excluding a double real zero for t > 0 (wall WJ10). |
| T32 [proved], T33, T34 [checked] (inertia and sum rules) | stated in an abstract finite setting; nothing cites them | They become part of the main body the moment someone states them for the window form in infinite dimension: "kappa_+(N_L,e) = kappa_-(Q_L,e) + [t_e(L) > 1]" needs Q_L,e^-1 cosh to make sense on the window (T10 gives a bounded inverse when lambda_L > 0). That statement would join T32 to T27, T29 and T31 and decide wall WP1 (when is one quartet invisible to N). |
| T45 (first-order caps) [checked] and T46 (positive folded ground states) [open], T47 (certified box) [open] | the bootstrap's window statements are not tied to anything proved on the window | T46 itself is the connector: with it T45 gives the sign pattern of every feasible interval (even block caps the increase, odd block the decrease) through the mirror part of T74. So "T46 for every L" joins T45, T74 and T44. |
| T59 (one fibre field) [checked] | an alternative to T50 that nobody uses yet | "T52/T55 for the doubled matrix [[N', E],[E, E]]": S1-cubic says the lemmas apply unchanged; nobody computed that chain's constant. |
| T72 (primes not mirror positive on L^2) [checked] | a negative statement | It is the other half of T70; the connector would have been a pairing between L^2(0, L] and atoms at log-integers, which is exactly what the refuted bridge T6 lacked. |
| T76, T77 (mirror criterion) [proved], T19 [known] | idea #21's criterion, with no consumer after the kill | Only a statement that uses "local roots real and of modulus exactly 1" (barrier B11) would give them a consumer; none is stated. |
| T14, T15, T16, T17, T18 [open, literature from memory or unreviewed], T24 [open] | cited in discussions, used by no proved lemma | Reading the sources. T18 would connect to idea #13 once the Hecke correspondence passage is read; T17 must not be connected to anything until a human has checked the preprint. |
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

Not "open" but unestablished, and cheap: an independent check (or Lean) of **T32** (exact inertia; the odd half
is written only by K-theory), **T76/T77** (mirror criterion; one seat), **T68** (integrated open path), **T23**
(Fejer equivalence; the limiting step). And two literature entries would become `known` by reading one source
each: T13 (Burnol's theorem, full text) and T18 (Bondarenko-Radchenko-Seip sections 4 to 7 or Berndt-Knopp).

## (e) What to formalise first (lemmas a LIVE route depends on), with difficulty

Live routes are #8 and #9. The formal seat's first five files (D1 = T70, C1 = part of T65, Lemma A = T50 without
the count, Lemma C = T52, reverse Cauchy-Schwarz = Step 2 of T51) serve #21 (killed), #11 (killed) and #10
(parked). They are sound choices as finite algebra, but none lies on a live route. For the live routes:

| order | entry | used by | difficulty in Lean 4 + mathlib | note |
|---|---|---|---|---|
| 1 | T45 first-order caps | #9 | trivial (one bilinear expansion) in the finite-matrix form | state it for a real symmetric matrix Q and a perturbation -2 delta n^-1/2 G |
| 2 | T32 exact inertia (and with it T33, T34) | #9, #10 | easy to medium: one polynomial identity (board B92) plus Sylvester's law of inertia; the count needs "largest dimension of a positive definite subspace", which mathlib has only in part | nominated by S1-parity; would also give T50's missing count and so T61 |
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
