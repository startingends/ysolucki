# K-theory MEMORY (rewritten at the end of session 1, 2026-11-11, after the round-2 judgement was ingested). Read this first.

## State of rh/THEORY.md
125 entries, `records.py theory check` clean. 9 formal (T27, T32, T50, T70, T106, T109, T110, T112, T114), 55 checked, 13 known,
23 proved, 23 open, 2 refuted. SIXTH BATCH: T115 checked by me (LEMMA_T115.md; +1 power restricted to |t| >= 2), T117 checked
(both directions on established entries; step 6 of Bettin-Gonek added to T116's statement).
MAIN LINE since the fourth batch: the bridge (rh/BRIDGE.md, idea #27): T99 (known base case), T100 (plank 7, checked by me),
T101 (plank 5, open: FIRST OPEN LINK), T102 (plank 6, D_L), T103 (7b/7c heuristic), T104 (8a), T105 (plank 8, the span).
FIFTH BATCH: T106-T114 copy barrier (Thms 1-3 corrected; L1-L5 formal over Q / N); T115-T121 short-family wall (bounded-height
equivalence T117, Bettin-Gonek T116, open lemma T115 cited from memory, bounded NB T118 open, Landau T119, window identity T120,
Buchstab T121); T122-T124 SP-reflection's defect function, Szego-Krein limit, NB-distance identity; T125 SP-modular's Rankin-Selberg.
How they were entered: batch files batch1..batch6 in this folder, run through `enter.py.txt`, and the stand-alone batch7_judge_readers.py.txt batch8_formal_foothold_seminar.py.txt, batch9_verdict_formal_bridge.py.txt and batch10_copy_transport.py.txt (every write goes through
`tools/records.py theory`; keys -> T numbers in keys.json; do NOT rerun old batches; for new entries append keys to PLAN in
enter.py.txt and write a new batch file, or call records.py directly). The structure is in STRUCTURE.md; the tree in tree_2026-11-11.txt.
Map: T1-T6 seeds; T7-T19 literature; T20-T24 round 1; T25 notebook N2 repaired; T26-T34 parity and inertia; T35-T42 first failure (#8);
T43-T48 bootstrap (#9); T49-T62 cubic seat (#10); T63-T69 curvature seat (#11); T70-T79 mirror (#21) and the tilt identity; T80 zero-side
formula on the form domain; T81 open converse behind wall WP1; T82-T83 foothold (computer-assisted); T84-T87 first-prime lemma and
unconditional uniqueness; T88-T90 rank-one pole algebra, candidate (F), bracket; T91-T92 SP-reflection; T93 Schur ray (N35, P3);
T94-T97 SP-operator P1, P4, P5, P6; T98 dial coefficients (idea #26).

## What I found myself (details in PROGRESS.md)
1. T3 (notebook N2) is FALSE as stated: A(s) = 2^-s + 4^-s, w = log 2 gives f = sqrt 2 + cos(t log 2). Repaired statement T25 (c_1 != 0) is
   open: N2's Phragmen-Lindelof step is a sketch. Nobody has been told except through the theory document and my report.
2. The project's normalisation of the explicit formula equals Suzuki's W(f) (constant check via -psi(1/2)); T7 is `known`.
3. Classical zero facts T8 are `known` from a TERTIARY source (Wikipedia pages, quoting fetch). Replace by a textbook when someone has one.
   T9 (Selberg, distinct zeros) from the introduction of arXiv 1306.0854 (secondary).
4. 17 short proofs checked line by line by me (C1-C17 in PROGRESS.md): those entries say `checked by: K-theory`.
5. T32 (exact inertia): now `checked` (the round-2 judge derived it independently, J18; I checked his and the seat's arguments).

## Things the next session must pick up
- FORMAL: rule = `formal` only if the formal seat reports the Lean statement as matching AND a recorded full build covers the file.
  Formal seat finished session 1: full build 01:06 UTC, 26 files, axioms audit; its MEMORY.md has a table "What is formal, by theory
  entry" (read it first). Set formal: T70 (as stated), T32, T50, T27 (statements REWRITTEN by me to the machine-checked wording:
  subspace-dimension indices, real abstract forms; the old wordings are in the notes as corollaries by Sylvester / real kernels).
  In part only (notes carry the difference): T26, T29 (Step 2), T33, T35, T44, T45, T51 (Steps 1-5 in eigenpair form), T52, T63, T64, T65,
  T74, T75, T77, T84 (finite Perron). T33's corrected wording has a Lean counterpart for every clause: ask the formal seat to confirm,
  then it can be formal. The formal seat's next targets: spectral-theorem bridge, existence of a minimiser, T34, T68.
- MY MISTAKE, keep in mind: T33's last sentence was false for the even block; I had copied it from S1-curv's F1 (a) and passed it in my
  check C3. The formal seat's file 17 caught it. Lesson: when I check a short proof, check EVERY clause of the entry I write, including
  "in particular" clauses, against small cases (here zeta at L <= 0.10, recorded in the same files).
- FOOTHOLD: T82, T83 are `checked` (V-FH verdict: verified as stated; trust base Arb / python-flint; A not new as a claim (Zhu, weaker
  constant), B's type not found). Zhu arXiv 2608.24827 has a library digest now (rh/library/2608.24827.md): not yet read by me; it may
  bear on T47 (certified bounds at L = 0.8).
- READER-3 (bombieri-2000.md, 2511.22755.md, 2112.05500.md): applied to T2, T10, T11, T29, T35, T36, T37, T38, T41, T80.
- BRIDGE: when the lead records plank outcomes in rh/BRIDGE.md, mirror them: plank 4 (second implementation), plank 5 proof and 10-digit
  check (T101), plank 7's 12-digit numerical check of (a) (not run; T100 is checked on paper only), plank 8a measurement (T104), plank 9
  (controls; no entry yet). The quantity "K_L >= 2L" in T103 is the lead's claim and was not checked by me.
- Seminar: board read in full up to B69; B81-B110 skimmed; from turns 2-3 only the posts the coordinator named (B90, B99, B103, B117, B120,
  B169, B170, B180, B181, B186) plus PROOF_first_prime.md, operator/PROOFS.md, reflection/NOTES_session1.md N4, cubic TURN3.md section 3,
  parity NOTES Q, R. NOT entered: S1-curv G2, G3; SP-reflection N3, N5-N9; S1-cubic TURN2.md; anything after B186.
- T88 (rank-one algebra): the seat's file names the method only; a written derivation or a Lean file is needed before `checked`.
- T90 (lead's bracket): I re-derived the three lines; left `proved` because the coordinator said "unchecked until a seat answers".
- DONE: rh/experiments/r2_judge/JUDGEMENT.md ingested (verdicts in `checked by`; T32 -> checked; T81 added; gaps in notes). Entries
  that are also in print keep `checked` with the citation in `source` (the tool's `known` means 'not reproved here'); if the lead
  wants `known` instead for T51, T53 (D3), T30 (2), it is one `status` command each.
- T80 is the open input under T36, T37, T39, T44 (downgraded to `proved` on 2026-11-11 after READER-1's full reading of Suzuki). If
  someone writes the proof (or finds it in Connes-Consani / CCM, digests in rh/library/), re-mark those four `checked`
  (checked by: R2-parity-ref; T44 by K-theory).
- Board s1.md was processed up to B69 in full and B81-B110 only by skimming (B81, B90, B91, B92, B99, B103, B105 used). NOT entered yet:
  S1-curv G1-G3 (S1_ADDITIONS.md, F_d versions of F2/F4), S1-cubic TURN2.md, S1-mirror's finite statements in B82 (Hankel matrix of power
  sums; the finite step of Theorem 2), anything from the specialists SP-reflection, SP-operator, and whatever came after B110.
- rh/library/ (reader seats' digests of whole papers) appeared during the session. Used: 2606.09096 (T7, T10, T80), 2511.23257 (T11, T24),
  1611.03772 and perfekt-pushnitski-helson (T19, T71, T76, T77), 2005.02996 and brs-fourier-interpolation (T18, now known), 1606.05726
  (T16, now known), johns-positive-solutions (T17 statement, T43, T44, T47, T48), branden-huh (T52, T53), rodgers-tao (T22),
  2106.01715 (T10, T80), connes-consani 2006.13771 and burnol-propagator (T1, T4). NOT yet used: miller, connes-consani-moscovici beyond
  one line, X. Zhu arXiv 2608.24827 (unread, queued by the lead: certified bounds for the lowest window eigenvalue; relevant to T47).
- Literature still `open` because no text was read: T13 Burnol (abstract only), T14 Krein, T15 Krein-Langer; T17 Johns stays open
  (read by readers, proofs unreviewed).
- Proved but not independently checked: T23, T68, T76, T77, T85, T86, T88, T90, T91, T92, T94, T95, T96, T97, T98. Proved and blocked by
  T80: T36, T37, T39, T44.
- Deliberately NOT entered (trivial or commentary): lane D pencil lemma (zero of Z_1 + lam Z_2 iff lam = -L_1/L_2); lane B closed-span
  equality and D_P(N) >= d_N; C critic's unitarity M(w)M(1-k-w) = 1; KEY_LEMMA_SHAPE S1; Hamburger's theorem (lead, B12, from memory);
  S1-cubic (M1) fibre form of B25 (mentioned in T74's note); the n = 4 dial lemma (inside T77's note); computed facts (M2, M3, sieve tables).
- Conventions I used: textbook theorems of linear algebra and analysis (Sylvester, Perron-Frobenius, Courant-Fischer, Weyl, Jensen,
  Paley-Wiener, Gauss's digamma integral, the Mellin transform of the fractional part) are background, not entries; number-theoretic and
  operator-theoretic inputs specific to zeta are entries and are `known` only if a text was fetched and quoted.
- Ideas #28-#34 linked (STRUCTURE.md Revision 4); #33 has NO entry (SP-modular NOTES D12 not entered).
- Specialists' items entered as `proved` and NOT independently checked: T122, T123, T124, T125 (each rests on theorems cited from
  memory: inner-outer factorisation, Szego-Kolmogorov-Krein, Beurling's closure theorem, Zagier's renormalisation). T117 is now checked.
- First open links (STRUCTURE.md, Revision 4): #34 -> T118 (T115 and T117 are checked); #27 MAIN LINE -> T101; #8 -> T80 (then T40/T41; no lemma using arithmetic is stated); #9 -> T47 (certification), then T46;
  #21 killed -> T6 refuted; #10 parked -> T62 (and the open T81, T89). Ideas #22-#26 are linked in `routes` (#22: T29-T31; #23: T32, T50,
  T61, T81; #24: T51, T53, T55, T65; #25: T56, T62; #26: T18, T98).
