# LEVINSON_THETA: what would make the mollifier length theta trivial in Levinson-Conrey (SP-sieve, 2026-11-11)
Construction first (owner rules 14-15); no numerics were run. Labels: PROVED / KNOWN (what I read) / FROM MEMORY / HEURISTIC /
CONJECTURE / RISK. READ this session: rh/CORE.md; NOTEBOOK N91-N92; THEORY T116-T118; digests conrey-1989.md, radziwill-1207.6583.md,
bettin-gonek-1604.02740.md, bcr-1411.7764.md (read in earlier sessions; re-used, not re-read). No search this session.

## 1. (v) The object that would make theta trivial, in my words
Theta enters Levinson-Conrey in TWO different places, and they must not be confused.
(A) IN THE MAIN TERM. Conrey's Theorem 2 (KNOWN, digest): c(P,Q,R) = |P(1)Q(0)|^2 + (1/theta) int int e^{2Ry}|Q(y)P'(x) + theta Q'(y)P(x)
    + theta R Q(y)P(x)|^2, and kappa >= 1 - (1/R) log c + o(1). Even with every error term zero, kappa(theta) < 1 for each finite theta; Farmer's
    theta = infinity conjecture is exactly the statement that this main-term formula persists for all theta (FROM MEMORY via Bettin-Gonek's
    paraphrase). The 1/theta has a proved reason: Radziwill's Theorem 1 (KNOWN, digest): (1/T) int_T^{2T} |1 - zeta M_theta|^2 >= c/theta for
    EVERY Dirichlet polynomial of length T^theta, because at each of the >> T log T zeros on the line 1 - zeta M = 1, and a polynomial of length
    T^(1+theta) cannot drop from 1 to 0 faster than on the scale 2pi/((1+theta) log T). That is the uncertainty principle at the archimedean
    place (CORE, "the open tension": no function compact on both sides). So the main-term theta-dependence is NOT technology; no object removes it.
(B) IN THE ERROR TERM. The asymptotic is proved only for theta < 4/7 (Conrey), binding term T^(-1/2) y^(7/8) from the Deshouillers-Iwaniec
    bilinear (Type II) Kloosterman bound made available by Vaughan's identity for mu (KNOWN, digest; S2 B21). This is technology, and the
    object that would make it trivial is an EXACT evaluation of the off-diagonal for Moebius-type coefficients at every length: the
    twisted second moment's off-diagonal main terms for all theta (the BCH 'theta = 1' formula and beyond; for theta > 1 the ratios-conjecture
    main terms, FROM MEMORY: Conrey-Farmer-Zirnbauer). BCR prove it is FALSE in general for theta > 1 for general coefficients (stated there;
    KNOWN as statement) and their trilinear route is sharp (Appendix A): an exact formula past theta = 1 must use mu.
So the answer to (v): the object is an exact formula for the mollified mean square, valid for mollifiers of every length, for Moebius-type
coefficients; and it would remove only (B). (A) stays, and with it kappa(theta) < 1 at every finite theta.
Candidates, examined:
 (a) Euler-product mollifier psi_y = prod_{p<=y} (1 - f(log p/log y) p^(-s)). PROVED (algebra): its coefficients are multiplicative, so
     Conrey's main-term arithmetic (Lemma 1, the sum over h, k of b(h)b(k)(h,k)^(1+a+b)/(h^(1+a)k^(1+b))) FACTORS over p exactly: one local factor
     per prime, no cross terms (H12's decoupling, as in SP-operator's N52 (b)). But its support is all y-smooth squarefree n up to e^((1+o(1))y):
     the length is T^theta with theta ~ y/log T, so the off-diagonal (B) is uncontrolled unless y << log T, and then it mollifies only the small
     primes: zeta psi_y ~ the zero part Z_y of Gonek-Hughes-Keating (FROM MEMORY), with mean square ~ log T/(e^gamma log y) (CONJECTURE of
     GHK, from memory), so c -> infinity and Levinson gives nothing. Truncating to n <= T^theta restores localisation and destroys the
     factorisation: exactly H12. Not the object.
 (b) Mollifier from the approximation of 1/zeta at the same height on the reflected side. The approximate functional equation reflects
     zeta (length T^(1/2) on each side) but 1/zeta has NO functional equation (S2: SP-modular SHORT_FAMILY 3b); a 'reflected Moebius
     polynomial' chi(s) conj B(1 - conj s) is not a mollifier of 1/zeta at s. PROVED that it cannot shorten the Type II range: the off-diagonal
     of zeta B with B of length T^theta is indexed by mollifier pairs (h, k), and reflection acts on the zeta variables only (BCR section 3,
     steps 1-6, KNOWN). Not the object; at best a re-packaging of the two-piece mollifiers already in the literature (FROM MEMORY: Feng 2012).
 (c) Hilbert space: theta = dimension of the approximating subspace. This is the right frame and it is (A): Radziwill's bound is a
     distance bound dist^2(1, zeta span{n^(-s): n <= T^theta}) >= c/theta in L^2[T, 2T]. Chosen as the construction below.

