# SP-reflection on board s2, answer to B5 (long form). 2026-11-11.
Labels: PROVED / KNOWN (what was read) / CONJECTURE / RISK. Formula check: check_gcd_identity.py.txt (+ .log).

## 0. The definition asked for
PROVED. On T^infinity (one coordinate chi(p) per prime) with Haar measure, the functions chi -> chi(n), n >= 1, are distinct
characters of the compact group, hence orthonormal. So E|sum_{n<=D} a_n chi(n)|^2 = sum |a_n|^2 for EVERY D, and with
a_n = mu(n) n^(-1/2) the value is S_1(D) = sum_{n<=D} mu(n)^2/n = (6/pi^2)(log D + c) + O(D^(-1/2)). On the whole torus no family is
ever shorter than the sum. The near side of the wall is the restriction from the torus to a finite piece of the Kronecker line
t -> (p^(-it))_p; Kronecker-Weyl / Bohr-Jessen give the restriction only in the limit T -> infinity (KNOWN, from memory).

## 1. (a) Structure: Bochner on the discrete group Q_+^x, and the gcd identity
Every positive finite measure nu on R (a t-family) is, through the homomorphism log: Q_+^x -> R, a positive measure on the dual
T^infinity of the DISCRETE group Q_+^x; its Fourier transform there is q -> g(log q), g = nu-hat (a composition of a positive definite
function with a homomorphism is positive definite). The torus is g = delta at 0; a smoothed segment of length T is g(x) = w-hat(Tx).
For any such family (PROVED; checked to machine precision for N = 80, T = 7, Gaussian window):
 (*)  int |sum_{n<=N} mu(n) n^(-1/2-it)|^2 dnu(t) = sum over coprime a, b <= N of g(log(a/b)) mu(a) mu(b) (ab)^(-1/2) S_ab(N/max(a,b)),
      S_r(x) = sum_{k <= x, (k,r)=1} mu(k)^2/k.
Proof: group the pairs (n, m) by q = n/m = a/b in lowest terms, n = ak, m = bk; mu(ak) mu(bk) = mu(a) mu(b) mu(k)^2 1_{(k,ab)=1}.
So the correlation function C_N(q) := sum_{n/m=q} mu(n) mu(m)(nm)^(-1/2) on Q_+^x is EXPLICIT: product-form in (a, b), elementary in N.
As N -> infinity, C_N(q)/C_N(1) -> psi(a/b) = mu(a) mu(b)(ab)^(-1/2) prod_{p|ab} p/(p+1) (PROVED, from S_r(x) ~ (6/pi^2) prod_{p|r} p/(p+1) log x).
psi is the Fourier transform of the PRODUCT probability measure
      sigma = (x)_p  (p/(p+1)) |1 - p^(-1/2) chi_p|^2 dHaar(chi_p)       on T^infinity
