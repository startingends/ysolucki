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

## TURN 2 (started 00:18 UTC, after a container restart). Nothing addressed to me on the board (B71-B78 go to others).
Rule: jobs > 1 GB or > 1 min: `flock /tmp/claude-0/-home-user-ysolucki/9039aa06-6540-523a-ba98-9efe520848c8/scratchpad/heavy.lock python3 tools/memcap.py 2 python3 <script>`.
Tasks: (1) what is a one-block certificate; (2) one-field form for F_d = zeta(s-d)zeta(s+d), prediction first; (3) locality outcome;
(4) Lean nomination among A, B, C; question SP-reflection and SP-operator.

### Derived by hand BEFORE computing (00:18 UTC)
- EXACT: Q_d(f) = 2 Q(e^{dx} f, e^{-dx} f) = 2 Q(cosh(dx) f) - 2 Q(sinh(dx) f)  (zero side: zeros gamma -+ i d; Q bilinear symmetric).
  So with g = cosh(dx) f:  Q_d(f) = 2 [ Q(g) - Q(tanh(dx) g) ]:  F_d >= 0 on [-L,L]  <=>  multiplication by tanh(dx) is a contraction
  for zeta's Weil form on [-L,L]. Second order: threshold d_crit(L)^2 ~ mu_0(L) / Q(x psi), psi = ground state of Q_L.
- One-field form for F_d: E_d(x,y) = e^{|x-y|/2} 2cosh(d(x-y)) = e^{(1/2+d)|u|} + e^{(1/2-d)|u|}; N'_d = primes_d - arch'_d (two slowest
  exponentials removed), N'_d - E_d = -Q_d. Two-plane fibre form: 4 functionals e^{+-(1/2+-d)x}, #pos(Ntilde_d) = 2 + #neg(Q_d).

### PREDICTIONS written BEFORE computing (00:18:02 UTC); boxes, exact compression of the tilted kernel
PT1. E_d on 24 boxes, L = 1: exactly ONE positive eigenvalue for d = 0.05, 0.1, 0.25 (so the one-field matrix stays a valid
     'one positive eigenvalue <=> Q_d >= 0' form and does NOT single out d = 0 by its shape). At d = 0.45: I guess two (unsure).
PT2. Threshold d_crit (smallest d with lowest eigenvalue of Q_d < 0), L = 1: 24 boxes in [0.03, 0.12]; 48 boxes smaller by a factor
     in [1.4, 2.2] (box mu_0 = 3.74e-3, 1.155e-3; the true mu_0 = 8e-30 would give d_crit ~ 1e-14, not computable here).
PT3. Second-order formula: d_crit^2 * Q(x psi) / mu_0 in [0.8, 1.25] (x psi by box centres).
PT4. Failing block = parity of the lowest eigenvector of Q on boxes (I expect EVEN at L = 1).
PT5. Model 'tilt by box-centre differences' (Q o 2cosh(d(x_i - x_j))) and the exact compression agree on d_crit within 10%.
PT6. #pos(Ntilde_d) with 4 fibre nodes = 2 + #neg(Q_d) for every d != 0 (identity; tests the code); so for d != 0 Ntilde_d NEVER has
     one positive eigenvalue and by Lemma B no cubic certificate exists for it on any window.
Control: d = 0 must give Q_0 = 2 Q exactly (code check), and Beurling is not involved.

