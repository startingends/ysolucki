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

## The owner's rules (2026-11-10). Binding on every idea, every agent, and the lead.
1. **Start from the wall, not the toolbox.** Every idea names the wall it attacks (W1, W2, …; list in
   `docs/HUB.md`) and says why it will not hit the same wall. "Another look-alike with zeros on the line" is
   rejected on sight.
2. **No pure reformulations.** "RH is equivalent to X" counts only if X brings in an input the original
   did not have, and the idea names that input.
3. **Work backwards from the constraints.** Given B1–B11, what must the key lemma of any proof look like?
   Design to that shape (`rh/KEY_LEMMA_SHAPE.md`), not from what is familiar.
4. **A surprising prediction.** Each idea states a number before computing it, one that would come out
   differently for the impostor. If nothing could surprise us, the idea says nothing.
5. **Novelty by search, not memory.** "Believed new" from recall is worthless. Record the queries run, the
   sources read and how much of each was read. Literature access was verified on 2026-11-10 (web search +
   full-text fetch of arXiv). The honest end state is usually "not found in what was read".
6. **Aim for the smallest new proved statement,** not the whole thing. It is the first real sign that a
   route exists.
7. **Create; do not explore to solve.** (owner, later the same day) Exploring is for learning only: one
   big step toward understanding, then stop. The area around every approach we touched is crowded, and what
   is known there is equivalent to RH, not easier. Progress comes from making something new: taking a
   mechanism from another field and building a new object with it. A search that only rediscovers the map
   is not work on the problem.
8. **Look where nobody has looked. There is no procedure for finding it.** The easy ideas were used up over
   165 years. Do not expect a method to produce the idea; expect to have to invent. When an idea turns out
   to be known, record it and move further out, do not circle back to its neighbours.
9. **Build on what is there; real insight, not novelty for its own sake.** (owner, later the same day)
   Everything in the journal, the knowledge base and the idea log, including the paths other people have
   made, is there to help create new mathematics and make discoveries. Follow those paths far enough to
   learn from them, then make your own discovery out of what you learned. A new idea must say which
   recorded results it grows from and what it explains or uses that was not explained or used before.
   "Nobody has done this" is not a reason to do it; "this is what the record is pointing at" is.
10. **Read whole papers first; reading is not a direction.** (owner, 2026-11-11) Each run starts from the
    digests in `rh/library/` so it begins at the frontier. Reading is only for knowledge and understanding:
    do not let a paper persuade you that its road is the road, or that its topic matters because it is
    written up. Take the knowledge, then create (rules 7 to 9).
11. **The atlas and the seminar keep running.** Both sharp turns so far came from one agent questioning
    another. A round without a seminar board and an atlas pairing pass is incomplete.
These are enforced as required fields in `tools/ideas.py` (wall, new input, prediction, smallest, novelty).
A field may honestly read "FAILS RULE: …"; such ideas cannot be `alive`.

12. **Build the bridge; do not throw darts.** (owner, 2026-11-11) "We don't know exactly where the island is and
    have no idea where to start building the bridge, but when you understand more and more of the ocean you get a
    better idea of where the vicinity is, and then start building a bridge to there. This requires BUILDING the
    bridge, not just throwing darts: understanding the ocean, having a hunch and going off that hunch, and getting
    confirmation as you keep building." In practice: one hunch at a time is the project's main line; it is built in
    planks, each plank a precise statement with a confirmation (a number predicted first, a proof checked, a control
    that fails) before the next plank is laid; a failed confirmation moves or abandons the bridge, and says so.
    The record of the current bridge is `rh/BRIDGE.md`.

13. **Be abstract and take risks; fewer measurements.** (owner, 2026-11-11) "Your ideas are rediscoveries and your
    hunches are recombinations ... you need to not just regurgitate a safe and likely wrong answer, but take risks
    and be brilliant." Three working rules: (a) fewer measurements; more time on ONE structural question, such as
    "in what setting does our hard object have an exact formula?"; (b) give two specialists the SAME concrete object
    and require each to express it in its own toolkit; (c) ask of each wall "what kind of object would make this
    trivial?" and then look for that object, rather than estimating around the wall. Honesty rules are unchanged:
    a risky idea is labelled risky, and a wrong one is recorded as wrong.

14. **Two scales, work up.** (owner, 2026-11-11) Every result is rated "Quality" and "Toward RH", each out of 10,
    in `rh/RATINGS.md`. A breakthrough is 9–10 on both. Climb rung by rung; a different KIND of idea is needed to
    leave 1–2 on the second scale, not more of the current kind.

15. **Hunches built to a target; construct before measuring.** (owner, 2026-11-11) Read `rh/CORE.md` first. A new
    hunch must (i) use the Euler product, (ii) work in the bulk (resolve individual zeros, below the band edge),
    (iii) be exactly tight along colliding pairs (rule H11), (iv) survive an independent verifier, and (v) answer
    "what object would make the wall trivial?" BEFORE any measurement. The first step of a round is building an
    object; measurement comes after. One object is worked by one seat, resumed by id, for depth.

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
2. Passed through barriers B1–B11 in `docs/KNOWLEDGE.md`, in writing.
3. Run on the control group; the failing step for the counterexample is exhibited.
4. Three independent refuters with different lenses (logic / analysis estimates / "does it prove too much"),
   then a judge. Survives only if no reproduced gap remains.
5. Numerical sanity check of every intermediate inequality where one is possible.

## How work is organised: two tracks (owner, 2026-11-10)
Round 1 showed four faults: lanes anchored the agents on the known map; refuters told to default to
"wounded or refuted" killed half-formed ideas, which always look refutable; 30 to 40 minute timeboxes rewarded
finishing something safe over staying with something strange; and a judge scoring 0-10 on "chance this leads
to a theorem" ranks the weird idea low every time. So the two jobs are split.

**Creation track.** No lane, a long run, no refuter attached. Each seat keeps its own `IDEAS_LOCAL.md`.
At the end a *screen* (not a judge) asks two questions of each idea and nothing else:
1. Is it new? (by search, with queries and sources; "not found in what was read" is the usual honest answer)
2. Is it precise enough to compute? (is an object defined well enough to calculate a number from it; if not,
   exactly what is missing)
No score, no likelihood, no kill. Ideas that pass are computed next.

**Verification track.** Proofs and numbers only: independent refuters (default to wounded/refuted when
unsure) and a judge who settles disputes with evidence. Scores and kill decisions live here.
An idea enters this track only when it asserts a proof or a number.

**Audit.** After either track an idea auditor promotes the important entries from the agents' local logs to
the main log `docs/IDEAS.md` (`ideas.py promote` / `skip`). A round is not closed while
`tools/hubcheck.py` reports local ideas awaiting audit.

## Lanes (round 1 only; lanes are no longer used for creation)
- **A Positivity:** Weil explicit formula, Li coefficients, truncated Weil quadratic forms.
- **B Approximation / deformation:** Nyman–Beurling–Báez-Duarte, de Bruijn–Newman flow, Jensen polynomials.
- **C Spectral / geometric:** Hilbert–Pólya, Berry–Keating, prolate operator, scaling flow, function-field
  transplant, F₁ geometry.
- **D New structures:** anything outside A–C; the place for inventing the missing mathematics.

## Files
- Idea log: `docs/IDEAS.md` (via `tools/ideas.py`). Barrier list and facts: `docs/KNOWLEDGE.md`.
- Experiments: `rh/experiments/<id>_<slug>/` each with `PROGRESS.md`. Large data: `rh/data/` (gitignored).
- Shared numerics: `tools/rhlib.py` (tested). Live state: `rh/RESUME_HERE.md`.
