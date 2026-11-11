# NOTES of S1-parity (Socratic seminar S1; I speak for rh/experiments/r2_parity/)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. All numerics run as `python3 tools/memcap.py 2 python3 <script>`.
Folder: rh/experiments/s1_seminar/parity/. Board: `python3 tools/board.py --board s1 ...` (me = S1-parity).

## TURN 1 (2026-11-10, from 23:40 UTC)

### A. What I read and checked line by line (r2_parity)
PROOF_parity_index.md: Lemma 1, Lemma 2, Prop. 3, Theorem 4, C1-C4. Re-derived every step. No gap found. Small remarks:
 * Prop 3(b) "the total follows from kappa(N) = kappa(N_e) + kappa(N_o)": the additivity over the two R-orthogonal blocks
   needs one more line when the space is infinite dimensional (take maximal definite subspaces W_e, W_o; the form is
   <= 0 on W_e^perp + W_o^perp, of codimension p + q). True; one line missing, not a gap.
 * Theorem 4 uses ONLY the zero side (not the explicit formula); explicit formula enters only in Prop 3 / C2.
 * Step 3d check: cos^2(tz) = 1/2 + (e^{2itz}+e^{-2itz})/4, e^{-2itz} = e^{-2ita} e^{2tb}; |r| <= 3/4. OK.
PROOF_first_failure.md: Lemma 1, Lemma 2, Theorem 3, section 4, Prop 5(a)-(d). ONE REAL REMARK (found by me, turn 1):
 * Lemma 2 cites (SEL) "N_0(T) >= c T log T" and compares it with the O(r) zeros of fhat. The comparison needs the number
   of DISTINCT real ordinates (fhat vanishes once at each distinct gamma), while N_0 as usually stated counts with
   multiplicity. Repair by citation: Selberg's method counts sign changes of Z(t) (zeros of odd order, distinct), or
   Heath-Brown 1979 / Conrey 1989 (a positive proportion of zeros are simple and on the line) (both from memory).
   Status of Lemma 2 and Theorem 3 (D)=>(A): PROVED given that citation in its distinct-zero form. Posted on the board.
 * CORE (form domain) is still an ASSUMPTION; Theorem 3 is "PROVED given S1, S3, S4, CORE".
PROOF_uniqueness.md: Theorem U, all three steps re-derived (g-hat = |fhat|^2; E(r) = (1/pi) sum d_j cos(r u_j); scaling
   f_T; mean values). No gap. Conditional on RH. Uses nothing arithmetic.

### B. Reruns of the seat's numbers (copies wb/v1/v2/v3 .py.txt here, driver rerun_all.sh.txt, logs in rerun/)
v1, v2 a, v2 bg, v2 sieve int, v2 sieve half, v2 joint int 40: output IDENTICAL to the seat's logs (diff, timing stripped).
v3 int/half at L=0.5 (subset of positions): identical lines. v2 joint half 60: identical (0 differing lines).
One cosmetic difference: PROGRESS table says -2.3e-6 at x=1.9995 (int 30); v3 at dps 22 gives -2.443e-6 (the table value
came from the coarser v2 'pos' golden section). Sign and conclusion unchanged.
Lead's quoted numbers found in the lead's own logs: e10 test_a.log (-0.01203, -9.051e-10, -2.105e-23), e9 boot_L1.0.log
(n=6: [-1.15e-13, 1.78e-14]).

### C. Idea #21 mirror table, second route (mirror2.py.txt, mirror2_A12.log, mirror2_A24.log; mirror3.py.txt)
Route: Dirichlet-series LOGARITHM (not the lead's recursion), exact rationals for the dial (binomial series of theta^n,
n = 7/5), Jacobi formula at n = 4, impostor coefficients validated against -f'/f(12), -f'/f(20) from Hurwitz zeta
(diff 2e-26, 2e-43 = truncation tail), eigenvalues at 60 digits.
| function | lead: min eig, rank, #neg | mine (a,b = 2..12) | verdict |
| zeta | -7.5e-17, 5, 0 | 0 (exact to 1e-60), 5, 0 | REPRODUCED |
| impostor DH | -12.81, 9, 5 | -12.810168, 9, 5 (others -2.938, -1.688, -0.5707, -0.3605) | REPRODUCED |
| L(chi_4) | 0.0, 4, 0 | 0, 4, 0 | REPRODUCED |
| dial n=1.4 | -14.15, 11, 3 | -14.147134, 11, 3 (others -6.205, -3.154) | REPRODUCED |
| dial n=4 | -57.94, 7, 1 | -57.936166, 7, 1 | REPRODUCED |
c_2..c_9 agree with the lead's 3 decimals in every row. With the 1/sqrt(ab) normalisation the smallest eigenvalues are
-2.5466 (DH), -1.8569 (1.4), -9.6572 (4); signs/counts identical (congruence).
Larger matrix a,b = 2..24: zeta 0 neg (rank 9), L(chi_4) 0 neg (rank 8), DH 7 neg (min -50.35), n=1.4: 8 neg (min -38.55),
n=4: exactly 1 neg (min -235.47).
PROVED (mine, turn 1): dial n = 4. Z_4 = 8 (1 - 4^(1-s)) zeta(s) zeta(s-1) (Jacobi), so
   c(m) = (1+m) Lambda(m) - [m = 4^k] m log 4;  at m = 2^j: c = log 2 (1 - (-2)^j); at odd p^j: log p (1 + p^j).
   Hence [c(ab)]_{a,b>=2} = sum_{p odd} log p (v_{p,1} v^T + v_{p,p} v^T) + log 2 (v_{2,1} v^T - v_{2,-2} v^T),
   v_{p,r}(p^k) = r^k: exactly ONE negative square for every size A >= 4 (x = e_2 - e_4 is orthogonal to all positive
   vectors and not to v_{2,-2}). The negative square is the Euler factor (1 + 2^(1-s)), root -2 with multiplicity -1;
   its zeros lie ON the centre line Re s = 1; the off-centre zeros of Z_4 are those of zeta(s) zeta(s-1), which is
   mirror POSITIVE (checked: mirror3 log, 0 negative eigenvalues). So at n = 4 the mirror failure and the off-line zeros
   come from different factors. (COMPUTED check: closed form vs logarithm route 1e-59.)
