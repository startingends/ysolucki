# Round 1 idea audit (auditor R1-AUD, 2026-11-10)

Scope: the nine round-1 local idea logs (lanes A-D, their critics, the judge). 33 local entries, every one decided.
Result: **9 promoted** (main #12-#20), **20 merged** as dated notes into main entries, **4 skipped**.
Main log before: 11 ideas. After: 20 ideas, `ideas.py check` 0 errors. No line of the main log was removed or
changed outside the tool; ideas #1-#11 received log notes only (their fields and statuses are untouched).
Nothing was committed.

Decisions: **P** promoted · **M** merged into an existing main idea (note on that idea; local entry closed with
"merged into main #K") · **S** skipped (reason in the local log).

## Every local entry

| local entry | title | decision | main # | reason (one line) |
|---|---|---|---|---|
| R1-A/#1 | A1 Prolate law | M | #2 | It is #2's first test: lowest eigenvalue law 1 - chi_4(2 pi e^(2L)); reproduced; judge: parked 2, mechanism is Connes-Consani; wall WJ2 |
| R1-A/#2 | A2 Detection height | M | #8 | Numbers exact, law fails in 10 of 20 surgery controls; judge: superseded by the two-regime law (#16) |
| R1-A/#3 | A3 One-gap reduction | **P** | **#20** killed | Not a reduction (hypothesis contains "at most one negative square" = RH by parity). Reason reusable: wall WJ3, parity-resolved negative index |
| R1-A/#4 | A4 Kicked Krein system | M | #8 | Judge: parked 1; a(L) never defined; in substance Suzuki's canonical systems (KNOWLEDGE section 7) |
| R1-A/#5 | A5 Windowed Pick/Loewner identity | M | #2 | Proved off the lattice by the critic (1e-30); a tool for the window laboratory; judge: alive 2, carries no arithmetic |
| r1_A_critic/#1 | Zero-surgery controls | **P** | **#17** alive | Judge: alive 3. Dial-an-impostor at any height and offset; critic's prediction registered first |
| r1_A_critic/#2 | Horizon lemma | **P** | **#18** killed | Judge: kill line hit (-2.48 at L = 3, quartet at 2.96 x the horizon). Reason reusable: two regimes of visibility |
| R1-B/#1 | B-1 Semilocal Nyman-Beurling | M | #14 | Judge: "fold into the missing-prime law". Object D_S and its numbers kept; headline claims dead (D_P(N) >= d_N) |
| R1-B/#2 | B-2 Second-order recipe | M | #5 | It is #5's first test; own kill line hit in the critic's run (10-13% drift per doubling); 3.55/log^2 N stands; wall WJ5 |
| R1-B/#3 | B-3 Zoomed control | M | #1 | Proved floor lemma (WJ6): the Nyman-Beurling lane cannot see the impostor below N = exp(several hundred); judge: parked 1 |
| R1-B/#4 | B-4 Heat-flow imaginary-part energy | M | #4 | It is #4's first test: every functional monotone the wrong way (WJ10); identity known (de Bruijn 1950; Ki-Kim-Lee 2009) |
| R1-critB/#1 * | C-1 Missing-prime law | **P** | **#14** testing | Judge: alive 3. One proved floor (D_S > 0), stable constant 1.10-1.17. Recorded as testing, see "Rule failures" |
| R1-critB/#2 * | C-2 No 1/log^2 N term in the optimum; zero-difference frequencies | M | #5 | Structure of #5's optimum; judge: open 2, suggestive only (resolution 1.79) |
| R1-C/#1 | C1 Fejer-window test | M | #1 | Judge: parked 2; diagonal of the Weil form, no new input; kept as the 0.2-second impostor detector; wall WJ7 |
| R1-C/#2 | C2 Prime-side Pick pencil | S | - | Judge: parked 1; counting claim false as stated; method is the Loewner framework / AAA; only an off-line zero finder |
| R1-C/#3 | C3 Shadow pairs | M | #6 | Killed (six real zeros at X = 1e6). Evidence for W1: free real-rootedness holds for the impostor too |
| R1-C/#4 | C4 Fractional-multiplicity Eisenstein series | S | - | Judge: parked 1; part 1 is de Branges-Lagarias, part 2 mis-parametrised; wall WJ8 is in the judge's list; the dial came out of it (#12) |
| r1_C_critic/#1 | Theta-power dial | **P** | **#12** alive | Judge: alive 4 (top of the round). Two implementations, off-line zeros located |
| r1_C_critic/#2 | Certified sentence S_100(t) >= 0 (critic's N2; title only) | M | #1 | Judge: open 2; the smallest provable statement for the control lab (round-2 item 5), with the judge's kill line |
| R1-D/#1 | D1 Price of a zero (Beurling rigidity) | M | #15 | Judge: open 2; stronger than RH, numerics measured deletion noise; first conjecture BR dead by Broucke-Debruyne-Revesz; wall WJ11 |
| R1-D/#2 | D2 Pencil lab | **P** | **#19** alive | Judge: alive 3. L1, reproduced digit for digit; continuous control group |
| R1-D/#3 | D3 Kernel shape is not the mechanism | M | #1 | Control-group negative result (four shape properties shared by the impostor); judge: stands, score 1; wall WJ12 |
| R1-D/#4 | Threshold law in the pencil (judge's "D7") | M | #19 | Judge: open 2; four minima fix no exponent; move the question to the dial |
| R1-D/#5 | D5 Totally positive density from Moebius | S | - | Judge: parked 1; known equivalence (Groechenig, Katkova); impostor's off-line pair invisible; untested |
| R1-D/#6 | D6 Carry deformation | M | #19 | Killed (zeros leave the line at first order, both directions). Kept as a design rule for control families |
| R1-D/#7 | Discrepancy form of the deletion cost (judge's "D4") | M | #15 | Judge: open 2; smallest statement on the D1 route (WJ11); untested; natural proof circular |
| r1_D_critic/#1 | Multiplicity dial | M | #15 | Judge: alive 2 as a control; explains D1's numbers; not a route |
| r1_D_critic/#2 | Second critical line | S | - | Judge: open 2; heuristic only, nothing computed |
| r1_judge/#1 | Two-regime visibility law | **P** | **#16** open | Judge: open 3. Corrects A2 and the horizon lemma; one implementation plus prime-side cross-check |
| r1_judge/#2 | Functional-equation-rigid dial | **P** | **#13** open | Judge: open 3. Uniqueness of the functional equation's solution does not force RH; dimension count unverified |
| r1_judge/#3 | One price list C(S) | **P** | **#15** open | Judge: open 3. Unifies lane B's fee and lane D's deletions; untested for thin infinite S |
| r1_judge/#4 * | Parity lemma / WJ13 | M | #10 | Round-2 item 4; #10 already carries the WJ13 correction; lemma, check and kill lines added there; also the "smallest" of #20 |
| r1_judge/#5 * | Two-parameter picture Lambda(n) | M | #12 | Judge's cross-link 4; conjecture "zeta is an isolated zero of Lambda"; nothing computed |

\* Entries that had no local-log entry. Captured by the auditor first (stage 1): lane B's critic had no local log at
all (created as `r1_B/critic/IDEAS_LOCAL.md`, owner `R1-critB`, from its PROGRESS.md); the two judge entries were
transcribed from verdict.json (round-2 item 4 / WJ13; cross-link 4).

## Rule failures recorded (new main entries only)

"FAILS RULE" written into a field, as the owner's rules allow:
- **#13** prediction: no number stated before computing.
- **#14** wall: it meets W1 / WJ4 and gives no reason why it would get past (judge: "still RH with a rate").
- **#15** wall (same as #14) and prediction (the judge's single-prime run has no prior prediction on record).
- **#16** prediction: computed without a prior prediction (measured -2.478). The judge names a blind prediction for
  round 2 (signs at T = 6000, 10000, 20000, 60000) but did not register values; I did not invent any.
- **#20** wall, new input, prediction (killed idea; recorded for completeness).

Not labelled as failures, but weaker than the rule asks (stated in the fields):
- **#12** prediction: the judge counts the critic's bracket n_c(40) in (1.3, 1.5) as a blind prediction that held;
  the critic's files show the bracket came from its own run at n = 1.3 and 1.5. Blind only for the judge's finer run.
- **#19** prediction: the four heights below 200 were already known from lane A; only the T = 1000 counts were blind.
- **#14** prediction: the critic predicted lower bounds (held); the constant 1.14-1.16 itself was measured. No impostor version.
- Novelty is **UNSEARCHED** for #15 and #17, and for the central object of #14 and #19; #12, #13, #16, #18 rest on
  search summaries only (no paper read in full). #13's key fact (Hecke's dimension count) is from memory plus one snippet.
- Not interval-certified: every computed number in #12-#20. One implementation only: #16/#18 (judge's wave packet;
  base value has two routes), #17 (surgery perturbation), #15 (judge's single-prime run), multiplicity dial (note on #15).
