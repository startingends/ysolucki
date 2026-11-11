# TRANSPORT: what the algebraic family knows that the t-family does not, and a hybrid family (SP-modular, 2026-11-11)

Common object of rule 13 (b) with SP-sieve; its answer NOT read. Nothing here proves RH or is claimed to lead to it.
Labels: PROVED (argument here) / KNOWN (with what I read) / FROM MEMORY / CONJECTURE / RISK.
READ for this file: rh/NOTEBOOK.md N62-N65; digests bettin-gonek-1604.02740.md (whole) and conrey-1989.md (sections 1-3); from
earlier sessions the 11/12 paper's outline, Prop. 3.1, 4.5, 5.1, 5.4, App. A.2 (text), and Dunn-Radziwill section 5.1 plus a grep
showing that their Mellin transforms carry angular twists (mu/|mu|)^l (source lines 1438-1472). No numerics.

## 0. A correction of scale first: at bounded height, "mollifier exponent" and "zero-free abscissa" are the same statement
(0a) KNOWN (Bettin-Gonek Thm 1, digest; the reader checked the proof line by line): I_N(0,T) := int_0^T |zeta M_N(1/2+it)|^2 dt << T^(1+eps)
     for all N <= T^theta implies no zeros in Re s > 1/2 + 1/(2 theta). Their step 9: the off-line zero is seen ONLY at bounded t
     (lower bound x^(2 beta_0)/(1+|t|)^4), so the proof uses the hypothesis only on a bounded range of t, uniformly in the length.
(0b) PROVED (converse, at bounded height; sketch with standard inputs). If L(s) (zeta, or L_K(s, nu)) has no zero in Re s > sigma, then
     1/L(s) << (1+|s|)^eps in Re s >= sigma + delta (Borel-Caratheodory and Hadamard three circles, as in Titchmarsh 14.2, FROM MEMORY),
     and smoothed Perron gives M_N(1/2+it) << N^(sigma - 1/2 + eps) uniformly for |t| <= T_0 fixed. Hence
        int_0^(T_0) |L M_N(1/2+it)|^2 dt << N^(2 sigma - 1 + eps),
     which is <= T^(1+eps) iff N <= T^(1/(2 sigma - 1)). So on bounded heights the dictionary sigma <-> theta = 1/(2 sigma - 1) holds in BOTH
     directions, by elementary means. With the 7/8 theorem: theta = 4/3 at bounded height for zeta_K, and for zeta, at no extra cost.
(0c) PROVED (why that is not the mollifier problem). On [0,T] with N = T^theta, theta > 1, the mollifier alone has mean square
     int_0^T |M_N(1/2+it)|^2 dt ~ (T + N) sum_{n<=N} mu(n)^2/n ~ N log N, which is much larger than T (Montgomery-Vaughan, FROM MEMORY). So
     I_N(0,T) << T^(1+eps) at theta > 1 asserts zeta M_N ~ 1 in mean square at ALL heights up to T. A zero-free half-plane gives no
     such cancellation at large heights: (0b) gives N^(2 sigma - 1) T, too big. So N65's "the quasi-RH method is ahead on the theta scale"
     is right in zero-free strength, and only there. Mollifier technology (Levinson, Conrey theta < 4/7) proves UNIFORM
     asymptotics over [T, 2T], which neither the October theorem nor (0b) supplies. The two methods are on different statements.

## 1. Question 1: what the algebraic family knows, in automorphic terms
(1a) THE TWO FAMILIES AS FAMILIES OF HECKE CHARACTERS (PROVED, definitions). Over K = Q(sqrt-3), twist Moebius by a Hecke character
     psi of K: A_psi(D) = sum_n mu(n) nu(n) psi(n) W(N(n)/D). The t-family is psi = N(.)^(-it), t in [0,T]: the unitary characters of the
     IDELE NORM, trivial at every finite place, living entirely at infinity (the continuous-spectrum / Eisenstein direction: these
     are the parameters of E(., 1/2+it)). The sextic family is psi = chi_.(u) = (u/.)_6: finite order, ramified at u, trivial at infinity.
