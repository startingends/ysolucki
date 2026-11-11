# Round 3 idea audit (auditor R3-AUD, 2026-11-11)

Scope: the twelve local idea logs of seminar S1 (seats parity, cubic, curv, mirror), seminar S2 and the specialist
seats (SP-operator, SP-modular, SP-reflection, SP-sieve), and the standing seats (K-atlas, BG, FH and its verifier V-FH).
94 local entries, every one decided.
Result: **6 promoted** (main #28-#33), **86 merged** as dated notes into main entries, **2 skipped**.
Main log before: 27 ideas (#27 written by the lead). After: 33 ideas, `ideas.py check` 0 errors (27 recorded rule
failures, 6 of them new and written on purpose, see below), `hubcheck.py` 0 errors and 0 awaiting audit. Ideas #1-#27
received log notes only; their fields and statuses are untouched. Nothing was committed by me.

Decisions: **P** promoted · **M** merged into a main idea (a dated note on that idea; local entry closed with
"merged into main #K") · **S** skipped (reason in the local log).

Sources used for what each idea turned into: `rh/experiments/s1_seminar/socrates/CLOSING.md` (S1), board `s2`
(B22-B28) and `rh/NOTEBOOK.md` N34-N61 (the lead's synthesis, including both seminar closings), `docs/JOURNAL.md` J4-J6,
`rh/BRIDGE.md`, `rh/FOOTHOLDS.md` (with V-FH's verdict), `rh/BIGGER.md`, `rh/HUNCHES.md` E-F, `rh/THEORY.md` T75-T105
(the theory keeper has entered most of these results with a status), `rh/ATLAS.md` F1-F30, `docs/KNOWLEDGE.md` B11, the
seats' own files (S2_B6.md, S2_B10d.md, NOTES_session1.md D12, OBJECT_PHI.md) and a dozen s1 board posts. I re-judged
and recomputed nothing. Five web searches of my own (standard mode, titles and summaries only) are recorded in the
novelty fields or notes of #28, #30, #31, #32, #33; none of them found the promoted statement.

Why six. Most of these entries are results that test or refine an idea already on the main log (the bridge #27, the
first-failure template #8, the bootstrap #9, the cubic #24, the inertia relation #23), or the record of the control
that killed #21 (22 entries, merged there in four notes), and most proved ones already have a home with a status in
`rh/THEORY.md` or `rh/FOOTHOLDS.md`. An entry got its own number if it is a proposal new in the record and precise
enough to compute (#28, #29, #30, #33), or a result that a later run needs by itself, either as the object a line of work
now stands on (#31) or as the proved form of the wall where that line stopped (#32).

## Every local entry

| local entry | title (short) | decision | main # | reason (one line) |
|---|---|---|---|---|
| S1-parity/#1 | Mirror form of the full Weil kernel: one positive square (pole) | M | #21 | Proved identity (folding, FORMAL B142, T75); it is why the bridge of #21 points the wrong way |
| S1-parity/#2 | Dial n = 4: one negative mirror square from a factor with zeros on the line | M | #21 | Proved twice (S1-parity, S1-mirror); #21's claim fails in both directions on the dial |
| S1-parity/#3 | sup_L kappa_+(Ntilde) = 1 + nu; odd block of Ntilde <= 0 iff RH | M | #22 | Proved by combination; known in substance (Krein-Langer); bookkeeping |
| S1-parity/#4 | Gamma form alone: even below odd; odd block fails in (0.37, 0.38) | M | #9 | Computed detail of the background without primes |
| S1-parity/#5 | Gap in first-failure Lemma 2: count distinct ordinates | M | #8 | Correction with a repair by citation |
| S1-parity/#6 | One-signed folded ground states explain the feasible intervals of #9 | M | #9 | Caps proved outer bounds (T45, FORMAL); 'caps are the intervals' computed only |
| S1-parity/#7 | Exact inertia kappa_+(N_e) = kappa_-(Q_e) + [t_e > 1] ... | M | #23 | It is #23 (one of its three derivations); Haynsworth 1968 |
| S1-parity/#8 | Conjecture: block >= 0 implies nodeless ground state | M | #28 | It is half (N) of #28; contested in a weight family (B197), not recomputed |
| S1-parity/#9 | Tilt threshold d_c(L) = sqrt(mu/c); count = rungs below c d^2 | M | #17 | Computed visibility law of the F_d control; same shape as #17 |
| S1-parity/#10 | Theorem U': at most one l1-perturbed weight system survives all windows | M | #9 | Checked (T87); overlaps Johns Prop. 3.2; withdrawn as new by its author |
| S1-parity/#11 | Odd block below (1/2) log 2 is a Perron operator | M | #28 | Proved (T85, three write-ups, Perron step FORMAL); the proved case of (N) |
| S1-parity/#12 | kappa_K -> 0 with fixed companions (cut Poisson map has a kernel) | M | #27 | Proved; only the least leak can carry a constant (plank 3, 6) |
| S1-parity/#13 | Trigonometric bases overestimate the bottom by 3-30% | M | #2 | Numerical caution for every eigenvalue number of the instrument |
| S1-parity/#14 | Moebius-side doubling identity (Hunch 1) | M | #27 | Doubling is quadratic: the hunch's own kill line; F_d shows the functional equation cannot supply it |
| S1-cubic/#1 | Pair obstruction: every coupled pair needs a third box | M | #10 | Proved test; fails for every pair; R* = n - 1 was not about the edge |
| S1-cubic/#2 | Mirror squares enter Weil's form with a minus sign | M | #21 | Proved identity; mirror positivity gives lower bounds where RH needs upper |
| S1-cubic/#3 | Mirror form of the fibre-extended matrix | M | #23 | Proved; no-prime system mirror positive yet Weil-negative from 0.38 |
| S1-cubic/#4 | Reweighting test for any mirror bridge | M | #21 | Computed: window positivity pins c_2 = 1, the mirror cone does not |
| S1-cubic/#5 | 'No two close' locality of certificates | M | #10 | Explained as a graded pair obstruction (TURN2.md 3) |
| S1-cubic/#6 | Question: is the factor 2 one deficit or two? | M | #24 | Answered by S1-curv G4: two-halves deficit is the mirror-crossing term |
| S1-cubic/#7 | Block-averaged Bakry-Emery curve (1+3 theta)/(2+2 theta) | M | #24 | Proved on the model, computed for zeta; refines #24's factor 2; blind to Beurling |
| S1-cubic/#8 | One fibre field e^{|x-y|/2}; Kac-Baker tower of local fields | M | #23 | Proved for m = 0 only; tower uncomputed; reformulation until something is proved (one promote splits it out) |
| S1-cubic/#9 | Odd block without primes is Metzler (linear certificate) | M | #28 | Same Perron fact as (N); certificate not computed |
| S1-cubic/#10 | r-block certificates; two mirror blocks = doubling in Lorentzian form | M | #24 | Proved and computed; a member of #24's family |
| S1-cubic/#11 | Tilt test: one-field form tilt-blind; Q_d = 2[Q(g) - Q(tanh(dx)g)] | M | #21 | Twist identity, found by four seats (T79); box heuristic withdrawn |
| S1-cubic/#12 | Question: certificate indexed by window size | M | #8 | Answered (B127): de Branges chain exists iff positive, vacuous as existence |
| S1-cubic/#13 | Candidate (F): N_e^-1 cosh(x/2) one-signed; critical pole strength | **P** | **#29** open | New in the record, precise (T89 open, T90 proved); not the even inequality in disguise, but as weight-sensitive |
| S1-cubic/#14 | Hadamard formula: -dmu/dL = C (edge amplitude)^2 | M | #8 | Heuristic; finite form trivial; bears on edge regularity (WP2) |
| S1-curv/#1 | Open-path term of Bochner is a Hankel form | M | #11 | Proved split; conjecture Op >= 0; split does not see the Beurling control |
| S1-curv/#2 | Sum rules in closed form, margins 1/(t_e - 1), 1/(1 + t_o) | M | #23 | Proved (Sherman-Morrison); F1(a) refuted by a machine-checked counterexample (B193) |
| S1-curv/#3 | Parity differences: two-sided squeeze T + 4s^2 <= H <= 4c^2 - T | M | #21 | Proved (T75), three seats; blind cosine prediction missed |
| S1-curv/#4 | Comb reduction: integer Hankel and Toeplitz matrices | M | #21 | Computed, 4 blind hits; comb subspace is far from the tight directions and blind to Beurling |
| S1-curv/#5 | Tilt as a contraction; Bernstein constant nu | M | #21 | Proved identity (T79); part of the F_d control record |
| S1-curv/#6 | Half-window Gamma_2: rho_half = 5/6 from even-odd cross terms | M | #24 | Proved and computed (0.838); the two-halves point of #24's curve |
| S1-curv/#7 | Derivative lemma: edge-regular eigenfunction's derivative is an eigenfunction of the other parity | M | #8 | Proved given hypotheses; addresses WP2/T40; unchecked by a second seat |
| S1-curv/#8 | Edge-strip lemma on the first-prime window | M | #28 | Proved bound; closes only for L <= 0.361; throws the sign away, so no (C) |
| S1-mirror/#1 | Real-tilt control F_d = zeta(s-d) zeta(s+d) | M | #21 | The control that killed #21; recorded as barrier B11 (KNOWLEDGE.md) |
| S1-mirror/#2 | Doubling: RH on the window = |mirror| <= half-window shift | M | #28 | Reformulation; own kill line met (saturators are the ground states); kept as (C) |
| S1-mirror/#3 | Prime mirror positivity lives only above the horizon | M | #21 | Heuristic + smallest case proved; comb computation agrees |
| S1-mirror/#4 | Mirror positivity and Ramanujan meet only at roots +-1 | M | #21 | Proved classification (T91); prime by prime; a control, not a route |
| S1-mirror/#5 | First-prime lemma: odd background Perron, forced sign and minimum weight | M | #28 | Proved (T86, P3 FORMAL); the proved case of #28; excludes Beurling 2 -> 2.1 at L = 0.40 |
| S1-mirror/#6 | Impostor has a Poisson map and obeys the small-eigenvalue law | M | #27 | Plank 9: the result that moved bridge 1 |
| SP-operator/#1 | Twist as conjugation 2cosh(d ad_X) Q; concave at d = 0 | M | #21 | Proved (P2); blind first-failure guesses missed |
| SP-operator/#2 | RH iff i(Lambda'/Lambda) in class N_1 | M | #22 | Proved modulo bookkeeping (T95); known in substance (Krein-Langer); reformulation |
| SP-operator/#3 | Window family is a de Branges chain while positive; h_1(L) | M | #8 | Proved (T94); vacuous as existence (atlas F29); slopes pause after prime entries |
| SP-operator/#4 | Closed-form chain for the archimedean window (read Burnol) | S | - | A reading promise; nothing defined, proved or computed (S1 open item 6) |
| SP-operator/#5 | Multiplier duality cosh vs cos (Schur products) | M | #21 | Proved (P3, T93 checked); why every mirror hypothesis is twist-invariant |
| SP-operator/#6 | Odd block on the no-prime window: Perron, no perturbation step | M | #28 | Proved (P7); one of three write-ups of (N) without atoms |
| SP-operator/#7 | Plank 5: window form = Weil form of the Poisson tail | M | #27 | Proved for a stated class (T101), confirmed to 1e-14; the bridge's one exact plank |
| SP-operator/#8 | Plank 7: primes eliminated on the tail (and window) | M | #27 | Proved (T100 checked), to 1e-48; seat's own board error corrected |
| SP-operator/#9 | Plank 6: D_L bounded, Q <= C D false, g(0) = 0 not closable | M | #27 | Proved (T102); led to FH's corrected definition |
| SP-operator/#10 | Zeros of zeta_K as an energy-dependent point interaction at omega | M | #31 | Proved; in print in substance (Colin de Verdiere 1982-83, Bombieri-Garrett 2020) |
| SP-modular/#1 | Half-shift = modular surface; totient window arithmetic | M | #33 | Proved + computed; prediction (room at the half shift) missed; kept as positive control |
| SP-modular/#2 | Two involutions; Zagier's form = Weil form on S-even functions | M | #21 | Proved dictionary; a third test class disjoint from windows (F22) |
| SP-modular/#3 | Dial defect (8/45) n^3 (n-1)(n-2)(n-4)(n-8); positivity below 4 | M | #26 | Proved (T98); one prediction missed; refines #26 |
| SP-modular/#4 | Half shift: positivity free, RH a rate; window: the reverse | M | #33 | Heuristic framing; test not computed |
| SP-modular/#5 | Function-field twin of Zagier's programme (Cornelissen-Lorscheid) | M | #21 | In print (read): note with citation; needs a one-dimensional quotient |
| SP-modular/#6 | Hecke-Gram rank test for Euler products | M | #21 | Proved instrument for B1; F_d passes (blind to B11) |
| SP-modular/#7 | Counts are not enough (Epstein) | M | #21 | Known caution for N38 |
| SP-modular/#8 | w-dial (1 -+ K_w[L])/w joins the positive control to the Weil blocks | **P** | **#33** open | New in the record and computable; an instrument; ray family like all others (T96) |
| SP-modular/#9 | Coupling phase tau_gamma of each zero at omega | M | #31 | Proved in framework; not computed; 'all equal' is Colin de Verdiere's 1983 conjecture, reported false |
| SP-modular/#10 | zeta_K as Eisenstein transform of two positive measures; Hecke rank one at CM points | M | #31 | Made exact (R1); separates the field, not the point; impostor has the same kernel shape |
| SP-modular/#11 | No Hecke-equivariant pseudo-Laplacian | M | #31 | Killed by its own proof (constrained space {0}) |
| SP-modular/#12 | Cusp part of the resolvent drops out of sheet differences | M | #31 | Proved; Waldspurger data invisible to zeros |
| SP-reflection/#1 | Ramanujan as the second involution (Herglotz on Z) | M | #21 | Proved, classical in parts; FAILS RULE 2 (seat); prime by prime |
| SP-reflection/#2 | F^t Helson positive for t <= 1/degree; mirror matrix = generator | M | #21 | Proved (T92); explains the excluded index 1; converse false |
| SP-reflection/#3 | Ratio dial zeta(s-d)/zeta(s+d): moments of a product measure | M | #21 | Proved; d = 0 is the trivial boundary; Suzuki's K_d[t] not >= 0 on L^2 (B150) |
| SP-reflection/#4 | Weil form as an inverse propagator; no bridge gives an upper bound | M | #21 | Diagnosis (atlas F27); FAILS RULE 2 (seat) |
| SP-reflection/#5 | Defect function Dfc on the modular surface | **P** | **#31** parked | Not found in searches, precise, computed; became the J6 object; ends as Nyman-Beurling for zeta_K |
| SP-sieve/#1 | Sparse-family Vaughan never excludes: copies are extremal | **P** | **#32** parked | Proved barrier a later run needs (S2's conclusion in proved form) |
| SP-sieve/#2 | Siebert-Granville shape: constant-factor gain at copies -> zero-free region | M | #32 | S2's one surviving thread; heuristic analogy; the 'smallest' of #32 |
| SP-sieve/#3 | Order stratification of the sextic rows | M | #32 | Closed by SP-modular B26: no absorption on the quadratic stratum |
| SP-sieve/#4 | Impostor's inverse has poles in Re s > 1 | M | #32 | Proved + known (Saias-Weingartner 2009); impostor excluded by normalisation |
| K-atlas/#1 | F_d is an Eisenstein L-function; B11 = half-shift wall? | M | #21 | Identification checked by SP-modular (B211); RS square detects nothing |
| K-atlas/#2 | Missing-prime law on the window: L* = (1/2) log q + eps(q) | M | #14 | Numerics in print (Connes-Consani 2106.01715 sec. 2.2, 2.4); odd block first is the addition |
| K-atlas/#3 | Visibility law and tilt threshold are one statement; slope 1/2 | M | #17 | Proved part (B184) and computed slopes; kill line not yet tested |
| K-atlas/#4 | Two-halves constant 5/6 as a pencil statement | M | #24 | Nothing new computed by the seat; open formula question recorded on #24 |
| K-atlas/#5 | One price list C(S) = main #15 | M | #15 | Same idea as #15 |
| K-atlas/#6 | Yes-pairings already on the record (four reformulations) | S | - | Pointer to rh/ATLAS.md; no new statement |
| K-atlas/#7 | Impostor's null vector at first failure is nodeless | M | #8 | Negative result, reproduced (B209); no sign-change early warning |
| K-atlas/#8 | Odd block = (N) nodeless minimiser + (C) copositivity | **P** | **#28** open | New in the record, precise; S1's surviving proposal and S2's copositivity residue |
| BG/#1 | Every monotone family has zeta as its last member | M | #30 | Proved one-liners; the frame of #30 |
| BG/#2 | BG-1: body of positive solutions; zeta at its corner | **P** | **#30** open | New in the record (two searches + mine), precise, computed (one implementation) |
| BG/#3 | What are the pole-free threshold objects? | M | #30 | Open question on #30's objects |
| BG/#4 | Odd Gamma factor carries a pole at conductor 0.99838 | M | #30 | Computed fact about #30's body |
| BG/#5 | BG-2: Deligne's amplification = variance of primes in progressions | M | #32 | Not new in substance (Barban-Davenport-Halberstam); parked by the seat |
| BG/#6 | BG-3: damping plane; critical damping d + theta | M | #30 | Known family (Hinkkanen, Lagarias, Garunkstis); same as N35 / T93 |
| BG/#7 | Linear law misses by 1.1e-6: what is the defect? | M | #30 | Open question on #30's V3 |
| BG/#8 | Kunneth amplification needs a non-circular product | M | #32 | Half-thought; obvious product circular |
| FH/#1 | FH-2: certified forcing of the first prime | M | #9 | Checked theorem (V-FH; T83); it is #9's claim certified at the first prime |
| FH/#2 | Verified zeros as the cap in the medium band | M | #2 | Heuristic spreading mechanism; kill line is #16's visibility question |
| FH/#3 | One-step extension with a non-negative new mass | M | #9 | Conjecture 'not precise yet' (seat); FH-2's Operation 2; not computed |
| FH/#4 | Leak form D_L: both pole conditions, not parity-diagonal; Q/D in [0.33, 2.5] | M | #27 | Plank 3b/6 correction and numbers (FH-3, not a foothold) |
| V-FH/#1 | Never use a rounded log 2 (bottom moves at 1e-7) | M | #2 | Numerical trap for every window script |

## Rule failures recorded (new main entries only)

"FAILS RULE" written at the start of a field, so that `ideas.py check` and `hubcheck.py` count it:
- **#28** prediction (no number fixed by the seat; the only blind numbers on the route are S1-mirror's R1-R4 for the
  first-prime bound, quoted in the field).
- **#29** prediction (none fixed before computing; I propose one for the next run in the field, for the lead to confirm).
- **#31** new input (it ends as a reformulation: Dfc(omega) = 0 is exactly a continuous Nyman-Beurling statement for
  zeta_K, notebook N52, N54).
- **#32** wall and prediction (a barrier, not a route: it measures the short-family wall).
- **#33** wall (an instrument; it places both ends of the half-shift wall F17 in one family and does not attack it).

Weaker than the rules ask, stated in the fields but not labelled: #28's inherited kill line is half vacuous (the split
is logically right, so 'both hold and the block is negative' cannot happen; a note on #28 says which half operates);
#29's continuum statement is open (T89) and grids of 24 and 48 boxes disagree; #30 rests on one float64 implementation
and nothing in it is checked by a second seat; #33's first-order statement is proved under RH on the zero side and only
formally on the prime side. Novelty for all six is "not found" in the searches listed, never "new".

Statuses: #28, #29, #30, #33 open; #31 and #32 parked (proved, but each ends at a named wall: #31 at Nyman-Beurling for
zeta_K, #32 at the copies). None is alive: no new entry has survived a kill test that it could have failed.

## Inconsistencies found in the sources (not changed, only reported)

- Titles carried verbatim that say more or less than the record now supports (the tool cannot change titles): #28
  keeps the atlas keeper's "(maybe)"; #29's title "has one sign for zeta" is computed on 13 grid rows only; #31's
  "zero exactly at RH points" is a statement given the inner-outer factorisation.
- `rh/experiments/s1_seminar/socrates/CLOSING.md` section 2 lists Theorem U' as "the new line not checked", while
  `rh/THEORY.md` T87 says checked. I used T87's status in the note on #9 and flag the difference.
- S1-curv/#5's log (box heuristic nu x mu ~ 0.01) and SP-modular's SHORT_FAMILY.md 4(a) ("the impostor is invisible
  for H >= D") were withdrawn by their authors (s1 B106; s2 B27); the notes use the corrected statements.
- The note I wrote on #26 refers to the remark in #26's evidence that the n = 8 member has zeros off its centre line;
  that remark (the round-2 auditor's) is still checked by nobody.
- `rh/FOOTHOLDS.md` FH-1 notes Zhu arXiv 2608.24827 (unrefereed) states positivity for L <= 0.8; FH-1 is "not new as a
  claim"; FH-2 is "not found". Both are only in the note on #9, not in any main field.
- The S1 closing's open items 1 (recompute S1-curv's rows against conjecture B119), 7 (the Beurling number 1.0966 of
  the first-prime lemma) and 8 (second implementation of the impostor's ladder) are still open; they bear on #28, #28
  and #27.

## What the owner should hear about

None of the following is a proof of the Riemann Hypothesis or a step known to lead to one. Four are proposals sharp
enough to compute; two are records of where a line of work stopped, kept so nobody walks it again.

1. **#28: the odd half of Weil's test, asked only on positive shapes.** Weil's energy splits into an even and an odd
   half, and the odd half alone already decides RH. For the odd half, without any prime in the window, the lowest-energy
   shape is provably positive everywhere on one side, and on such positive shapes every prime's contribution has a fixed
   good sign. So the proposal is: show the lowest shape stays positive (N), and show the energy is non-negative on
   positive shapes only (C). Example: on the window of half-width 1 the one bad term, coming from the pole, is paid 5.7%
   by the smaller window, 43% by the Gamma factor and 51% by the primes, almost all by the prime 2. What it is not: a way
   around the zero margin. On that very shape the margin is about 10^-83 of the bad term, and leaving out even the prime
   19 breaks the inequality. The proved piece (the first-prime lemma) only says the first prime must carry at least a
   computable positive weight, 20 to 40% below its true weight.

2. **#29: one test function instead of a whole matrix, for the even half.** Turn the strength of the pole like a dial:
   below a first mark the even half fails. The proposal is that one particular function, the response of the window to
   the pole, never changes sign for zeta; if so, a single function that is positive everywhere on the window certifies
   the even half (a proved bracket). Example: on the window of half-width 1 with 96 boxes the two marks are 0.999891 and
   1.000388 and the true strength, 1, sits between them. What it is not: easier to verify than positivity itself. It
   pins the weight of the prime 2 exactly as tightly, and two grids already disagree about it near the edge.

3. **#30: zeta as a corner.** Forget primes and zeros; allow any real weight on every whole number; turn a dial for the
   strength of the pole and one for the conductor, and ask for the smallest conductor at which some weights keep the
   energy non-negative. With zeta's own pole the answer is conductor 1, achieved by exactly log 2, log 3, log 2, log 5,
   0, log 7, ...; with half the pole it is 2.009; with no pole 4.036; with a pole 10% stronger no conductor was found
   that works (the computed threshold keeps rising with the window). Example of a surprise: for the odd type of smooth term the extreme object sits at conductor 2.8606, below
   the 3 of the first real character, and is not built from primes. What it is not: checked. One float program, no
   second seat; the corner statement contains RH, so it cannot be proved as it stands.

4. **#31: a non-negative function on the modular surface that vanishes where a Riemann hypothesis holds.** Average the
   logarithm of the "spectrum" of each point z with a bell-shaped weight; the excess over an explicit constant is a sum
   of penalties, one per zero off the line of that point's zeta function. Example: at z = i it was computed as
   -0.04609 against the constant -0.04612, no visible excess, as expected. What it is not: a new handle. Three
   specialists derived the same quantity three ways and it is, exactly, the Nyman-Beurling distance for the field of
   cube roots of unity; the step it needs next is the short-family wall of #32.

5. **#32: why the October 2026 method stops where it stops.** Every mean-square bound of the kind used there is
   attained exactly by the "copies" (the members of the family that are the untwisted sum itself), so in the regime
   where the family is not longer than the sum no such bound can single out the Moebius function. Example: in the
   sextic family about H^(1/6) rows are copies, so no inequality valid for all bounded sequences can go below D^2 over
   all rows, while D^(2 - delta) for the Moebius sequence alone would already give a zero-free half-plane. What it is
   not: new mathematics in kind (large-values and zero-density statements are standard), and not a route; the one open
   thread it carries is a conjectured sieve-type theorem whose best outcome would be a narrow zero-free region, not RH.

## For the lead

1. **#9 now holds the project's first checked theorem with a prime in it (FH-2), as a note.** If the owner should be able
   to say "look at the forcing theorem" by number, one `promote` of FH/#1 does it (the tool allows promoting an entry
   that carries a merge note); its fields would have to be filled first. Same for S1-mirror/#5 (first-prime lemma, now a
   note on #28) and S1-cubic/#8 (Kac-Baker tower, a note on #23).
2. **The structural line of J6 has its numbers now:** #31 (the object at omega) and #32 (the wall). The short-family
   wall itself (N53-N58) is the lead's synthesis and is still not a main idea in its own words; #32 is its proved near
   side from one seat.
3. **Statuses that are the lead's call:** #31 and #32 parked where the seats' local statuses were open; #29 open though
   it survived one separation test.
4. **Proposed predictions to confirm:** the blind number I wrote into #29's prediction field (the kappa-interval of (F)
   on the one-prime window, within a factor 10 of FH-2's weight box) is mine, not the seat's.
5. **Unread or unreached sources named in the notes:** Burnol (de Branges chain on the no-prime window, S1 open item 6),
   Lachaud 2002/2003 (toroidal forms, overlap with SP-modular's Zagier dictionary), BCR Ch. 8, Lehmer 1948 (dial
   integer case), Johns' preprint (overlap with Theorem U').
6. `docs/HUB.md`'s idea board has no #28-#33.

## Could not decide

- Whether FH/#1 (FH-2) should have its own number rather than a note on #9. I merged it by the rule used in round 2
  (a result that tests an idea goes into that idea) and because it has two homes already (T83, FOOTHOLDS.md FH-2), but it
  is the most solid item in this scope.
- Whether #28 and the first-prime lemma should be one entry or two. I kept one: the lemma is the proved case of #28's
  (N) and the only proved step towards its (C).

## Left open

- `tools/hubcheck.py`: 0 errors, 0 awaiting audit at the last run (33 ideas in the main log, 192 in local logs).
- `python3 tools/ideas.py check`: 33 ideas, 0 errors, 27 recorded rule failures.

## How it was done (reproducible, do not re-run)

`audit_lib.py.txt`, `stage1_promote.py.txt`, `stage2_merge.py.txt`, `stage3_skip.py.txt`, `stage4_rulefail.py.txt`,
`stage5_novelty.py.txt` in this folder drive `tools/ideas.py` with argument lists. Each stage ran once (marker files
`.done_stage*`; notes and promotions are not idempotent); one further note on #28 was written by hand (PROGRESS.md).
`main_numbers.json` holds the main numbers returned by the tool. `PROGRESS.md` has the plan, fixed before the first
write, and one line per tool decision. The table above was checked mechanically against the closing line of every local
entry (0 mismatches).