(local Fourier coefficients 1, -sqrt p/(p+1) at +-1, 0 beyond; checked numerically for p = 2, 3, 5, 7). It is the weak limit of
|M_N|^2 dHaar / S_1(N) (Levy continuity on a compact group), the normalised Steinhaus model of |1/zeta(1/2)|^2, and it is MUTUALLY
SINGULAR to Haar (Kakutani's dichotomy for product measures: the Hellinger defects ~ c/p have divergent sum; KNOWN, from memory).
Sum and family: the sum is the set of pairs (a, b) <= N (length N); the family is nu (length T); H/D = T/N.

## 2. (b) Near side (B1's form: twisted second moment with mollifier longer than the height; the t-family of length T, N >> T)
(*) holds for every N/T. With g(x) = w-hat(Tx) (compact support |x| <= 1/T) only q = a/b with |log(a/b)| <= 1/T enter: coprime near-pairs
b = a + h, |h| <= a/T <= N/T =: H. So the near side is EXACTLY
      int |M_N|^2 w(t/T) dt/T = S_1(N) + sum_{0<|h|<=H} sum_{a} w-hat(T log(1+h/a)) mu(a) mu(a+h) S_{a(a+h)}(N/(a+h)) / sqrt(a(a+h)),
a logarithmically weighted, coprimality-weighted sum of BINARY CORRELATIONS of mu at shifts h <= H = N/T. Trivially the off-diagonal
is O(H) against the diagonal (6/pi^2) log N: harmless for N <= T log T (Montgomery-Vaughan), and beyond that it needs, averaged over
h <= H, a saving of order log N/H in the logarithmic two-point correlations: a POWER saving in H in an averaged Chowla statement.
KNOWN (from memory, unread): Tao 2016 (two-point logarithmic Chowla, each fixed h, o(log x)); Matomaki-Radziwill-Tao 2015
(averaged over h <= H, o(HX) for any H -> infinity). Both give o(1), not H^(-c). So (*) gives NO new bound; it gives the exact location:
the near side of the t-family is "averaged Chowla with a power saving in the averaging length".

## 3. (c) Impostor
The first impostor-false line is the factorisation in the proof of (*): mu(ak) mu(bk) = mu(a) mu(b) mu(k)^2 1_{(k,ab)=1}, i.e. that the
coefficient vector is MULTIPLICATIVE (and squarefree-supported). For the inverse b = 1/f_DH of the impostor this fails; its
correlation function on Q_+^x has no product form and its normalised limit shape is not a product measure on T^infinity: this is the
line at which "its inverse is not a product of one-variable factors" enters. (The impostor's OWN coefficients c chi + conj(c) conj(chi)
give four product terms and a computable C; the line distinguishes the inverse, not the function.) But (*) itself is only a
reformulation in the sense of B9: at each finite N, T it is equivalent to the correlation statement at the same N, T; it uses the
Euler product exactly and then stops.

## 4. Structural reading (what the identity says about the wall)
The t-family sees Q_+^x through the ARCHIMEDEAN neighbourhood {|log q| < 1/T} of 1. The multiplicative structure of mu is exact in the
DISCRETE (finite-place) structure of Q_+^x: (*) is the statement that C_N is a product over primes. The near side is exactly the place
where the two topologies meet: rationals (a+h)/a archimedean-close to 1 with numerators and denominators up to N >> T. There the
finite places see a and a + h separately, i.e. an additive shift. So an exact structure for the near side would have to couple the
archimedean place with the finite places on rationals close to 1: a product-formula statement, barrier B10 ("both structures at
once") in the language of positive-definite functions on Q_+^x. I know no theorem of my toolkit that does this.

## 5. RISK, and how it failed by its own lines
Tried: zeros as quadrature nodes (Gauss-Christoffel is the one exact "short family integrates a long class" structure of moment
theory: n nodes are exact for degree 2n - 1). The explicit formula is an exact quadrature rule whose correction is supported on
prime powers, and by (*) the multiplicative correlations C_N(p) = -p^(-1/2) S_p(N/p), C_N(p^k) = 0 (k >= 2) are exact. So I hoped the
DIFFERENCE between the zero-family and the (log-density-weighted) segment-family mean squares of M_N would be elementary for every N.
It is not: for finite T the prime correction is w-hat evaluated at log(n a/b), which picks pairs b close to p a, i.e. correlations
mu(a) mu(pa + h) at shifts |h| <= pa/T: twisted Chowla again. The exact part is only the h = 0 term. Recorded as failed.
CONJECTURE (risk, unsearched): sigma (section 1) restricted to the Kronecker line is a critical multiplicative chaos (log-variance
sum 1/p ~ log log); the near-side wall is not about the total mass (which Chowla-type cancellation would give) but the total mass is
what B1 needs, so the chaos picture explains the fine structure, not the wall. I state it so that nobody builds on it unchecked.

## 6. (d) Outside
Matomaki-Radziwill (Ramare's identity: mu(pm) = -mu(m) for p not dividing m, used to factor a long sum through one prime) controls
Moebius sums longer than their t-family by o(1). It uses multiplicativity at ONE prime. Question to SP-operator: on T^infinity,
Ramare's identity is conditioning on one coordinate z_p of the Bohr lift (the dependence of M on z_p is the factor 1 - p^(-1/2) z_p);
does your tensor-product structure of T_1 turn that conditioning into an EXACT identity at one prime for the segment family, and how
does the saving depend on the number of primes conditioned on?
