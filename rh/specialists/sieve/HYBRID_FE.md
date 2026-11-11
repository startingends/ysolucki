# HYBRID_FE: the Gonek-Hughes-Keating product read through the functional equation (SP-sieve, 2026-11-11)
Construction only; no numerics were run (none was needed to decide the question). Labels: PROVED (argument here, given the cited formula) /
FROM MEMORY / HEURISTIC / CONJECTURE / RISK. READ: rh/CORE.md, NOTEBOOK N98. The GHK paper is NOT in the library and was not read:
every statement of it below is FROM MEMORY.

## 1. (v), and the formula
(v) The object that would make the wall trivial here: a POINTWISE bound, at one height t, for the short prime polynomial
   S_X(t, delta) := sum_{n <= X} Lambda(n) v_X(n) n^(-1/2-it) 2 sinh(delta log n)/log n,
of size X^(delta + o(1)) (square-root cancellation at that single t). Section 2 shows this is exactly what excluding an off-line quartet
through the hybrid product needs. The hybrid product does not supply it; it says where it is needed. So the hybrid product is a SHADOW.
THE FORMULA (FROM MEMORY: Gonek, Hughes, Keating, Duke Math. J. 136 (2007), Theorem 1). Let s = sigma + it, sigma >= 0, |t| >= 2, X >= 2,
K a fixed positive integer, u >= 0 smooth with mass 1 supported in [e^(1 - 1/X), e], U(z) = int_0^inf u(x) E_1(z log x) dx (E_1 the exponential
integral), v_X(n) = int_n^inf u(x) dx. Then
   zeta(s) = P_X(s) Z_X(s) (1 + O(X^(K+2)/(|s| log X)^K) + O(X^(-sigma) log X)),
   P_X(s) = exp( sum_{n <= X} Lambda(n) v_X(n)/(n^s log n) ),   Z_X(s) = exp( - sum_rho U((s - rho) log X) ).
