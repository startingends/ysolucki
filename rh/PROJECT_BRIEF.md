# PROJECT BRIEF: Riemann Hypothesis

Current truth for the project. Agents never edit this file; proposals go in `BRIEF_PROPOSALS.md`.

## Goal
Prove the Riemann Hypothesis: every nontrivial zero of ζ(s) has real part 1/2.
The goal is fixed. Ideas are disposable; a wall is a reason to regroup at the hub, not to stop.

## The request, restated (owner, 2026-11-10)
Make a breakthrough on RH with a team that constantly discusses and brainstorms, records every idea,
explores freely (a new field of mathematics is in scope), makes concrete progress, and when it hits a wall
steps back to the recorded ideas, brainstorms, and keeps going. The ideas log is the hub.
Owner's standing instructions:
- Do not treat the goal as unrealistic; persevere.
- Be creative and think outside the box: novel, real, testable ideas, not restatements.
- Learn from solved cases, but do not build on top of them. Study them for the *move* (how the solver got
  creative, how a strange idea was tested), not as a foundation to extend. Solving an analogue, a partial
  ("quasi") version or a look-alike is not solving RH and is never reported as progress toward L4 by itself.
- Explain each interesting idea to the owner in plain English with an example; the owner may answer with
  insights or direction, which are recorded in the idea's log and acted on.

## The six rules (owner, 2026-11-10). Binding on every idea, every agent, and the lead.
1. **Start from the wall, not the toolbox.** Every idea names the wall it attacks (W1, W2, …; list in
   `docs/HUB.md`) and says why it will not hit the same wall. "Another look-alike with zeros on the line" is
   rejected on sight.
2. **No pure reformulations.** "RH is equivalent to X" counts only if X brings in an input the original
   did not have, and the idea names that input.
3. **Work backwards from the constraints.** Given B1–B10, what must the key lemma of any proof look like?
   Design to that shape (`rh/KEY_LEMMA_SHAPE.md`), not from what is familiar.
4. **A surprising prediction.** Each idea states a number before computing it, one that would come out
   differently for the impostor. If nothing could surprise us, the idea says nothing.
5. **Novelty by search, not memory.** "Believed new" from recall is worthless. Record the queries run, the
   sources read and how much of each was read. Literature access was verified on 2026-11-10 (web search +
   full-text fetch of arXiv). The honest end state is usually "not found in what was read".
6. **Aim for the smallest new proved statement,** not the whole thing. It is the first real sign that a
   route exists.
These are enforced as required fields in `tools/ideas.py` (wall, new input, prediction, smallest, novelty).
A field may honestly read "FAILS RULE: …"; such ideas cannot be `alive`.

### The deeper version
- *What a top professional would do that wasn't asked:* keep a barrier list and test every idea against known
  counterexamples before investing in it; build the numerical laboratory first; demand that each route says
  exactly where the Euler product enters; look for the weakest new unconditional statement on the route,
  because a proof of RH will pass through new unconditional theorems long before it arrives.
- *Rawest input:* the zeros themselves (Arb, rigorous), the primes, the explicit formula linking them, and the
  counterexample functions (Davenport–Heilbronn, Epstein) as a control group.
- *Methods:* analytic number theory, operator theory / noncommutative geometry, the function-field analogy,
  random-matrix heuristics as a guide, rigorous interval arithmetic for any computed inequality.
- *Outside check:* (1) the control group: an argument that also "works" on Davenport–Heilbronn is wrong;
  (2) independent refuters; (3) reproduction of every number by a second implementation;
  (4) formal verification of any lemma the route rests on.

## Ladder of results (what counts as progress)
| level | meaning |
|---|---|
| L0 | idea recorded with a plain-English explanation, a testable claim, first test, kill line |
| L1 | computed evidence, reproduced by a second implementation |
| L2 | a conditional lemma, fully proved ("if X then RH", X strictly weaker-looking or new) |
| L3 | a new unconditional theorem on the route, however small |
| L4 | RH |
Every claim carries its level. Nothing is reported above the level it has earned.

## Standard for a claimed proof (any step at L2 or above)
1. Written out in full, every inequality with its constants.
2. Passed through barriers B1–B10 in `docs/KNOWLEDGE.md`, in writing.
3. Run on the control group; the failing step for the counterexample is exhibited.
4. Three independent refuters with different lenses (logic / analysis estimates / "does it prove too much"),
   then a judge. Survives only if no reproduced gap remains.
5. Numerical sanity check of every intermediate inequality where one is possible.

## How a round works (seminar)
proposers (parallel, one lane each, each keeping its own `IDEAS_LOCAL.md`) → critics who try to refute (own
local logs too) → judge ranks and names the next experiments → **idea auditor** goes through every local log
and PROGRESS.md and promotes the important entries to the main log `docs/IDEAS.md` (checking each against
the six rules; `ideas.py promote` / `skip`) → lead runs or assigns the tests and updates the hub.
A round is not closed while `tools/hubcheck.py` reports local ideas awaiting audit.
After each round the lead writes the wall(s) hit into the main log and the next round starts from it.

## Lanes (round 1)
- **A Positivity:** Weil explicit formula, Li coefficients, truncated Weil quadratic forms.
- **B Approximation / deformation:** Nyman–Beurling–Báez-Duarte, de Bruijn–Newman flow, Jensen polynomials.
- **C Spectral / geometric:** Hilbert–Pólya, Berry–Keating, prolate operator, scaling flow, function-field
  transplant, F₁ geometry.
- **D New structures:** anything outside A–C; the place for inventing the missing mathematics.

## Files
- Idea log: `docs/IDEAS.md` (via `tools/ideas.py`). Barrier list and facts: `docs/KNOWLEDGE.md`.
- Experiments: `rh/experiments/<id>_<slug>/` each with `PROGRESS.md`. Large data: `rh/data/` (gitignored).
- Shared numerics: `tools/rhlib.py` (tested). Live state: `rh/RESUME_HERE.md`.
