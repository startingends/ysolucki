# PROOF_dial: what singles out the special points of the theta dial (SP-modular, 2026-11-11)

Status of this file: three small statements about the CONTROL family of ideas 12 and 13 (the theta dial), with full
proofs. They are statements about impostors, not about zeta, and they are not steps toward the Riemann Hypothesis.
They answer the lead's question Q3 ("state exactly what singles out those points") with identities instead of memory.
Novelty: NOT established (two web searches, summaries only; see the end).

Notation. theta(tau) = sum_{j in Z} e^(pi i j^2 tau) = 1 + 2q + 2q^4 + 2q^9 + ..., q = e^(pi i tau).
For n in C: theta^n = sum_{m>=0} r_n(m) q^m (principal branch; r_n(m) is a polynomial in n of degree m).
Z_n(s) = sum_{m>=1} r_n(m) m^(-s) is the dial of idea 12. C(n,k) = n(n-1)...(n-k+1)/k!.

## Lemma 0 (coefficients, finite). For every n:
   r_n(1) = 2n,  r_n(2) = 4 C(n,2) = 2n(n-1),  r_n(3) = 8 C(n,3) = (4/3) n(n-1)(n-2),
   r_n(6) = 64 C(n,6) + 24 C(n,3),  r_n(7) = 128 C(n,7) + 64 C(n,4).
Proof. theta^n = (1+u)^n = sum_k C(n,k) u^k with u = 2q + 2q^4 + 2q^9 + ..., and the coefficient of q^m in u^k is 2^k times
the number of ordered k-tuples of positive squares with sum m. m = 1: (1). m = 2: (1,1). m = 3: (1,1,1). m = 6: (1,1,1,1,1,1)
and the three orderings of (4,1,1). m = 7: (1,...,1) seven times and the four orderings of (4,1,1,1). QED.

## Theorem A (the multiplicativity defect at the first coprime pair). For every n in C:
        2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8).
Proof. By Lemma 0, 2n r_n(6) = (8/45) n^2 (n-1)(n-2)(n-3)(n-4)(n-5) + 8 n^2 (n-1)(n-2) and r_n(2) r_n(3) = (8/3) n^2 (n-1)^2 (n-2).
So the left side is (8/45) n^2 (n-1)(n-2) [ (n-3)(n-4)(n-5) + 45 - 15(n-1) ] and
(n-3)(n-4)(n-5) + 60 - 15n = n^3 - 12n^2 + 32n = n(n-4)(n-8). QED.
Machine check (exact rational arithmetic, dial_coeffs.py.txt, PROGRESS P5): the two sides agree at n = 1/2, 6/5, 7/5, 9/5,
5/2, 3, 7/2, 5, 6, 7, 9, 10, 1, 2, 4, 8; both sides are polynomials of degree at most 7, so 16 points prove the identity again.

Corollary A. Let n != 0 and a_n(m) = r_n(m)/r_n(1). Then a_n(2) a_n(3) = a_n(6) if and only if n in {1, 2, 4, 8}.
Hence Z_n(s) is a constant times an Euler product prod_p (1 + a(p) p^(-s) + a(p^2) p^(-2s) + ...) ONLY IF n in {1, 2, 4, 8}.
Converse (KNOWN: Jacobi's formulas r_2/4 = sum_{d|m} chi_4(d), r_4/8 = sum_{d|m, 4 not| d} d, r_8/16 = sum_{d|m} (-1)^(m+d) d^3;
formulas from memory, the last two also seen in a search summary; each right side is visibly multiplicative; n = 1 is
trivial). COMPUTED: the defect 2n r_n(ab) - r_n(a) r_n(b) vanishes at n = 1, 2, 4, 8 for (a,b) = (2,5), (3,4), (3,5), (2,7),
(4,5), (3,7), (2,9), and is non-zero at n = 6 for (2,3) (-3072), (3,4), (2,7), (3,7).
Remark. {1, 2, 4, 8} are the dimensions of the real normed division algebras (Hurwitz); in those dimensions Z^n carries a
maximal order whose norm form is the sum of n squares and is multiplicative. The polynomial n(n-4)(n-8) is the trace of
that fact on the dial. The sign of the defect alternates: a_n(6) < a_n(2) a_n(3) on (1,2) and (4,8), > on (0,1), (2,4),
(8, inf). So "is an Euler product" is the zero set of a function that changes sign at each special point: it is not a
one-sided (positivity) condition in n.

## Theorem B (signs of coefficients). r_n(2) < 0 for 0 < n < 1; r_n(3) < 0 for 1 < n < 2; and
        r_n(7) = n(n-1)(n-2)(n-3) [ 8/3 + (8/315)(n-4)(n-5)(n-6) ] < 0 for 2 < n < 3.
