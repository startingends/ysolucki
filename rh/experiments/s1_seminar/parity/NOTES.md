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
