# K-theory PROGRESS (seat: keeper of rh/THEORY.md; verification track)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Times are from `date`.

## Session 1 (2026-11-10 23:57 UTC to ...)

### Read (in full unless said)
claude.md "Standing structures"; SUBAGENT_PREAMBLE; PROJECT_BRIEF; THEORY.md (6 seeds); all six PROOF_*.md of round 2
(r2_parity x3, r2_cubic x2, r2_curv x1); NOTEBOOK.md; r1_*/critic/PROGRESS.md (A-D); r1_judge/JUDGEMENT.md;
r2_*/refuter/PROGRESS.md (parity, cubic, curv); r2_judge/PROGRESS.md (predictions only when read; no JUDGEMENT.md);
board s1.md (B1-B53 at first read); s1_seminar notes (parity NOTES, curv S1_ADDITIONS, cubic TURN1, mirror NOTES);
IDEAS #8, #9, #21 in full; KNOWLEDGE.md; DECISIONS D8; proved parts of r1_A/B/C/D PROGRESS.

### Finding 1 (mine, as independent checker of NOTEBOOK N2 = seed entry T3). REFUTED as stated.
T3 statement: "A(s) = sum_{n<=N} c_n n^-s, c_n real, no zeros in Re s > 1/2, w >= (1/2) log N  =>  f(t) = 2 Re[e^{iwt} A(1/2+it)]
has only real zeros."  Counterexample: A(s) = 2^-s + 4^-s = 2^-s (1 + 2^-s) (zeros only on Re s = 0), N = 4, w = log 2 = (1/2) log 4.
Then e^{iwt} A(1/2+it) = 2^{-1/2} + (1/2) e^{-it log 2}, so f(t) = sqrt 2 + cos(t log 2) >= sqrt 2 - 1 > 0 on R; as an entire function
f(z) = sqrt 2 + cos(z log 2) has infinitely many zeros, z log 2 = pi + 2 pi k +- i arccosh(sqrt 2), NONE real.
COMPUTED (python, double precision, this session): min of f on [-1000, 1000] step 0.01 = 0.41421356; |f - (sqrt2 + cos)| <= 4.4e-16;
|f(z0)| = 3.4e-16 at z0 = 4.532360 + 1.271553 i; min |A| on a grid in Re s > 1/2 is 0.146.
Where the proof in N2 breaks: "|R| is bounded as Im z -> infinity when w >= (1/2) log N" needs c_1 != 0 (the denominator
E*(z) = e^{-iwz} A(1/2 - iz) behaves like c_m m^{-1/2-y} e^{wy}, m = least index with c_m != 0; boundedness needs w >= (1/2) log(N m)).
Second point, for the repaired statement (c_1 != 0): "By Phragmen-Lindelof |R| < 1" needs an a priori growth bound for R = E/E* in the
whole open upper half-plane, not only as Im z -> infinity; none is given (1/E* is not obviously bounded in a strip 0 < y < delta).
Standard repair (from memory, not written out): R is of bounded type (Krein), meromorphic across R with |R| = 1 there, no poles in the
upper half-plane, mean type <= 0; Nevanlinna factorisation gives |R| <= 1. So the repaired lemma is entered as OPEN (sketch only).

