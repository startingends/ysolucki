# CUBIC_ABSORB: does a family of cubic residue symbols absorb mu? (SP-modular, 2026-11-11)

Nothing here proves RH or is claimed to lead to it. Labels: PROVED (argument here, from identities verified) / KNOWN (with what I
read) / COMPUTED / FROM MEMORY / CONJECTURE / RISK.
READ: rh/NOTEBOOK.md N73 is the brief's summary (not re-read); rh/specialists/sieve/S3_SLOPE.md sections 2-3 (the comparison system,
c = 1/6 -> 7/8, c = 1/3 -> 0.7439, floor 1 - 4c/5); digest openai-qrh-11-12.md (Lemma 4.1, step 5, step 7, READER-4's correction of G);
the 11/12 paper's text, outline (2.10)-(2.14) and App. A.2 (sessions 2-3); Dunn-Radziwill 2109.07463 abstract, main theorem, section 5.1
(Patterson's coefficients (5.7)). COMPUTED: cubic_absorb_check.py.txt / .log (prediction P11 in PROGRESS.md, HIT).

Notation (the paper's): chi_n(x) = (x/n)_6 for primary squarefree n prime to 6; gamma_j(n) = N(n)^(-1/2) sum_(x mod n) chi_n(x)^j e(x/n),
e(z) = exp(4 pi i Im z/sqrt3); so gamma_1, gamma_(-1) are SEXTIC, gamma_2 = gamma_(-4) and gamma_4 = conj gamma_2 are CUBIC (chi^2 is the cubic symbol),
gamma_3 is QUADRATIC; alpha(n) = n/|n|; G(n) = conj(chi_n(4)) gamma_3(n) (READER-4's corrected form), a ray-class unit.

## 1. The identities (KNOWN from Lemma 4.1 as corrected; COMPUTED at 74 split primes to 3e-14; extended to squarefree n by the
## paper's statement of Lemma 4.1)
 (I1) gamma_2(n)^3 = mu(n) alpha(n)                 [mu is the CUBE of the normalised cubic Gauss sum; "the -1 is mu"]
 (I2) gamma_1(n) gamma_2(n) = mu(n) alpha(n) G(n)     [sextic x cubic = mu x (Hecke character) x (ray class)]
 (I5) gamma_3(n)^2 = (-1/n)_2                       [quadratic: a character, no constant -1 (S2 B26)]
Consequences (PROVED, algebra on unimodular quantities, mu^2 = 1 on squarefree n; I3, I4 also COMPUTED at primes):
 (I3) mu(n) gamma_2(n)^2 = alpha(n) conj gamma_2(n)       [mu x (cubic)^2 = alpha x (one conjugate cubic): ABSORBED into one cubic Gauss sum]
 (I4) mu(n) conj gamma_2(n) = gamma_1(n) conj(alpha(n) G(n)), equivalently mu(n) gamma_2(n) = alpha(n) G(n) conj gamma_1(n)
                                                       [mu x (one cubic) = a SEXTIC Gauss sum x units]
 (I6) gamma_2(n)^2 = gamma_1(n) conj G(n)                  [the square of the cubic Gauss sum IS the sextic Gauss sum, up to the ray class G]
The rule behind all of them (PROVED from I1-I2): mu is the product of a sextic and a cubic Gauss sum up to units. Multiplying a Gauss
sum by mu therefore converts sextic <-> cubic (I4) and (cubic)^2 <-> cubic (I3). The coordinator's arithmetic in exponents of gamma_2
(mu = conj(alpha) gamma_2^3, gamma_2^6 = alpha^2): mu gamma_2^k = alpha gamma_2^(k-3). So k = 1 gives alpha conj(gamma_2)^2 (two Gauss sums: not
one theta coefficient), k = 2 gives alpha conj gamma_2 (one: absorbed), k = 3 gives alpha (a Hecke character: the copy).

## 2. The one-variable cubic family: absorption lands on the 6-fold cover
Family: A_u(D) = sum_n mu(n) nu(n) (u/n)_3 W(N(n)/D), rows u, N(u) <= H. Expanding |A_u|^2 and doing the paper's Poisson summation in u
(exact), the non-zero frequencies carry the Gauss sum of the character (./z_1)_3 conj((./z_2)_3) modulo z_1 z_2: ONE cubic Gauss sum per
column variable, gamma_2(z_1) conj gamma_2(z_2) (twisted multiplicativity; the cocycle is mu_3-valued, FROM MEMORY). The dual column
coefficient is mu(z) gamma_2(z).
(2a) PROVED (I3, I4): mu gamma_2 = alpha conj(gamma_2)^2 = alpha G conj gamma_1. It is NOT a cubic Gauss sum: it is a square of one, or a SEXTIC Gauss
     sum. mu is absorbed, but into an object of order 6.
(2b) WHERE SEXTIC GAUSS SUMS LIVE (FROM MEMORY: Kubota; Patterson): the r-th Fourier coefficient of Kubota's Eisenstein series on the
     n-fold cover of SL_2 over K (mu_n in K) is a Dirichlet series sum_c g_n(r,c) N(c)^(-s) of n-th order Gauss sums; it has meromorphic
     continuation and functional equations, with its leading pole carried by the residue, the n-fold theta function. For n = 6 such an object
     EXISTS, with a functional equation. And the twist (h/n)_6^(+-1) of g_6(1,n) is a shift of frequency, g_6(h,n) = conj((h/n)_6) g_6(1,n).
     So the dual column sums are smoothed partial sums of the h-th Fourier coefficient of the SEXTIC Kubota Eisenstein series.
(2c) THE LINE THAT FAILS: "theta coefficients = Gauss sums". The October proof transforms the column sum by the automorphy of ONE form,
     theta_3, whose coefficients are known (Patterson's Thm 8.1, read in Dunn-Radziwill (5.7)). For n = 6 the theta representation of the
     cover of GL_2 does not have a unique Whittaker model (Kazhdan-Patterson: unique only for r = n or n - 1 on GL_r, i.e. n <= 3 on GL_2;
     FROM MEMORY), and no formula for the coefficients of theta_6 is known to me. The Eisenstein-series route (functional equation of
     sum_c g_6(h,c) N(c)^(-s) in s, uniformly in h) is a different, unbuilt transformation; I know no theta-type transformation for it
     with an explicit dual length. RISK: it may exist; if so, its residual term (the theta_6 coefficient at h, of unknown size) enters
     every row.

## 3. The two-variable cubic family: absorption WORKS, and the next step fails
(3a) Family: rows (u_1, u_2), N(u_i) <= H, A_(u_1,u_2)(D) = sum_n mu(n) nu(n) (u_1 u_2/n)_3 W. It depends only on u = u_1 u_2: it is the one-variable
     cubic family WEIGHTED BY THE DIVISOR FUNCTION d(u) (exit E6 of COPY_BARRIER). Poisson in (u_1, u_2) separately (exact, O^2 is a lattice)
     gives, per column pair, the SQUARE of the one-variable Gauss sum: the dual column coefficient is mu(z) gamma_2(z)^2.
(3b) PROVED (I3): mu gamma_2^2 = alpha conj gamma_2: ONE conjugate cubic Gauss sum times alpha: by Patterson's formula (tau(mu) has conj g(.,c)) a
     coefficient of theta_3 times alpha, exactly as in the sextic family (where mu gamma_(-1) = chi(-1) conj G alpha gamma_2). By (I6) this is no
     accident: gamma_2^2 = gamma_1 conj G, so the two-variable cubic family has the SAME dual Gauss sums as the sextic family, up to G.
(3c) THE NEXT STEP (the paper's (2.14), its "key point"): after the theta transformation the twist at p | h is a product of the Fourier
     factor and the theta multiplier, chi_p^(-1) chi_p^(-2) = chi_p^(-3): QUADRATIC, so the sharp quadratic large sieve applies.
     PROVED: in the two-variable cubic family every twist is a power of chi^2 (cubic symbols), and the theta multiplier is chi^2 as well;
     every product is an EVEN power of chi, hence trivial or cubic, never the quadratic chi^3. So (2.14) has no analogue: the dual mean
     square must be bounded by a CUBIC large sieve. KNOWN, read (Dunn-Radziwill abstract): "Heath-Brown's cubic large sieve is sharp up to
     factors of X^(o(1)) under the Generalized Riemann Hypothesis", i.e. its excess term (M L)^(2/3) cannot be removed in general (READER-7, N58).
     Worse: a cubic twist of a cubic Gauss sum is a FREQUENCY SHIFT, g(h,n) = conj((h/n)_3) g(1,n), so the dual column sums become sums of
     theta_3's coefficients along the dilated frequencies h n, with no character left in h to give orthogonality (HEURISTIC reading).
(3d) COPIES in the two-variable family: pairs with u_1 u_2 a cube, about H^(2/3) (log H)^c of H^2 pairs (PROVED by counting cubes with
     divisor weights): log-density 1/3. Among the Poisson frequencies (the c of S3_SLOPE) the cubes again have density 1/3.

## 4. What it would give if the downstream worked (conditional, from SP-sieve's file)
 - N49's amplifier alone, with a diagonal two-variable mean square at family size H^2 = D^(1+theta): |A_1|^2 << H^2 D / H^(2/3), A_1 << D^(5/6+):
   Re s > 5/6 (against 11/12 for the sextic Part I). CONJECTURE-conditional on the diagonal, which (3c) blocks.
 - SP-sieve's comparison system with c = 1/3: 0.7439 (S3_SLOPE V2), below 3/4. CONDITIONAL on the low estimate being the sextic one;
   with the cubic large sieve's excess (M L)^(2/3) in the low estimate the system changes and I cannot evaluate it. QUESTION for SP-sieve
   (the one thing that would decide whether this family is worth more): rerun V2 at c = 1/3 with the quadratic sieve factor (M + L)
   replaced by (M + L + (M L)^(2/3)) in the low estimate.

## 5. Fake first and honesty
 - Impostor: fails at the absorption line in both families: (I1) is used with mu POINTWISE on squarefree n (gamma_2(p)^3 = -alpha(p)); its
   Dirichlet inverse has unbounded coefficients (S2 B27), so it fails the normalisation |mu nu| <= 1 before that.
 - Over Q there are no cubic residue symbols (mu_3 not in Q); the family exists only over fields containing mu_3, i.e. for zeta, Dirichlet
   L-functions and CM-by-K forms through K = Q(sqrt-3) (TRANSPORT 3b).
 - Exact answer to the question: (i) the one-variable cubic family does NOT absorb mu into a cubic Gauss sum; it absorbs it into a SEXTIC
   one (I4), whose automorphic home is the 6-fold cover, where the theta coefficients are not known and the Whittaker model is not unique
   (recalled): the failing line is "theta coefficients = Gauss sums" (Patterson's formula has no n = 6 analogue). (ii) The two-variable
   (divisor-weighted) cubic family DOES absorb mu into theta_3 coefficients (I3), but the paper's key step (2.14) fails for parity of exponents:
   no odd power of the sextic character occurs, so no quadratic twist and no sharp quadratic large sieve; the cubic sieve's excess is
   sharp under GRH (Dunn-Radziwill). (iii) Which power of gamma is needed: exactly gamma_2^2 (or equivalently a sextic gamma_(+-1)) per column, so that
   mu gamma^k is ONE cubic Gauss sum; and the downstream needs the dual twist to be an ODD power of the sextic character.
 - Summary rule (PROVED from (I1)-(I6) and (2.14)): absorption needs the column Gauss sum to contain mu (sextic, or cubic squared); the sharp
   sieve needs the transformed twist to contain the quadratic character; in any family built from cubic symbols alone the second fails.
   The sextic family is the one where both hold, because the sextic character is the product of the quadratic and the cubic ones.

CORRECTION (2026-11-11, H_CUB.md sec. 2): 3(c)'s "no character left in h to give orthogonality" is WRONG. g(h,n) = conj((h/n)_3) g(1,n)
is a cubic character of h (cubic reciprocity), exactly Heath-Brown's large-sieve configuration (Dunn-Radziwill, proof of Thm hboptimal;
DDDS24). The (2.14) parity statement stands, but the post-theta twist for the family's sign is chi^(+-4), a NON-trivial cubic character
(H_CUB sec. 3, HEURISTIC, risk R1).