COMPUTED (mirror3): L(chi)L(chi-bar) mod 5 (Socrates B6): c(4) = -2 log 2 = -1.3862944; a,b=2..12: min eig -3.8918203,
   3 negative, 3 positive; a,b = 2..24: min -6.2709884, 6 negative.
COMPUTED (r9check): [w(log ab) + Lambda(ab)/sqrt(ab)], 2<=a,b<=60, at 400 digits: smallest eigenvalue +8.3652e-251
   (double precision -2.1e-16 quoted in B7 is rounding; the matrix is positive DEFINITE). 2x2 at {3/2, 4/3}: -0.47515839.

### D. Answer to B10 (Socrates) : identity PROVED here, checked numerically (hank.py.txt, hank.log)
phi on (0, L], f_e = phi(|x|), f_o = sgn(x) phi(|x|). <f_e,c> = 2C, <f_o,s> = 2S, C = int phi cosh(x/2), S = int phi sinh(x/2).
For any R-invariant kernel k: q(f_e) = 2[T_k + H_k](phi), q(f_o) = 2[T_k - H_k](phi), H_k = int int phi(x)phi(y) k(x+y).
Pole kernel 2cosh(u/2) = e^{u/2} + e^{-u/2}: H_P = E_+^2 + E_0^2 (E_+ = int phi e^{x/2}, E_m = int phi e^{-(2m+1/2)x}), = 2(C^2+S^2).
Gamma kernel (in N): H_w = sum_{m>=0} E_m^2. The m = 0 Gamma square CANCELS the e^{-x/2} half of the pole:
   IDENTITY:  Q(f_e) - Q(f_o) = 4 [ E_+^2 - sum_{m>=1} E_m^2 - sum_{n <= e^{2L}} Lambda(n) n^{-1/2} (phi*phi)(log n) ].
 = 4 x Hankel form of the FULL Weil kernel, which for u > 0 is e^{u/2} - sum_{m>=1} e^{-(2m+1/2)u} - sum Lambda(n) n^{-1/2} delta_{log n}
 = sum_rho e^{(rho-1/2)u}: the classical von Mangoldt explicit formula (d psi). So the mirror form of the full kernel has
 exactly ONE positive square (the pole at s = 1), minus the trivial zeros -2m (m >= 1), minus the prime powers.
 Check: phi = 1, direct quadrature of Q = P + A - Pi vs right side: 5e-31 (L = 0.3 no primes), 6e-31 (0.38), 1e-30 (1.0).
(a) Neither block inequality implies the other. Even + D3/D5 gives N(f_o) <= N(f_e) <= 8 C^2; the odd inequality wants
    N(f_o) <= -8 S^2: missing term exactly 8(C^2 + S^2) = 4 H_pole(phi). Odd + D5 gives nothing for even (wrong direction).
(b) Separate fact. D3's sign pushes the OTHER way (it raises the odd block relative to the even one). PROVED: for the
    Gamma form A alone, A(f_e) <= A(f_o) for the same phi, hence lambda_k(A_even) <= lambda_k(A_odd) for every k.
    COMPUTED (int N=30, no primes): A alone lowest (even ; odd): L=0.36: -1.32972 ; +0.0520851. 0.37: -1.36166 ; +0.0244417.
    0.38: -1.39286 ; -0.00248088. 0.40: -1.45318 ; -0.0543135. So the odd block of the Gamma form alone loses positivity
    between 0.37 and 0.38; the pole (-2<f,s>^2) only lowers it further (+0.0103 -> -0.0178 at 0.37/0.38), while in the
    even block the pole's +2<f,c>^2 removes the single negative direction (-1.39 -> +0.00105).
    On the ground states (L = 0.38): odd ground state: lambda = -0.017844 = 2T - 2H_Q with 2T = +0.15263,
    -2E_+^2 = -0.40550, +2 sum_{m>=1}E_m^2 = +0.23502; even extension of the same phi has energy +0.3231.
    Even ground state: lambda = +0.0010456, 4H_Q = -0.6957 (Hankel form NEGATIVE there); its odd extension has energy +0.69675.
    So the sign of H_Q is opposite on the two ground states: the asymmetry is not a consequence of one sign.
(c) No step in the three files uses that atoms sit at logs of integers. Arithmetic inputs actually used: Theorem 4:
    |Im gamma| < 1/2, |Re gamma| > 14 (convenience), N(T) = O(T log T) (zero side only); first-failure Lemma 2: Selberg-type
    lower bound for distinct on-line zeros; Suzuki S1, S3, S4 for zeta; Theorem U: RH, positions arbitrary.

### E. Combination with the cubic seat's Lemma A (r2_cubic/PROOF_trickle.md), PROVED by putting the two together
Ntilde on V + R F1 + R F2 (N on V, Ntilde(f,F1) = <f,e^{x/2}>, Ntilde(f,F2) = <f,e^{-x/2}>, Ntilde(F1,F2) = 1).
Lemma A (algebraic, holds for kappa counts in infinite dimension): kappa_+(Ntilde_L) = 1 + kappa_-(Q_L).
With Theorem 4: sup_L kappa_+(Ntilde_L) = 1 + nu (nu = number of distinct zeros with Re > 1/2). Parity (R swaps F1, F2):
even block V_e + R(F1+F2): kappa_+ = 1 + kappa_-(Q_even) -> 1 + #quartets; odd block V_o + R(F1-F2): kappa_+ = kappa_-(Q_odd)
-> #quartets. So RH <=> odd block of Ntilde is <= 0 on every window <=> even block of Ntilde has exactly one positive square
on every window. This removes wall WP1 as a wall of bookkeeping: the right signature is that of Ntilde, not N.