## 2. The construction: Levinson's inequality as an exact identity with three named losses
Notation (Conrey, digest): sigma0 = 1/2 - R/L, L = log T, V = Q(-(1/L) d/ds) zeta, B a mollifier, N_V = zeros of V in [T, 2T] right of sigma0.
(2.1) PROVED (Littlewood's lemma, the identity behind Levinson's (38)-(39), applied to V B on the rectangle [sigma0, 3] x [T, 2T]):
   (1/T) int_T^{2T} log|V B(sigma0 + it)| dt = (2 pi/T) [ sum_{V(rho)=0, Re rho > sigma0} (Re rho - sigma0) + sum_{B(rho)=0, Re rho > sigma0} (Re rho - sigma0) ] + o(1)
   (with Q(0) = 1, b(1) = 1: the right edge Re s = 3 contributes o(1) because log|1 + g| has mean 0 for an almost-periodic g with |g| < 1).
   Levinson's chain then uses: LOSS 1 (zeros of B, dropped: >= 0); LOSS 2 (Jensen/AM-GM: (1/T) int log|VB| <= (1/2) log ((1/T) int |VB|^2),
   equality iff |VB| is constant on the segment); LOSS 3 (each V-zero right of the line contributes at least R/L, and V-zeros right of the
   line dominate the zeta-zeros off it via the functional equation: Levinson's lemma, KNOWN in type, from memory). With B = 1/zeta exactly
   (infinite length), B has no zeros (LOSS 1 disappears) but poles at the zeros of zeta, and the meromorphic Littlewood lemma gives
   (1/T) int log|V/zeta(sigma0 + it)| dt = (2 pi/T)[ sum_V (beta - sigma0) - sum_zeta (beta - sigma0) ] + o(1)   (PROVED, same lemma),
   an exact relation between the zeros of V and of zeta, with nothing left to estimate except the left side, which needs the zeros. So the
   'perfect mollifier' turns Levinson's method into a tautology; theta measures how far a computable object is from it.
(2.2) Where the Euler product enters: only in B (mu, multiplicativity), through Conrey's Lemma 1 (main term) and Vaughan's identity (error
   term, Type II). Where the functional equation enters: in V (Levinson's lemma: zeros of V right of the line <-> zeros of zeta off it) and
   in the off-diagonal (Estermann functional equation, Conrey Lemmas 3-6). They meet in the bulk (theta = 4/7 > 1/2) only in the ERROR term (B).
(2.3) Tightness along colliding pairs: NO (PROVED by counting). A collided pair leaving the line changes N_V and N_zeta by O(1) out of
   ~ (T/2 pi) L, i.e. kappa by O(1/(T L)); every loss above is an average over [T, 2T]. Levinson counts simple zeros (kappa*, Q of degree 1,
   Conrey) and so 'sees' a double zero as a non-simple one, but only as one in T L. Rule (iii) of owner rule 15 fails.
(2.4) The term that limits theta: Conrey's T^(-1/2) y^(7/8) (Type II, Deshouillers-Iwaniec after Vaughan). The construction does not change it;
   it re-expresses Levinson's method so that the theta-dependence splits into (A), forced and impostor-blind (section 3), and (B), technology.
   Even (B) = 0 at every theta (Farmer) gives kappa = 1, a density statement: 100% is not all (CORE 3: how many, never whether).

## 3. Impostor (Davenport-Heilbronn f)
- (A) is impostor-blind (PROVED as a reading of Radziwill's argument): it uses only that the function has >> T log T well-spaced zeros on
  the line and that zeta M is a Dirichlet polynomial; f has many zeros on the line (FROM MEMORY: Karatsuba, >> T (log T)^(1/2 - eps);
  Selberg announced a positive proportion for linear combinations of L-functions), so the same 1/theta cost appears.
- (B) behaves differently, but at the familiar line: the mollifier built from f's Dirichlet inverse has unbounded coefficients
  (1/f has poles in Re s > 1: Saias-Weingartner, S2_B10d 5b), so Conrey's normalisation |b(n)| <= 1 and Lemma 1's Euler-product arithmetic
  fail at the first line. Selberg's method for linear combinations (FROM MEMORY) mollifies each component L(s, chi) separately, i.e. it
  borrows the components' Euler products.
- The decisive impostor fact (FROM MEMORY, RISK as to exact hypotheses): for linear combinations like f, almost all zeros are on the line
  (Bombieri-Hejhal 1995, under GRH and a zero-spacing hypothesis for the components), while f has >> T zeros off the line in 1/2 < sigma < 1
  (Davenport-Heilbronn; Voronin). So kappa = 1 is CONSISTENT WITH off-line zeros. Hence Farmer's theta = infinity, even if proved, cannot
  give RH: the Levinson-Conrey output is twist-blind at the level of kappa. Only a bounded-height statement (T117) sees an off-line zero.

## 4. Verdict and ratings
The theta-dependence of Levinson-Conrey has an intrinsic part (the uncertainty principle at infinity, Radziwill's c/theta) that no object
removes, and a technical part (the Type II error) whose removal would give kappa -> 1, which an impostor can also satisfy. The concrete
residue worth keeping: (2.1) with B = 1/zeta shows the perfect mollifier makes Levinson an identity about zeros; the place where theta
could matter for RH is the bounded-height reading of T117, not the [T, 2T] reading.
Quality 4/10 (clean split of the theta-dependence and a sharp impostor reason; mostly assembly of known results, nothing new proved
beyond algebra). Toward RH 1/10 (the method is a density method; kappa = 1 is consistent with off-line zeros).
