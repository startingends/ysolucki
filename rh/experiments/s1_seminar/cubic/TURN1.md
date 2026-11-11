# S1-cubic, turn 1: detail behind the board posts

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. All numbers double precision, box basis of r2_cubic (`box.py.txt`,
confirmed end to end against 20000 zeros by the checker, r2_cubic/refuter/PROGRESS.md section 6).
Run as `python3 /home/user/ysolucki/tools/memcap.py 2 python3 <script> <args>` from this folder; each run 1 s to 2 min.

## 0. Reruns of the seat's numbers (COMPUTED today, this folder)
- `tests.py.txt p1` -> rerun_p1.log: Ntilde eigenvalues zeta L=1 n=12: 5.30595, -1.8115e-3, -3.4672e-2; Beurling 5.28690, +1.9953e-2. Same as r2_cubic/tests.log.
- `be2.py.txt i|ii|iii` -> rerun_be2iii.log: T^BE = formula F5 to 4.4e-15; resampling rho = 0.7, 0.6, 0.55, 0.525;
  zeta L=1: rho_BE 0.5902, 0.5280, 0.4816 (n = 12, 24, 48), gap 1.00034, 1.00015, 1.00005;
  Beurling 0.5863, 0.5230, 0.4825, gap 0.99623, 0.95387, 0.92808; every slice of T^BE has 2 positive eigenvalues.
- `tests.py.txt p2` -> rerun_p2.log: cone certificate slices all Lorentzian.

## 1. The checker's findings (r2_cubic/refuter/PROGRESS.md): all accepted; three recomputed (`s1_checks.py.txt a|c`, s1_checks.log)
1. Lemma B is KNOWN: Braenden-Leake arXiv 2304.13203v2 Lemma 2.8 (d = 3), crediting Cordero-Erausquin-Klartag-Merigot-Santambrogio.
   Accepted (I have not read the paper; the checker read pp. 6-9). My text said "probably folklore; relation unchecked".
2. "Theta_t best t = 0.05, worst -0.047" was a grid artefact (my step was 0.05). Recomputed on a 0.001 grid:
   zeta L=1 n=12: t = 0.014, -0.0184; zeta L=0.5 n=12: t = 0.057, -0.0217; Beurling L=1 n=12: t = 0.014, -0.0239. "No t works" stands.
3. Lemma D4 bounds the QUADRATIC value vt^T P_k vt by mu-size; the vector T_k vt is only controlled at sqrt(mu) size. Accepted.
   The "Meaning" paragraph (continuum ladder 6e-30) is an extrapolation, not part of the lemma. Accepted.
4. CD(rho, n) on the resampling chain: exact constant 1/2 - 2/n + (1 + 2/n)/m. Recomputed m = 40: 0.13500, 0.28125, 0.42750
   for n = 5, 8, 20 (formula: the same). My sentence "(n-4)/(2(n-1)) < 1/2 for every n" needs m > 2(n+2)/3. Accepted.