Proof. The first two are read off Lemma 0. For the third, C(n,7) = C(n,4)(n-4)(n-5)(n-6)/210, so
r_n(7) = C(n,4)[64 + (128/210)(n-4)(n-5)(n-6)], which is the displayed formula. For 2 < n < 3: n(n-1)(n-2) > 0, n - 3 < 0, and
(n-4)(n-5)(n-6) lies in (-24, -6), so the bracket lies in (8/3 - 64/105, 8/3 - 16/105), positive. QED.
(Check: r_{5/2}(7) = -35/16, exact, dial_coeffs.log.)
So for 0 < n <= 3, theta^n has all coefficients >= 0 if and only if n in {1, 2, 3} (for integer n they count lattice points).
COMPUTED beyond (exact rationals, dial_coeffs.log): n = 3.1: first negative coefficients at m = 28, 47, 103 (48 of the first
1000); n = 3.5: m = 16, 40, 64, 88, 112, 128 (76 of the first 2000); n = 3.9: m = 64, 128, 256, 448 (9 of the first 1000);
n = 4.5, 5.5, 6.5, 7.5: none among the first 1000. CONJECTURE (not proved): for every non-integer n in (3,4) some
coefficient is negative, and for every real n >= 4 none is. If so, coefficientwise positivity separates integers from
non-integers on the dial exactly below 4, and is blind above.

## Theorem C (positive solutions of the theta functional equation). Let 0 < n < 8 and k = n/2. Let
f(tau) = sum_{m>=0} a_m e^(pi i m tau) with (a_m) of polynomial growth, and f(-1/tau) = (tau/i)^k f(tau) on the upper half-plane.
Then f = a_0 theta^n. Consequently, for 0 < n <= 3: a non-zero such f with all a_m >= 0 exists if and only if n in {1, 2, 3}.
Proof. theta has no zero in the upper half-plane and theta^n(-1/tau) = (tau/i)^k theta^n(tau), theta^n(tau+2) = theta^n(tau)
(principal branches; both sides of the first identity are analytic, have equal modulus, and agree at tau = i). So
f/theta^n is invariant under tau -> tau + 2 and tau -> -1/tau, which generate Gamma_theta, and f has moderate growth
(Bondarenko-Radchenko-Seip, arXiv 2005.02996, sec. 3: for 2-periodic F moderate growth is "tantamount to" a Fourier
expansion over m >= 0 with coefficients of polynomial growth). So f lies in their M_k(Gamma_theta, +), whose dimension is
1 + floor(k/4) = 1 for k < 4 (their Proposition 3.1, citing Berndt-Knopp Thm 6.3; read in the TeX source). It contains
theta^n, so f = a_0 theta^n. The second statement follows from Theorem B and r_n(m) >= 0 for n = 1, 2, 3. QED.
In words: a "Poisson summation formula in dimension n" carried by a POSITIVE measure on the radii sqrt(m) exists, for
0 < n <= 3, exactly in the dimensions where there is a lattice to count.

## Controls
- Violating A (not an Euler product): dial members n = 1.2, 1.4, 1.8 of board B2 (defect -0.936, -2.009, -2.263), n = 3
  (48), n = 6 (-3072). Violating B/C (a negative coefficient): the same non-integer members; n = 3 and n = 6 PASS.
- NOT violating either: F_d and G_d (multiplicative; F_d has coefficients n^(-d) sigma_(2d)(n) > 0). These statements are
  blind to barrier B11. Epstein zeta functions of forms with class number > 1 have counting coefficients >= 0 and a
  functional equation, no Euler product and zeros off the line (KNOWLEDGE B2): "the coefficients count something" is not
  sufficient for anything about zeros. That is a caution for notebook N38, which looks for a count attached to WINDOW
  functions, not to coefficients.

## Barriers (preamble rule 6)
B1: Theorem A is a statement about the Euler product itself (where it can exist). B2/B11: run on the controls above.
B3: nothing here has slack or zeros in it. These are finite identities and one cited dimension formula.

## Novelty (owner rule 5)
Searches (2026-11-11, summaries only): (1) "r_s(n)/2s OR r_k(n)/(2k) multiplicative if and only if k = 1, 2, 4, 8 sums of
squares Bateman": no statement found; (2) "Lehmer 1948 On the partition of numbers into squares r_s(n)/2s multiplicative
only s = 1, 2, 4, 8": the paper exists (Amer. Math. Monthly 55, 476-481); the summaries do not state the result.
FROM MEMORY: for INTEGER n the statement "r_n(m)/(2n) is multiplicative iff n in {1,2,4,8}" is classical (I believe
Lehmer's note proves it); I could not confirm it by reading. The polynomial identity of Theorem A for real n, Theorem B
(iii) and Theorem C were not found in anything I read (BRS has the dimension formula, not the sign statement; atlas F20
already records r_n(2), r_n(3) and their signs). Status: not found in what was read; NOT established as new.

## Nomination to FORMAL (finite, algebraic)
(F1) In Q[n]: 2n (64 C(n,6) + 24 C(n,3)) - (4 C(n,2)) (8 C(n,3)) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8).
(F2) In Q[n]: 128 C(n,7) + 64 C(n,4) = n(n-1)(n-2)(n-3) (8/3 + (8/315)(n-4)(n-5)(n-6)); and for real 2 < n < 3 the value is < 0;
     4 C(n,2) < 0 on (0,1); 8 C(n,3) < 0 on (1,2).
(F3) Lemma 0 as a statement about truncated power series: the coefficients of q^1, q^2, q^3, q^6, q^7 in
     sum_{k<=7} C(n,k) (2q + 2q^4)^k.
