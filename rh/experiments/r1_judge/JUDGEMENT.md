# Round 1 judgement (judge: r1_judge, 2026-11-10)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. "(from memory)" marks unverified citations.
All judge computations are double precision or mpmath, single run, in this folder. Files:
`wavepacket.py.txt`, `wp_primeside.py.txt`, `thetadial.py.txt`, `missing_prime.py.txt` and their logs.

## 0. Verdict in one paragraph

Round 1 produced good instruments and no route. Every number a critic rechecked reproduced. No idea is above L1
and none is a step toward L4. Three things changed during judging: (i) the "horizon lemma" of lane A's critic is
false as stated (judge's computation, section 1.1); (ii) the "theta dial" of lane C's critic is now reproduced by a
second implementation and its off-line zeros are located (section 1.2); (iii) lane B's "missing-prime fee" also
holds for a single missing prime with the same constant (section 1.3). The strongest output of the round is the
family of control instruments (zero surgery, pencil, theta dial, multiplicity dial) and one corrected law for what
a finite window can see.

## 1. What the judge computed

### 1.1 Horizon lemma (lane A critic, C2): kill line hit  [COMPUTED, two routes for the base value]
Claim under test: "every zero configuration with zeta's counting function whose members below 1.5 x 4 pi e^{2L}
are on the line has a non-negative window form on [-L, L]".
Configuration: zeta's zeros with ONE neighbouring pair replaced by an off-line quartet at the pair midpoint
(the critic's own surgery). Test vector, no eigen-solve: f(u) = phi(u) cos(mu u), phi(u) = sinh(delta u)(1-(u/L)^2)^p.
`python3 wavepacket.py.txt L delta height halfwidth p`:

| L | delta | quartet height | height / (4 pi e^{2L}) | taper p | Rayleigh quotient of the modified form |
|---|---|---|---|---|---|
| 3.0 | 0.49 | 15000.37 | 2.96 | 2 | **-2.478** |
| 3.0 | 0.49 | 15000.37 | 2.96 | 1 | **-5.62** |
| 2.7 | 0.49 | 8000.37 | 2.88 | 1 | **-2.78** |
| 3.0 | 0.49 | 40000.16 | 7.89 | 2 | +0.46 |
| 3.2 | 0.49 | 30000.17 | 3.97 | 2 | +1.57 |
| 3.0 | 0.30 | 15000.37 | 2.96 | 2 | +1.44 |
| 3.5 | 0.30 | 100000.22 | 7.26 | 2 | +2.16 |
| 1.0 | 0.49 | 201.88 | 2.17 | 2 | +2.77 |

A positive value only says that this one vector does not detect the quartet. Two configurations are negative
(L = 3.0 at 15000.37, both tapers; L = 2.7 at 8000.37). The two delta = 0.49 configurations further out (3.97 and 7.89
times the horizon) are positive; there the local on-line sum is large (unmodified quotient 12.4 and 11.0 against 5.2).

Checks. The quartet term equals the closed form -(int phi sinh(delta u))^2 to all printed digits. The sum over
on-line zeros is converged in the zero range (753, 1991 zeros: same 7 digits). The unmodified value
Q_zeta(f)/||f||^2 = 5.1696 (zero side) agrees with 5.1695 from the PRIME side
(`python3 wp_primeside.py.txt 3.0 0.49 15000.3685 2`, 98 prime powers <= 403, Guinand-Weil formula): two independent routes.
A first version of the script kept an unresolved mirror term (aliasing error about 1e-2); fixed, and the sign did not change.
Not done: Arb, full eigenproblem, a second implementation of the quartet term.

So a single off-line quartet at about 3 times the proposed horizon makes the form negative at L = 3 although
every zero below it is on the line. The critic's kill line ("any configuration with the correct counting function, all
members on the line below 1.5 x 4 pi e^{2L}, and a negative eigenvalue") is hit. The critic's garbage run at
L = 0.58 is not contradicted: at that L the mechanism below does not reach.

Mechanism [HEURISTIC, matches the table]. For an odd envelope phi the quartet contributes -(int phi sinh(delta u))^2
and the on-line zeros near the packet contribute about (1/2) log(T/2 pi) int phi^2 (their local density), so the form
is negative when
    sinh(2 delta L)/(2 delta) - L  >  c * (1/2) log(T / 2 pi),   c between about 0.3 and 1.3 (local zero spacing).
This is a SECOND regime of visibility, beside the "ladder" regime measured by lanes A (T < about 4 pi e^{2L}).
From the critic's surgery table the ladder regime fits 4 pi e^{2L*} = T + (0.9 +- 0.2) log T ln(1/delta) for T >= 35
(judge's fit to 16 of the 20 rows; the T = 17.6 rows are off by 15%).
In terms of X = e^{2L}: far from the line a window sees offsets delta > about log(2 delta log T)/log X,
which is the classical scale X = (log T)^{1/(sigma - 1/2)}.

Consequence. The critic wrote that an off-line zero just above the verified height 3e12 "would first show at
e^{2L} about 2.4e11". That holds only for zeros very close to the line. For delta near 1/2 it would show at L of
about 3 to 3.6 (primes up to about 400 to 1300); for delta = 0.1 at L of about 11.5. The hoped corollary
"verification to 3e12 gives unconditional positivity for windows containing all primes up to 1e11" is therefore
out of reach by this route; the corrected ceiling is e^{2L} of order 1e3.

### 1.2 Theta dial (lane C critic, N1): reproduced and sharpened  [COMPUTED, second implementation]
`python3 thetadial.py.txt count n 18.3 24 0.1` and `... root n sigma t` (mpmath 70 digits; Riemann splitting with
incomplete gamma functions and exact binomial coefficients r_n(m), no numerical integration of theta^n).
Validation: n = 1 gives 7.0674, 10.5110, 12.5054 (zeta ordinates halved); n = 2 gives 6.0209, 10.2438, 12.9881, 14.1347.

| n | on-line zeros in (18.3, 24) | zero off the line Re s = n/4 |
|---|---|---|
| 1.3 | 18.5362, 20.8981, 21.3598, 23.9828 | none (critic: 20.90, 21.36) |
| 1.4 | 18.4731, 23.9127 | 0.368894 + 21.146073 i (offset 0.0189) |
| 1.5 | 18.4205, 23.8218 | 0.557087 + 21.161908 i (offset 0.1821) |
| 1.8 | 18.3199, 23.5011 | 0.614261 + 21.206138 i (offset 0.1643) |
| 2.0 | 21.0220, 21.4506, 23.2784 | none |

The critic had only inferred the off-line zeros from a missing pair; they are now located (|Lambda| < 1e-72 at each).
The collision is just below n = 1.4: with offset^2 linear in n near a collision, n_c = 1.399 [HEURISTIC extrapolation].
The critic's blind prediction n_c(40) in (1.3, 1.5) is confirmed.

### 1.3 Missing-prime fee for one missing prime (lane B critic, C-1)  [COMPUTED, lane B's Gram matrix]
`python3 missing_prime.py.txt` (run from r1_B; least squares over all k <= N coprime to the missing primes; N = 2000).
C_N(S) / (three-interval local bound): S = {3}: 0.06075/0.05516 = 1.10; {3,5}: 1.17; {5,7}: 1.17; {5}: 1.24.
C_N is still falling slowly with N in each case, and for {7}, {11}, {13} the fee is within a factor 3 of the
finite-N floor d_N^2 = 0.0061, so those ratios (1.5 to 2.8) say nothing. My local bound is not valid when 2 is
among the missing primes (the intervals overlap); those rows are to be ignored.
Reading: the constant 1.14 to 1.16 that the critic found for "all primes above P missing" also appears when a
single small prime is missing. It looks like the gap between the three-interval bound and the true local cost,
not something that grows.

### 1.4 Checked by reading only
- A3: the critic's logic is right (section 2). - B critic's proof that D_S > 0: checked line by line, correct.
- C2: the critic's counterexample nodes [85, 115] contain both off-line ordinates 85.70 and 114.16, so it refutes
  the stated counting window [T-8, T+8], not the idea that negatives count off-line zeros inside the node range.
- A1 convergence: mu_zeta_c.log gives 2.45e-165, 4.94e-167, 3.98e-167 at N = 200, 300, 400, as the critic says.

## 2. Disputes settled

| dispute | ruling | evidence |
|---|---|---|
| A2: is 4 pi e^{2L*}/(qT) in [0.6, 1.2] a law? | No. Critic right; and there is a second regime neither side saw. | surgery.log (10 of 20 outside); section 1.1 |
| A3: reduction or equivalence? | Not a reduction. The hypothesis gives mu_2 >= R(theta_L) >= 0 (R < 0 would refute RH outright), i.e. at most one negative square, which already implies RH by parity. | reasoning; DH parity counts 1+1, 2+2 |
| A-critic C2 horizon lemma | Killed as stated. | section 1.1 |
| B-1: does the prime filtration beat the 1/log N floor? | No: D_P(N) >= d_N for every N. The object D_S survives; the claim does not. | one line; critic's sandwich |
| B-1 WALL 2 (D_S > 0 unprovable) | Not a wall. Critic's three-interval proof is correct. | checked |
| B-2 kill line | Hit (a_1 drifts 10 to 13% per doubling), and P(1) -> 0. | b2_stability |
| C2 counting claim | False as stated; true statement is the Krein-Langer bound. | c2_T100.log |
| C3 | Refuted by the critic's X = 1e6 run (six zeros). | c3.log |
| C4 | Part 1 is de Branges-Lagarias; part 2 mis-parametrised. Critic right. | c4_unit |
| D1 numerics | Measure deletion noise, not the zero. Critic's z = 0.5 control is decisive. | bc_*.log |
| D2 "exactly" | "up to O(1) boundary terms, GRH for the two ends up to T". | 153 vs 153.5 |

## 3. Ranking

Score = chance (0-10) that the idea leads to a new unconditional theorem or a real reduction of RH. Not generous.

| idea | lane | score | status | why |
|---|---|---|---|---|
| Theta-power dial (C critic N1) | C | 4 | alive | Two implementations; off-line zeros located. A one-parameter family through zeta with an exact functional equation and a unique solution at every setting, which still loses RH. Instrument, not a route; a small theorem ("off-line zeros for every 1 < n < 2") looks provable. |
| Missing-prime law (B critic C-1) | B | 3 | alive | One small proved statement (D_S > 0 with an explicit floor), a clean constant (1.10 to 1.17) confirmed for single missing primes. Still RH with a rate; no idea how to bound the remainder. |
| Two-regime visibility law (judge J1; replaces A2, A-C2) | A/C | 3 | open | Corrects two round-1 claims; single implementation with a prime-side cross-check. Could become a clean "positivity on [-L,L] excludes isolated zeros with offset delta below height exp(X^delta/delta)" lemma. |
| Pencil lab (D2) | D | 3 | alive | L1, reproduced. The continuous control group the other lanes need. Instrument only. |
| Zero-surgery controls (A critic C1) | A | 3 | alive | Dial-an-impostor. Perturbation code has one implementation; judge's wave packet agrees with it in spirit, not digit for digit. |
| FE-rigid dial as control for uniqueness arguments (judge J2) | C/lead | 3 | open | Kills in advance any argument that uses only uniqueness of the solution of the functional equation; must be run on idea #9. Dimension count is from memory plus a search snippet. |
| One price list C(S) (judge J3) | B/D | 3 | open | Unifies lane B's staircase and lane D's deletions; first numbers support "cost is local". Untested for thin infinite S. |
| Semilocal Nyman-Beurling (B-1) | B | 3 | open | The object is good; "beats the floor" and "better detector" are dead. Fold into the missing-prime law. |
| Detection height (A2) | A | 2 | open | Numbers exact; the law is replaced by J1. |
| Horizon lemma (A critic C2) | A | 2 | killed | Kill line hit at L = 3 (section 1.1). The generic-junk observation at L = 0.58 stands. |
| Price of a zero (D1) | D | 2 | open | Strictly stronger than RH, no mechanism, experts conjecture the opposite, and the numerics measured noise. Worth keeping only through D4. |
| Discrepancy lower bound (D4) | D | 2 | open | Smallest statement on the D1 route; untested; the natural proof is circular. |
| Second critical line (D critic) | D | 2 | open | Says what a cheap deletion system must look like; nothing computed. |
| Multiplicity dial (D critic) | D | 2 | alive | A correct control (integer weight kills the main term). Explains D1's numbers; not a route. |
| Threshold law (D7) | D | 2 | open | Four minima fix no exponent. Restate as a distribution of critical values, and move it to the theta dial where zeta itself is the base point. |
| Fejer-window test (C1) | C | 2 | parked | Lemma F is correct; it is the diagonal of the Weil form. Keep as the 0.2-second detector. |
| Certified S_100 >= 0 (C critic N2) | C | 2 | open | A finite certified sentence the impostor fails. Small, honest rule-6 target. |
| Exact sum over zeros for d_N (B critic C-2) | B | 2 | open | Suggestive spectrum at resolution 1.79; read Landreau-Richard 2002 first. |
| Prolate law (A1) | A | 2 | parked | Reproduced; mechanism is Connes-Consani; a measurement. |
| Pick/Loewner identity (A5) | A | 2 | alive | Proved off the lattice, generic to every truncated convolution form. A tool. |
| Kernel shape is not the reason (D3) | D | 1 | alive | A narrow negative result that stands (four properties, grid check). |
| One-gap reduction (A3) | A | 1 | killed | Not a reduction. By-product kept: parity-resolved negative index. |
| Kicked Krein system (A4) | A | 1 | parked | a(L) undefined; in substance Suzuki's canonical systems (KNOWLEDGE section 7). |
| Second-order recipe (B-2) | B | 1 | parked | Own kill line hit; repaired form is a fit. |
| Zoomed control (B-3) | B | 1 | parked | Floor lemma right; the lane sees zeros only through 1/|rho|^2. |
| Heat-flow energy (B-4) | B | 1 | parked | Known (de Bruijn 1950, Ki-Kim-Lee 2009). |
| Pick pencil (C2) | C | 1 | parked | Loewner framework; ill-posed continuation. Good zero-finder. |
| Fractional Eisenstein (C4) | C | 1 | parked | de Branges programme restated; the global object that exists (theta^n) has no Hecke operators. |
| Totally positive density (D5) | D | 1 | parked | Known equivalence (Groechenig, Katkova). |
| Shadow pairs (C3) | C | 0 | killed | Six zeros at X = 1e6; folds into C1. |
| Carry deformation (D6) | D | 0 | killed | Own kill line hit; reproduced. |

## 4. Walls, as exact statements

- **WJ1 (locality; merges A-W3, C-W-C5).** For a Dirichlet series F with functional equation and for L below the
  first-detection window L*(F), no computed property of the window form on [-L, L] separates F from zeta. Not known:
  any quantity Phi(L), defined from the prime side on [-L, L], with Phi_zeta(L) != Phi_DH(L) in a way not explained
  by zeros below the visibility curve of section 1.1.
- **WJ2 (accuracy; A-W2).** inf spec Q_L is about (1 - chi_4(2 pi e^{2L})) x power of L, i.e. about exp(-4 pi e^{2L}).
  Any proof of Q_L >= 0 through an estimate of sum_{n <= e^{2L}} Lambda(n) n^{-1/2} g(log n) needs error below that.
  Missing: a positive measure on R whose Fourier transform equals the Weil distribution on (-2L, 2L), built without zeros.
- **WJ3 (gap; A-W1).** No lower bound mu_2(L) - mu_1(L) >= K L e^{(1+2 delta)L} (R(theta_L) - mu_1(L)) is known, and
  any such bound contains mu_2(L) >= 0, which is already RH.
- **WJ4 (rate of the prime filtration; B-WALL 1).** Not known: D_P^2 = O(1/(P log P)), where D_P = dist(chi, closed
  span{frac(1/(kx)) : k P-smooth}). Proved: D_P^2 >= m_P > 0 with m_P about (1/2) sum_{n > 1, gcd(n, P#) = 1} n^{-2}.
- **WJ5 (missing estimate; B-WALL 3).** sum over h, k <= N of mu(h) mu(k) w(h) w(k) (pi/2hk)(V(h,k) + V(k,h)) = main term
  + o(1), V the Vasyunin cotangent sum, w(k) = 1 - log k/log N. The elementary terms contain sum_{k <= N} mu(k) w(k),
  not known to be o(1) with the needed uniformity.
- **WJ6 (resolution of Dirichlet polynomials; B-WALL 4).** Proved: an off-line zero rho forces
  d_N^2 >= (2 beta - 1)/(|rho|^2 (1 + (2 beta - 1)/|rho - 1|^2)); Burnol: d_N^2 >= (C + o(1))/log N. So length N cannot tell
  a zero on the line from one within about 1/log N of it.
- **WJ7 (conservation of difficulty; C-W-C1).** For fixed X >= 70, not proved without zeros:
  2 sum_{n <= X} Lambda(n) n^{-1/2} (1 - log n/log X) cos(t log n) <= Pole_X(t) + Arch_X(t) for all real t.
- **WJ8 (half-shift; C-W-C3).** No Hilbert space is constructed, without the zeros, whose scattering function is
  Lambda(k' - w)/Lambda(k' + w) for some 1/2 < k' < 1. Every geometric positivity known gives k' = 1.
- **WJ9 (Hodge index; B9 unchanged).** No candidate for Spec Z x Spec Z has a proved inequality E.E <= 2 (E.h)(E.v).
- **WJ10 (heat-flow direction; B-WALL 6).** Every functional of the zeros of H_t computed is monotone forward in t.
  Not found: F with F(t) <= F(0), F(0) bounded by arithmetic, whose finiteness excludes a double real zero at t > 0.
- **WJ11 (Beurling cost; D-W2, W3).** Not decided: for S a set of primes with pi_S(x) = Li(x^a) + O(x^{a'}), a' < a,
  a > 1/2, is #{n <= x : gcd(n, S) = 1} - Ax = Omega(x^c) for some c(a) > 0? Equivalently, can zeta_S have all its zeros
  in Re s > c located at zeros of zeta, with polynomial growth of zeta/zeta_S there, for every c > 0?
- **WJ12 (shape of the kernel; D-W6).** Find a property P of an even kernel K that holds for Phi_zeta, fails for
  Phi_DH, and implies real zeros of the cosine transform. None of positivity, log-concavity, Csordas-Varga concavity,
  Turan (m <= 40) separates the two.
- **WJ13 (new, judge).** "The window form N = primes - arch has exactly one positive eigenvalue on every window"
  (idea #10, claim a) is implied by RH but does not obviously imply it: with Q = pole - N and the pole of signature
  (+ on even, - on odd functions), it gives at most one negative square of Q in each parity block, i.e. at most ONE
  off-line quartet [linear algebra PROVED; "each quartet costs one negative square per block" HEURISTIC, DH: 1+1, 2+2].
  The statements equivalent to RH are the block inequalities N_even <= 2 <f, cosh(u/2)>^2 and
  N_odd <= -2 <f, sinh(u/2)>^2.

## 5. Cross-links (what no single lane could see)

1. **One map of what each test can see.** Window with primes <= X: zeros near the line up to height about 4 pi X
   with exponentially fine resolution (lane A, critic's surgery), and zeros at offset delta up to height about
   exp(X^delta/delta) (judge). Fejer diagonal (lane C): about half the X-efficiency of the full form, trivially
   positive above T0(X) = 2 pi exp(8 sqrt X/log X). Nyman-Beurling (lane B): offset 1/log N, weighted by 1/|rho|^2,
   so height T needs N > exp(c T^2). Pick matrix from Re s = 1.25 (lane C): precision exponential in height.
   The window is the only efficient detector, and its far regime is the classical X = (log T)^{1/(sigma-1/2)}.
2. **Three counts of the same integer.** Lane A's parity-resolved negative index (one even + one odd per quartet),
   lane C's negative eigenvalues of Pick matrices (Krein-Langer index) and lane D's count of critical values of
   rho(t) all count off-line quartets and are monotone under refinement. Together with WJ13 this says what the
   signature target of idea #10 can and cannot give.
3. **The dial is the pencil for zeta.** Lane D noted that zeta is alone in its functional-equation space, so the
   pencil cannot be built for zeta. Lane C's dial is the missing family: exact functional equation for every n,
   zeta at n = 1. And by Hecke's dimension count (1 + [k/4] for the theta group, from memory, consistent with a search
   snippet) the solution of the functional equation is unique for every 0 < n < 8. So uniqueness does not force RH.
   What n = 1 and n = 2 have and 1 < n < 2 lacks is Hecke operators. This is a ready control for idea #9
   (positivity forces the primes) and corrects the reading of KEY_LEMMA S1. Exact, by hand: the normalised
   coupling at m = 3 is (2/3)(n-1)(n-2) log 3 < 0 for 1 < n < 2, so idea #10's sign fact fails at once off n = 1.
4. **A two-parameter picture.** Dial n (lane C) and heat time t (lane B) both keep the functional equation. In the
   (n, t) plane let Lambda(n) be the de Bruijn-Newman constant of theta^n. Then Lambda(1) = 0 iff RH (given
   Rodgers-Tao), Lambda(1.4) > 0 by section 1.2, Lambda(2) = 0 iff GRH for Q(i). CONJECTURE to test: Lambda(n) > 0 for every
   non-integer n near 1, so zeta is an isolated zero of Lambda. Lane D's threshold law (D7) is the same question in
   the pencil direction.
5. **One price list.** Lane B's staircase (a missing prime q costs about 1/(2 q^2)) and lane D's deletions (a thin set
   of deleted primes costs the integers x^{a/2} of noise) are the same functional: the additive unevenness forced by
   a multiplicative defect. With C(S) = Nyman-Beurling distance using only k coprime to S: RH iff C({p > P}) -> 0;
   section 1.3 suggests C(S) is within 1.1 to 1.2 of its local bound for small S. Lane D's "second critical line" a/2
   is, for S = all primes, the critical line itself.
6. **Exact stages versus truncations.** With primes <= 7 lane A's ground state gives gamma_1 to 3e-26; with primes
   <= 1e6 lane C's truncated Euler family gives 0.0069. Lane B's prime filtration is exact but only algebraic
   (1/(P log P)). Of the exact finite stages, only the window is exponentially efficient.

## 6. Round 2 (kill lines fixed now)

1. **Visibility map on real impostors.** Second implementation of section 1.1 in Arb (full even/odd eigenproblem at
   L = 2.7 with the quartet at 8000.37, or a certified Rayleigh quotient). Then run lane A's form along lane D's pencil
   (quartets below height 300) and compare L* with both regimes. Blind prediction to register: at L = 3, delta = 0.49,
   the sign of the wave-packet quotient for quartets at pair midpoints nearest T = 6000, 10000, 20000, 60000.
   Kill: the second implementation gives a positive form at (3.0, 0.49, 15000.37); or more than half of the pencil
   quartets are first detected outside +-0.08 in L of the two-regime prediction.
2. **Dial battery.** n_c(T) for the first ten collisions up to T = 200, on both sides of n = 1; idea #9's feasible set
   and lane A's first-failure window along the dial; Lambda(n) at n = 1.4 by heat-flowing the located pair back.
   Smallest theorem to attempt: Z_n has a zero off Re s = n/4 for every 1 < n < 2.
   Kill: n_c(T) stays above 1.2 up to T = 500 (then the dial says nothing local about zeta); or the solution space of
   the functional equation is not one-dimensional under idea #9's conditions.
3. **Missing-prime law.** Converge kappa_P for P = 11, 13 with a well-conditioned y-space solve; compute the exact
   one-prime cost C({q}) by Szego theory for q = 3, 5, 7 and compare with section 1.3; run the Davenport-Heilbronn
   staircase. Kill: converged kappa_P > 1.5 at P = 11 or 13; or C({q})/fee grows with N past 1.5 for q = 3.
4. **Write out the parity lemma and WJ13.** "If Q_L has at most one negative square for every L then RH", via
   Krein-Langer extension, and the exact relation between idea #10's signature claim and RH. Kill: a surgery
   configuration with one quartet whose form has fewer than two negative squares at large L (then the count is wrong).
5. **One certified sentence the impostor fails.** S_100(t) >= 0 for all real t by interval arithmetic plus the trivial
   bound beyond T0, then the same for the odd sinh packet of section 1.1 with delta = 0.3085, which should catch
   Davenport-Heilbronn at smaller X than the triangle (X* about 60). Kill: T0(70) above 1e11 with no zero-side substitute.

## 7. Literature touched by the judge (3 web searches, summaries only, nothing read in full)
- Hecke series of signature (lambda, k, gamma); a snippet of arXiv 2007.13844 quotes Berndt's dimension formula
  1 + [k(1/4 - 1/(2m)) + gamma/4 - 1/4], which for the theta group (m = infinity, gamma = 1) is 1 + [k/4]. Not read.
- Weil positivity on finite windows: the search returned only 2026 numerical preprints; nothing on "verified height
  implies positivity on a window" was found. Yoshida 1992 and Bombieri's "Remarks" remain unread.
- arXiv 2304.09545 and 2401.02813: zeros of sum r_alpha(n) n^{-s} ON the line Re s = alpha/4 (Hardy-type); the
  summaries show no result on zeros leaving the line as alpha varies.