- #17 has no kill line of its own (the critic fixed none); the judge's round-2 kill lines that use it are recorded.

Status differing from the judge: **#14 is "testing", the judge said "alive"**. PROJECT_BRIEF says an idea with a
FAILS RULE field cannot be alive, and #14's wall field honestly fails. The reason is in #14's log. All other
promoted entries carry the judge's status (#12, #17, #19 alive; #13, #15, #16 open; #18, #20 killed).

Inconsistencies found in the sources (not changed, only reported; corrected values quote the judge's own files):
- Lane D's local log is numbered differently from lane D's PROGRESS.md and from the judge: local R1-D/#4 is the
  threshold law (PROGRESS and judge: "D7"), local R1-D/#7 is the discrepancy form (PROGRESS and judge: "D4").
- The judge's local entry #1 quoted +2.23 for (L = 3.2, T = 30000); JUDGEMENT.md and wavepacket.log give +1.57. #16 uses +1.57.
- Where I rewrote an agent's field before promotion (plain english for the dial, the surgery controls, the horizon
  lemma, the rigidity entry; extended claims/evidence), the agent's original text is preserved as a note in its local log.

## What the lead should look at first

1. **#14 status and the B-1 fold.** Decide whether #14 (missing-prime law) is "alive" as the judge ranked it or stays
   "testing" under the FAILS RULE rule. I folded lane B's B-1 into #14 (the judge's instruction) instead of giving it
   its own main number as the audit brief listed; one `promote` undoes that if wanted.
