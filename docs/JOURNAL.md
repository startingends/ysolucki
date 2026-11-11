# Journal

Append-only. One entry per finished job: date, what was done, decisions, useful facts.
Newest at the bottom. Lead only. No secrets. Unconfirmed leads go to IDEAS.md, not here.

---

## 2026-11-10 · J1 · Infrastructure set up
- Built the hub (`docs/`), the project folder (`rh/`), the shared numerics (`tools/rhlib.py`), the idea-log
  tool (`tools/ideas.py`), the consistency check (`tools/hubcheck.py`) and the memory cap (`tools/memcap.py`).
- Backlog recheck: repo was empty (two commits, template only), so nothing had been done before.
- Decisions taken by default are listed in `docs/DECISIONS.md`.
- Useful facts: python-flint (Arb) gives zeta zeros far faster than mpmath (`flint.acb.zeta_zeros`);
  mpmath is kept as the independent cross-check in the tests.
- The test suite caught one wrong number on its first run: lambda_3 recalled from memory as 0.2076389248;
  three independent computations give 0.2076389205543. Corrected in KNOWLEDGE.md. Lesson kept as a rule:
  no recalled constant is trusted until reproduced.
- Suite: 16 tests pass (`python3 -m pytest tests -q`); `tools/hubcheck.py` reports 0 errors.

## 2026-11-10 · J2 · Round 1 seminar (9 agents: 4 proposers, 4 critics, 1 judge)
- Outcome in the judge's words: "Round 1 produced good measuring instruments and no route to a proof."
  Every number a critic rechecked reproduced. Nothing is above L1; nothing is a step toward L4.
- Launched before the owner's rules 1-8 existed; its agents wrote ideas into PROGRESS.md. Those were
  transcribed into per-agent local logs and are being audited (agent R1-AUD) for promotion to the main log.
- Instruments that survived (judge's ranking, 0-10): theta-power dial 4 (a family through zeta itself with
  a unique functional equation and off-line zeros at n = 1.4); missing-prime law 3; two-regime visibility
  law 3; pencil lab 3; zero-surgery controls 3.
- Refuted or killed: horizon lemma (judge built a counterexample), one-gap reduction A3 (hypothesis already
  contains RH), shadow pairs, carry deformation.
- Corrections to the lead's own work, applied the same day: idea #8's detection law holds only near the
  line (two regimes); idea #10's "one positive eigenvalue" is weaker than RH by one quartet (wall WJ13);
  KEY_LEMMA_SHAPE step S1 does not apply to zeta as written.
- Walls recorded by the judge: WJ1-WJ13 (`rh/experiments/r1_judge/verdict.json`, JUDGEMENT.md).
- Useful facts: Arb midpoint arithmetic at 400-1400 bits was needed (lowest eigenvalue 4e-167 at L = 1.75);
  one numpy job was killed for memory, since then every job runs under tools/memcap.py.
- Cost: about 2.0 million subagent tokens, 131 minutes wall-clock.

