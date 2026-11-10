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