UNCONDITIONAL as I recall it (RH is used only to say Z_X is small or a product over nearby zeros); the error is small for X <= |t|^(1 - eps).
It is a smoothed explicit formula for log zeta: LINEAR in Lambda (N98's first class), evaluated at one point.

## 2. The hybrid functional equation, and an off-line quartet
(2a) PROVED (from the formula at s and 1 - s, both with sigma in [0, 1], and zeta(s) = chi(s) zeta(1 - s)):
   log|P_X(s)| - log|P_X(1 - s)| = log|chi(s)| + log|Z_X(1 - s)| - log|Z_X(s)| + O(err),
   and at s = 1/2 + delta + it the left side is -Re S_X(t, delta) (expand n^(-1/2-delta) - n^(-1/2+delta)); log|chi(s)| = -delta log(t/2 pi) + O(1/t).
(2b) PROVED (symmetry of the zeros). The zero multiset is invariant under rho -> 1 - conj(rho) and rho -> conj(rho), so
   {(1 - s) - rho} = { -(s - rho) }  as multisets,  hence  log|Z_X(1 - s)/Z_X(s)| = Re sum_rho [ U(w_rho) - U(-w_rho) ],  w_rho = (s - rho) log X.
   With E_1(w) = -gamma - log w + Ein(w) (Ein entire; FROM MEMORY, standard), the logarithms cancel in the real part, so only the odd entire part
   Ein(w) - Ein(-w) = 2 sum_{k odd} w^k/(k k!) survives (averaged against u). It is exponentially large for |Re w| large, of size e^(|Re w|)/|w|.
   So the zero side has NO singularity at a zero (the zeros cancel exactly in zeta(s)/zeta(1 - s) = chi(s)); each zero within reach contributes
   about X^(|Re(s - rho)|)/(|s - rho| log X) with a phase.
(2c) THE QUARTET 1/2 +- beta + i gamma (and conjugates), t close to gamma, 0 < delta < beta. On-line zeros contribute X^delta/(|s - rho| log X)
   each (through Z_X(1 - s), where they lie to the right). The quartet contributes, through Z_X(1 - s), a term of size X^(delta + beta)/((delta + beta) log X)
   (the mirror of 1/2 - beta + i gamma lies to the right of 1 - s at distance delta + beta), and X^(beta - delta)/((beta - delta) log X) through Z_X(s).
   So the quartet FORCES |S_X(t, delta)| to carry a term ~ X^(delta + beta)/log X at t ~ gamma, against the typical size X^delta (Montgomery-Vaughan
   mean value over t in [T, 2T], X <= T: S_X ~ X^delta on average, FROM MEMORY in this normalisation).
(2d) THE INEQUALITY THE EULER PRODUCT GIVES, and why it is not enough (PROVED). Lambda >= 0 gives |S_X(t, delta)| <= S_X(0, delta) ~ X^(1/2 + delta)/((1/2 + delta) log X):
   the non-oscillating majorant, i.e. the POLE term (N62, Landau). It exceeds the forced X^(delta + beta) for every beta < 1/2: no contradiction for any
   off-line zero. To exclude the quartet one needs |S_X(t, delta)| << X^(delta + beta - eps) at the single height t ~ gamma: a pointwise square-root
   bound for a prime polynomial, which by Perron / the explicit formula IS the zero-free statement at that height (circular). The term that decides
   it is the oscillating prime sum S_X(t, delta) itself, measured against its pole majorant.
(2e) THE SIZE OF X. The quartet term beats the X^delta background once X^beta >> (number of zeros within reach) ~ log T, i.e. log X >> (log log T)/beta;
   for a near-collision beta ~ 1/log T this needs X = T^c, and the GHK error allows X up to T^(1 - eps): beyond Montgomery's line (X > T^(1/2)),
   in the bulk. So the object reaches the bulk; what it lacks is a pointwise bound, not range.
(2f) What exists instead (FROM MEMORY): large-value estimates (Montgomery, Halasz, Huxley) bound the NUMBER of t in [T, 2T] where S_X is large:
   zero-density, never zero-free (CORE 3; S2_B10d 3c). The hybrid FE, used with them, reproduces density theorems.

## 3. Tightness at a collision (beta -> 0)
PROVED (from 2c): the quartet's term X^(delta + beta)/((delta + beta) log X) tends continuously to the double-zero value 2 X^delta/(delta log X), with
difference ~ X^delta beta log X: linear in beta, uniformly tight. And at delta = 0 the zero side has modulus exactly 1 (pairs cancel by 2b): the
hybrid FE is EMPTY on the critical line itself. So the object is tight along colliding pairs (rule iii), but only because it is an identity.

## 4. Impostor (Davenport-Heilbronn f)
f has the functional equation and a Hadamard product; -f'/f = sum Lambda_f(n) n^(-s) for Re s > beta_max (> 1: f has zeros in Re s > 1,
Saias-Weingartner, S2_B10d 5b). The GHK derivation (contour shift of a smoothed -f'/f) runs with Lambda_f: P^f_X = exp(sum_{n <= X} Lambda_f(n) v_X(n)/(n^s log n)).
What changes: Lambda_f is not supported on prime powers, not >= 0, and grows like n^(beta_max - 1), so the error O(X^(-sigma) log X) becomes
O(X^(beta_max - 1 - sigma)) (RISK: fine at sigma = 1/2 only if beta_max < 3/2, not checked), and the majorant of 2d becomes X^(beta_max - 1/2 + delta).
The hybrid FE (2a)-(2c) holds verbatim, and its off-line zeros ARE present: the identity is satisfied by them. Since 2d gives no contradiction for
zeta either, nothing breaks for f: the object is TWIST-BLIND as an identity. The only impostor-sensitive line is the size bound |Lambda(n)| <= log n
(the same normalisation line as in S2 and S3), and it is too weak by X^(1/2 - beta).

## 5. Verdict and ratings
The hybrid product is pointwise and in the bulk, but it is the explicit formula localised at a point; through the functional equation it gives an
identity (2a)-(2b) in which an off-line quartet forces a large value X^(delta+beta) of a short prime polynomial at one height. The Euler product's
inequality (Lambda >= 0) bounds that polynomial only by its pole majorant X^(1/2+delta), short by X^(1/2-beta). What is missing is the same thing as
CORE 6's fixed bound: a pointwise (Stepanov-type) bound for one prime polynomial at one height.
Quality 4/10 (exact bookkeeping of where a quartet appears and of the missing factor X^(1/2-beta); rests on a formula recalled, not read).
Toward RH 1/10 (it re-expresses the zero-free statement at a height as a pointwise prime-sum bound; no new input).

## Check of N101 (SP-sieve, adversarial; N101 read at the end of rh/NOTEBOOK.md; no numerics)
Notation: S(t) = sum_{p <= X} a_p p^(-1/2-it) (prime-power terms are lower order), X = T^c, N = X^k, M_2k = int_T^(2T) |S|^(2k) dt.
(1) PARTLY CORRECT. Forward (PROVED): S^k is a Dirichlet polynomial of length N; Gallagher/Sobolev on unit t-intervals gives
    |S(t)|^(2k) << (log N)^2 sup-local integral <= (log N)^2 M_2k, so M_2k << T^(1+o(1)) gives |S(t)| << T^(1/(2k)+o(1)), which is <= X^eps once
    k >= 1/(2 c eps): ONE fixed k suffices (N101's k = 1/(eps c) is enough, with a factor 2 to spare). Only M_2k << T^(1+o(1)) is needed, not
    Gaussian constants. Converse: OVERSTATED. |S| << X^eps on [T,2T] gives only M_2k << T X^(2k eps) = T^(1 + 2k c eps), i.e. a moment bound with a
    power loss, not of Gaussian size. Equivalence holds at the level of exponents, not of constants.
(2) CORRECT up to smoothing (PROVED). For any coefficients b_n and a smooth kernel w with transform supported in [-1, 1]:
    int |sum b_n n^(-it)|^2 w^(t - T0)/T) dt = T sum_{m,n} b_m conj b_n (m/n)^(-i T0) w(T log(m/n)) = T^2 int |sum_{|log(n/x)| < 1/(2T)} b_n n^(-iT0)|^2 dlog x
    for w a triangle (self-convolution of an indicator); with sharp intervals one has only Gallagher's inequality (FROM MEMORY: Montgomery,
    Topics, Lemma 1.9). At height T0 ~ T the twist n^(-iT0) removes the t ~ 0 (pole, smooth-mean) part; the diagonal m = n is the Poisson
    (square-root) part of the variance and the off-diagonal is its excess. 'Variance around a smooth mean' is the right reading (Goldston-
    Montgomery's form), with that twist.
(3) CORRECT (PROVED as arithmetic, given (2)). Bounding each count by the sieve/Brun-Titchmarsh upper bound (right order, no cancellation):
    sum over the ~T intervals I of |count_I|^2 with b_n ~ n^(-1/2) gives about N/T times the diagonal: the loss is N/T = T^(kc - 1), which is
    T^(1/eps - 1) at N101's k and T^(1/(2eps) - 1) at the k of (1). Upper-bound sieves give the mean, never the deviation (parity: the
    deviation of a count of products of primes is a sign-sensitive quantity).