## 2026-11-10 · J3 · Lead's own work during round 1
- Owner's rules 1-8 adopted and enforced in `tools/ideas.py`; per-agent local idea logs with audit and
  promotion added (claude.md changed at the owner's request).
- Literature access verified. Found already known: window positivity and its lowest eigenvalue (Yoshida
  1992, Suzuki 2026, Connes-van Suijlekom 2025), canonical-system restatement (Suzuki 2021), positive
  solutions of the explicit formula (Johns, unreviewed preprint, Oct 2026).
- Ideas #8-#11 recorded. 13 blind predictions made, 10 hit, 3 missed on size; two of the hits had a wrong
  stated reason. All unreviewed, single implementation.
- Computed facts worth keeping (unreviewed): positivity on a window pins each von Mangoldt weight as the
  integer enters (2 to 10 digits for n = 2..13); with one free atom, positivity is possible only at
  position 2.000 (1.994 and 2.014 fail); primes - arch has exactly one positive eigenvalue on windows up to
  L = 1.25; the Gamma factor and pole alone turn negative at L about 0.362.

## 2026-11-11 · J4 · Whole papers read; round-2 proofs and numbers judged; what in our record was wrong

**Readers** (four seats, two by the lead's mistake after a restart; the double readings agree). Read whole:
Johns Part I + N3, Suzuki 2606.09096, Connes–van Suijlekom 2511.23257, Connes–Consani 2106.01715 and 2006.13771,
Connes–Consani–Moscovici 2310.18423, Burnol math/9809119, Perfekt–Pushnitski 1611.03772,
Bondarenko–Radchenko–Seip 2005.02996, Rodgers–Tao 1801.05914, Miller math/0112196; Brändén–Huh in part.
Digests: `rh/library/`. What changed in the record (details as dated notes on the ideas named):
- **Already published, which we had as ours:** positions forced and "the form goes negative if a prime's term is
  omitted" (numerics, Connes–Consani 2106.01715 §2.2–2.3; ideas #9, #10c); the lattice Loewner identity
  (2511.23257 Prop. 4.1; idea #2); the explanation of the tiny eigenvalues (2106.01715 §3); the heat-flow monotone
  quantities (Rodgers–Tao Lemma 12; idea #4); Lemma B (Brändén–Leake Lemma 2.8) and Lemma D3 (Brändén–Huh
  Lemma 2.15); the theta-dial dimension count (BRS Prop. 3.1; idea #13); the mirror criterion for a, b ≥ 1
  (Perfekt–Pushnitski Thm 3.3 and older; idea #21).
- **Wrong in our record:** "window positivity published up to log 100" (nothing is proved for any window that
  contains a prime; proved range is λ² ≤ 2); "Connes–Consani 2021 / CCM 2022 prove archimedean positivity via the
  prolate operator" (the theorem is 2006.13771, on the no-prime window); Burnol row; Johns title and the
  "ladder ending at RH" line; atlas F1's "real zeros for free" (needs a simple isolated even lowest eigenvalue).
- **Still only ours after all of this:** intervals for the weights on a finite window and the sieve's room law;
  every impostor/control computation; the twisted control F_d and barrier B11; the a, b ≥ 2 mirror criterion;
  Lemma C (certificates are vacuous); Theorem F (Bakry–Émery cubic). None of these is a step towards RH yet.
- **Unread and directly relevant:** X. Zhu, arXiv 2608.24827 (certified bounds and a decay law for the lowest
  window eigenvalue). Queued first.

**Round 2, verification track** (`rh/experiments/r2_judge/JUDGEMENT.md`; proofs and numbers only). Proved and
checked by the judge: Lemmas A–E, Theorem F (cubic seat); Theorems B–E (curvature seat); parity lemma,
Proposition 3, Theorem 4 (negative squares of the window form ≤ number of off-line zeros, ≤ half of it per
parity block, attained for large windows), Corollaries C1, C3, first-failure template, Theorem U (parity seat).
Gaps found: Theorem A's use of λ₁ > 0 (false for L ≤ 0.10); "cannot be improved by linear algebra" (C2);
"false on every single window" (Theorem U's scope); the CD(ρ, n) sentence is wrong as written.
**Nothing earned ladder level L2 or L3.** Nearest: Corollary C1 ("at most one negative square on every window"
⟺ RH) and the per-block count of Theorem 4, both waiting on Yoshida 1992 and Bombieri 2000.
Prediction record: cubic 5 of 13, curvature 7 of 14, parity 5 of 11 hit; only some can be shown to precede
their results (one git commit separates them).

**Lead's computation e22** (`rh/experiments/e22_rootplane/`): two of three blind predictions missed. A window pins
each atom at a rate set by how long it has been inside; tilting one prime alone is caught ten times earlier than
tilting everything together (F_d).

## 2026-11-11 · J5 · The bridge (owner's rule 12): one hunch, built in planks

**The owner's instruction.** Stop throwing darts; understand the ocean, form a hunch, build towards it and get
confirmation at every step. The main line is now `rh/BRIDGE.md`; seats are assigned to planks.

**The hunch (idea #27).** The Weil form on a window is comparable, up to a constant factor, to the least
band-limiting leak of a companion function. Then positivity is free and the statement has a constant factor of room.

**Confirmations so far** (experiment e27, four rounds, every prediction committed to git before its run; 7 of 9 hit):
the whole ladder of small eigenvalues follows the leak sizes with ratios of order 1 (index rule mis-predicted);
the explicit vectors are near-null within 10–41% from 1e-6 to 1e-29; at form level the ratio stays between 0.2 and
4.6 on four rungs per parity; a three-line change of variable (Möbius inversion) removes the primes from the
window form; a diagonal model then gives the comparison constant as ζ(2)(2L + 0.43) per unit of leak, which matches
the measured constant to 61–91% and predicts the drift of the law's constant at five larger windows to within
0.1 in the logarithm against an outside author's certified bounds.
**Where it is hard, exactly:** the tail form has a large null space, so only the least-leak representative can
satisfy a lower bound, and on it the cross terms between dilates are not controlled. If they are bounded by a
constant times the leak, the constant loses against 2L on large windows and small windows are a finite certified
computation. Whether they are bounded is the next measurement.

**Other results of these hours.**
- Foothold theorems FH-1, FH-2 **verified** by an independent verifier (first checked unconditional statements of
  the project about windows containing a prime; FH-1 is contained in an unrefereed 2026 claim, FH-2 was not found).
- Lean: 26 files, full build passes, no sorry; it found a false sentence in a lemma two human-style checks had
  passed (T33). Theory document: 98 entries.
- Seminar S1, turn 3: first-prime lemma (two seats independently); candidate (F) and the lead's pointwise bracket
  (checked by a seat; (F) is not the even inequality in disguise and is as weight-sensitive as positivity).
- Atlas: 30 failures, 435 pairs; one pairing where a missing sign is supplied (one-signed minimiser ⇒ the prime
  mirror term is non-negative term by term).
- Bigger-statement seat: the body of positive solutions on the integers, with zeta at a corner of the
  (pole weight, conductor) plane; near-linear law log q*(r) = 1.39532 (1 − r). Unreviewed, one implementation.
- Readers: Connes–Consani–Moscovici 2511.22755, Bombieri 2000, Connes–Moscovici 2112.05500 read whole. Already in
  print, which we had as ours: monotonicity of the lowest eigenvalue in the window (Bombieri Thm 5; CCM (3.27));
  attainment of the infimum (Bombieri Thm 3); the per-block count of negative squares for FINITE zero sets
  (Bombieri Thm 9); zeros of the minimiser's transform reproducing zeta's zeros (CCM §6); the lowest eigenvalue
  tracking 1 − χ₄ (CCM Fig. 4); the fake-zero experiment (Bombieri §13).
- Creation seats: refused by the model's safeguard; not relaunched (decisions D10, A19).

## 2026-11-11 · J6 · Structural mode (owner's rule 13): one object, three toolkits, one wall

After the owner asked for abstraction and risk over measurement, the lead stopped measurement jobs and gave the
same concrete objects to several specialists at once (notebook N43–N56, `rh/HUNCHES.md` F1–F5, the specialists'
`OBJECT_PHI.md` and `SHORT_FAMILY.md`). What came out, in order:
- Where a zero of ζ_K (K = ℚ(√−3)) is an actual object: a node at the CM point ω of the Eisenstein family. Three
  toolkits, independently: positivity and self-adjointness see only |Φ| on the line, which impostors share; RH_K is
  a PHASE statement (outerness = minimum phase = cyclicity; −log of the cyclicity angle = the Jensen defect Dfc,
  derived three ways). Most of the operator side is in print (Colin de Verdière 1982–83, Bombieri–Garrett 2020).
- Rule H9 (found here): an identity linear in the object whose zeros are sought returns the zero and nothing more.
- The quasi-RH method outputs (1 + κ)/2 from an auxiliary moment exponent κ, so any "individual sum by a family mean
  square" argument loses a square root; the amplifier formula 1 − δ/2 (copies of density H^δ) explains 11/12 and a
  3/4 cap for algebraic copies; δ = 1 is Bagchi's strong recurrence (⟺ RH). (Heuristic; unsearched.)
- A Wiener–Hopf determinant at ω (SP-reflection) is the first loss-free sign-sensitive object found; the operator
  seat showed it is Balazard–Saias–Yor / Nyman–Beurling for ζ_K (prediction N51 hit); the positivity seat reached the
  same conclusion independently.
- **One wall, reached by four routes:** a Möbius-specific mean square in the regime where the family of twists is not
  longer than the sum (equivalently a mollified second moment with mollifier longer than the square root of the
  height; equivalently RH ⟺ boundedness of the Möbius Nyman–Beurling approximants). The October 2026 proof works on
  the other side (family longer than the sum); the impostor is invisible there and excluded exactly in the short
  regime; the extremal direction of every mean-square bound there is the trivial twist; the Möbius side has no
  duality of its own. Candidate exact formula: a Kuznetsov formula on the cubic cover (being read).
- Killed or reduced on the way: Hunch 2 (positivity as a norm through the cubic theta; the fake has the same kernel
  structure); the Bohr lift and the Hecke module of δ_ω (both linear); the theta-kernel route (killed by the fake);
  Hunch 1's polynomial doubling law (doubling is quadratic and needs root size, not the functional equation).
None of this is a proof of RH or a step that is known to lead to one. It is a map of where the difficulty is.
