# Decisions

ONE queue of every open decision, each with the default in use and what changes if the owner says otherwise.
Owner answers yes / no (or a number); the lead applies it the same day and moves the item to "Answered".

## Open

| id | decision | default in use | what changes otherwise |
|---|---|---|---|
| D1 | Scope: ζ only, or also Dirichlet/automorphic L-functions and function fields? | ζ is the target; function fields and other L-functions are used as test beds and controls | a wider target changes which lanes get agents |
| D2 | Size of each seminar round | up to 9 agents per round (the session's workflow guideline); rounds repeat | a higher cap allows more lanes and more refuters per round, at more token cost |
| D3 | Model per seat | every seat inherits the session model | owner may name a model for judge / refuter seats |
| D4 | Literature | agents use web search where available; anything recalled without a source is marked "(from memory)" | owner may supply papers or forbid web access |
| D5 | Git | WIP commits pushed to `claude/eloquent-keller-2074gq`; one draft PR kept open | owner may ask for separate PRs per round |
| D6 | Long compute | jobs over ~20 min run here under `tools/memcap.py` + flock, one at a time | owner may approve separate cloud sessions for heavy jobs |

| D7 | Auditor's calls on round 1: #14 (missing-prime law) recorded as `testing`, not the judge's `alive`, because its wall field fails rule 1; lane B's prime-filtered Nyman–Beurling folded into #14 instead of getting its own number | auditor's calls accepted | owner may ask for the judge's status or a separate number |

## Answered

| id | date | answer | applied |
|---|---|---|---|
| A1 | 2026-11-10 | "The first step is to set up the infra." | infra built before any research (journal J1) |
| A2 | 2026-11-10 | The goal is a proof; never treat it as unrealistic; persevere at walls. | written into `rh/PROJECT_BRIEF.md` (Goal) and `docs/SUBAGENT_PREAMBLE.md` (rule 7) |
| A3 | 2026-11-10 | Explain interesting ideas in plain English with an example; be creative; novel testable ideas. | `plain english` is a required field in `tools/ideas.py`; preamble rules 9-10; brief updated |
| A4 | 2026-11-10 | Learn from solved cases but do not build on top of them; use them as inspiration for creativity and for how to test unusual ideas. Solving the "quasi" (an analogue or partial version) is not solving Riemann. | brief standing instructions; preamble rule 9; KNOWLEDGE section 6 (moves from solved cases). Round 1 was already running when this arrived: applied at the lead's synthesis and built into round 2. Lead's reading of "quasi": analogues, partial versions and look-alikes. |
| A5 | 2026-11-10 | The hardest part is "where do I even start": build understanding first, then branch out; note ideas and brainstorm constantly. | `rh/UNDERSTANDING.md` (chain of statements we checked ourselves + open questions Q1-Q5) and `rh/NOTEBOOK.md` (running brainstorm) created and linked from the hub |
| A6 | 2026-11-10 | Six rules: start from the wall; ban pure reformulations; work backwards from the barriers; demand a surprising prediction that differs for the impostor; novelty by search, not memory; aim for the smallest new proved statement. | Brief (section "The six rules"), preamble rule 11, five new required fields in `tools/ideas.py`. All ideas re-audited: #3 killed, #2 and #6 parked, 10 rule failures on record. `rh/KEY_LEMMA_SHAPE.md` written for rule 3. Literature access verified for rule 5. |
| A7 | 2026-11-10 | Agents must be able to add to their OWN idea log; it must not confuse other agents; afterwards an auditor keeps the most important takeaways in the main idea log. Change claude.md accordingly. | `claude.md` ("Where things live", "Agents", "Ideas log") rewritten; `tools/ideas.py` gained `init-local`, lenient local `add`, `promote`, `skip`; `tools/hubcheck.py` lists local ideas awaiting audit; preamble rule 2 and the brief's round description updated. Round 1 was launched before this, so its agents wrote ideas into PROGRESS.md; the lead transcribes those into local logs and an auditor promotes them when the round ends. |
| A8 | 2026-11-10 | Output little in chat: only very short progress updates now and then; everything goes into ideas and brainstorming; keep going. | applied from that message on |
| A9 | 2026-11-10 | Stop exploring to solve; explore only to learn; create novel ideas by carrying other fields and ideas into new ones. What remains has to come from somewhere nobody has looked, and there is no procedure for finding it. | brief rules 7 and 8; preamble; idea #10 is the first idea made under them |