2. **#16 and #18 rest on one double-precision run.** The kill of the horizon lemma, and the consequence already written
   into #8 ("verified zeros to 3e12 buy windows with primes up to about a thousand, not 1e11"), need the Arb
   reproduction (round-2 item 1). Register the four-height sign prediction with values before computing it.
3. **#13's foundation is unverified.** The "unique solution for 0 < n < 8" count is from memory plus a search snippet.
   Read the dimension formula in full text before the dial is used as a uniqueness control on #9.
4. **The parity lemma** (note on #10; "smallest" of #20) is, per the judge, the cheapest fully provable conditional
   lemma on the table, and it fixes what #10's certificate would and would not prove. It is not yet proved.
5. **Older main ideas whose first tests round 1 actually ran** now carry the results as notes; their statuses are the
   lead's call: #4 (every functional monotone the wrong way, wall WJ10), #5 (kill line passed; optimum's structure
   measured), #1 (the Nyman-Beurling lane hits the lab's kill line; three new control instruments #12, #17, #19),
   #8 (A2 law replaced by #16). `docs/HUB.md`'s idea board is stale (still "22 awaiting audit", no #12-#20).

## Left open

- `tools/hubcheck.py` reports 0 errors but **12 ideas awaiting audit, all in round-2 logs** (`r2_cubic`, `r2_curv`:
  6 each when last run, both agents still writing). They appeared while this audit ran and are outside its scope
  (round 1); every round-1 log is at 0 awaiting.
- Walls WJ1-WJ13 exist only in JUDGEMENT.md / verdict.json; the main entries cite them by name. Writing them into
  `docs/HUB.md` is the lead's step.

## How it was done (reproducible, do not re-run)

`audit_lib.py.txt`, `stage1_capture.py.txt`, `stage2_promote.py.txt`, `stage3_merge_skip.py.txt` in this folder drive
`tools/ideas.py` with argument lists. Each stage ran once (marker files `.done_stage*`; notes and promotions are not
idempotent). `main_numbers.json` holds the main numbers returned by the tool.
