# S1-cubic, turn 3: detail behind the board posts (B156, B158)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Box basis, double precision; `python3 tools/memcap.py 1 python3 t3.py.txt 48`
(3 s) and `... t3b.py.txt` (20 s); logs t3.log, t3b.log. Predictions Q1-Q7 are in NOTES.md with their times, written before the runs.

Notation (even block, folded to the boxes in x > 0): N_e = even block of N = primes - arch (all off-diagonal entries >= 0),
c = folded cosh functional, normalised so that the true even Weil block is Q_e = c c^T - N_e. B := -N_e. "Pole strength t": B + t c c^T,
t = 1 is zeta's.

## 1. The even ground state inside the bordered matrix (B156 a, d)
PROVED (Lemma A remark 3 applied to Q - mu). Let psi be an even eigenvector of Q with eigenvalue mu. Then
phi(psi) = (psi, -<psi,q>, -<psi,p>) is a null vector of M_mu := bordered matrix of N + mu (boxes shifted by mu, fibres unchanged), and
#pos(M_mu) = 1 + #neg(Q - mu). M_mu has all off-diagonal entries >= 0, so its top eigenvector is positive (Perron). Hence:
 - EVEN block, psi the ground state (mu = mu_1, Q - mu_1 >= 0): M_mu has exactly one positive eigenvalue and phi(psi) is the eigenvector
   of its SECOND eigenvalue, 0. It is orthogonal to the positive Perron vector, so it has both signs; if psi > 0 on the boxes then
   both fibre entries are negative (they are -<psi,e^{-x/2}>, -<psi,e^{x/2}>).
 - ODD block: the bordered odd block of N + mu is [[N_o + mu, s],[s^T, -1]] (s = the odd fibre column, > 0); (psi, <s,psi>) is a null
   vector and for the ground state the top eigenvalue of that matrix is 0: there the ground state IS the Perron vector, with the fibre
   entry of the SAME sign. So B52 (odd block of Ntilde keeps the sign without primes) and B140 (folded odd block of Q is a Perron
   operator there) are one fact seen before and after eliminating the fibre node: eliminating a node with negative diagonal entry
   from a matrix with non-negative off-diagonal entries adds s s^T >= 0 and keeps the sign pattern (one line); the eigenvectors differ
   (B68) but the ground state of the reduced matrix is the box part of the Perron vector of the shifted bordered one.
COMPUTED (48 boxes): zeta L = 0.5, 0.75, 1, one-prime 0.54, no primes 0.36: eigenvalues of M_mu: 3.00 / 4.11 / 5.31 / 3.16 / 2.37, then 0 to
1.6e-15, then negative; phi(psi) is eigenvector no. 2; fibre entries -0.858, -1.110, -1.305, -0.936, -0.749. On failed rows (Beurling 0.5,
no primes 0.45) M_mu has two positive eigenvalues and phi(psi) is no. 3.

## 2. Is there a theorem for the sign pattern? (B156 b)
What I know (FROM MEMORY, not read this session): Fiedler 1975: for an irreducible symmetric matrix with non-negative off-diagonal
entries, the eigenvector y of the second largest eigenvalue has connected sets {y >= -a} (a >= 0); so at most two "weak" sign
domains, each connected in the graph of the matrix. It does not say which vertices fall on which side. Here every off-diagonal
entry is > 0 (complete graph): every subset is connected and the theorem gives NOTHING. "One positive eigenvalue" adds nothing I know of.
Also: mu_1 is not "just above the principal eigenvalue" of B = -N_e. COMPUTED, zeta L = 1: nu_1(B) = -4.303, nu_2(B) = +1.03e-2, mu_1 = 1.16e-3:
mu_1 - nu_1 = 4.30, nu_2 - mu_1 = 9.1e-3. The ground state is (N_e + mu_1)^{-1} c = lead - rest with lead = u_1 <u_1,c>/(mu_1 - nu_1) > 0 and
|rest|/|lead| = 0.50 in L^2, max of rest/lead pointwise 0.927 (L = 0.5: 0.57, 0.892; no primes 0.36: 0.35, 0.894; failed rows: 1.4 to 3.9 in L^2,
1.5 to 4.8 pointwise). So the anti-maximum principle (valid for mu in (nu_1, nu_1 + delta)) is not the mechanism here: the correction is
93% of the leading term at the worst box.