5. "Two solvers" for the locality slack holds only for n = 2, 3, 4. Accepted (and see section 3: CLARABEL fails often here).
6. Degree-1 count on random Lorentzian matrices (11 of 12) is instance-dependent (7 of 12 on the checker's). Accepted.
7. Section 3 (U),(V): formulas with <g> = mean need total mass of pi equal to 1. Accepted.

## 2. Where the mirror-positive kernels stand in the Weil form (for board B4)

Notation: f real in L^2[-L, L], C(u) = int f(x+u) f(x) dx, r_p = p^{-1/2}.
  q_p(f) := sum_{k in Z} p^{-|k|/2} C(k log p) = (1/2pi) int P_{r_p}(xi log p) |fhat(xi)|^2 d xi,   P_r = Poisson kernel.
  E_w(f) := int_0^inf w(u) int |f(x+u) - f(x)|^2 dx du >= 0   (f extended by 0; R2-curv Theorem E: arch = -c_inf |f|^2 + E_w).
  theta(X) := sum_{p <= X} log p.

IDENTITY (PROVED; bookkeeping): for f supported in [-L, L],
    Q(f) = 2<f,p><f,q> + E_w(f) + (theta(e^{2L}) - c_inf) |f|^2  -  sum_{p <= e^{2L}} (log p) q_p(f).
Proof: primes(f) = sum_p log p sum_{k>=1} p^{-k/2} 2 C(k log p) = sum_p log p (q_p(f) - |f|^2); C(u) = 0 for |u| > 2L so only
p <= e^{2L} contribute; Q = pole + arch - primes.  QED
ONE-VARIABLE MIRROR STEP (PROVED, classical): r^{|k|} is positive definite on Z, so (1-r)/(1+r) |f|^2 <= q_p(f) <= (1+r)/(1-r) |f|^2.
So each prime's mirror character, carried to the shift picture by the one-variable theorem, gives a form q_p that is bounded
BELOW by a positive multiple of |f|^2, and it enters Q with a MINUS sign. Weil positivity is the UPPER bound
    sum_{p <= e^{2L}} (log p) q_p(f)  <=  2<f,p><f,q> + E_w(f) + (theta(e^{2L}) - c_inf) |f|^2 .
COMPUTED (`s1_checks.py.txt b`), zeta, L = 1, theta = 5.3471:
| n | p | eig(q_p) on the box space | Poisson bounds |
|---|---|---|---|
| 12 | 2, 3, 5, 7 | [0.240, 2.247], [0.439, 1.561], [0.597, 1.404], [0.877, 1.123] | [0.172, 5.828], [0.268, 3.732], [0.382, 2.618], [0.451, 2.215] |
| 24 | 2, 3, 5, 7 | [0.231, 2.263], [0.426, 1.574], [0.567, 1.433], [0.755, 1.245] | same |
Identity residual 4e-16. Right side ("rest") has eigenvalues in [4.04, 7.47], sum log p q_p in [3.95, 7.21] (n = 24).
On the lowest eigenvector f of Q (mu = 3.74e-3, n = 24): rest(f) = 6.416971, sum log p q_p(f) = 6.413231;
per prime q_p(f) = 1.964, 1.317, 1.030, 1.000 for p = 2, 3, 5, 7. So on the near-null vector the per-prime squares are of
order 1 and balance the rest; they do not vanish. (Lemma D says pieces of a PSD decomposition of Q must vanish there:
the q_p are not such pieces.)

## 3. Board B9: which forbidden entries kill the certificate program (`locality2.py.txt`, `eprime.py.txt`; logs of the same names)

Slack programme: maximise t with P_k >= t (I - a a^T/|a|^2) for all k (checker's normalisation); t* > 0 feasible with margin,
t* < 0 infeasible. Solvers CLARABEL and SCS; CLARABEL returned no answer in about half of the runs (marked), where both
answered they agree to 4 digits.

(a) COMPUTED. zeta L = 1, n = 6: make ONE pair (i,j) of boxes "fibre-only" (T_ijk = 0 for every box k, k = i, j included):
all 15 pairs are infeasible, slack between -1.13 and -1.43 (end pair (0,5): -1.434; central adjacent pair (2,3): -1.214).
Keeping T_iij, T_ijj and zeroing only the distinct third boxes: all 15 infeasible, -0.64 .. -0.74.
Slack is roughly proportional to the coupling N_ij (ratio 1.55 .. 1.57 at n = 6).
| n (L=1) | end pair (0,n-1) | central adjacent pair | an interior pair |
|---|---|---|---|
| 4 | -2.300 (N_ij 1.286) | -1.977 (1.109) | -2.038 (1.139) |
| 8 | -0.821 (0.582) | -1.061 (0.754) | -0.804 (0.561) |
| 12 | -0.372 (0.307) | -0.865 (0.734) | -0.465 (0.376) |
| 16 | -0.395 (0.368) | -0.738 (0.724) | -0.247 (0.222) |
(n = 8 .. 16: SCS only.) zeta L = 0.5 n = 8: -0.069, -0.481, -0.122; Beurling L = 0.5 n = 8: -0.069, -0.471, -0.115.
So the end pair is NOT special: every coupled pair needs a third box, each on its own. R* = n - 1 was only the first
pair to lose all its third boxes as R decreases. The sentence "certificates are maximally non-local in scale"
(r2_cubic/PROGRESS.md section 4, item 3) is NOT supported by P5 and I withdraw it; the supported statement is
"no coupled pair of boxes can do without a third box".
A different locality test (zero the distinct triples i<j<k with min(j-i, k-j) > r, "no two of the three close"):
n = 12: r = 4 (4 of 220 triples zeroed) feasible, margin unchanged 4.854e-4 (both solvers); r = 3 (20 zeroed) -0.206;
r = 2: -0.331; r = 1: -0.440; r = 0 (no distinct box triple at all): -0.792 (SCS only for r <= 3).
n = 8: r = 2 (4 of 56 zeroed) -0.173; r = 1: -0.419; r = 0: -0.728 (SCS only). Not understood; one implementation.

(b) PROVED (new, elementary). Setting of PROOF_trickle Lemma B/D. Let i != j with H_ij != 0 and let B be a set of indices
containing i and j such that T_ijk = 0 for all k in B. Put w := sum_{k not in B} T_ijk e_k. Then a.w = H_ij and
   (E')   G := H D H - H  >=  (a_i/s_i) v_i v_i^T + (a_j/s_j) v_j v_j^T,   v_i := l_i - (s_i/H_ij) w,  v_j := l_j - (s_j/H_ij) w.
Proof. For k in B: (P_i)_jk = H_ij H_ik/s_i - T_ijk = H_ij H_ik/s_i; for k not in B: (P_i)_jk = H_ij H_ik/s_i - w_k. So
P_i e_j = (H_ij/s_i) v_i and (P_i)_jj = H_ij^2/s_i > 0. For P >= 0 and e with e^T P e > 0: P >= (Pe)(Pe)^T/(e^T P e). Hence
P_i >= v_i v_i^T/s_i, likewise P_j >= v_j v_j^T/s_j with the same w, and G = sum_k a_k P_k >= a_i P_i + a_j P_j. a.w = H_ij
because sum_k a_k T_ijk = H_ij.  QED
With B = boxes, w lives on the two fibre indices: one free parameter, and lambda_min is concave in it, so (E') is a
one-dimensional convex test with no SDP solver. COMPUTED (`eprime.py.txt`): best value of lambda_min of
[G - ...] on a-perp over w, per pair: zeta L=1 n=6: -5.96 .. -6.35 (15 pairs); n=8: -4.38 .. -4.96 (28); n=16: -2.07 .. -2.78
(120); zeta L=0.5 n=8: -0.87 .. -1.21; Beurling L=0.5 n=8: -0.86 .. -1.17. (E') fails for EVERY pair in every case: this is a
solver-free proof (in floating point, margins of order 1) that no pair can be fibre-only on these matrices.
At a critical window (Hv = 0) (E') forces v_i.v = 0, which is Lemma E. I have no statement in terms of the margin alone,
and none for the distinct-only variant.

(c) Nothing in Lemmas A-E or Theorem F uses that the atoms sit at logarithms of integers, nor the Euler product.
A: any N, p, q. B: sign of the off-diagonal of H, at step 5 only. C, D, E, F: no sign at all (F5's ">= 0 on distinct triples"
uses off-diagonal >= 0). The integers enter only as data (`box.py.txt`: lam() against beurling()). The one sentence that
mentions Poisson summation over the integers is the "Meaning" paragraph after Lemma D, which is commentary. So every
conclusion of the seat is true verbatim for a Beurling system with non-negative couplings.

## 4. Three facts about mirror positivity seen from the box Weil form (for board B3; `mirror_checks.py.txt`, mirror_checks.log)

(M1) PROVED (two lines). Mirror (Hankel) form of the fibre-extended matrix Ntilde, on the half space {x > 0} + {F1}
(reflection J: x -> -x, F1 <-> F2), for phi on (0, L] and alpha the coefficient of F1:
   Ntilde(h, Jh) = K_H(phi) + 2 alpha <phi, e^{-x/2}> + alpha^2
                 = primes_H(phi) + sum_{m >= 1} ( int phi e^{-(2m+1/2)x} dx )^2 + ( alpha + int phi e^{-x/2} dx )^2 ,
because w(u) = sum_{m>=0} e^{-(2m+1/2)u} and its m = 0 term is e^{-x/2} e^{-y/2}: the pole fibre completes the m = 0
note of the Gamma kernel to a square. (With F2 on the positive side the functional is e^{+x/2} and the form is not >= 0.)
COMPUTED: no primes, L = 1 and 0.5, 24 boxes: smallest eigenvalue -5e-18, +2e-17 (F1); -0.53, -0.12 (F2).
With zeta's atoms on boxes: -0.85 (5 of 13 negative), -0.45 (4 of 13): R2-curv's D4 again (boxes are not lattice points).
(M2) COMPUTED. The system with NO primes (Gamma factor + pole) is mirror positive in the continuum by (M1), and its Weil form
is negative from L = 0.38: odd block 4.8e-2 (0.36), -9.1e-3 (0.38), -6.4e-2 (0.40), -0.19 (0.45), -0.31 (0.50); even block
positive up to 0.45 and -1.8e-2 at 0.50 (24 boxes; agrees with r2_parity's 0.37 .. 0.38). Same for zeta(s)(1 - 2^{-s})
(primes >= 3, atoms at odd integers) on windows L < (1/2) log 3 = 0.549, where its window form IS the no-prime form.
(M3) COMPUTED. Mirror positivity on the integers is unchanged if every prime's weight log p is multiplied by any c_p >= 0
(the mirror matrix becomes sum_p c_p log p v_p v_p^T). The window form is not: L = 1, weights of 2, 4 multiplied by c_2:
lowest eigenvalue of Q, 48 boxes: c_2 = 0: -0.527; 0.5: -0.258; 0.9: -4.3e-2; 0.97: -7.8e-3; 1.00: +1.2e-3; 1.03: -2.2e-2;
1.1: -8.1e-2; 2: -0.873. (24 boxes: 0.97 gives +4.5e-3, i.e. not resolved; 1.03 gives -1.8e-2.)
Consequence (follows from M2 and M3, which are COMPUTED negative Rayleigh quotients on a subspace, i.e. witnesses up to
rounding, with margins >= 7e-3): any statement "mirror positivity + H => block inequalities on every window" is false
unless the hypothesis H fails for the no-prime system, for zeta(s)(1 - 2^{-s}) and for c_2 = 1.03; in particular H cannot be
"the atoms sit at integers" and cannot be invariant under positive reweighting of the primes.

## 5. Board B33: the odd block of Ntilde (`oddblock.py.txt`, oddblock.log)
Folded basis (e_i +- e_Ji)/sqrt2, i a box in x > 0, and (F1 +- F2)/sqrt2. Entry between boxes at x, y > 0: K(|x-y|) +- K(x+y).
COMPUTED: even block: 0 negative off-diagonal entries of 156 (24 boxes) and of 600 (48 boxes), L = 1. Odd block: 38 of 156, 108 of 600
negative, smallest -0.505 / -0.398; L = 0.5: 12 of 156; no primes (L = 0.45): 0 of 156 (w is decreasing). So
odd block = (non-negative off-diagonal) - (mirror matrix of the primes).
Certificate and the odd block (PROVED, Lemma B steps 4 + 5): a = Perron vector is even, D commutes with J, so M_odd <= M_odd^2;
Perron on the FULL matrix gives eigenvalue 1 simple with an even eigenvector; hence M_odd <= 0.
CORRECTION of my wording in B52: the witness is v = D^{1/2} y, y an odd eigenvector of M = D^{1/2} H D^{1/2} with eigenvalue in (0,1)
(it exists iff the odd block has a positive eigenvalue); then v^T (HDH - H) v = (mu^2 - mu)|y|^2 < 0. Not "the eigenvector of H itself".

## 6. Board B42: block-averaged Bakry-Emery (`blockbe.py.txt meanfield|weil`, blockbe.log)
Definition. For a partition of the sites into blocks S: rho_S := sup{rho : sum_{k in S} pi_k (Gamma_2 - rho Gamma)(f)(k) >= 0 for all f},
rho* := min_S rho_S. PROVED (sum over blocks; R2-curv's C4 argument): gap >= rho*. Blocks = sites: pointwise Bakry-Emery.
One block: rho* = gap exactly (sum_x pi_x Gamma_2 = ||Lf||^2).
Mean field (PROVED): resampling chain, uniform pi, g = f - <f>, V = <g^2>: Gamma = (V + g_k^2)/2, Gamma_2 = (3V + g_k^2)/4, so
sum_{k in S} pi_k (Gamma_2 - rho Gamma) = (3/4 - rho/2) theta V + (1/4 - rho/2) int_S g^2, theta = pi(S). For |S| >= 2 a mean-zero g
supported in S exists (int_S g^2 = V), hence   rho_S = (1 + 3 theta)/(2 + 2 theta)   exactly: 1/2 at theta -> 0, 5/6 at theta = 1/2, 1 at theta = 1.
COMPUTED m = 40: |S| = 2, 10, 20, 40: 0.54762, 0.70000, 0.83333, 1.00000 = formula.
Weil chain (H = Ntilde, a = Perron, L = 1; rho*, and in brackets the mean-field value for the pi-share of the worst block):
| partition | zeta n=24 | zeta n=48 | Beurling n=24 | Beurling n=48 |
|---|---|---|---|---|
| sites | 0.5280 (0.532) | 0.4816 (0.517) | 0.5230 | 0.4825 |
| 8 box blocks + F1 + F2 | 0.6107 (0.588) | 0.6025 (0.588) | 0.5898 | 0.5833 |
| quarters, fibres at the ends | 0.7034 (0.662) | 0.6976 (0.662) | 0.6920 | 0.6865 |
| two mirror halves (x<0 + F2, x>0 + F1) | 0.8431 (0.833) | 0.8364 (0.833) | 0.8280 | 0.8204 |
| boxes, F1, F2 | 0.6264 (0.587) | 0.6262 (0.587) | 0.6275 | 0.6274 |
| one block | 1.0002 | 1.0000 | 0.9539 | 0.9281 |
So "the factor 2" is the theta -> 0 end of a curve; the Weil chain follows the mean-field curve within 0.01 to 0.04; block values are
stable under refinement where the site value is not; the control is separated only by the single block (the gap).
Tensor version (PROVED, proof here). Let S_1..S_r be a partition of the indices, b_i := a restricted to S_i (so a = sum b_i),
H_i := T.b_i = sum_{k in S_i} a_k T_k, l_i := H b_i, sigma_i := b_i.s > 0. Assume each H_i has at most one positive eigenvalue,
H has off-diagonal >= 0, and the r x r matrix Hhat := (b_i^T H b_j) is irreducible and non-degenerate (its off-diagonal entries
are >= 0 automatically, the supports being disjoint). Then H has exactly one positive eigenvalue.
Proof. H_i a = l_i and a^T H_i a = sigma_i, so by step 2 of Lemma B H_i <= l_i l_i^T/sigma_i, and summing, H <= H D' H with
D' := sum_i b_i b_i^T/sigma_i. On W := span(b_i) this reads Hhat <= Hhat C Hhat, C = diag(1/sigma_i); Hhat 1 = sigma, so steps 4-5 of
Lemma B (Perron on the r x r matrix) give that Hhat has exactly one positive eigenvalue. Every x is z + x' with z in W and
b_i^T H x' = 0 for all i (Hhat non-degenerate); then x'^T H x' <= x'^T H D' H x' = 0 and x^T H x = z^T H z + x'^T H x'.  QED
r = n is Lemma B, r = 1 is "H <= l l^T/s", the conclusion itself. The cone tensor of Lemma C has T.b with at most one positive
eigenvalue for EVERY b with l.b >= 0 (the proof of Lemma C with l_k replaced by l.b and H e_k by H b). So each of these
intermediate conditions is, as an existence statement, again equivalent to the conclusion. For T^BE the block condition reads
sum_{k in S} pi_k (Gamma_2 - Gamma)(k) >= sum_{k in S} pi_k (Kf)_k^2 - (sum_{k in S} pi_k (Kf)_k)^2/pi(S), which is stronger than
block-averaged CD(1) (the right side is a variance, >= 0).

## 7. Board B49: one fibre FIELD instead of two fibre nodes (`blockbe.py.txt E`)
W0 := form of the kernel e^{-|x-y|/2} (the m = 0 term of w), P := pole form 2<f,p><f,q>. Kernel identity:
   p(x)q(y) + q(x)p(y) - e^{-|x-y|/2} = e^{|x-y|/2} =: E(x,y).
e^{-|x-y|/2} is the Green function of -d^2/dx^2 + 1/4 on the line (2 kappa = 1), p and q are its two harmonic functions, and -E is the
growing fundamental solution (boundary conditions u' = +-u/2 at the ends). PROVED: E has exactly one positive eigenvalue on any
window (E = P - W0, W0 > 0, P has one positive eigenvalue, <1, E 1> > 0); E has full rank, so NO single border node can replace
the two fibres in the shift picture (a node contributes rank one to the Schur complement). In the mirror picture the same
kernel is e^{(x+y)/2}, rank one: that is where S1-parity's cancellation (B25) lives.
One-field form (PROVED, Haynsworth): N' := N - W0 = primes - (arch without its slowest exponential). Then N' - E = -Q and
   #positive eigenvalues of [[N', E],[E, E]] = 1 + #negative eigenvalues of Q   (E non-degenerate of signature (1, n-1)).
All off-diagonal entries of this 2n x 2n matrix are >= 0 (w - e^{-u/2} = sum_{m>=1} e^{-(2m+1/2)u} > 0; E > 0).
COMPUTED 24 boxes: E = direct compression of e^{|x-y|/2} to 3e-15; eig(E) = 2.894, -5.9e-4, ...; min off-diagonal of N' 8.8e-4 (L = 1),
4.5e-3 (L = 0.5); #pos = 1, 1, 5, 2 = 1 + #neg(Q) for zeta L = 1, 0.5, Beurling L = 1, no primes L = 0.45.
The matrix inverse of the box compression of E is NOT tridiagonal (defect 1e2), so I make no claim about E^{-1} on boxes.
