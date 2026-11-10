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