(4) CORRECT, from memory: k = 1 is Goldston-Montgomery (1987), under RH: pair correlation F(alpha) ~ 1 for alpha in [1, A] is equivalent to the
    variance of primes in intervals [x, x + delta x] being ~ delta x log(1/delta) for the matching range of delta. Here alpha = c.
(5) NOTHING KNOWN to me gives square-root variance for products of exactly k primes, each <= X, in multiplicatively short intervals, beyond
    the trivial range N = X^k <= T, where the mean value theorem makes the moment diagonal (KNOWN in this form, from memory: Soundararajan's
    moment lemma int_T^(2T) |sum_{p<=x} a(p) p^(-1/2-it)|^(2k) << T k! (sum |a(p)|^2/p)^k for x^k <= T, as used by Soundararajan 2009 and Harper).
    Bilinear (Type I/II) structure does not help: the coefficients are convolutions of PRIMES (both variables rough), so there is no smooth
    variable for Voronoi or a level-of-distribution input; in S2_B10d terms a Type II bound for bounded coefficients is attained by one
    character row and gives the D-term, i.e. exactly (3)'s loss. Known square-root variance results are for SMOOTH convolutions:
    d_2 = 1 * 1 (Jutila 1984, mean square of Delta(x + h) - Delta(x), via Voronoi; FROM MEMORY), partial results for d_k (Lester; Rodgers-
    Soundararajan in progressions; FROM MEMORY), and the function-field analogues (Keating-Rudnick, Keating-Rodgers-Roditty-Gershon-Rudnick,
    via Katz equidistribution; FROM MEMORY): those are N101's 'Weil/Deligne' side. 'Almost all intervals' results for almost-primes
    (Matomaki-Radziwill; Teravainen; FROM MEMORY) give variance o(mean^2), far from square-root.
    ONE LEAD (abstract only, search this session): Gorodetsky, arXiv 2111.00853, 'The variance of integers without small prime factors in short
    intervals': an UNCONDITIONAL variance asymptotic for y-rough integers in intervals of length at least a power of y, by complex analysis and
    sieve theory, 'connecting with statistics of y-smooth numbers'. Our set is the opposite (X-smooth, exactly k factors, all near X), and
    the rough-number result works where the sifting primes are SMALL against the interval, which is the sieve's comfortable regime; I expect
    it not to transfer (HEURISTIC), but its range is the one thing to read before closing (5).
VERDICT: (1) true forward, converse overstated; (2) true up to smoothing; (3) true; (4) true (from memory, under RH); (5) no foothold known
beyond the trivial range N <= T; one paper to read (Gorodetsky).
