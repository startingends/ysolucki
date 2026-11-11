# RESUME HERE

## State at 2026-11-11 02:10 UTC (read this first after a context summary or a restart)
1. Read `docs/HUB.md` ("The bridge" and "Running jobs"), `rh/BRIDGE.md`, `docs/DECISIONS.md` (Answered A18–A21,
   open D9–D10) and `git log -8`. The record is the memory; do not redo what it says is done.
2. The owner's standing goal (A18): keep working until there is a breakthrough big enough to prove RH; never claim
   one that does not exist. Rule 12 (A20): build ONE bridge from a hunch, plank by plank, each plank confirmed.
3. Bridge 1 (idea #27, Weil form against the band-limiting leak) is BUILT AND ENDED: it explains the tiny
   eigenvalues but the impostor shares all of it; RH is decided in the bulk below the band edge 2π e^(2L).
4. The owner pointed to the October 2026 quasi-RH proof (A21). READER-4 is reading it whole; notebook N42 has a
   second-hand summary of its mechanism (Möbius sums in a family of sextic twists, amplifier by copies, cubic Gauss
   sums / Kubota theta). The next bridge, if any, is to be laid from that understanding plus bridge 1's conclusion.
   No bridge 2 hunch is formulated yet; do not invent one without a confirmation plan.
5. Do NOT relaunch the creation seats (D10, A19). Chat replies stay very short.


_Last updated: 2026-11-10, after round 1 (journal J2, J3)._

## Read this first after a context summary or a restart
`docs/HUB.md` section "Running jobs", `docs/DECISIONS.md` (the Answered table is the record of every owner
instruction and what was done about it), and `git log -8`. On 2026-11-10 the lead lost sight of work it had
already done (a creation run already launched, an owner instruction already recorded) after a context
summary, and began to redo it. Nothing was launched twice, but one verifier was restarted twice.

## Where we are
- No proof. Nothing new proved. Round 1 gave instruments and controls, not a route (judge's verdict).
- The owner's rules 1-8 are in `rh/PROJECT_BRIEF.md`. The two that decide what happens next:
  rule 7 (create, do not explore to solve) and rule 8 (look where nobody has looked; no procedure).
- Live created ideas: #10 (arithmetic Lorentzian geometry: the form primes - arch has non-negative
  off-diagonal kernel; target = the two parity-block inequalities, to be certified link by link) and
  #11 (the same form as the spectral gap of a prime jump process; curvature tools). Both need one invented
  object: a statement about THREE scales at once (notebook N30). Neither has been tested beyond checks that
  RH-type positivity already implies.
- Supporting, partly known: #8 (first-failure window), #9 (positivity forces primes and their positions).
- Controls available: Davenport-Heilbronn (`tools/controls.py`), Beurling shift (2 -> 2.1), zero surgery,
  the theta-power dial (round 1), all in `rh/experiments/`.

## Next steps, in order
1. Finish the audit of round-1 local idea logs (`python3 tools/hubcheck.py` must show 0 awaiting audit).
2. Round 2, briefed with rules 1-8 and per-agent local logs. It is a creation round, not a survey:
   - invent the cubic object for #10 (search for a non-negative 3-tensor certificate on a small
     discretised window; look at its shape; try chains in the divisibility order and mixed volumes);
   - compute the curvature (Bakry-Emery, Ollivier) of the prime jump process of #11, with the impostor,
     the Beurling shift and the dial as controls; search the literature for #11 first (it is unsearched);
   - prove the parity lemma (judge's round-2 item: exact relation between signature and RH);
   - one or two free seats whose only brief is rule 8.
3. Reproduce the lead's single-implementation numbers (#9 sieve, #10 tests) with a second implementation
   before anything is called L1.

## Setup for a fresh container
    pip install -r requirements.txt
    python3 -m pytest tests -q && python3 tools/hubcheck.py
`rh/data/` is gitignored; `tools/rhlib.zeros(n)` rebuilds its cache on demand.

## Open questions for the owner
See `docs/DECISIONS.md` (D1-D6 on defaults).