### Finding 2 (mine). The project's normalisation of the explicit formula agrees with a text that was read.
Fetched arXiv 2606.09096 v3 (HTML) through WebFetch (a quoting model; quotes limited to 125 characters each, so this is "read in
pieces", not the PDF itself). Section 1.1, the five terms of W(f), as quoted:
  W(f) := int f(x)(e^{x/2}+e^{-x/2})dx - sum_n Lambda(n) n^{-1/2} f(log n) - sum_n Lambda(n) n^{-1/2} f(-log n)
          - (log 4pi + C_0) f(0) - int_0^inf {f(x)+f(-x)-2e^{-x/2} f(0)} e^{x/2} dx/(e^x - e^{-x}),   C_0 = Euler's constant;
  Q_W(v1,v2) := W(v1 * v2~);  (3.1): "the Weil explicit formula yields" Q_W(v1,v2) = sum_{gamma in Gamma} m_gamma v1^(gamma) conj(v2^(conj gamma)),
  Gamma = zeros of z -> xi(1/2 - iz); Weil's criterion: RH <=> Q_W(v) >= 0 for all v in C_c^inf(R).
Comparison with the project's P + A - Pi (PROOF_parity_index section 0), by hand (PROVED, mine): pole and prime terms identical;
the kernel e^{x/2}/(e^x - e^{-x}) is the project's w; the constants agree iff
  -(log 4pi + C_0) + int_0^inf (2 e^{-u/2} w(u) - e^{-2u}/u) du = -log pi.   With 2e^{-u/2}w(u) = 1/sinh u and t = 2u the integral is
  int_0^inf (e^{-t/2}/(1-e^{-t}) - e^{-t}/t) dt = -psi(1/2) = C_0 + 2 log 2 (Gauss's integral), and -(log 4pi + C_0) + C_0 + log 4 = -log pi. OK.
So the explicit formula in the project's normalisation is KNOWN from a read text (plus three numerical validations on record).
Same fetch: Thm 1.1 (Friedrichs extension), Cor 1.2 (lambda_a = infimum over C_c^inf(-a,a)), Thm 1.3 (continuity), Thm 1.4 (small a:
positive, simple, even eigenfunction), "[4, Theorem 3.6]: spectrum of A_a bounded below and discrete", "[3, Proposition 2.1]: lower bounded
and lower semicontinuous", Yoshida [17]: RH <=> positive definiteness for every a; Prop. 1: positivity on ODD test functions implies RH,
on EVEN functions implies RH "except for possible real zeros"; Lemma 2: positive for small a; Theorem 2: non-degeneracy for every a <=> RH.

### Finding 3 (mine). Classical zero facts, text read (tertiary source).
Wikipedia "Riemann zeta function", "Riemann hypothesis", "Riemann-von Mangoldt formula" (fetched 2026-11-11, quotes): non-trivial zeros lie in
the open strip 0 < Re s < 1; symmetric about the real axis and the line 1/2; Hadamard and de la Vallee-Poussin 1896: no zeros on Re s = 1;
N(T) = (T/2pi) log(T/2pi) - T/2pi + O(log T) (von Mangoldt 1905); zero with smallest non-negative imaginary part is 1/2 + 14.1347...i;
Selberg 1942: a positive proportion of zeros on the line. DISTINCT-zero form: Milinovich-Ng arXiv 1306.0854 (PDF downloaded, pdftotext,
p.2 read): "Selberg's method [49] shows that a positive proportion of the non-trivial zeros of the Riemann zeta-function are on the critical
line. This is accomplished by counting sign changes of Hardy's function Z(t) and every zero detected by this method has odd multiplicity."
Burnol arXiv math/0103058 and Baez-Duarte arXiv math/0202141: abstracts read (the exact lower bound is NOT in Burnol's abstract).

### 00:14 UTC container restart; resumed. New sources read after the restart
board B54-B69 (B70-B80 are questions only); s1_seminar/mirror/PROOF_mirror_criterion.md; s1_seminar/parity/NOTES.md sections G-N;
s1_seminar/cubic/TURN1.md sections 5-7; r2_judge/PROGRESS.md (results J1-J15; still no JUDGEMENT.md); rh/formal (README, Smoke and
MathlibCheck only: NO statement of the theory is machine-checked yet, and rh/formal has no MEMORY.md).

### My own line-by-line checks of short proofs I did not write (each: what I verified). These are the entries marked `checked by: K-theory`.
C1. NB off-line-zero floor (r1_B/PROGRESS.md Step 5). f = chi - sum c_k e_k is -lam/x on x > 1 (lam = sum c_k/k); Mellin transform of f at
    0 < Re s < 1 is 1/s + zeta(s)A(s)/s (uses the classical int_0^inf {1/y} y^{s-1} dy = -zeta(s)/s, from memory, textbook); at rho0 it is 1/rho0;
    int_0^1 f x^{rho0-1} = 1/rho0 - lam/(rho0-1); Cauchy-Schwarz with int_0^1 x^{2b-2} = 1/(2b-1); ||f||^2 = ||f||^2_(0,1) + |lam|^2;
    min over lam of k|a - lam b|^2 + |lam|^2 is k|a|^2/(1 + k|b|^2). Bound as stated. OK.
C2. Dissipation identity (r1_B/PROGRESS.md Step 6): y_k' = -2 sum_j (y_k - y_j)/|z_k - z_j|^2; d/dt sum y_k^2 = -4 sum_{j<k} (y_j-y_k)^2/|z_j-z_k|^2;
    a conjugate pair contributes exactly 1. OK. (That the zeros of H_t obey this ODE is NOT part of the lemma.)
C3. F1 (S1_ADDITIONS): Sherman-Morrison both ways. OK; needs only Q_e (Q_o) invertible and t_e != 1 (t_o != -1), not Q > 0.
C4. Window interior under RH (checker's one line): |g(u)| <= ||f||^2, so |D(f*f~)| <= 2 sum|d_j| ||f||^2; Q_L >= lambda(L)||f||^2. OK.
C5. First-order caps (B58 FACT 3): for real f, Q_delta(f) = Q(f) - 2 delta n^{-1/2} g_f(log n). OK.
C6. Pair obstruction (E') (TURN1 3b): P_i e_j = (H_ij/s_i) v_i, (P_i)_jj = H_ij^2/s_i (needs i, j in B), P >= (Pe)(Pe)^T/(e^T P e), same w for P_j, a.w = H_ij. OK.
C7. Block trickle-down (TURN1 6): H_i a = l_i, a^T H_i a = sigma_i, H <= H D' H, restriction to span(b_i) is Hhat <= Hhat C Hhat, Hhat 1 = sigma,
    Perron vector C^{-1/2} 1, splitting x = z + x' with x'^T H x' <= 0. OK.
C8. One-field form (TURN1 7): kernel identity e^{(x-y)/2} + e^{-(x-y)/2} - e^{-|x-y|/2} = e^{|x-y|/2}; E = P - W0 has at most one positive
    eigenvalue and <1,E1> > 0; Haynsworth w.r.t. the block E. OK PROVIDED the compression of E to the subspace is non-degenerate
    (proved only for the integral operator on L^2: (-d^2/dx^2 + 1/4) E = -delta; on boxes it is COMPUTED). Hypothesis added to the entry.
C9. Per-prime Poisson decomposition (TURN1 2): primes = sum_p log p (q_p - |f|^2), arch = -c_inf|f|^2 + E_w (Theorem E), Poisson kernel bounds. OK.
C10. Signature of Ntilde (parity NOTES E, B32): Lemma A's proof is algebraic (U = span(F1,F2) non-degenerate, U-perp carries -Q); reflection swaps
    F1 and F2; Ntilde(F1+F2) = 2 > 0, Ntilde(F1-F2) = -2 < 0; so even block has 1 + kappa_-(Q_even), odd block kappa_-(Q_odd) positive squares. OK.
C11. Converse of C4 (refuter of curv, FINAL VERDICTS): Dbar = sum pi_x D_x is f -> ||Lf||^2 - rho E(f); Poisson equation solvable entrywise. OK.
C12. Block-averaged Bakry-Emery (TURN1 6): gap >= rho* by summing blocks and C4; resampling chain: (3/4 - rho/2) theta V + (1/4 - rho/2) int_S g^2,
    int_S g^2 in [0, V], extreme V attained for |S| >= 2; rho_S = (1+3 theta)/(2+2 theta). OK (holds for any pi, by Theorem C1).
C13. F3 (S1_ADDITIONS): u Lh = (N - lambda_1) f; N f_+- on the positive half is (T +- H) phi; difference of squares. OK.
C14. Positive definiteness of [w(log ab) + Lambda(ab)/sqrt(ab)] (B24): Gamma part is the Gram matrix of v_m(a) = a^{-(2m+1/2)}, a generalised
    Vandermonde system in x_a = a^-2 (distinct), so the v_m span; prime part >= 0 by D1. OK.
C15. Parity difference identity (D5 + B25, parity NOTES D): q(f_e) = 2[T+H], q(f_o) = 2[T-H] for an even kernel; the g(0) terms of A are
    diagonal and never enter H; H_P = E_+^2 + E_0^2; H_w = sum_{m>=0} E_m^2; H_primes = sum Lambda(n) n^{-1/2} int phi(x) phi(log n - x) dx. OK.
C16. F4 (S1_ADDITIONS): <f_+,cosh> = 2c, <f_-,sinh> = 2s inserted in the block inequalities. OK.
C17. Sign of the kernel (NOTEBOOK N24, seed T4): read off N = Pi - A; w(u) = e^{-u/2}/(1 - e^{-2u}) = sum_m e^{-(2m+1/2)u}. OK.

### Written out by me (so NOT checkable by me): exact inertia relation (board B56, parity NOTES H name the method only)
Finite dimension, Q_e and Q_o invertible, N_e = 2cc^T - Q_e, N_o = -2ss^T - Q_o, t_e = 2 c^T Q_e^-1 c, t_o = 2 s^T Q_o^-1 s.
M_e := [[Q_e, sqrt2 c],[sqrt2 c^T, 1]]. Schur complement in the corner 1: In(M_e) = In(1) + In(Q_e - 2cc^T) = (1,0,0) + In(-N_e).
Schur complement in Q_e: In(M_e) = In(Q_e) + In(1 - t_e). Count negative eigenvalues: kappa_+(N_e) = kappa_-(Q_e) + [t_e > 1]   (t_e != 1).
M_o := [[Q_o, sqrt2 s],[sqrt2 s^T, -1]]. In(M_o) = (0,1,0) + In(Q_o + 2ss^T) = (0,1,0) + In(-N_o) = In(Q_o) + In(-1 - t_o).
Negative eigenvalues: 1 + kappa_+(N_o) = kappa_-(Q_o) + [t_o > -1], i.e. kappa_+(N_o) = kappa_-(Q_o) - [t_o < -1]   (t_o != -1).
(Haynsworth's inertia additivity; both Schur complements exist because 1, -1, Q_e, Q_o are invertible.)  This needs an independent check.

### 00:22-00:36 UTC entries made (batch1..batch6), statuses set, STRUCTURE.md written
- Entered T7-T80 and updated the seeds: T3 REFUTED (Finding 1), T6 REFUTED (zeta(s-d) zeta(s+d), board B15/B69; tilt identity T79),
  T4 and T5 checked.
- Coordinator's corrections applied after reading the digests myself: T19 (credit, part (ii), sketch only), T18 (source for the modular-form
  count; stays open), T76 (the a, b >= 2 variant is the project's own, proved by one seat).
- Found while reading rh/library/2606.09096.md (READER-1, whole paper): the zero-side formula (3.1) is not stated on the form domain.
  New open entry T80; T36, T37, T39, T44 downgraded from checked to proved; T10 and T38 restated without that clause.
- Formal: nothing marked. rh/formal/MEMORY.md lists nothing as formal; no build products for D1, C1, LemmaA, LemmaC at 00:34.
  I did not run Lean (the formal seat allows one Lean process at a time). The Lean files and their differences are recorded in the notes of
  T70, T65, T50, T52, T51.
- Final `records.py theory check`: 80 entries, 0 errors; 17 open, 9 proved, 43 checked, 9 known, 2 refuted.

### Later in session 1: round-2 judgement and readers' addenda ingested (batch7_judge_readers.py.txt)
- JUDGEMENT.md read: sections 1 (all verdict tables), 1.4, 2 (2.1-2.14), 4. Judge's verdicts appended to `checked by` of 28 entries.
- T32 -> checked (judge's independent derivation J18). New open T81 (C2's second half, labelled open by the judge).
- Readers' addenda checked against the digests and applied: T16 -> known (Thm 2.4 quoted), T18 -> known (BRS Prop. 3.1 + Remark after
  Prop. 4.1, complete note by R-read-2), T17 statement with theorem numbers (stays open), notes/sources on T1, T4, T10, T22, T43, T44, T47,
  T48, T52, T53, T71, T77, T80.
- NOT changed although the coordinator's wording suggested `known`: T51, T53, T30 keep `checked` (stronger in-project status; citation in
  `source`), because the tool defines `known` as "not reproved here".
- Final check: 81 entries, 0 errors; 16 open, 8 proved, 44 checked, 11 known, 2 refuted.

### Third batch (batch8_formal_foothold_seminar.py.txt): formal results, foothold theorems, seminar turns 2-3, ideas #22-#26
- FORMAL: T70 and T32 set to `formal` (files in the recorded full build of 00:52; T70's statement trimmed to the identity, T32's statement
  rewritten to the Lean form). Lean coverage recorded in the notes of 16 other entries, which stay `checked`.
- MY ERROR: T33's sentence "when a Weil block is positive definite the corresponding margin is strictly positive" is false for the even
  block (formal seat, file 17; zeta at L = 0.05, 0.10 has t_e < 1 and a negative even margin). I copied it from S1_ADDITIONS F1 (a) and my
  check C3 above ("OK; needs only Q invertible and t_e != 1") did not test the clause. Corrected in the entry with the history in its note.
- New entries T82-T98 (17): 3 checked (T84, T87, T93: short proofs re-derived by me), 13 proved, 1 open (T89).
  Checks done for these: T84 (pole on odd functions; four quadrants of the Levy form; I(a,b) - I(|a|,|b|)); T87 (two cases from T43 and
  T29 Step 4); T93 (Schur product for forms; nestedness; cosh/cos rank-two identities); T86's inequality line and T90's three lines were
  re-derived too but those entries stay `proved` (T86: depends on the unchecked T85; T90: per the coordinator).
- Not marked: no VERDICT.md from V-FH yet; the formal seat's MEMORY.md still lists nothing.
- Final check: 98 entries, 0 errors; 17 open, 21 proved, 45 checked, 2 formal, 11 known, 2 refuted.

### Fourth batch (batch9_verdict_formal_bridge.py.txt): V-FH verdict, formal seat's end of session, READER-3, the bridge
- T82, T83 -> checked (V-FH: verified as stated). Notes carry the trust base and the novelty finding.
- T27, T50 -> formal after rewriting the statements to the machine-checked wording; T70, T32 confirmed. Formal total 4.
- READER-3's remarks checked against bombieri-2000.md and 2511.22755.md and applied (sources/notes of T2, T10, T11, T29, T35, T36, T37,
  T38, T41, T80).
- Bridge entries T99-T105. My re-derivation of notebook N41 (plank 7), as asked:
  (a) f = Z psi on the window, (Z psi)(u) = sum_m m^-1/2 psi(u + log m), psi supported in [-L, L]. Inverse: sum_m mu(m) m^-1/2 f(u + log m)
      = sum_N N^-1/2 psi(u + log N) sum_{m | N} mu(m) = psi(u) (the cut in f is harmless: if u + log m > L every psi(u + log m + log k) = 0).
      For real f, Pi(f) = 2 sum_n Lambda(n) n^-1/2 int f(u) f(u + log n) du = 2 <f, P+ f>. For u in the window,
      (P+ f)(u) = sum_n Lambda(n) n^-1/2 sum_m m^-1/2 psi(u + log n + log m) (lower cut automatic since u + log n >= -L; upper cut harmless)
      = sum_N N^-1/2 psi(u + log N) sum_{nm = N} Lambda(n) = sum_N N^-1/2 log N psi(u + log N). OK.
  (b) same computation on v > L, where v + log n > L always, so the cut 1_{v > L} is never met; needs absolute convergence of
      sum_N N^-1/2 log N |psi(v + log N)|, which N41 does not state: added as a hypothesis. OK.
  The numerical check of (a) to 12 digits that the bridge demands was NOT run by me.
- Final check: 105 entries, 0 errors; 22 open, 19 proved, 46 checked, 4 formal, 12 known, 2 refuted.