### F. Board: what I posted / asked (turn 1)  -> see board; open items for next turn
 * Offered to S1-mirror: first failing window of F_d = zeta(s-d) zeta(s+d) with implementation B (kernel x 2cosh(du)).
 * Watch: refuter r2_parity/refuter/PROGRESS.md (only predictions V1-V7 so far, no findings at 23:40).
 * To do next turn: answer replies; if asked, compute F_d first-failure window; two-prime model recomputation for S1-mirror.

### G. Second-route recomputation of S1-mirror's B18/B19 (b19check.py.txt/.log, b19conv.py.txt/.log)
All printed numbers REPRODUCED in the same basis (int N=40). Thresholds (exact pencil): weight at 4: L=0.75 [-6.02e-5, +1.419e-5],
L=0.80 [-3.882e-8, +6.126e-9]; weight at 2, L=0.75 [-1.448e-11, +1.292e-13]; half/60: [-5.696e-5, 1.191e-5], [-3.984e-8, 5.465e-9],
[-1.428e-11, 1.122e-13]. NOT CONVERGED row: L=0.70 flipped weight at 4, odd block: int -1.73e-10, -1.33e-9, -3.53e-9 (N=40,80,120),
half -2.57e-6, -4.47e-6, -5.05e-6 (atom at 4 is 0.0137 inside the edge). S1-mirror withdrew the L=0.70 rows (B55).

### H. Answer to B41 (S1-curv): exact inertia (inertia.py.txt/.log). PROVED (Schur complement / Haynsworth):
   kappa_+(N_e) = kappa_-(Q_e) + [t_e > 1],  kappa_+(N_o) = kappa_-(Q_o) - [t_o < -1],  t_e = 2<c,Q_e^-1 c>, t_o = 2<s,Q_o^-1 s>.
   0 failures in 20000 random indefinite cases; zeta windows: t_e = 0.198 (L=.05), 0.842 (.10), 1.345 (.12), 7.83 (.20), 1.3e6 (.5), 1.15e29 (1).
   One-quartet config has kappa_+(N) = 1 iff t_e < 1 and t_o < -1 (WP1 as a computable condition).
   At a first failure with null vector psi not orthogonal to cosh: second eigenvalue of N_e at L_0 strictly negative (PROVED);
   persistence past L_0 needs continuity of eigenvalues of N_L in L (not cited) -> HEURISTIC beyond L_0 (corrected in B57).

### I. Reply to my seat's checker (R2-parity-ref) posted as B57. CONCEDED: position right end (feasible positions inside
   (1.9996, 2.0080), not [1.9996, 2.0085]); P5 control never computed; C2 'cannot be improved' is an observation; Lemma 2 label
   needs 'given S1, CORE' + distinct zeros; attributions (CC Prop 2.1, CCM Thm 3.6); 'one parity block suffices' KNOWN (Yoshida 1992
   Prop 1); first-failure Thm 3 KNOWN in substance (Suzuki p.5, Yoshida Thm 2); Theorem U 'false on every window' now has the checker's
   one-line proof. DEFENDED and reproduced by the checker: Lemma 1, Prop 3, Theorem 4, Theorem U, V1-V7.

