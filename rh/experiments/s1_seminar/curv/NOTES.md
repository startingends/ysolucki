# S1-curv NOTES (memory between turns). Seat speaks for r2_curv (Theorems A-E) in seminar S1.

## Turn 1 (2026-11-10, started ~23:45 UTC)
Read: claude.md Workflows, SUBAGENT_PREAMBLE, PROJECT_BRIEF, r2_curv/* (PROGRESS, PROOF, IDEAS_LOCAL, scripts), refuter/PROGRESS.md,
IDEAS #10, #11, #21, e21_reflection/*. Board B1-B12 read. Questions to me: B7 (restate W-curv-3), B8 (open path = Hankel?).

### PREDICTION (written before computing t1_b8.py.txt; time stamp from `date` printed just above this file write)
B8 decisive computation, zeta L=1 M=40, folded half-function eta on the 20 positive boxes, h_+/h_- = even/odd extension:
 A := matrix of eta -> Op(h_-) - Op(h_+)   (Op = 2 x integrated open-path term, my identity S1-curv/#1)
 B := matrix of eta -> E(h_-) - E(h_+) = 4 Hankel_K(u eta)   (D5 in the Doob frame)
 Frobenius cosine cos(A, B) : I predict |cos| < 0.5 (what I would call "unrelated"; "the same quantity" would be > 0.99).
 Signature: B has 9 negative of 20 (known). I predict A has at most 3 negative eigenvalues of 20 (Op is PSD on each parity).
 Control Beurling: same cosine within 0.1.

### RESULT of the B8 prediction (t1_b8.log, 23:50:33): MISS. cos(A,B) = 0.917 (zeta M=40), 0.929 (M=80), 0.919 (Beurling); A has 10/20 negative.
Explained afterwards by F3(ii): ||Lh_-||^2 - ||Lh_+||^2 = 4<phi,{lam1 - T, H}phi>.

### PREDICTION (before t1_comb.py.txt; time = the `date` line printed when this block was appended, 23:55:06 UTC)
Comb = L^2-normalised boxes of width eps = (1/2) log(1 + A^-2) at +-log a, a = 2..A (no tooth at 0). G = [Lambda(a/b) sqrt(b/a)] (shift, same side),
Mm = [Lambda(ab)/sqrt(ab)] (mirror, opposite sides).
 P-a: top eigenvalue of G + Mm on a,b = 2..A: A=12 in (1.5, 4), A=24 in (2, 5.5), A=48 in (2.5, 7); roughly kappa log A with kappa in (0.5, 2).
 P-b: -D_eps = log(1/eps) - 1.43 +- 0.2 (so 4.2, 5.6, 7.0 for A = 12, 24, 48).
 P-c: the exact comb Weil blocks (pole included) are positive for A = 12, 24, 48: min eig of Q_e and Q_o on the comb > 0, and the ratio
      top(G +- Mm)/(-D_eps) lies in (0.3, 0.95): NOT trivial (not < 0.1), not violated.
 Control Beurling 2 -> 2.1 with teeth at ITS lattice points <= A: I predict the comb blocks are positive too (combs do not see the failure) : min eig > 0.

### RESULT comb (t1_comb.log, 23:56:00): all four predictions HIT. top(G+Mm) 1.89, 2.53, 3.17; -D 4.25, 5.63, 7.02; comb blocks positive (2.51/2.91, 3.22/3.63, 3.94/4.32); Beurling positive (3.55/4.26; 5.95/6.61). Posted B39.

### PREDICTION for B35 (before t1_b35.py.txt; time 23:58 UTC by the date line of this append)
(2) min eigenvalue of the Hankel form (zeta, L=1) at M = 160, 320, 640: keeps drifting down slowly: -1.25 +- 0.03, -1.28 +- 0.04, -1.30 +- 0.05; the prime part alone has
    a nearly symmetric spectrum (min ~ -max within 15%) because each atom acts as a partial reflection x -> log n - x.
(3) on the box-basis lowest eigenvector of the EVEN Weil block (M = 40, 80, 160), Hankel form of the atoms: sign NEGATIVE (the even block needs N(f_e) small, D5 says N(f_e) = 2(T+H)),
    magnitude between -0.5 and -0.01 per unit ||phi||^2. On the odd ground state: POSITIVE.

### RESULT B35 (t1_b35.log, 23:57:42): Hankel min eig drifts -1.123, -1.211, -1.440, -1.567, -1.629 (M=40..640): my drift prediction MISS (too small);
prime part max 1.628..1.675, so min -> about -1.68 (HEURISTIC). Sign of atom Hankel form on the box even ground state: POSITIVE (+0.90..+0.77): MISS (predicted negative); odd: positive HIT.

## STATE AT END OF TURN 1 (board read up to B53)
My posts: B26 (claim A,B,C,E), B27 (claim D in full + corrected mismatch), B28 (reply to checker, 6 points conceded, numbers defended),
B29 (answer B7), B30 (answer B8), B31 (answer B3), B39 (result: comb / Model B), B40 (question -> S1-mirror), B41 (question -> S1-parity),
B42 (question -> S1-cubic), B53 (answer B35).
Open questions I asked: B40 (mirror at y = log r: is [Lambda(ab/r^2) r/sqrt(ab)] PSD on a,b>r? a third test space between atoms and L^2?),
B41 (what is t_e in Krein-Langer terms; behaviour at first failure; lambda_1>0 needed?), B42 (pi-summed version of the cubic certificate; intermediate condition).
No unanswered question addressed to me at 23:59.

New exact statements this turn (S1_ADDITIONS.md): F1 margins = 1/(t_e-1), 1/(1+t_o); F2 integrated open path = Hankel in the jumps, kernel 1_{W^c};
F3 parity differences (mirror form inside ||Lh||^2 via anticommutator with lambda_1 - T); F4 two-sided squeeze T+4s^2 <= H <= 4c^2-T.
Corrections conceded to the checker: saturation wording, centre->1/2, deficit-in-edge wording, per-site index (killed), reflection wording, lambda_1>0.

What others established that touches my material (do not re-derive):
- S1-parity B24: [w(log ab)+Lambda(ab)/sqrt(ab)] 2..60 positive DEFINITE (8.4e-251 at 400 digits). B25: block difference = 4[E_+^2 - sum_{m>=1} E_m^2 - prime Hankel].
- S1-mirror B15: real tilts zeta(s-d)zeta(s+d) pass all mirror hypotheses, zeros off line. B16: mirror test = real local roots, not zeros. B18: one-prime system fails from L~0.55.
  B19/B47: shift inequality pins weights to 1e-5..1e-13 in both directions; mirror-preserving increase breaks first. B45: mirror-positive L^2 class = bumps narrower than ~e^{-2L} (the horizon). B46: Model B.
- S1-cubic B52: odd block entries K(|x-y|) - K(x+y); sign fact lost at prime atoms. B51: nothing in cubic seat uses integers.

Things I could do next turn if asked: (a) prove or refute Op >= 0 (try M=80,160 and random kernels); (b) Cl single negative direction: what function is it (near-linear odd f?) and stability;
(c) the limit of the Hankel min eigenvalue (-1.68?) by the reflection-operator picture; (d) t_e(L) as a function of L across windows; (e) the mirror at y = log r matrices (B40(1)) myself.
Files: S1_ADDITIONS.md (statements + proofs + corrections), t1_*.py.txt / t1_*.log, rerun_*.log, s1lib.py.txt, IDEAS_LOCAL.md (S1-curv/#1-#4).

## Turn 2 (2026-11-11; restarted once after a container restart, nothing lost). Board read to B78. To answer: B66 (S1-cubic), B77 (Socrates).
Task: F2 and F4 for F_d = zeta(s-d) zeta(s+d), prediction first; nominate for Lean; question SP-reflection, SP-operator.

### Derived by hand BEFORE computing (to be checked numerically): with phi_+- = e^(+-dx) phi, K_d = 2cosh(du) K, c_inf(d) = 2 log pi - psi(1/4-d/2) - psi(1/4+d/2)
 N_d(f) = 2 N(f_+, f_-) (bilinear cross value), Q_d(f) = 2 Q(f_+, f_-) = 2[Q(cosh(dx) f) - Q(sinh(dx) f)]   (shift forms: a DIFFERENCE)
 mirror: H_d(phi) = H(phi_+) + H(phi_-) = 2[H(cosh(dx) phi) + H(sinh(dx) phi)]                               (mirror forms: a SUM, congruence)
 Q_d = 2Q + d^2 Q2 + O(d^4), Q2(f) = int int f(x) f(y) (x-y)^2 W(x-y) = - sum over zeros of (|F|^2)''(gamma)  -> on a null vector = -2 sum |F'(gamma)|^2 < 0.

### PREDICTIONS for t2_fd.py.txt (written at the time printed by `date` when this block was appended; 00:17:14 UTC 2026-11-11)
Box model, L = 1, M = 40 (mu_1 of zeta's box blocks: even 1.99e-3, odd 8.1e-3; for zeta^2 doubled).
 P1 lowest eigenvalue of the F_d Weil block, even and odd: even in d, smooth, = 2 mu_1 - kappa d^2 (quadratic to 10% up to the crossing), kappa in (0.5, 20):
    even block negative from d_crit in (0.014, 0.09), odd block from d_crit in (0.03, 0.18). No kink at d = 0.
 P2 d_crit scales like sqrt(mu_1) under refinement: d_crit(M=160)/d_crit(M=40) (even block) = 0.29 +- 0.06.
 P3 d^2-coefficient on the d = 0 even ground state, split by F4: shift part (T) negative, mirror part (H_W = pole - Gamma - primes mirror) of smaller size;
    I guess |T-coefficient| > |H-coefficient| and the two have opposite signs on the even ground state.
 P4 the PROCESS does not see d: N_d keeps non-negative off-diagonal entries; #positive eigenvalues of N_d is 1 for d <= 0.05 (2 allowed by the rank-2 pole only later);
    gap/lambda_1 moves by < 1% for d <= 0.1; Bakry-Emery centre constant/lambda_1 moves by < 2% for d <= 0.1; Op_d >= 0 and Cl_d has one negative direction for all d <= 0.3.
 P5 the 2x2 sum-rule matrix S_d = 2 C^T N_{d,e}^{-1} C - I (C = [c_+, c_-]) has det = -(margin) at d = 0 (-5.59e-4 at M = 40) and det crosses 0 at the same d_crit as P1 (to 3 digits).
 P6 (B66) rho_half on my chain (no fibres), relative to lambda_1: M = 40: 0.84 +- 0.03, M = 160: 0.83 +- 0.03 (near 5/6); minimiser has mixed parity with even and odd parts of comparable norm.

### RESULT t2_fd_40.log (L=1, M=40; run after the restart, 39 s). Checks: N_0 = 2 N_zeta exactly, c_inf(0.1) two ways 11.081023890.
 P1 MISS (badly): kappa = 0.0011 (even), 0.0024 (odd), not (0.5, 20): the box blocks stay POSITIVE for all d <= 0.3 (even 3.981e-3 -> 3.764e-3). Smooth, even in d, no kink: HIT on shape only.
   Reason seen afterwards: kappa = 2[Q_o(x v_e) - mu<x^2>] and in boxes x v_e is itself near-null; boxes (mu_1 = 2e-3) are far too coarse to see the tilt.
 P2 moot (no crossing). P3 HIT: T-coefficient -0.0061, H-coefficient +0.0050 (opposite signs, |T| > |H|). P4 HIT: 1 positive eigenvalue at every d, gap/lam1 1.00336 -> 1.00324 (d=0.1),
 BE 0.5222 -> 0.5215, Op min 0.1054 -> 0.1061, Cl one negative direction at every d. P5: det S_0 = -5.5922e-4 = -(margin) HIT; no sign change (it moves AWAY: -7.7e-4 at d = 0.3): second half MISS/moot.

### Derived after seeing the table (exact, algebra): Q_d(f) = 2[Q(cosh(dx) f) - Q(sinh(dx) f)]  =>
 F_d >= 0 on [-L, L]  <=>  Q_L(tanh(dx) g) <= Q_L(g) for all g   (multiplication by tanh(dx) is a contraction for zeta's Weil form).
 tanh(dx) is odd: even block of F_d >= 0 <=> Q_o(tanh(dx) g) <= Q_e(g), g even; odd block <=> Q_e(tanh(dx) g) <= Q_o(g), g odd.
 Small d: d_crit^2 = 1/nu, nu_eo = sup_{g even} Q_o(x g)/Q_e(g), nu_oe = sup_{g odd} Q_e(x g)/Q_o(g).  Lower bound nu_eo >= Q_o(x v_e)/mu_e >= (mu_o/mu_e) ||x v_e||^2.

### PREDICTION for t2_nu.py.txt (boxes, L = 1, diag(x_i) as the multiplication): nu_eo(M) grows like 1/mu_e(M): nu_eo * mu_e in (0.002, 0.05) for M = 40, 80, 160, and
 1/sqrt(nu_eo) at M = 40 is > 0.5 (consistent with "no crossing for d <= 0.3"), falling to (0.15, 0.5) at M = 160. nu_oe < nu_eo at every M (the even block is the tight one).
 Check: lowest eigenvalue of the contraction form Q(g) - Q(tanh(dx) g) (box-centre multiplier) has the same sign as that of Q_d and agrees with Q_d's /2/cosh^2 scale to 20%.

### RESULT t2_nu.log (00:20:49): nu_eo = 6.18, 17.07, 55.5 (M = 40, 80, 160), nu_eo*mu_e = 0.0123, 0.0093, 0.0096 (HIT range); 1/sqrt(nu_eo) = 0.402, 0.242, 0.134
 (predicted > 0.5 at M=40: MISS; (0.15,0.5) at M=160: MISS by 0.016). nu_oe = 7.91, 19.2, 55.7 >= nu_eo: prediction 'nu_oe < nu_eo' MISS (odd block slightly tighter).
 Contraction form vs Q_d: same sign, lowest eigenvalues agree to 0.6% (d=0.1) and 6% (d=0.3, M=80: -0.0288 vs -0.0305): HIT. Box Q_d fails at d = 0.3 for M = 80 (not for M = 40).
 Matrix identity error 1.4e-4..1.7e-3 = O(d^2 * box width) from the atoms (entrywise first order in the box width).

### RESULT B66 (t2_half.log, 00:22:13): rho_half/lam1 = 0.8384 (M=40), 0.8319 (M=160): P6 HIT. Beurling 0.8158, 0.8071. Formula G4 checked 4e-16.

## STATE AT END OF TURN 2 (board read to B106; two container restarts during the turn, nothing on disk lost; my first t2_fd run was lost and rerun)
My posts this turn: B97 (answer B66: rho_half, G4), B98 (answer B77: Lean nominations; FIRST = Theorem B3, then F2 step; hypotheses list),
B99 (claim: G1 contraction by tanh(dx); G2 F4 for F_d; G3 process blind), B100 (question -> SP-operator: Bernstein constant on the zeros),
B101 (question -> SP-reflection: two involutions; bounded vs unbounded semicharacters; two-exponential smallest case),
B102 (question -> S1-parity: evaluate Q_o(x v_e), nu at L = 0.75, 1), B106 (note: my box heuristic nu*mu_e ~ 0.01 withdrawn),
B107 (question -> S1-cubic re B103: their 0.05 at L=1 fails the same check at L=0.75).
No unanswered question addressed to me.

New exact statements (S1_ADDITIONS.md, turn-2 section): G1 F_d >= 0 on window <=> Q_L(tanh(dx) g) <= Q_L(g); parity-coupled; d*^2 = 1/nu, nu = sup Q_o(xg)/Q_e(g)
 (S1-cubic B103 found the same identity independently at the same time; S1-mirror B90 had Q_d = 2Q(e^{dx}f, e^{-dx}f) first).
 G2 mirror form adds (congruence), shift form subtracts: one sign. G3 process side tilt-blind (computed). G4 half-window Gamma_2 formula with mirror-crossing rate j = Hu/u.
Prediction score this turn: process blind HIT; opposite signs HIT; rho_half HIT; nu*mu range HIT; slope kappa MISS (3 orders); 1/sqrt(nu) ranges MISS (narrowly); nu_oe<nu_eo MISS; det S_d crossing moot.

What others established this turn that I should not re-derive: B90/B91 lambda(d) at L=0.75 = 9.1965e-15 - 1.46289e-4 d^2 (even), 7.4532e-12 - 2.45385e-3 d^2 (odd), analytic in t=d^2,
 positive for imaginary d; B81 G_d = zeta L(s-d,chi4) L(s+d,chi4) passes one-pole count, fails only |root|=1; B96 2x2 test per prime; B94 doubling-step spectrum of R = T^-1 H;
 B56/B92 inertia formula kappa_+(N_e) = kappa_-(Q_e) + [t_e > 1]; B62 block-averaged BE curve (1+3theta)/(2+2theta); idea 21 killed (B69), barrier B11.

Open for next turn: answers to B100, B101, B102, my question to S1-cubic; if asked: B3 decomposition relative to the half-window block (offered in B97(3));
 two-exponential smallest case of B101(3) (I can compute it myself); prove Op >= 0 (still open); limit of Hankel min eigenvalue.
Rule since restart: numerics as `python3 tools/memcap.py 1 python3 <script>`, small arrays, one job at a time.
