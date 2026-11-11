# SHORT_FAMILY: the short-family mean square in the operator toolkit

SP-operator, 2026-11-11. Written without reading SP-modular's answer. Read for this file: rh/NOTEBOOK.md N49, N53; digest
rh/library/openai-qrh-11-12.md (whole). No source opened; KNOWN = from memory unless stated. One formula check (scratchpad
check.py, 30 digits, below). Labels: PROVED / KNOWN / COMPUTED / CONJECTURE / RISK.

## 1. The Nyman-Beurling form as an operator
Setting. c = (c_d)_{d<=N}, f_c(x) = sum_d c_d rho(1/(dx)) on (0, inf), M_c(s) = sum_d c_d d^-s, b := 1 * c (Dirichlet convolution),
b_n = sum_{d|n, d<=N} c_d: the coefficients of zeta(s) M_c(s). The Moebius vector is c = mu w_N.
(1a) PROVED (Mellin-Plancherel; N53): ||f_c||^2 = (1/2pi) int |zeta(1/2+it) M_c(1/2+it)|^2 dt/(1/4+t^2). Mellin of rho(1/(dx)) is
     -d^-s zeta(s)/s on 0 < Re s < 1.
(1b) THE GRAM MATRIX, factorised (PROVED). G_N = P_N T_1^* Gamma T_1 P_N, where
     - T_1 = [1_{a|b}] (b over a), the DIVISOR MATRIX: the multiplicative Toeplitz operator of symbol zeta (convolution by 1),
       "analytic" (it moves e_d to multiples of d); its inverse is the Moebius matrix [mu(b/a) 1_{a|b}];
     - Gamma(m, n) = 1/max(m, n) = sum_{k >= max(m,n)} 1/(k(k+1)): Gamma = A A^T, A(m, k) = 1_{m <= k}/sqrt(k(k+1)) (Cesaro-type).
       Gamma is the Gram matrix of {1_(0,1/m)} in L^2(0, inf); in the normalised coordinates x_m = c_m/sqrt(m) it is the
       multiplicative Toeplitz matrix [(min/max)^(1/2)] = [int (m/n)^(it) dt/(2pi(1/4+t^2))] (PROVED: the Fourier transform of
       1/(1/4+t^2) is 2pi e^(-|u|/2)). KNOWN (Hardy's inequality, from memory): ||Gamma||_{l^2 -> l^2} = 4.
     Hence, for c with sum_d c_d/d = 0 (the pole condition M_c(1) = 0, the same bookkeeping as bridge plank 5),
          ||f_c||^2 = || A^T T_1 c ||^2 = sum_{k>=1} |sum_{d<=N} c_d floor(k/d)|^2 / (k(k+1)).                 (1.1)
     Proof: with y = 1/x, sum c_d rho(y/d) = y M_c(1) - sum c_d floor(y/d), constant on [k, k+1); int_k^{k+1} dy/y^2 = 1/(k(k+1)).
     COMPUTED (check of (1.1), random c, N = 7, k < 4000 both sides, 30 digits): 0.12948469226652842389852298 on both sides,
     relative difference 2e-30. Formula (1.1) is elementary and is surely known (Baez-Duarte's discrete Nyman-Beurling; not searched).
(1c) THE WINDOW IDENTITY (PROVED; the multiplicative analogue of plank 5 and of Borodin-Okounkov). The window {1..N} is closed
     under divisors, so P_N T_a = P_N T_a P_N for every analytic multiplicative Toeplitz T_a (if d > N all multiples of d are > N);
     hence P_N T_1 P_N and P_N T_{1/zeta} P_N are mutually inverse. For c = mu 1_{[1,N]} this is Moebius inversion: (T_1 c)_n = [n = 1]
     for n <= N EXACTLY, so S_k(b) = sum_{d<=N} mu(d) floor(k/d) = 1 for k <= N and = 1 - R_N(k) for k > N,
          R_N(k) := sum_{N < d <= k} mu(d) floor(k/d)   (R_N(k) := 0 for k <= N).
     The Nyman-Beurling approximant is -sum_d mu(d) rho(1/(dx)); in y = 1/x it equals S_floor(y) - y M_N(1), so (no pole condition needed)
          d_N^2 := || -sum_{d<=N} mu(d) rho(1/(dx)) - 1_(0,1) ||^2_{L^2(0,inf)} = sum_{k>=0} int_k^(k+1) |R_N(k) + y M_N(1)|^2 dy/y^2
     (the k = 0 term, = M_N(1)^2, is the part of the approximant on x > 1). COMPUTED check (N = 6, k < 200, 20 digits, direct
     piecewise quadrature of the left side against the right side): they agree to 1e-21 (0.17952227897969552914 both) once the k = 0 term is included; my first
     version omitted it and was off by exactly M_6(1)^2 = 0.017778 (0.179522 against 0.161745), which located the error.
     The term y M_N(1) is the pole bookkeeping (it contributes about N M_N(1)^2 from k <= N; a smooth weight with M_c(1) = 0 removes it,
     at the price of exact inversion only where the weight is 1). Apart from it, ALL the energy lives BEYOND the window: the
     Moebius vector is exactly in the kernel of P_N(T_1 c - e_1), and the distance is a mean square, over the long family k in
     (N, inf) with weights 1/k^2, of Moebius sums R_N(k) of length < k. On the dyadic block k ~ X the family (k) and the sums
     (d in (N, k]) have the SAME length: exactly the borderline H ~ D of N53.
(1d) SPECTRUM. In normalised coordinates G~_N = [ (ab)^(1/2) G(a,b) ] = compression to {1..N} of the multiplicative Toeplitz matrix
     [nu^(log(a/b))], nu = |zeta(1/2+it)|^2 dt/(2pi(1/4+t^2)). Viewed on the group Q_+, its symbol is the push-forward of nu to the
     dual group T^infinity (one coordinate p^(it) per prime) along the Kronecker line t -> (p^(it))_p: a SINGULAR measure on T^infinity.
     PROVED consequences: (i) ||G~_N|| >= (1/N) <G~ 1, 1> = (1/N) int |sum_{a<=N} a^(it)|^2 d nu ~ N int d nu/(1+t^2): the top of the
     spectrum grows like N (the vector 1, smooth in log a, i.e. the trivial twist t ~ 0); (ii) the diagonal is constant
     (= log 2pi - gamma), so most of the N eigenvalues are tiny (effective rank about (T/pi) log N for the part of nu at height <= T);
     (iii) the Moebius vector x = (mu(a) w(a) a^(-1/2)) has ||x||^2 ~ (6/pi^2) log N, and RH (N53) <=> <G~_N x, x> = O(1), i.e. Rayleigh
     quotient O(1/log N). It is NOT near the bottom of the spectrum (the bottom tends to 0 for trivial dimension reasons); it sits in
     the bulk with bounded energy. The precise spectral form of RH here: the mass of x on the spectral subspace E_(K, inf) of G~_N
     is O(1/K) uniformly in N. KNOWN in type (from memory: Toeplitz operators on H^2(T^infinity) are bounded iff the symbol is L^inf;
     Helson; Hedenmalm-Lindqvist-Seip): the singularity of the symbol on T^infinity is why G~_N is unbounded as N -> inf and why no
     Szego/Helson theorem on T^infinity applies to it.

## 2. Why the large sieve gives only the trivial term, as an operator statement
(2a) PROVED. Let R_T: l^2({1..N}) -> L^2[-T, T], (R_T x)(t) = sum x_n n^(-it). Then R_T^* R_T = [2 sin(T log(m/n))/log(m/n)] (sinc kernel
     sampled at the nodes log n: a time-and-band-limiting matrix with NON-uniform nodes). Montgomery-Vaughan (KNOWN):
     ||R_T||^2 <= T + O(N). The O(N) is attained, for every fixed T >= 1: for x = 1 on (N/2, N], sum n^(-it) ~ N^(1-it)(1 - 2^(-1+it))/(1-it),
     so ||R_T x||^2 >> N^2 while ||x||^2 = N/2. Mechanism: the nodes log n crowd (spacing 1/n); a cluster C_j = {n : log n in [j/T, (j+1)/T)}
     has about e^(j/T)/T members whose exponentials are indistinguishable on [-T, T]; then ||R_T x||^2 ~ 2T sum_j |sum_{n in C_j} x_n|^2
     (HEURISTIC in the constants; exact in order of magnitude by a Gallagher-type splitting). So ||R_T||^2 ~ T . max_j |C_j| ~ N: the D-term
     IS the top singular value, and its singular vectors are the cluster-constant vectors, smooth in log n at scale 1/T.
(2b) THE POINT (PROVED as a reading of (2a) and of digest step 4): the top singular directions are the TRIVIAL TWIST. In the t-family
     they are t ~ 0 (n^(-it) ~ 1 on a cluster); in the sextic family (i) they are the rows on which the symbol is trivial (u = p^6,
     A_u = A_1 + O(D/Y), digest step 3), which is exactly how the paper extracts A_1. For the Moebius vector the D-term contribution is
     T sum_j |cluster sum of mu(n) n^(-1/2)|^2, i.e. short-interval (log-scale 1/T) Moebius sums: the original problem. So in the short
     regime the large sieve is sharp AND equivalent to the statement it should prove; a mean square over a short family can never be
     an amplifier, because its extremal vectors are the copies.
(2c) What extra structure of the coefficient vector would beat it: an EXACT statement that the Moebius vector is orthogonal (to within
     square-root size) to the cluster-smooth subspace, not an estimate valid for all vectors. In the elementary form (1c): the tail
     R_N(k) = sum_{N<d<=k} mu(d) floor(k/d); write floor(k/d) = k/d - 1/2 - psi(k/d). The d > sqrt k part of psi(k/d) is smooth in d (the
     cluster part, the D-term), and against it one needs sum_{d ~ y} mu(d) F(d) << y^(1/2+eps) for smooth F: RH-strength. Only an exact
     transformation of these sums (Poisson/theta: the quasi-RH paper's route via mu = cube of Gauss sums over Z[omega], digest steps 5-7)
     changes their length; nothing in the operator picture supplies one for mu over Z.

## 3. Rule 13 (c): an operator identity that would make the short family trivial
(3a) The one I name: an exact Krein / Levinson recursion in N, made explicit by the window identity (1c).
     The windows {1..N} are a NEST of divisor-closed sets, and on each of them the analytic multiplicative Toeplitz operators
     compress multiplicatively (PROVED in 1c). Gram-Schmidt in N gives, exactly (KNOWN, linear algebra),
          d_N^2 - d_(N+1)^2 = |<1 - f_N, r_(N+1)>|^2 / ||r_(N+1)||^2,   r_(N+1) = residual of rho(1/((N+1)x)) against the first N,
     a Levinson recursion with "reflection coefficients" kappa_N = correlation of the target with the new residual. If kappa_N had a
     closed form (as Verblunsky coefficients do for a Toeplitz matrix on Z, through the Szego recursion), RH would be a statement
     about the summability of explicit numbers. The kind of object that would make it automatic: a GROUP structure in N, i.e. a
     Gram matrix that is Toeplitz for a group acting transitively on the nodes, with a bounded, absolutely continuous symbol: then
     Szego's theorem (on T, or Helson's on T^infinity) gives the limit and the recursion.
(3b) Why it probably fails, exactly. (i) The nodes log n are not a group orbit on the line; the only group present is Q_+, and on it
     the symbol of G~ is singular (carried by the Kronecker line in T^infinity, 1d): Szego-Helson theory needs an absolutely
     continuous symbol, and the passage from "almost every line" to "the line t -> (p^(it))_p" is Bagchi's strong recurrence (N46, N49).
     (ii) The window identity moves the energy to k > N but does not SHORTEN the sums: R_N(k) is again a Moebius sum of length
     comparable to k; there is no analogue of plank 5's archimedean gain (there the tail lived above the band edge, where
     log(frequency) won; here the tail is the same kind of object at larger scale). (iii) An exact recursion with explicit kappa_N
     would make d_N computable in closed form, hence decide RH by computation: implausible for that reason alone (owner rule 2 test).
(3c) The other two forms asked for, in one line each. G_N = B^T B with B = A^T T_1 P_N explicit (1b), and the Moebius vector is in the
     known kernel of P_N(T_1 c - e_1) (1c): this factorisation EXISTS and is elementary; it reduces the form to the tail and stops there.
     A commutation with the dilation semigroup x -> nx: Gamma commutes with no dilation (1/max(m,n) is not invariant under (m,n) -> (km,kn);
     it scales by 1/k), and the normalised Gamma~ is dilation-invariant but its compression to {1..N} is not: the cut breaks it,
     exactly the one-sidedness of the window.

## 4. Fake first: the impostor
For a Dirichlet series f = sum a_n n^-s with a_1 = 1 (Davenport-Heilbronn), put c = (coefficients of 1/f) on [1, N], T_f the
multiplicative Toeplitz operator of convolution by a. Everything in (1a)-(1c) holds verbatim with T_f in place of T_1 (PROVED: only
a_1 = 1 and divisor-closed windows are used): ||f M_N||^2-type form = window part + tail with R^f_N(k) := truncated sums of the
inverse coefficients. So the window identity is impostor-blind, like plank 5. Where the pole of 1/f at rho_0 = 0.808 + 85.7i shows
(HEURISTIC, by Perron): the partial sums of the inverse coefficients carry a term x^(rho_0)/rho_0 (times the cutoff), so R^f_N(k)
has size N^(0.808) for k ~ N, the tail is ~ N^(1.616) sum_{k>N} k^(-2) ~ N^(0.616) -> inf. In the spectral picture (1d): the impostor's
normalised inverse vector has cluster sums growing like e^(0.308 j/T): it correlates with the top (cluster-smooth, trivial-twist)
eigenvectors and SATURATES the D-term, while under RH the Moebius vector must be asymptotically orthogonal to them. So the impostor
is the vector that the large sieve's extremal direction catches; the theorem to prove is that mu is not caught.
And the structural difference (KNOWN/PROVED): for zeta, T_1 = product over p of the one-variable analytic Toeplitz operators of
symbols (1 - z_p)^(-1) (Bohr lift; each outer), and T_{1/zeta} = product of (1 - z_p): finite products are outer, invertible in each
variable. For the impostor T_f is a SUM of two such products, not a product; its inverse is not a product of local inverses. The
operator picture therefore sees the Euler product as a tensor-product factorisation of T_1 over primes; the singular symbol (the
Kronecker line) is what prevents using it on the critical line.

## 5. Summary
1. Exact: ||f_c||^2 = sum_k |sum_{d<=N} c_d floor(k/d)|^2/(k(k+1)) under M_c(1) = 0, i.e. G_N = P_N T_1^T Gamma T_1 P_N, Gamma = [1/max] = A A^T.
2. Window identity: the Moebius vector is exactly in the kernel of P_N(T_1 c - e_1); the distance is a tail sum over k > N of
   R_N(k)^2/k^2, a family of the same length as its sums (the borderline H ~ D). Elementary, almost certainly known.
3. Normalised, G_N is a multiplicative Toeplitz compression with a singular symbol on T^infinity; its top grows like N; RH = bounded
   energy of a vector of norm^2 ~ log N, with O(1/K) mass above level K.
4. The large-sieve D-term is the top singular value of a non-uniform sampling operator; its extremal vectors are the trivial twist
   (clusters at t ~ 0, rows u = p^6). In the short regime the mean square is equivalent to the trivial-twist Moebius sum: no amplification.
5. Trivialising object: a Levinson recursion with explicit reflection coefficients, i.e. a group-Toeplitz structure with a.c. symbol.
   It fails because the symbol is carried by the Kronecker line, and the window identity does not shorten the tail.
6. Impostor: all identities hold; its inverse coefficients saturate the D-term (pole at 0.808); it is a sum, not a tensor product.
