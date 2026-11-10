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