(1b) WHAT THE ALGEBRAIC FAMILY HAS, three things, each PROVED or read:
     (i) EXACT copies (read: the paper's (2.4)): chi_n(p^6) = 1 for p not dividing n, so the trivial twist recurs exactly, H^(1/6) times.
         The t-family has none: N(n)^(-it) = 1 for all n <= D forces t = 0. Its only near-copies are |t| << 1/log D (or Kronecker-type
         near-returns, of density eps^(pi(D)); N49), i.e. the t-family's copy set has measure ~1/log D in [0,T].
     (ii) A POISSON DUALITY IN THE TWIST VARIABLE THAT MOVES mu. Summing over the row u is Poisson over the lattice O; its dual
         coefficients are Gauss sums of the column modulus, and gamma_2(p)^3 = -alpha(p) puts mu into them, prime by prime. The dual of the
         t-family is Fourier analysis in t: the kernel is int_0^T (m/n)^(it) dt, which only localises |log m - log n| < 1/T. No arithmetic,
         no Gauss sum, mu untouched (Montgomery-Vaughan / Hilbert's inequality is the whole duality).
     (iii) THE REASON, in one sentence (PROVED from the definitions): mu is a product over FINITE places; absorption is a product of
         LOCAL identities at finite places (the -1 at each prime is the primary Jacobi sum); an archimedean character has its only
         local component at infinity, where its "Gauss sum" is a Gamma factor (Tate's local epsilon factor at infinity). One local
         factor at one place cannot carry a function that is a product over all finite places.
(1c) THE HYBRID FAMILY EXISTS AS A FAMILY OF HECKE CHARACTERS (PROVED for (b); the rest as stated):
        psi_(u,k,t)(n) = (u/n)_6 * alpha(n)^k * N(n)^(-it),   alpha(n) = n/|n| on primary n (a Grossencharacter of conductor dividing 3,
                                                           infinity type 1; it is the Hecke character of the CM curve x^3 + y^3 = 1),
     rows u (finite part, norm up to H), k in Z (angular infinity type, |k| <= K), t (vertical infinity type, |t| <= T).
     (b) THE ABSORPTION STILL HOLDS: mu(n) gamma_(-1)(n) = chi_n(-1) G(n)^(-1) alpha(n) gamma_2(n) is a POINTWISE identity in n (digest, Lemma 4.1);
         the archimedean factors alpha^k N^(-it) multiply both sides. The first Poisson summation is in u only and does not see k, t.
         The dual coefficients become alpha(n)^(k+1) gamma_2(n) xi(n) N(n)^(-it): cubic theta coefficients with an archimedean twist.
         KNOWN (read, grep): Dunn-Radziwill's Mellin transforms already carry (mu/|mu|)^l; the 11/12 paper handles l = 1 by one
         z-bar derivative (A.2). CONJECTURE: general k by higher K-types of the representation generated by theta, with dual length
         growing like N(h)^2 (1 + |k| + |t|)^2/X (conductor at infinity), and losses polynomial in (1 + |k| + |t|).
     (a) EXACT COPIES: PROVED, only at k = t = 0. A Hecke character equal to 1 on all primary primes prime to p is trivial (Hecke /
         Chebotarev: characters agreeing on a density-one set of primes are equal), so its infinity type is 0. The archimedean
         directions enlarge the family by K T and add NO exact copy: in the hybrid family the copy density is H^(1/6)/(H K T), smaller
         than in the sextic family. Near-copies in t (|t| << 1/log D) add a factor 1/log D, nothing at power scale.
     CONCLUSION of question 1 (PROVED from (a), (b)): the hybrid family exists and (b) survives in it, but (a) lives only on the
     algebraic axis. Mixing in the archimedean direction can only dilute the amplifier.

## 2. Question 2: what the October method would give in the hybrid family
(2a) For each fixed (k,t), Prop. 3.1 with the weight W replaced by W(y) y^(-it) (k absorbed as above) holds with the loss
     ||W y^(-it)||^2_(C^J) << (1 + |t|)^(2J): PROVED as a reading of (4.12) and (5.2), which bound everything by ||W||_(C^J). So, with (2.4):
        sum_n mu(n) nu(n) alpha(n)^k N(n)^(-it) W(N(n)/D) << D^(7/8+eps) (1 + |k| + |t|)^(C)        [CONJECTURE for k != 0, PROVED reading for k = 0]
     i.e. the October theorem for the L-functions L_K(s, nu alpha^k) uniformly in a fixed power of the archimedean conductor.
(2b) WHAT IT GIVES ON THE MOLLIFIER SCALE (PROVED from (2a), (0a), (0b)): the bounded-height mollifier bound
        int_0^(T_0) |L_K M_N(1/2+it)|^2 dt << N^(3/4+eps),   i.e. theta = 4/3 in Bettin-Gonek's dictionary,
     for zeta_K, for every Dirichlet L-function (base change), and, if (2a) holds for k != 0, for the Grossencharacter L-functions
     L_K(s, alpha^k). Exponent 4/3. NOT the Nyman-Beurling range theta >= 3/2 of N65 (that would need sigma <= 5/6), and NOT the
     uniform [0,T] statement of (0c), which is a different kind of statement (large heights, zeta M ~ 1) that the method does not
     touch. The hybrid family adds nothing to the theta exponent: by (1c)(a) the copies do not grow.
(2c) RISK, the one new thing transport might buy. If (2a) holds for k != 0, the October method gives a zero-free half-plane
     Re s > 7/8 (analytic normalisation) for L(s, alpha^k), k >= 1: degree-2 L-functions over Q, e.g. L(s, alpha) = L(E, s + 1/2) for the CM
     curve x^3 + y^3 = 1 (conductor 27; FROM MEMORY), and L-functions of the CM newforms attached to alpha^k. That would be the first
     quasi-GRH for a degree-2 L-function of a modular form, obtained without any degree-2 input: because the form has CM by K,
     its L-function is a Hecke L-function of K. What has to be checked: Lemma 4.1's bicharacter R and function G with an
     infinite-order twist (pointwise identities, so I expect no change), and the theta transformation for the K-type k + 1
     (Patterson's coefficients for the higher K-types: not read).

## 3. Question 3: fake first, and who can enter at all
(3a) THE IMPOSTOR (PROVED): excluded at the normalisation line in the hybrid family as in the sextic family. Its Dirichlet inverse c_n
     has |c_n| unbounded (1/f_DH has poles up to Re s ~ 1.12; S2 B27), and |c_n psi(n)| = |c_n| for every unitary psi: no twist, finite or
     archimedean, changes coefficient size. It also fails absorption (no mu pointwise), as before.
(3b) WHO ENTERS (PROVED as a list, given the paper's scope "finite-order Hecke characters over K", digest section 6, plus (2c)):
     * Hecke L-functions of K, finite order (the theorem), and by (2c) possibly infinite order (CONJECTURE).
     * Over Q, by factorisation: zeta, every Dirichlet L-function (L_K(s, chi o N) = L(s,chi) L(s, chi chi_-3)), and the CM-by-K forms (2c).
       So zeta itself and L(s, chi_-4) over Q DO enter: as factors of Hecke L-functions of K.
     * They enter only as factors. What does NOT enter: anything not a base change from, or automorphic induction of, a Hecke
       character of K. Degree-2 forms without CM by K (Delta, non-CM elliptic curves); Hecke L-functions of other imaginary quadratic
       fields that are not Dirichlet L-functions (e.g. the Grossencharacters of Q(i), the CM curve y^2 = x^3 - x); the Dedekind zeta of a
       field not of the form "abelian over Q or over K".
(3c) WHY NOT Q(i) DIRECTLY (FROM MEMORY; the reasons are two, at two different lines). Q(i) contains mu_4, not mu_3, so its covers are of
     degree 2 and 4. Degree 2: the theta function is supported on squares (S2 B26 (4)): no absorption. Degree 4: Kubota's quartic theta
     exists, but by Kazhdan-Patterson its Whittaker model is not unique, so its Fourier coefficients are NOT determined by quartic
     Gauss sums (Patterson's formula has no quartic analogue). So over Q(i) the line "dual coefficients = theta coefficients = Gauss sums"
     fails. Q(sqrt-3) is singled out among imaginary quadratic fields by mu_3 together with the uniqueness for n = 3 on GL_2 (the
     exceptional case n = r + 1 = 3 of Kazhdan-Patterson). Whether the quartic absorption identity (g(chi_4)^4 = -(unit) p^2 ?) even holds
     over Z[i]: not checked.

## 4. Summary in ten lines
1. At bounded height the mollifier exponent and the zero-free abscissa are one statement (Bettin-Gonek one way, Perron the other):
   the October 7/8 gives theta = 4/3 there, for zeta_K and for zeta, at no extra cost.
2. On [0,T] with theta > 1 the mollifier statement is a different, uniform one (zeta M ~ 1 at all heights); nobody's method reaches it.
3. In automorphic terms the t-family is the archimedean (idele-norm) characters, the sextic family finite-order characters of K.
4. The algebraic family has exact copies (sixth powers) and a Poisson duality whose dual Gauss sums absorb mu prime by prime.
5. The t-family has neither: no exact copies, and its "Gauss sum" is one Gamma factor at one place, which cannot carry mu.
6. A hybrid family (u/.)_6 alpha^k N^(-it) exists; absorption survives (pointwise identity), the theta step needs higher K-types (conjecture).
7. Exact copies exist only at k = t = 0 (a Hecke character trivial on almost all primes is trivial): the hybrid only dilutes the amplifier.
8. Risk: the hybrid might give a quasi-GRH half-plane for CM-by-K degree-2 L-functions, e.g. L(E, s) of x^3 + y^3 = 1.
9. The impostor is excluded at the normalisation line in the hybrid too: twisting never changes |c_n|.
10. Only Hecke L-functions of K and their factors enter (zeta, Dirichlet L, CM-by-K forms); Q(i) fails at the theta-coefficient line.
