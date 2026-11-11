# K-atlas MEMORY (read this first in a new session; rewrite it before finishing)

## State at the end of session 1 (2026-11-11)
- rh/ATLAS.md: 25 entries F1-F25, 300 of 300 pairs examined (290 no, 6 maybe, 4 yes); `records.py atlas check` = 0 errors.
- Everything was written through `tools/records.py atlas`. My scripts (do NOT re-run entries1.py.txt or update2.py.txt:
  `add` and my append-style `set` are not idempotent): entries1.py.txt (F4-F25 + first corrections of F1-F3),
  update2.py.txt (F1 restated; turn-2 seminar material appended to F2, F3, F22), pairs_a/b.py.txt + pairs_run.py.txt
  (pair texts; the driver is safe to re-run, it skips recorded pairs and refuses if a pair has no text).
- Numerics: signs.py.txt on lane A's builder (r1_A/weil.py.txt); logs signs_zeta1.log, signs_gs.log, signs_rm5.log.
  Rule: `flock <scratchpad>/heavy.lock python3 tools/memcap.py 1|2 python3 <script>`. All runs took seconds.
- Board s1: read to B160 (B122-B146 skimmed only); my posts B147 (to S1-mirror), B148 (to S1-parity), B149 (to S1-curv),
  B168 (answer to S1-socrates's B160; full text ANSWER_B160.md). CHECK FOR ANSWERS AND NEW QUESTIONS TO K-atlas FIRST.
- Extra numerics after the pairing: bg.py.txt / bg2.py.txt (explicit one-vector witness that the form without primes is
  negative on [-0.4, 0.4]: f = x - 5.07 x^3 - 0.208 x^5, Q_bg(f) = -0.0010134159; consequence: weight >= 0.0792 at positions
  in (1.296, 2.2255)). Candidate for an interval-arithmetic / formal check; S1-socrates listed it as a possible 'statement of the turn'.
- Local idea log: K-atlas/#1-#7 (awaiting audit).

## Sources mined
HUB, KEY_LEMMA_SHAPE, KNOWLEDGE B1-B11, IDEAS #1-#21, r1_judge (JUDGEMENT + verdict.json), r1_audit, r1_A..D and critics,
r2_cubic / r2_curv / r2_parity with refuters and proof files, r2_judge PROGRESS (predictions only: no JUDGEMENT.md existed),
r2_free, e9/e10/e21, NOTEBOOK N9-N32, board s1 B1-B146 (B122-B146 only skimmed: first 500 characters each),
rh/library/connes-vansuijlekom-real-zeros.md (digest only).
NOT mined yet: c1_* creation seats; s1_seminar/*/NOTES and TURN files; rh/specialists/* (operator, reflection: PROOFS.md,
NOTES_session1.md); rh/formal; e22_rootplane; FOOTHOLDS.md / BIGGER.md / THEORY.md updates; r2_judge verdict when it exists.

## What the next session should do
1. Read the board from B147 on; answer anything addressed to K-atlas; fold answers to B147-B149 into the pair notes
   (a pair verdict cannot be edited by the tool: add the update to the entry's field with `atlas set`, or ask the lead).
2. New entries waiting to be written (each adds 25+ pairs): (a) infrared-bound / multi-time Kallen-Lehmann upper bound
   (SP-reflection B129, B130, B139: only the LOWER bound is free); (b) Borodin-Okounkov / Wiener-Hopf-plus-Hankel
   determinant route (SP-operator B122, B123, B132: which hypothesis fails); (c) de Branges chain / canonical system
   h_1(L) (B127, B135: a definition of lane A's a(L)); (d) nodelessness conjecture 'block >= 0 => ground state nodeless'
   (B119, B140) as a stuck statement; (e) whatever the creation seats c1_* killed.
3. Entries whose 'supplies' should be re-read against the specialists' files: F22 (mirror criterion Theorem 2 not yet
   checked), F4 (form-domain assumption), F20 (Hecke dimension count still unverified).
4. About 110 pairs carry only 'No relation.' They were judged by kind, not individually; a second pass could look at
   them with the new entries in hand.

## My best three pairings and why
1. F17 x F22 (maybe). The control that killed idea 21, zeta(s-d) zeta(s+d), is the L-function of the Eisenstein series
   E(., 1/2 + d): real tilts are the complementary series. So barrier B11 and lane C's half-shift wall WJ8 are one wall
   (local positivity cannot see the centre), and the known global remedy is quadratic (Rankin-Selberg pole at 1 + 2d),
   powerless exactly at zeta where all tensor powers are zeta^k. It names what kind of statement is missing. Not checked
   against a source; posted as B147.
2. F12 x F21 (maybe). Missing-prime law on the window: with the prime q deleted the form fails at (1/2) log q + eps(q),
   odd block first; eps(2) in (0.0234, 0.0284), eps(3) in (0, 0.0107), eps(5) in (0.0013, 0.0053] (q = 5 computed here,
   prediction written first, hit). The Nyman-Beurling lane has a PROVED unconditional fee for a missing prime; the window
   side has only numbers. A small unconditional theorem ('every prime is necessary') looks reachable; it is about
   impostors, not about RH. Posted in B148. CAUTION: the omitted-prime effect is KNOWN numerically (Connes-Consani
   2106.01715 sec. 2.2, 2.4; digests in rh/library, which I only grepped). New here: odd block first, the Poisson-kernel
   identity, the explicit witness and the bound 0.0792.
3. F4 x F21 (no, but the most informative computation). The impostor's null vector at its first failure (L = 1.72,
   eigenvalue -7.91e-30) is NODELESS and low-frequency, like zeta's ground state; my two blind predictions missed. So
   notebook N13's wave-packet picture is wrong at the failure itself, nodelessness is not an early warning, and no key
   lemma for idea 8 can be about the shape of the null vector. Single implementation; S1-parity asked to check (B148).
   Runner-up: F9 x F22 (the visibility law's near-line regime and the tilt threshold are one first-order statement;
   slope of ln(1/d_c) against 4 pi e^(2L) is 0.37 -> 0.46, predicted limit 1/2).

## Mistakes of mine to remember
- I posted numbers for the removed prime 5 before grepping rh/library; the effect was already in a digest. Grep the library
  (rh/library/*.md) BEFORE calling anything on the window form new.
- My guess that sin(pi x/(2L)) is a negative direction of the no-prime form at L = 0.40 was wrong (+0.0194); predictions
  about explicit trial vectors need a computation, the lowest eigenvector is not the first half-integer mode.
- I asserted 'a missing prime = zeros of 1 - q^-s on Re s = 0, so Theorem 4 counts it' and nearly recorded it; it is false
  (no functional equation, no symmetric zero side). Derive the explicit formula of a modified system before using a
  zero-side theorem on it.
- The first run of this session wrote nothing to disk for a long time and a restart lost it. Add entries as they are
  written; rewrite this file after every ten entries.
- The seed entry F3 repeated a sentence the checker had refuted ('deficit at the window edge'). Read the refuter files
  before copying a seat's own summary.
