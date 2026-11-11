<!-- local-idea-log owner=V-FH -->
# Local idea log of V-FH

Private working log of agent `V-FH`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `V-FH/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Trap: the window form feels the atom position at 1e-7; never use a rounded log 2
- status: open
- source: V-FH
- date: 2026-11-11
- plain english: The lowest value of the form on the window of half-width 0.54 changes from 1.08e-7 to 6.4e-8 when the prime is moved from log 2 = 0.69314718 to 0.693147, a shift of 1.8e-7. Any script that types the position as a 6-digit decimal reports a number for a different object.
- claim: COMPUTED (verifier/bottoms.py.txt): d(bottom)/dy at fixed weight is about 0.2 at L = 1/2 and 0.24 at L = 27/50; an audit of other project scripts for rounded log p is cheap and has not been done.
- log:
  - 2026-11-11: audit: not promoted: merged into main #2
