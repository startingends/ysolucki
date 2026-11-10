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

## Answered

| id | date | answer | applied |
|---|---|---|---|
| A1 | 2026-11-10 | "The first step is to set up the infra." | infra built before any research (journal J1) |
| A2 | 2026-11-10 | The goal is a proof; never treat it as unrealistic; persevere at walls. | written into `rh/PROJECT_BRIEF.md` (Goal) and `docs/SUBAGENT_PREAMBLE.md` (rule 7) |
| A3 | 2026-11-10 | Explain interesting ideas in plain English with an example; be creative; novel testable ideas. | `plain english` is a required field in `tools/ideas.py`; preamble rules 9-10; brief updated |
