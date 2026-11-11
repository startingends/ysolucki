# NOTES of S1-cubic (seminar S1, board `s1`). My memory between turns.

I speak for rh/experiments/r2_cubic/ (seat R2-cubic): PROOF_trickle.md (Lemmas A-E), PROOF_BE_cubic.md (Theorem F, sections 2-4),
PROGRESS.md, logs. Checker: r2_cubic/refuter/PROGRESS.md (R2-cubic-ref): no proof wrong, 7 findings, all accepted (TURN1.md section 1).
Board commands: `python3 tools/board.py --board s1 read --me S1-cubic --unread` / `post --from S1-cubic --kind ... [--to X] [--re N] "text"`.
Run numerics: `python3 /home/user/ysolucki/tools/memcap.py 2 python3 <script>` from this folder. Scripts here load THIS folder's box.py.txt.

## Files in this folder
- TURN1.md: all detail behind my turn-1 posts (sections 0-7). The citable file.
- IDEAS_LOCAL.md: my idea log, S1-cubic/#1 .. #9.
- Copies of the seat's scripts (box, tests, be, be2, fam, sdp, small, more, poly*, rand, validate) with paths pointed here.
- New scripts + logs: s1_checks (a: fine t grid; b: per-prime forms q_p; c: CD(rho,n)), locality2 (per-pair / radius SDP),
  eprime (pair obstruction E', two-close test), mirror_checks (Hankel of Ntilde; no primes; reweighting c_2), oddblock
  (signs of even/odd blocks), blockbe (meanfield | weil | E), rerun_p1/p2/be2iii logs.
- cvxpy solvers: CLARABEL fails ("nan (fail)") in about half the slack programmes; SCS works. Say so whenever quoting.

## TURN 1 (done). What I posted
- B36, B37, B38: the three results of the seat (vacuity A+B+C; Theorem F and factor 2; rigidity D/E + what exists without formula + wall).
- B51 (answer to Socrates B9): end pair NOT special; every pair fails alone; withdrew "maximally non-local in scale";
  new PROVED pair obstruction (E'); nothing in the seat uses the integers.
- B52 (answer to parity B33): even block of Ntilde keeps non-negative off-diagonal, odd block loses it exactly at the mirror entries
  (odd = Metzler - mirror matrix of primes); certificate covers odd block via step 4 restricted + Perron on the whole.
  Wording corrected in B63 (witness is D^{1/2} y) and B68 (odd block of Ntilde vs Q_odd: same inertia, not same eigenvectors).
- B62 (answer to curv B42): block-averaged Bakry-Emery; mean-field curve (1+3 theta)/(2+2 theta) PROVED; Weil chain numbers;
  block version of Lemma B PROVED; cone tensor satisfies all block conditions (vacuity again).
- B63 (answer to mirror B49): no one-node form (rank); one-FIELD form [[N',E],[E,E]], E = e^{|x-y|/2} = growing fundamental
  solution of -d^2 + 1/4; factor 2 does not depend on fibres.
- B64: reply to the checker (all 7 accepted).
- B65 -> S1-mirror: which blocks does a mirror mechanism test (mean-field model; where the squares stand; averaging over mirrors).
- B66 -> S1-curv: rho_half on their chain; is the half-window integral a form in T, H; which Bochner term carries the deficit.
- B67 (+B68) -> S1-parity: is "folded odd ground state has one sign" a theorem of the class or a property of zeta; controls.

## Awaiting (check first thing next turn)
- Answers to B65, B66, B67. Any question to me after B68. Any objection to B36-B38, B51, B52, B62, B63.

## Numbers I must be able to quote (all in TURN1.md)
- Ntilde zeta L=1 n=12: 5.30595, -1.8115e-3, -3.4672e-2; Beurling 5.28690, +1.9953e-2.
- rho_BE zeta L=1: 0.5902, 0.5280, 0.4816 (n=12,24,48); Beurling 0.5863, 0.5230, 0.4825; gaps 1.00034/1.00015/1.00005 vs 0.99623/0.95387/0.92808.
- Theta_t fine grid: t=0.014 -0.0184 (zeta L=1 n=12); t=0.057 -0.0217 (L=0.5); Beurling t=0.014 -0.0239.
- Pair slack (pairall) zeta L=1 n=6: -1.13..-1.43; end pair n=4,8,12,16: -2.30,-0.82,-0.37,-0.40; central: -1.98,-1.06,-0.86,-0.74.
- (E') best lambda_min: n=6 -5.96..-6.35; n=8 -4.38..-4.96; n=16 -2.07..-2.78; L=0.5 n=8 zeta -0.87..-1.21, Beurling -0.86..-1.17.
- Block BE zeta L=1 (n=24, 48): sites 0.5280, 0.4816; 8 blocks 0.6107, 0.6025; quarters 0.7034, 0.6976; halves 0.8431, 0.8364; one block 1.0002, 1.0000.
  Beurling: 0.5230, 0.4825; 0.5898, 0.5833; 0.6920, 0.6865; 0.8280, 0.8204; 0.9539, 0.9281. Mean field: (1+3theta)/(2+2theta).
- q_p on lowest eigenvector (L=1, n=24): 1.964, 1.317, 1.030, 1.000; rest(f) 6.416971 vs sum log p q_p 6.413231.
- Odd block negative off-diagonal: 38/156 (n=24), 108/600 (n=48), min -0.505; even block 0.
- E: eig 2.894, -5.9e-4; #pos [[N',E],[E,E]] = 1,1,5,2.
- Reweighting c_2 (L=1, 48 boxes): 0.97: -7.8e-3; 1.00: +1.2e-3; 1.03: -2.2e-2 (S1-mirror's B19/B43 have far sharper thresholds).

## What the board has established so far (my reading, for orientation only)
- Mirror positivity = ordering N(f_o) <= N(f_e) on lattice-supported test objects; it is a cone invariant under real twists and tilts
  (S1-mirror B13, B15); it tests local roots, not zeros (B16); no upper bound from it (B17); two test spaces (S1-curv B29).
- B25 (parity): Q(f_e) - Q(f_o) = 4[E_+^2 - sum_{m>=1} E_m^2 - primes_H]; B60 (mirror): window L <=> |H_W| <= T_W on half window.
- B32 (parity): sup kappa_+(Ntilde_L) = 1 + #off-line zeros; odd block of Ntilde <= 0 <=> RH; even block one positive square <=> RH.
- B58 (parity): folded ground state of each block has one sign (COMPUTED); first-order caps reproduce idea 9's intervals.

## To do next turn (my own list)
1. Read answers; answer anything addressed to me with a computation.
2. If nobody computes it: rho_half on N alone (no fibres) to see whether fibres matter (blockbe.py.txt takes any H, a).
3. Understand the "two-close" locality outcome (n=12: 4 most spread triples dispensable, margin unchanged; n=8: not). Check against
   the sign of the cone tensor on those triples (P7: rho = 1.0005 at n=12).
4. Idea S1-cubic/#8 (tower of local auxiliary fields for m >= 1; Kac-Baker): UNSEARCHED; needs a literature search before any claim.
5. Idea S1-cubic/#9: Collatz-Wielandt certificate for the odd block of the no-prime system at L < 0.37 (a positive x with A x <= 0).
6. Not done from the seat's own list: d*(margin) on a dialled family (R2-cubic/#10).

## Cautions
- Never post whether an idea is likely to work. Object only after asking. Labels on every statement.
- Do not read other agents' IDEAS_LOCAL.md. Do not edit anything outside this folder.
- Box-basis margins are 1e-2..1e-3; nothing here sees the true 1e-23 margins. Say "on boxes" when quoting.
