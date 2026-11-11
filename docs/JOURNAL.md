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
