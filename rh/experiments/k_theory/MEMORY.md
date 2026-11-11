# K-theory MEMORY (rewritten at the end of session 1, 2026-11-11 00:36 UTC). Read this first.

## State of rh/THEORY.md
80 entries, `records.py theory check` clean. 43 checked, 9 known, 9 proved, 17 open, 2 refuted, 0 formal.
How they were entered: batch files batch1..batch6 in this folder, run through `enter.py.txt` (every write goes through
`tools/records.py theory`; keys -> T numbers in keys.json; do NOT rerun old batches; for new entries append keys to PLAN in
enter.py.txt and write a new batch file, or call records.py directly). The structure is in STRUCTURE.md; the tree in tree_2026-11-11.txt.
Map: T1-T6 seeds; T7-T19 literature; T20-T24 round 1; T25 notebook N2 repaired; T26-T34 parity and inertia; T35-T42 first failure (#8);
T43-T48 bootstrap (#9); T49-T62 cubic seat (#10); T63-T69 curvature seat (#11); T70-T79 mirror (#21) and the tilt identity; T80 zero-side
formula on the form domain.

## What I found myself (details in PROGRESS.md)
1. T3 (notebook N2) is FALSE as stated: A(s) = 2^-s + 4^-s, w = log 2 gives f = sqrt 2 + cos(t log 2). Repaired statement T25 (c_1 != 0) is
   open: N2's Phragmen-Lindelof step is a sketch. Nobody has been told except through the theory document and my report.
2. The project's normalisation of the explicit formula equals Suzuki's W(f) (constant check via -psi(1/2)); T7 is `known`.
3. Classical zero facts T8 are `known` from a TERTIARY source (Wikipedia pages, quoting fetch). Replace by a textbook when someone has one.
   T9 (Selberg, distinct zeros) from the introduction of arXiv 1306.0854 (secondary).
4. 17 short proofs checked line by line by me (C1-C17 in PROGRESS.md): those entries say `checked by: K-theory`.
5. T32 (exact inertia): I wrote the derivation, so I cannot check it; the seat's own proof of the even half is on board B92.

## Things the next session must pick up
- FORMAL: rh/formal has Lean files for T70 (D1), part of T65 (C1, C3, C2 in two halves), T50 without the counting equalities, T52,
  and Step 2 of T51. On 00:34 UTC they were imported in RHFormal.lean but the formal seat's MEMORY.md listed nothing as formal and no
  build product existed for them. Rule: set `formal` (field + status) only when (a) imported, (b) `lake -d rh/formal build` succeeded,
  (c) rh/formal/MEMORY.md lists it. T65 and T50 can be formal only for the parts named in their notes (consider splitting the entries).
- r2_judge has PROGRESS.md (J1-J15, numbers) but still NO JUDGEMENT.md: when it appears, read its verdicts on the six PROOF files and
  adjust `checked by`.
- T80 is the open input under T36, T37, T39, T44 (downgraded to `proved` on 2026-11-11 after READER-1's full reading of Suzuki). If
  someone writes the proof (or finds it in Connes-Consani / CCM, digests in rh/library/), re-mark those four `checked`
  (checked by: R2-parity-ref; T44 by K-theory).
- Board s1.md was processed up to B69 in full and B81-B110 only by skimming (B81, B90, B91, B92, B99, B103, B105 used). NOT entered yet:
  S1-curv G1-G3 (S1_ADDITIONS.md, F_d versions of F2/F4), S1-cubic TURN2.md, S1-mirror's finite statements in B82 (Hankel matrix of power
  sums; the finite step of Theorem 2), anything from the specialists SP-reflection, SP-operator, and whatever came after B110.
- rh/library/ (reader seats' digests of whole papers) appeared during the session. Used: 2606.09096 (T7, T10, T80), 2511.23257 (T11, T24),
  1611.03772 (T19, T76), 2005.02996 (T18). NOT yet used: johns-2026-part1.md (rewrite T17's statement with theorem numbers; status stays
  open: unreviewed), connes-consani digests (could make T10's attributions first-hand), branden-huh, rodgers-tao, miller, burnol-propagator.
- Literature still `open` because no text was read: T13 Burnol (abstract only), T14 Krein, T15 Krein-Langer, T16 Suzuki canonical systems,
  T18 Hecke correspondence, T17 Johns (unreviewed).
- Proved but not independently checked: T23 (Fejer equivalence), T32 (inertia), T68 (F2), T76, T77 (mirror criterion).
- Deliberately NOT entered (trivial or commentary): lane D pencil lemma (zero of Z_1 + lam Z_2 iff lam = -L_1/L_2); lane B closed-span
  equality and D_P(N) >= d_N; C critic's unitarity M(w)M(1-k-w) = 1; KEY_LEMMA_SHAPE S1; Hamburger's theorem (lead, B12, from memory);
  S1-cubic (M1) fibre form of B25 (mentioned in T74's note); the n = 4 dial lemma (inside T77's note); computed facts (M2, M3, sieve tables).
- Conventions I used: textbook theorems of linear algebra and analysis (Sylvester, Perron-Frobenius, Courant-Fischer, Weyl, Jensen,
  Paley-Wiener, Gauss's digamma integral, the Mellin transform of the fractional part) are background, not entries; number-theoretic and
  operator-theoretic inputs specific to zeta are entries and are `known` only if a text was fetched and quoted.
- First open links (STRUCTURE.md (c)): #8 -> T80 (then T40/T41; no lemma using arithmetic is stated); #9 -> T47 (certification), then T46;
  #21 killed -> T6 refuted; #10 parked -> T62.
