# r1_audit PROGRESS (idea auditor R1-AUD, round 1)

Role: go through every round-1 local idea log, decide promote / merge / skip for each entry, keep the main log
`docs/IDEAS.md` to the most important takeaways. No commits. Edits only through `tools/ideas.py`.

## Log
- Read: claude.md "Ideas log", rh/PROJECT_BRIEF.md (rules 1-8), docs/IDEAS.md (#1-#11), docs/HUB.md (W1, W2),
  r1_judge/JUDGEMENT.md + verdict.json, all 8 local logs, all proposer and critic PROGRESS.md files,
  judge logs (wavepacket.log, thetadial.log, missing_prime.log), critic logs surgery.log, garbage.log.
- Backup of docs/IDEAS.md and the 8 local logs taken to the session scratchpad before any edit.
- Start state: hubcheck 11 main ideas, 29 local, 29 awaiting audit, 0 errors.
- Found: lane B critic has no local log (ideas C-1, C-2 only in its PROGRESS.md). Judge's parity lemma
  (round-2 item 4 / WJ13) and two-parameter picture (cross-link 4) have no local entry.
- Found: lane D's local log numbers differ from lane D's PROGRESS and from the judge:
  R1-D/#4 = "Threshold law" (PROGRESS and judge call it D7); R1-D/#7 = "Discrepancy" (PROGRESS and judge: D4).
- Found: judge's local entry #1 quotes +2.23 for (L=3.2, T=30000); JUDGEMENT.md and wavepacket.log say +1.57.

## Plan (decisions fixed before running the tool)
Promote 9 (in this order, main numbers 12..20): theta dial; FE-rigid dial; missing-prime law (lane B's B-1 folded in,
as the judge directs); one price list C(S); two-regime visibility law; zero-surgery controls; horizon lemma (killed);
pencil lab; A3 one-gap reduction (killed).
Merge 20 into existing or new main entries; skip 4. Details in AUDIT.md.

## Done (22:40-22:47 UTC)
- Stage 1: created r1_B/critic/IDEAS_LOCAL.md (R1-critB) with C-1, C-2; added r1_judge/#4 (parity lemma), #5 (Lambda(n) picture).
- Stage 2: 9 promotions -> main #12 dial (alive), #13 rigid dial (open), #14 missing-prime law (testing; judge: alive),
  #15 price list (open), #16 two-regime law (open), #17 zero surgery (alive), #18 horizon lemma (killed),
  #19 pencil lab (alive), #20 A3 one-gap reduction (killed).
- Stage 3: 20 merges (notes on #1, #2, #4, #5, #6, #8, #10, #12, #14, #15, #19), 4 skips.
- Verified: main log diff against the backup has 0 removed lines; 20 "MERGED from" notes present; every round-1
  local entry carries a decision; `ideas.py check` 0 errors; hubcheck 0 errors.
- hubcheck still lists round-2 logs (r2_cubic, r2_curv) as awaiting audit: they are live and out of scope.
- AUDIT.md written. Nothing committed.