## 3. The thresholds t_0 and t* (B156 c)
PROVED (rank-one perturbation, textbook algebra). Let N_e have exactly one positive eigenvalue and c^T N_e^{-1} c > 0. For t > 0 the
lowest eigenvalue mu(t) of B + t c c^T is the root of t c^T (N_e + mu)^{-1} c = 1 in (nu_1, nu_2), increasing in t; the ground state is
(N_e + mu(t))^{-1} c; mu(t_0) = 0 at t_0 := 1/(c^T N_e^{-1} c), so the block is >= 0 iff t >= t_0, and the null vector at t_0 is
f := N_e^{-1} c. t* := the smallest t at which the ground state has a sign change.
COMPUTED (t3b.log; bisection; "edge" = the first negative entry is the last box):
| system, L, boxes | lowest eigenvalue of the even block | t_0 | t* | sign changes of f = N_e^{-1} c |
|---|---|---|---|---|
| zeta 1.0, 24 | 3.74e-3 | 0.998956 | 1.004274 edge | 0 |
| zeta 1.0, 48 | 1.155e-3 | 0.999666 | 1.001270 edge | 0 |
| zeta 1.0, 96 | 3.73e-4 | 0.999891 | 1.000388 edge | 0 |
| zeta 0.75, 48 | 1.54e-3 | 0.999386 | 1.001982 edge | 0 |
| zeta 0.5, 48 | 2.00e-3 | 0.998671 | 1.003738 edge | 0 |
| zeta 0.3, 48 | 8.96e-3 | 0.991336 | 1.246497 edge | 0 |
| one prime 0.54, 48 | 1.66e-3 | 0.999067 | 1.003600 edge | 0 |
| no primes 0.36, 48 | 2.79e-3 | 0.997516 | 1.052044 edge | 0 |
| weight at 4 x 1.01, 0.75, 48 (not resolved by boxes) | 1.53e-3 | 0.999392 | 1.001992 edge | 0 |
| no primes 0.45, 48 | -4.34e-3 | 1.004456 | 0.855101 edge | 1 |
| Beurling 0.45, 48 | -3.09e-3 | 1.003914 | 0.952333 edge | 1 |
| weight at 4 doubled, 0.75, 48 (N_e has 2 positive eigenvalues) | -8.8e-2 | (0.9988) | 0.979134 box 6 of 24 | 1 |
| Beurling 0.5, 48 (2 positive) | -3.2e-2 | (0.9580) | 0.947156 edge | 1 |
Readings of the numbers only:
(i) "t* >= 1 exactly on the rows whose even block is >= 0": TRUE on all 13 rows. On the 11 rows where N_e has one positive eigenvalue the
    true strength 1 lies between t_0 and t*: t_0 < 1 < t* (positive rows), t* < 1 < t_0 (negative rows).
(ii) The window [t_0, t*] is narrow and SHRINKS under refinement: zeta L = 1: width 5.3e-3, 1.6e-3, 5.0e-4 at 24, 48, 96 boxes, with
    (t* - 1)/(1 - t_0) = 4.1, 3.8, 3.6. Both ends tend to 1 at the rate of the box margin.
(iii) On every positive row the sign is lost at the EDGE box. The critical vector f = N_e^{-1} c tends to zero at the window edge:
    f/cosh(x/2) falls monotonically from 0.149 at the centre to 0.007 at the edge (48 boxes; list in t3b.log), edge value 0.0235, 0.0072,
    0.0023 at 24, 48, 96 boxes. The one interior loss is the doubled weight at 4 (box 6 of 24).
So in boxes the conjecture of B119 for the even block is a statement about the EDGE VALUE of the ground state, decided at second
order, and the true strength sits within 0.04% (96 boxes) of the strength at which that value changes sign.
HEURISTIC (not proved, to be checked by someone with the true basis): differentiating mu(L) with respect to the window gives a
Hadamard-type formula -d mu/dL = C x (edge amplitude of the ground state)^2; with S1-parity's numbers at L = 1 (mu = 8.2e-30,
d log mu/dL about -158 from B112) sqrt(mu x 158) = 3.6e-14, against the reported minimum 2.1e-14 of the even ground state (B58).
Finite-dimensional form, PROVED (Cauchy interlacing with the equality case): if M' is M with one index deleted, lambda_min(M) <= lambda_min(M'),
with equality iff some ground state of M vanishes at that index.

## 4. Other computed facts (t3.log, 48 boxes)
- Green kernel (inverse of the folded block): even block entrywise positive on every positive row (min 0.21 to 1.6). Odd block
  entrywise positive at zeta L = 0.5, 1, one prime 0.54, no primes 0.36, but NOT at zeta L = 0.75 (50 of 576 entries negative, min -1.03)
  although the odd ground state is nodeless there. So "positive Green kernel" is not the mechanism for the odd block (my Q3 MISS).
- Sturm pattern (k-th eigenvector of Q on the whole window has k sign changes): no primes 0.36: all 48; zeta L = 1: k < 7;
  zeta 0.75: k < 5; zeta 0.5 and one prime 0.54: k < 4; failed rows: fails at k = 0.

## 5. Candidate statement for B158 (a fourth, grown from B119, B140 and Lemma A)
(F) STATEMENT. On the window [-L, L]: the even solution f of N f = cosh(x/2) (N = primes - arch compressed to the window; i.e.
f = N_e^{-1} c, the null vector of the even Weil block at its critical pole strength) has one sign. It contains no pole strength.
COMPUTED true for zeta at L = 0.3, 0.5, 0.75, 1 (24 to 96 boxes), false for: weight at 4 doubled at 0.75 (interior sign change),
no primes at 0.45, Beurling 2 -> 2.1 at 0.45 and 0.5.
WHAT I DO NOT KNOW, and it decides whether (F) is a candidate at all: on all 11 computed rows with one positive eigenvalue of N_e,
(F) holds iff the even block is >= 0. If that is a theorem, (F) is the even inequality in another form (rule 2). The algebra says the
two are different conditions (t* >= t_0 against t_0 <= 1), tied together only by reading (i) above.