### J. Answer to B48 (S1-mirror) (b48.py.txt, b48_L1.log, b48_L075.log)
 g = autocorrelation of a block ground state at log n = tau + h (even), tau - h (odd). FACT 1 (PROVED): tau_n = 0 if log n >= L:
 prime powers in [e^L, e^2L) act on parity eigenfunctions only through the mirror form. FACT 2 (COMPUTED): folded ground states of both
 blocks have one sign on (0,L] (L = 0.75, 1). FACT 3 (PROVED, trial vector): weight at n can rise by <= mu_e sqrt(n)/(2 g_e), fall by
 <= mu_o sqrt(n)/(2|g_o|); these caps reproduce the checker's exact end points to 0.1% (n<=5), 2% (6), 18% (7) at L=1.
 L=1 even: h = 0.051514, 2.1325e-4, 2.0018e-7, 3.6748e-11, 5.4277e-16, 1.4011e-23 (n=2..7), tau_2 = 1.0583e-4.
 L=1 odd: h = 0.3056, 5.8925e-3, 1.5003e-5, 6.3572e-9, 2.1416e-13, 1.593e-20, tau_2 = 1.7917e-4.
 OPEN (named): prove that the folded ground states of Q_even and Q_odd are positive on (0, L].  (S1-parity/#6)

### K. BLIND PREDICTION for F_d = zeta(s-d) zeta(s+d) (requested by S1-mirror in B55; written 2026-11-11 00:03 UTC, NOTHING computed yet)
 Kernel = zeta kernel x 2cosh(du). To first order Q_d(f) = 2 Q_0(f) + d^2 * W(u^2 g_f): fails when d^2 |X| > 2 mu(L), X = u^2-weighted
 form on the ground state, IF X < 0 (sign not known to me; guess X < 0 on the even ground state).
 P-F1. d = 0: positive at every L tested, lowest eigenvalues exactly 2 x zeta's (4.6e-15 x 2 at L = 0.75).
 P-F2. first failing window L_0(d): d = 0.25: in (0.30, 0.50); d = 0.10: in (0.35, 0.60); d = 0.05: in (0.40, 0.70); decreasing in d.
 P-F3. the EVEN block fails first for all three d.
 P-F4. negative squares per block at L = 1: d = 0.25: between 2 and 10 (guess 4); d = 0.05: between 1 and 5 (guess 2);
       at L = 1.5 at least as many, guess double. even count = odd count +- 1.
 Control: Beurling-type control is not available for a tilt; the control is d = 0 (must give zero negative squares).
 What would surprise me: L_0(d) > 0.8 for d = 0.25, or the odd block failing first, or X > 0.

### L. TO DO next turn
 1. F_d computation (generalise phi_arch to exponents 2m + a0, a0 = 1/2 +- d; pole exponents 1/2 +- d; atoms x 2cosh(d log n);
    validate against the zero side with zeros gamma +- i d). Post result re B55.
 2. Read replies to B33 (cubic answered: B52), B34 (mirror answered: B45), B35 (curv answered: B53), B58 (positivity of ground states).
 3. DONE (B61): v3 int/120 at x=2.008 gives -1.666e-6 infeasible; checker confirmed. Board posts of turn 1: B20-B25, B32-B35, B43, B44, B56-B59, B61.
 4. Possible own idea: 'mirror-only' regime: atoms in [e^L, e^2L) act only through h_n; block inequalities on the window written
    with T restricted to n < e^L. Smallest statement: positivity of folded ground states.

## TURN 2 (2026-11-11)
Coordinator: idea 21 killed (B69), barrier B11 added; specialists SP-reflection, SP-operator joined; Lean 4 project rh/formal.
Tasks: (1) F_d computation (B59), (2) lead's B70 (lowest eigenvalue of each block of F_d at L = 0.75 vs d, real and imaginary d),
(3) check the lead's remark in B69 (only the size of local roots is violated), answer B67 (S1-cubic), nominate a Lean statement.

### M. BLIND PREDICTIONS for B70, written BEFORE any F_d code exists (time stamp printed by `date` just above this block in the shell: see below)
 Zero side, real parity eigenfunction f: Q_d(f) = sum_gamma [fhat(gamma+id)^2 + fhat(gamma-id)^2] = 2 Q_0(f) - d^2 sum_gamma (fhat^2)''(gamma) + O(d^4).
 P-F5. mu_b(d) (lowest eigenvalue of block b of F_d's form, L = 0.75) is a SMOOTH EVEN function of d, analytic in t = d^2: NO kink at d = 0.
       mu_b(d) = 2 mu_b(0) - c_b d^2 + O(d^4) with c_b > 0 (on a near-null vector fhat(gamma) ~ 0 at the zeros it resolves, so
       -(fhat^2)'' ~ -2 fhat'^2 < 0). 2 mu_e(0) = 9.2e-15, 2 mu_o(0) = 7.5e-12.
 P-F6. imaginary d = i eps (zeta(s - i eps) zeta(s + i eps), zeros moved ALONG the line): mu_b = 2 mu_b(0) + c_b eps^2 + ...: POSITIVE for
       every eps, same |slope| as the real side (the function of t = d^2 is analytic through 0).
 P-F7. threshold at L = 0.75: real d fails for d > d_c with d_c = sqrt(2 mu_b(0)/c_b); guess c_b between 0.01 and 10, so
       d_c(even) in (3e-8, 1e-6), d_c(odd) in (9e-7, 3e-5). So 'one-sided in d^2, smooth': zeta is NOT a kink point.
 Would surprise me: a term linear in |d|; c_b < 0 (real tilt raising the eigenvalue); negative eigenvalue for imaginary d.
prediction block M written at 00:08:40 UTC

### N. BLIND PREDICTIONS for Socrates' B73 (written 00:14:30 UTC after the container restart; still NO F_d code exists, nothing computed)
 (a) L_d -> infinity as d -> 0 (at fixed L failure needs c(L) d^2 > 2 mu_0(L) and mu_0(L) > 0), but only DOUBLY LOGARITHMICALLY:
     from mu_0 = 1e-6, 4.6e-15, 8e-30 at L = 0.5, 0.75, 1 I read -log10 mu_0 ~ 4.3 L e^(2L), so L_d solves 4.3 L e^(2L) ~ 2 log10(1/d):
     L_d ~ (1/2) log log(1/d) + O(1). Anchors: d = 1e-7 <-> L ~ 0.75; d = 1e-14 <-> L ~ 1.0. For d = 0.05..0.25 I keep section K: L_d in (0.30, 0.70).
 (b) hybrids at d = 0.1 (one part tilted, the other two at d = 0, all in the F_d normalisation = 2 x zeta at d = 0):
     primes only: fails in the EVEN block (weights too heavy: +0.24% at 2), first failing L in (0.40, 0.52);
     pole only: fails in the ODD block (odd pole more negative), L in (0.35, 0.50);
     Gamma only: fails in the EVEN block (diagonal constant lowered, kernel raised), L in (0.38, 0.52).
 (c) pairs (one part left untilted): Gamma left untilted fails LATEST (pole and primes partly cancel in each block);
     primes left untilted fails in the ODD block, pole left untilted in the EVEN block, both earlier.
     All six hybrids fail before L = 0.75; none fails later than the full tilt by more than 0.05.
 Reading I expect: all three parts carry the information (each single mismatch is detected at about the same window).
 Would surprise me: a hybrid that stays positive to L = 0.75; a hybrid failing LATER than the consistent tilt F_d.

### O. TURN 2 RESULTS (all COMPUTED with fd.py.txt = implementation B at complex frequencies w +- i delta; memcap 1; two container restarts,
###    every number below was (re)computed after them and is in a log in this folder)
VALIDATION (fd_val.log): F_0 = 2 x zeta entrywise (0.0); prime side vs zero side sum_gamma fhat(gamma+id)^2 + fhat(gamma-id)^2, 5000 zeros:
 rel 1e-15 for d = 0, 0.1, 0.25, 0.3i, 2i; control (only primes tilted) disagrees at order 1.
B70 (fd_b70.log, L = 0.75, N = 40, dps 80): mu_e(d) = 9.1965e-15 - 1.46289e-4 d^2, mu_o(d) = 7.4532e-12 - 2.45385e-3 d^2; imaginary d: same
 coefficients with + sign, positive for all eps tried (1e-9 .. 0.1). No kink. d_c = 7.93e-6 (even), 5.51e-5 (odd). S1-mirror got the
 same coefficients independently (B90). P-F5 HIT, P-F6 HIT, P-F7 MISS (c 100x smaller than guessed). Posted B91.
FIRST FAILING WINDOW (fd_first.log, N = 30; int / half): d=0.05: even 0.5053/0.5064, odd 0.5623/0.5607; d=0.1: 0.4764/0.4779, 0.5311/0.5295;
 d=0.25: 0.4357/0.4373, 0.4924/0.4904; d=0: positive to 0.9. P-F2 HIT (all three), P-F3 HIT (even first).
NEGATIVE SQUARES (fd_count_*.log; even ; odd): L=1 (N=40, 60): d=0: 0;0. 0.05: 5;4. 0.1: 5;5. 0.25: 5;5.  L=1.5 (N=70, dps 220): 0;0. 17;17. 17;17. 18;17.
 P-F4: L=1 inside ranges (HIT), L=1.5 'double' MISS (x3.4). Ladder check (ladder.log): counts = number of zeta rungs below c d^2 (SP-operator's
 reading, B125): L=1 even rungs 1e-28.8, -22.3, -16.5, -11.5, -7.0, -3.3, -0.5; odd -25.4, -19.3, -13.9, -9.3, -5.0, -1.7. Posted B112, B162.
RATE (fd_rate.log): d_c(L) even = 0.056, 3.4e-3, 7.2e-5, 7.9e-6, 5.6e-7, 1.1e-9, 4.9e-13 at L = .5, .6, .7, .75, .8, .9, 1.0;
 c_e(L) = 6.1e-4, 3.0e-4, 1.8e-4, 1.46e-4, 1.2e-4, 8.9e-5, 6.9e-5. log(1/d_c) ~ 3.8 L e^(2L) (fit). Prediction N(a): shape HIT.
HYBRIDS d = 0.1 (fd_hyb.log), first failing window (first block): pole only 0.4760 (odd); Gamma only 0.3885 (even; odd never to 0.9);
 primes only 0.4479 (even); pole+Gamma 0.4885 (odd); pole+primes 0.4865 (odd); Gamma+primes 0.3881 (even); all three 0.4764 (even).
 Two hybrids fail LATER than F_d (by 0.010, 0.012): listed as 'would surprise me'. Posted B113.
LEAD'S REMARK (B69): F_d differs in 3 places (roots, pole positions, Gamma shift sign); the clean witness is S1-mirror's
 G_d = zeta L(s-d,chi4) L(s+d,chi4): gd.py.txt/gd.log: d=0 and d=0.3i positive to L=0.9; d=0.1 fails (even) at [0.845,0.847]; d=0.25 even
 [0.758,0.759], odd [0.883,0.884]. Not validated on the zero side (no chi_4 zeros). Posted B118.
B67 (b67.log, b67dh.log): folded ground states nodeless in ALL positive cases (zeta .5/.75/1; no primes .36; one-prime .54; impostor
 .5/1/1.3/1.6), nodes appear after failure in most failed cases (not: no primes .45; odd block of Beurling .50 and Liouville).
 CONJECTURE: block >= 0 => ground state nodeless. No proof (Perron and Beurling-Deny both fail). Posted B119.
B102 (b102_L075.log, b102_L1.log): zero-side Q0_o(x v_e) = 1.4628861e-4 = measured slope (8 digits); Q0_e(x v_o) = 2.4538506e-3 idem; L=1:
 6.9476802e-5, 1.2286467e-3. Exact d*: L=.75 even 7.9269169e-6 (0.999765 x first order), odd 5.5097155e-5; L=1: 4.8729893e-13, 6.0221344e-12.
 Posted B136.
B135 (b135_*.log): t_1(L) = <1,Q^-1 1> tables for zeta and impostor; t_1 x mu = 0.1..0.73 (zeta), 0.2..1.6 (impostor). Slope of log t_1 not
 smooth at L_n but no rule fits n = 2, 3, 4; resolution +-0.01. Posted B159.
NOMINATION (B92): bordered-inertia lemma (B56 even/odd) in definite-subspace form; first step = completing the square two ways.
SP-operator (B125, B131): B56 and Lemma A = Haynsworth 1968; m(z) = 1 = Aronszajn-Krein; Theorem 4 = explicit case of Krein-Langer
 (RH <=> q = i Lambda'/Lambda(1/2 - iz) in N_1). So B32, B56 are KNOWN; recorded as such. Open on both sides: the window at which a
 non-real point is first counted.
WITHDRAWN by me: 'the caps ARE the feasible intervals' (B58): proved is one inequality (outer bound) + computed agreement.

### P. Open items for turn 3
 * S1-cubic may reply to B119 (nodeless conjecture); SP-operator may supply one-sided derivative formula for t_1 (B159).
 * If asked: scan t_1 slopes with N of several hundred near L_2, L_3, L_4; zero-side validation of G_d (needs chi_4 zeros).
 * Own question worth asking next: does the ladder spacing (4-7 orders per rung) have a formula? (rungs at L=1.5: 19 below 1, zeta has 20 zeros below 77.2.)

### Q. THEOREM (odd block is a Perron operator on a window without atoms). PROVED (turn 2; checks the lead's B140; posted B169)
Setting: Q = P + A - Pi with atoms of weights m_n >= 0 (zeta: Lambda), odd functions f_o(x) = sgn(x) phi(|x|), phi on (0, L].
Hypothesis: no atom with log n < 2L (pole + Gamma alone: all L; zeta: L <= (1/2) log 2).
Claim: the lowest eigenvalue of the odd block is simple, with an eigenfunction of one strict sign on (0, L].
Proof. (1) A(f) = (psi(1/4) - log pi)|f|^2 + D_w(f), D_w(f) = (1/2) int int_{R^2} w(|x-y|)(f(x)-f(y))^2 dx dy.
   [A(f) = -log pi g(0) + int_0^inf (g(0)e^{-2u}/u - 2w(u)g(u))du = g(0)(-log pi + int(e^{-2u}/u - 2w)) + int 2w(u)(g(0)-g(u))du;
    Gauss: int_0^inf (e^{-2u}/u - 2w(u)) du = psi(1/4); int_0^inf 2w(u)(g(0)-g(u))du = D_w(f).]  (= S1-curv Theorem E, c_inf = log pi - psi(1/4).)
 (2) odd f: D_w(f_o) = int int_{x,y>0} j(x,y)(phi(x)-phi(y))^2 + 4 int phi^2 W, j = w(|x-y|) - w(x+y) >= 0 (w decreasing), W(x) = int_x^inf w.
   [regions (+,+),(-,-): int int w(|x-y|)(phi(x)-phi(y))^2; regions (+,-),(-,+): int int w(x+y)(phi(x)+phi(y))^2, and
    (a+b)^2 = 2a^2 + 2b^2 - (a-b)^2.]
 (3) pole on odd f: -2<f_o, s>^2 = -8 (int_0^L phi s)^2, s = sinh(x/2) > 0.
 (4) Hence Q(f_o) = -c_inf * 2|phi|^2 + int int j (phi(x)-phi(y))^2 + 4 int phi^2 W - 8 (int phi s)^2, and Q_o(|phi|) <= Q_o(phi):
   ||phi(x)|-|phi(y)|| <= |phi(x)-phi(y)|; potential terms unchanged; (int |phi| s)^2 >= (int phi s)^2. Also |phi| is in the domain.
 (5) phi = phi_+ - phi_-: Q_o(|phi|) - Q_o(phi) = 4 B(phi_+, phi_-), B(a,b) = -2 int int j a(x) b(y) - 8 int a s int b s < 0 if a, b >= 0 are
   both non-zero (disjoint supports; -8 s(x)s(y) < 0 strictly). So a minimiser cannot change sign; two orthogonal one-signed minimisers
   would give a sign-changing one; so the eigenvalue is simple. If the minimiser phi >= 0 vanished on a set E of positive measure,
   test the eigen-equation with h >= 0 supported in E: 0 = mu<phi,h> = Q_o(phi,h) = B(phi,h)-type term < 0. Contradiction.
 CITED only: existence of a minimiser (discrete spectrum of the window form, Connes-Consani-Moscovici Thm 3.6 via Suzuki; not read by me).
 Where it breaks: an atom at log n < 2L adds +2 m_n n^{-1/2} int phi(x) phi(log n - x) dx (mirror part, wrong sign). Even block: Gamma and
 both parts of each positive atom have the right sign, the pole +8(int phi c)^2 the wrong one.
 Use (not done): Barta-type lower bounds mu_odd >= inf (Q_o h / h) for any h > 0, on no-atom windows: a certified LOWER bound mechanism.

### R. THEOREM U' (unconditional uniqueness of the weights). PROVED given Theorem U and Theorem 4 Steps 3-4 (turn 2; posted B170)
Let D = sum_j d_j (delta_{u_j} + delta_{-u_j}), u_j > 0 distinct, real d_j, 0 < sum |d_j| < infinity. Then Q + D is negative on some
window (some f in C_c^infinity with Q(f) + D(f*f~) < 0), with NO hypothesis.
Proof. RH true: Theorem U. RH false: one off-line quartet; g = M f with f, M as in Theorem 4 Step 4 (k = 1): Q(g) <= 4Q+(f) + B_11 + d_1,
d_1 -> -infinity as K -> infinity; |M| <= 2 on R so |g|_2 <= 2|f|_2 and |D(g*g~)| <= 2 sum|d_j| |g|^2 <= 8 sum|d_j| |f|^2. QED
Corollary: {m : sum |m_n - Lambda(n)| n^{-1/2} < infinity (any positions), Q_m >= 0 on every window} = {Lambda} if RH, empty if not.
Covers: one prime removed (sum_k log q q^{-k/2} < inf), a weight changed, finitely many primes moved (Beurling). No window is given.
Explicit window for q = 2 (b145.log): pole + Gamma on [-0.45, 0.45]: energy of sin(pi x/0.45)/sqrt(0.45) = -0.12114738 (closed form).
Novelty: UNSEARCHED (Theorem U itself is unsearched, presumed folklore).

### S. B145 (b145.log): couplings c_j = Q_odd(x psi_j), even rungs at L = 1: 3.474e-5, 5.230e-3, 0.1099, 0.3071, 0.4864, 0.7536, 1.522;
 first-order rule predicts 6 negative squares for d >= 0.0175; matrices give 5 (6th eigenvalue positive: 1.0e-6, 1.4e-9, 1.8e-13 at
 d = .05, .1, .25, N = 60; falls with N). Undecided: interaction of rungs vs truncation. Posted B171.

### T. End of turn 2: board posts B91, B92, B93, B112, B113, B118, B119, B136, B159, B162, B169, B170, B171, B172. No question addressed to me is open.
 FORMAL machine-checked my nominations (B142): B56 bordered identity, B25 folding identity, Theorem 4 Step 2, Fact 1 and Fact 3; see B166 for the inertia count.
 Promised for next turn (B170): impostor null vector at L = 1.72, psihat at the off-line zero and at on-line zeros (needs lane A's zero list).
 Promised (B172): run S1-curv's doubling-step statement (C) on G_d with gd.py.txt.

## TURN 3 (2026-11-11)
Posted so far: B194 (B151/B158 closed, FORMAL nomination of the finite Perron step), B195 (PROOF_Uprime.md + exact comparison with Johns).
Foothold second route (fh_*.py.txt, logs): see section V below (written when the jobs finish).

### U. PLANK 4 of Bridge 1 (idea #27): BLIND EXPECTATIONS, written 01:18:57 UTC, before any of my plank-4 code exists.
 I have read the lead's e27 scripts and logs (so his numbers are known to me: this is a reproduction target, not blind, except
 where marked BLIND). My route: form matrices from implementation B (wb.py.txt); prolate functions from the Legendre/Bouwkamp
 expansion of the differential operator (NOT Nystroem on the sinc kernel), chi_n from the finite Fourier transform eigenvalue;
 projections of v by piecewise Gauss-Legendre between the breakpoints u = L - log k.
 (a) at the lead's own basis (integer lattice, N = 28, 28, 34): I expect his eigenvalues to all printed digits:
     L=.5: even 9.68788e-7, 0.0182354, 0.832128; odd 2.2226e-4, 0.381316, 0.89424.  L=.75: 4.83891e-15, 1.44721e-9, 5.13868e-5;
     3.8537e-12, 2.86434e-7, 4.56169e-3.  L=1: 9.82998e-30, 3.95331e-23, (third not in his log); 2.65649e-26, 3.38535e-20.
     Defects by my route: 1-chi_4 = 3.63038e-7, 1.0336e-15, 1.512e-30; 1-chi_6 = 1.18597e-4, 1.24412e-12, 5.73e-27; 1-chi_8 = 0.0137545,
     6.88035e-10, 1.0751e-23; 1-chi_10 = 0.355684, 1.97876e-7, 1.1531e-20; 1-chi_12 = 0.9406, 3.119e-5, ~7.7e-18. Expect >= 4 digits.
     BLIND: at N = 120 the lowest even eigenvalue is lower by 3-4% (L=.5), about 10% (L=.75), 25-35% (L=1), so every ratio
     'eigenvalue/defect' falls by that much under refinement; the foothold seat's polynomial test shows trig bases converge slowly.
 (b) at his N: Rayleigh/mu_1 = 1.222, 1.099 (L=.5); 1.360, 1.164 (.75); 1.380, 1.219 (1.0), overlap deficiencies 7.49e-6, 4.17e-7, 7.2e-8: expect 3 digits.
     BLIND: under refinement (N = 60, 120) the Rayleigh quotient of the projected v GROWS (the jumps of v at u = L - log k carry
     energy ~ J^2 log N that a truncated basis cuts off) while mu_1 falls: I expect the ratio at N = 120 between 1.3 and 2.5 (even)
     and 1.1 and 2.0 (odd), not converging to a limit near 1; if the jumps are below sqrt(defect) x 0.1 the growth is invisible
     and the ratio only rises by the fall of mu_1. I do not know the size of the jumps; guess J ~ sqrt(defect).
 (c) at his N: kappa_4 = 0.347, 0.675, 1.015 (even), 0.217, 0.546, 0.907 (odd): expect 3 digits.
     BLIND, K up to 8 at L = 0.75 (indices 4..32 even, 6..34 odd): kappa_K levels off: kappa_8 >= 0.5 kappa_4, i.e. >= 0.34 (even),
     >= 0.27 (odd). Would surprise me: kappa_8 < 0.1.
     BLIND, control F_d at L = 0.75 (form F_d/2, same vectors, same D): kappa_1(d) falls linearly in d^2 and changes sign near
     d = 9.5e-6 (the explicit vector is not the ground state, so later than d_c = 7.93e-6); kappa_4(d) changes sign between
     7.93e-6 and 9.5e-6; at d = 7e-6: kappa_4 between 0.05 and 0.4, kappa_1 between 0.7 and 1.1 (zeta: 0.675, 1.92).
     NOTE: 'the one-prime system at L = 0.5' is IDENTICAL to zeta there (3 enters at 0.549), so it is not a control; I use F_d.

### V. FOOTHOLD SEAT, second route (posted B196). Files fh_check.py.txt (A: fh_check_A.log), fh_x.py.txt/.log, fh_poly.py.txt (fh_poly_half.log,
###    fh_poly_054.log), fh_poly2.py.txt/.log, fh_poly3.py.txt (fh_poly3_half.log; hull scan killed for time).
 REPRODUCED: a(40), 2m; Lemma 5 vs implementation B on edge-nonvanishing functions (1e-30, six cases); Theorem B(iii) no-atom bottoms
 (-0.0323519539, -0.322228345; -0.0650680866, -0.410363726); Theorem B(ii) L=1/2 in the same polynomial space: feasible e^y in
 [1.9996146, 2.0080402] (certified residual (1.999585, 2.008058)), weights at y=log 2: [0.489531, 0.490166]; Theorem A consistent
 (my Rayleigh-Ritz at (1/2)log 3: 5.55e-8 / 1.50e-5 at N=120 >= certified 9.9998e-9 / 3.9999e-6).
 NOT REPRODUCED (outside the proofs): quoted float Rayleigh-Ritz 'true atom' values 9.0567e-7 / 1.9601e-4 (L=1/2), 6.447e-8 / 2.4997e-5 (27/50).
 Mine in the same polynomial spaces: 9.41663e-7 / 1.9573e-4 ; 1.07699e-7 / 2.47159e-5. With y = 0.693147, m = 0.490129: 9.075e-7 / 1.95986e-4 ;
 6.69e-8 / 2.49706e-5 -> diagnosis (HEURISTIC): they were computed at a rounded position.
 Trig Rayleigh-Ritz (atom 2 only): L=1/2: int 40/80/120: 9.4996e-7, 9.3744e-7, 9.3519e-7; half: 1.0189e-6, 9.820e-7, 9.670e-7.
 L=0.54: int 1.0988e-7, 1.0714e-7, 1.0666e-7. L=(1/2)log 3: int 5.757e-8, 5.579e-8, 5.552e-8; odd 1.708e-5, 1.615e-5, 1.578e-5.

### W. PLANK 4 RESULTS (posted B203, B204). plank4.py.txt, logs plank4_L05_int28, _L075_int28_K8, _L1_int34, _L05_int120, _L05_half60,
###    _L075_int80_K8, _L1_int80.
 At the lead's basis: every number of planks 1-3 reproduced to printed digits (two independent implementations).
 Refinement: lowest even eigenvalue -3.5% (L=.5, N=120), -19% (L=.75, N=80), -32% (L=1, N=80). Rayleigh/mu_1 even/odd: 1.218/1.105 (L=.5),
 1.142/1.157 (.75), 1.494/1.361 (1.0). kappa_4 even/odd: 0.366/0.322, 0.675/0.594, 0.842/0.837.
 K to 8 at L=.75, N=80: even 1.30, 1.03, .714, .675, .369, .336, .327, .293; odd 1.53, .931, .672, .594, .332, .326, .322, .268. (N=28 values
 for K>4 are truncation artefacts: .136 / .052 at K=8.)
 PROVED remark: E(g)|window = 0 for g supported in (-1/lambda, 1/lambda) (unscaled), so with fixed companions inf Q/leak = 0; kappa_K -> 0
 is forced for the Gram-matrix D of plank 3; plank 6's D_L (inf over companions) is the object to test.
 Control F_d/2, L=.75, even block kappa_1/kappa_4/kappa_8: N=28: d=5e-6: 1.40/.653/.136; 7e-6: .889/.333/.133; 7.9e-6: .605/.104/.076;
 1e-5: -.188/-.583/-.589. N=80, d=7e-6: .268/.147/.125 (zeta 1.30/.675/.293). kappa_1 linear in d^2, zero at 9.54e-6.
 Scoring of section U: reproduction expectations all HIT; BLIND eigenvalue falls: L=.5 HIT, L=.75 MISS (19% not 10%), L=1 HIT;
 BLIND ratio growth 1.3-2.5: MISS (stable at L=.5, falls at .75, rises at 1.0); BLIND kappa_8 levelling: MISS (0.293 / 0.268, still creeping);
 BLIND control: kappa_1(7e-6) in (0.7, 1.1): HIT (0.889 at N=28); kappa_4(7e-6) in (0.05, 0.4): HIT (0.333); zero of kappa_1 at 9.5e-6: HIT.

### X. B188 (K-atlas): b188.py.txt, b188_cone.log, b188_shares.log. (N) = odd minimiser nodeless; (C) = odd block >= 0 on one-signed phi.
 Failed rows: (N) ok, (C) fails: no primes .45, Beurling .50, Liouville .5. (N) fails, (C) holds (PROVED via zeta's (C) + extra mirror
 mass): weight at 4 doubled. BOTH fail: weight at 4 flipped (zeta's odd ground state has energy -1.157e-7 there), one-prime .60 (-1.41e-4),
 Beurling L=1 (-0.058). Impostor 1.8: (N) fails, (C) untested. So 'exactly one' is false on 3 rows.
 Shares at L=1 (N=40): T_W .0569 + Gamma .4304 + primes .5127; prime 2: 97.6% of the prime term, 3: 2.4%; E_0^2/E_+^2 = .591; centre of mass .246.
 Shares, continued (b188_shares.log): L=1.25 (N=50): .0495 + .4127 + .5378, E_0^2/E_+^2 .583, centre of mass .251; L=1.5 (N=70): .0451 + .4009 + .5540,
 .578, .254; prime shares at 1.5: 2: .954, 3: .0461, 4: 2.5e-4, 5: 2.5e-6, 7: 1.5e-11, ..., 19: 1.3e-64 (margin ~1e-83). Posted B207.

### Y. Impostor's bottom rung at its zeros (b148.py.txt, b148_L172.log, b148_L170.log; posted B209)
 Own DH builder N=100, dps 120: lowest even eigenvalue +1.118282e-28 (L=1.70), -7.910853e-30 (L=1.72): equal to K-atlas / lane A.
 L=1.72: on-line energy 8.669e-29 (122 ordinates < 200), off-line zero 85.699: psihat = -2.82e-16 + 4.87e-15 i (phase .518 pi), contribution
 -9.461e-29; sum below 200: -8.26e-30 vs eigenvalue -7.91e-30. L=1.70: on-line 9.271e-29; off-line -1.315e-29, -2.0e-30; sum 7.74e-29 vs 1.118e-28.
 Prop 5(c) confirmed on a real case (one quartet cancels the on-line energy; phase within .02 pi of i).

### Z. End of turn 3. Board posts: B194, B195, B196, B203, B204, B207, B209, B210. Files new this turn: PROOF_Uprime.md, fh_*.py.txt, plank4.py.txt,
 b188.py.txt, b148.py.txt (+ logs). No question addressed to me is open.
 Open / promised: (i) FORMAL may take the finite Perron step (B194). (ii) the verifier track has PROOF_Uprime.md. (iii) foothold seat should
 recheck its quoted float Rayleigh-Ritz values (B196). (iv) Plank 4 is done at the lead's bases; the bridge's kill test must use plank 6's D_L
 (inf over companions), see B204. (v) if asked: H1 on F_d (B210); impostor cone test for (C); hull of weights in foothold Theorem B (scan killed).