### TURN 2 results (two container restarts during the turn; everything below is on disk; detail in TURN2.md)
Posted: B103 (F_d in my forms), B104 (one-block certificate), B105 (locality explained), B108 (answer B86: Lemma A for F_d),
B109 (answer B87: nominations; Lemma A first), B110 (corrections to B103), B114 (answer B107: rung data, failed calibration),
B115 -> SP-operator (certificate indexed by window size; Krein-Langer index 1; what the tilt does to H(t)),
B116 -> SP-reflection (Dirichlet/Neumann; infrared bound hypotheses; Perron for T - H; run on the tilt).
Predictions PT1-PT6: HIT PT1, PT5, PT6; MISS PT2, PT3, PT4. WITHDRAWN: my heuristic 'F_d fails at L=1 for d > 0.05' (true d_c(1) = 4.9e-13,
S1-parity B112) and 'first failing window where d^2 x rung ratio = 1'.
Facts established this turn:
- Identity Q_d(f) = 2Q(e^{dx}f, e^{-dx}f) = 2[Q(g) - Q(tanh(dx)g)], g = cosh(dx)f: found independently by S1-mirror (B90), S1-curv (B99 G1), me.
- One-field form for F_d keeps its shape (E_d one positive eigenvalue COMPUTED d <= 0.45, N'_d positive off-diagonal): my seat is
  tilt-blind (B11). Fibre form of F_d: 4 nodes, #pos = 2 + #neg(Q_d).
- r-block certificate = decomposition H = sum H_i, H_i b_j = H_j b_i, each H_i at most one positive eigenvalue (PROVED incl. the
  converse construction of T). One block = the statement. Two mirror blocks: H_+- = H/2 +- (l_+ l_+^T - l_- l_-^T)/s.
- Locality outcome = graded pair obstruction: single entries loosely determined (ranges around the cone value), cost paid pair by pair.
- Lean: Lemma A in eigenvalue-free form (AMOP), statement + proof in TURN2.md section 4; the congruence for the one-field form needs
  no invertibility ('non-degenerate' in B63 withdrawn); the one non-algebraic step of the seat is the Perron step.
- Boxes: x psi_0 is 98.9% (mass) on the next rung but 42% of its Q-weight sits on eigenvalues 1-3 (48 boxes); calibration against the
  true Q_o(x v_e) = 7.3e-5 at L = 0.75 FAILS by a factor 6-8: boxes give no usable number for d_c.
Board facts from others to remember: d_c(L) = 0.056, 3.4e-3, 7.2e-5, 7.9e-6, 5.6e-7, 1.1e-9, 4.9e-13 at L = 0.5 .. 1.0 (B112); even block
fails first in the true form (odd first on my boxes); mirror positivity and Ramanujan are complementary, meeting at d = 0 (B90);
G_d = zeta L(s-d,chi4) L(s+d,chi4) has one pole and off-line zeros (B81); rho_half = 0.838, 0.832 on S1-curv's chain without fibres,
deficit carried by the mirror-crossing term, zero on parity eigenfunctions (B97); S1-mirror B95 answered my B65 (mirror mechanism is an
odd-block mechanism; averaging over mirrors leaves the mean-field square).
Awaiting: S1-parity on B67 (odd ground state sign on controls); SP-operator on B115; SP-reflection on B116.
New scripts/logs this turn: fd, fd2, twoblock, locality3, locality4, rungs, rungs2. Machine rule now: memcap 1, one job at a time.
To do next: (i) answers; (ii) is 'E_d has one positive square' provable (sum of two growing-exponential kernels)? (iii) S1-cubic/#8
(local auxiliary fields) still unsearched; (iv) if FORMAL takes Lemma A, be ready to answer about the statement in TURN2.md section 4.

## TURN 3 (started 00:48 UTC). Aim (owner rule 6): ONE statement provable now, not in papers read, violated by a control.
Addressed to me: B156 (even ground state in my bordered matrix; sign theorem; compute t*(L)), B158 (five-part line).
Read: B119 (parity: 'block >= 0 => folded ground state nodeless', 11 positive rows incl. the impostor; fails after failure),
B127 (SP-operator: t-indexed certificate = de Branges chain, vacuous as existence; index 1 = N_1 class; no property seeing the tilt),
B130 (SP-reflection: no infrared bound with the needed direction; hypotheses tilt-invariant), B140 (lead: Q_e = B + 8cc^T,
anti-maximum principle), B144 (FORMAL: Lemma A and Lemma C machine-checked in AMOP form; Perron step not formal).
Judge (r2_judge/JUDGEMENT.md 1.1): all proofs stand; Lemma B = Braenden-Leake 2.8; CD(rho,n) sentence wrong as written (accepted in B64).

### Derived by hand before computing
- EVEN: ground state psi of Q_e (eigenvalue mu_1) <-> phi(psi) = (psi, -<psi,q>, -<psi,p>) is the NULL vector of the bordered matrix of
  N + mu_1; that matrix has one positive eigenvalue (Perron vector > 0), so phi(psi) is its SECOND eigenvector; psi > 0 forces both
  fibre entries < 0. ODD: (psi, <s,psi>) is a null vector of [[N_o + mu, s],[s^T, -1]], whose top eigenvalue is 0: it is the PERRON
  vector there (when the odd block has non-negative off-diagonal: no primes).
- mu_1 is NOT just above the principal eigenvalue nu_1(B) = -lambda_1(N_e) (about -4.3 at L = 1): it sits just below nu_2(B).
  So the anti-maximum principle (mu in (nu_1, nu_1 + delta)) is not obviously the right tool.
- Fiedler's theorem (from memory, 1975): second eigenvector of an irreducible symmetric matrix with non-negative off-diagonal has
  connected positive and negative sets; for a complete graph (all N_ij > 0) that is no information.

### PREDICTIONS written BEFORE computing (00:48:19 UTC), boxes n = 48
Q1. Identity check: second eigenvalue of bordered(N + mu_1) is 0 to 1e-10 with eigenvector phi(psi); fibre entries negative.
Q2. t*/t_true (pole strength at which the even ground state first loses one sign, scanning t upward): zeta L = 0.5 and L = 1: > 1,
    my guess in [1.05, 4]. Controls: weight at 4 doubled L = 0.75: < 1; Beurling L = 0.5: < 1; no primes L = 0.45 (even block still
    positive): > 1. So 't* >= t_true exactly on the rows whose even block is >= 0' HOLDS on these five rows.
Q3. Green kernel: the inverse of each folded block of Q is entrywise >= 0 for zeta at L = 0.5 and 1 (both blocks) and for no primes at
    L = 0.36. (If so 'positive Green kernel' is the stronger statement behind B119.) For the even block I am less sure (pole has the wrong sign).
Q4. Sturm pattern: the k-th eigenvector of Q on the whole window (zeta, L = 1) has exactly k sign changes for k = 0..5; NOT for all 48
    (first violation at some k >= 6).

### Turn 3, first results (t3.log, 48 boxes) and second batch of predictions (00:50:37 UTC)
Q1 HIT. Q2: 't* >= t_true exactly on positive rows' HIT on 8 rows (zeta 0.5/0.75/1: 1.02; one-prime 0.54: 1.02; no primes 0.36: 1.06;
four2 0.75: 0.98; Beurling 0.5: 0.96; no primes 0.45: 0.86) but my size guess [1.05, 4] MISS: t* is within one grid step (2%) of the true strength.
Q3: Green kernel >= 0: even block HIT on all positive rows; odd block HIT at L = 0.5, 1, one-prime 0.54, no primes 0.36 but MISS at
zeta L = 0.75 (50 of 576 entries negative, min -1.03) although the odd ground state is nodeless there. Q4: Sturm HIT for k < 4..7 on zeta rows,
all 48 for no primes at 0.36; fails from k = 0 on failed rows.
Derived now: ground state of B + t c c^T is (N_e + mu(t))^{-1} c; the block is >= 0 iff t >= t_0 := 1/(c^T N_e^{-1} c); at t = t_0 the null
vector is f := N_e^{-1} c. So 'nodeless at the moment the block becomes positive' <=> S: N_e^{-1} c has one sign (pole-strength-free).
PNT heuristic: N applied to cosh(y/2) 1_window is about e^L cosh(x/2) (psi(y) ~ y), so f ~ e^{-L} cosh(x/2) > 0 for zeta.
Predictions: Q5. t*/t_true for zeta L = 1 at 24 and 96 boxes stays in (1, 1.1], first sign change at the EDGE box, and t* - 1 shrinks with n.
Q6. f/cosh(x/2) (f = N_e^{-1} c) varies by less than a factor 5 over the boxes other than the edge box, zeta L = 1, 48 boxes.
Q7. S (no sign change of N_e^{-1} c) holds on zeta L = 0.3, 0.5, 0.75, 1.0 and one-prime 0.54, fails on four2 0.75 (implied by Q2 logic),
and for Beurling at L = 0.45 (its even block there? unknown) I make no prediction.

### TURN 3 results (detail TURN3.md; logs t3.log, t3b.log)
Posted: B180 (answer B156), B181 (answer B158: candidate (F), not put forward; judge 1.1 accepted), B182-ish note to FORMAL (N1 interlacing
equality case; N2 rank-one ground state).
Second-batch predictions: Q5 HIT (t* in (1, 1.1], sign lost at the edge box, t* - 1 shrinks: 4.3e-3, 1.3e-3, 3.9e-4 at 24/48/96 boxes).
Q6 MISS (f/cosh varies by a factor 9.8 without the edge box at 48 boxes, 22.7 at 96: f decays to 0 at the edge). Q7 HIT.
Key facts:
- Even ground state = SECOND eigenvector (null) of bordered(N + mu_1), fibre entries negative; odd ground state = PERRON vector of
  [[N_o + mu, s],[s^T, -1]]. Fiedler says nothing on a complete graph. Anti-maximum principle not applicable (mu_1 far above nu_1).
- Ground state of B + t c c^T = (N_e + mu(t))^{-1} c; block >= 0 iff t >= t_0 = 1/(c^T N_e^{-1} c); null vector at t_0: f = N_e^{-1} c.
- On all rows with one positive eigenvalue of N_e: t_0 < 1 < t* (positive rows) or t* < 1 < t_0 (negative rows). Window [t_0, t*] shrinks
  with refinement (zeta L=1: 5.3e-3, 1.6e-3, 5.0e-4). Sign lost at the EDGE box; f -> 0 at the edge.
- Candidate (F): 'f = N_e^{-1} cosh has one sign'. Violated by four2 0.75 (interior), no primes 0.45, Beurling 0.45/0.5. OPEN: is (F)
  equivalent to the even inequality (then rule 2)? Need one system separating them.
- HEURISTIC Hadamard formula: -d mu/dL = C (edge amplitude)^2; check with parity's numbers: sqrt(8.2e-30 x 158) = 3.6e-14 vs min 2.1e-14.
- Green kernel of the odd block is NOT entrywise positive at zeta L = 0.75 (Q3 miss) although the ground state is nodeless.
Board, others (for orientation): FORMAL machine-checked Lemma A (AMOP form + the count T50), Lemma C, B56 count; S1-mirror's first-prime
lemma (B174) = S1-parity B169 = K-atlas B168 (odd block of pole + Gamma is a Perron operator on every window); S1-parity's candidate:
uniqueness of the weights (Theorem U type); SP-operator: no t-indexed property sees the tilt; SP-reflection: no infrared bound in the
needed direction.
To do next turn: (i) answers/objections to B180, B181; (ii) find a system separating (F) from even positivity (e.g. vary the pole
functional: replace cosh(x/2) by cosh(sigma x), or reweight atoms keeping t_0 < 1) -- prediction first; (iii) derive the Hadamard
formula properly or drop it; (iv) S1-cubic/#8 still unsearched.
