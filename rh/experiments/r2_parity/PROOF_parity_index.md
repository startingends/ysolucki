# PROOF_parity_index: the parity lemma, and the exact relation between signature and RH

Agent R2-parity, 2026-11-10. Covers JOB 1 (a) and (b). Every step is labelled. "CITED" = not proved here.

## 0. Setting and conventions

* D_L = C_c^infinity((-L, L)), complex valued; D = union of the D_L = C_c^infinity(R).
  fhat(z) = int f(x) e^{izx} dx (entire; for f in D_L: |fhat(z)| <= C_K (1+|z|)^{-K} e^{L |Im z|} for every K).
* Zeros of zeta in the strip are rho = 1/2 + i gamma, gamma complex, m_gamma = multiplicity. Gamma_R = real gamma
  (zeros on the line). Z = the set of DISTINCT gamma with Im gamma > 0 (equivalently Re rho < 1/2). The set of
  all non-real gamma is Z together with its complex conjugate. Z is invariant under gamma -> -conj(gamma)
  (functional equation + reality of zeta). CITED (classical): zeta has no zeros on the real segment (0,1), so
  no gamma is purely imaginary; hence the points of Z come in pairs {gamma, -conj gamma} with Re gamma != 0.
  A "quartet" is {gamma, -gamma, conj gamma, -conj gamma}; it contains 2 points of Z.
  nu := #Z (0 <= nu <= infinity) = number of distinct zeros with Re rho > 1/2 = 2 x (number of quartets).
* The hermitian form (zero side):  Q(f, h) = sum_gamma m_gamma fhat(gamma) conj( hhat(conj gamma) ),  f, h in D.
  The sum converges absolutely (rapid decay of fhat in horizontal strips, N(T) = O(T log T)).
* EXPLICIT FORMULA (CITED: Weil 1952; in the form used by the project, validated numerically to 1e-15 by lane A
  and again by this seat, v1.log): for f, h in D,
      Q(f, h) = P(f, h) + A(f, h) - Pi(f, h),
  P(f,h) = int int f(x) conj h(y) 2 cosh((x-y)/2) dx dy                      (pole),
  A(f,h) = -log(pi) g(0) + int_0^inf ( g(0) e^{-2u}/u - w(u) (g(u) + g(-u)) ) du,  w(u) = e^{u/2}/(2 sinh u)   (arch),
  Pi(f,h) = sum_{n>=2} Lambda(n) n^{-1/2} ( g(log n) + g(-log n) )            (primes),
  with g(u) = int f(x) conj h(x-u) dx.  N := Pi - A, so Q = P - N.  Q_L, N_L, P_L = restrictions to D_L.
* For a hermitian form q on a vector space V: kappa_-(q) = sup of dim of subspaces on which q is negative definite;
  kappa_+ likewise. (If D_L is a form core of the closed form of Suzuki's Thm 1.1, these agree with the numbers of
  negative / positive eigenvalues of the operator; that identification is CITED / not needed below.)
* R f(x) = f(-x). Even/odd parts f_e, f_o. c(x) = cosh(x/2), s(x) = sinh(x/2); <f, c> = int f c etc.

## 1. Lemma 1 (parity decomposition). PROVED

(i) Q, P, A, Pi, N are invariant under R (i.e. q(Rf, Rh) = q(f, h)); hence q(f_e, h_o) = 0 and
    q(f) = q(f_e) + q(f_o) for each of them.
(ii) For real f:  P(f) = 2 <f_e, c>^2 - 2 <f_o, s>^2.  For complex f: P(f) = 2 |<f_e, c>|^2 - 2 |<f_o, s>|^2.

Proof. (i) The correlation of (Rf, Rh) is g(-u), and each of P, A, Pi depends on g only through g(u) + g(-u)
(for P: 2 cosh is even). For Q use the explicit formula, or directly the invariance of the zero set under
gamma -> -gamma. If q is R-invariant then q(f_e, h_o) = q(R f_e, R h_o) = -q(f_e, h_o) = 0.
(ii) 2 cosh((x-y)/2) = e^{x/2} e^{-y/2} + e^{-x/2} e^{y/2}. Put F_+- = int f e^{+-x/2} dx. Then
P(f) = F_+ conj(F_-) + F_- conj(F_+) = 2 Re(F_+ conj F_-). Now F_+ = <f_e, c> + <f_o, s>, F_- = <f_e, c> - <f_o, s>
(the cross terms <f_e, s>, <f_o, c> vanish by parity), so F_+ conj F_- = |<f_e,c>|^2 - |<f_o,s>|^2 + (imaginary). QED

## 2. Lemma 2 (block form of Weil's criterion). PROVED given the criterion

CITED (Weil 1952; Yoshida 1992 for windows; also reproved in Theorem 4 below): RH <=> Q_L >= 0 on D_L for every L.
By Lemma 1, Q_L >= 0 for all L  <=>  for all L and all real f in D_L:
      even f:  N(f) <=  2 <f, c>^2 ;        odd f:  N(f) <= -2 <f, s>^2 .
(Complex f reduce to real and imaginary parts because the kernels are real.) QED

## 3. Proposition 3 (what RH gives for N, and the linear algebra of the converse). PROVED

(a) RH  =>  kappa_+(N_L) <= 1 for every L; more precisely N <= 0 on the hyperplane {f : <f, c> = 0} of D_L, and
    N_L restricted to odd functions is <= -2|<f,s>|^2 <= 0.
(b) For every L (no hypothesis):   kappa_-(Q_{L,even}) <= kappa_+(N_{L,even}),
                                   kappa_-(Q_{L,odd})  <= kappa_+(N_{L,odd}) + 1,
    hence kappa_-(Q_L) <= kappa_+(N_L) + 1.
(c) In particular "kappa_+(N_L) <= 1 for all L" implies kappa_-(Q_L) <= 2 for all L, and, per block, one of:
    (even, odd) negative index of Q_L <= (1, 1) or (0, 2).

Proof. (a) Let f in D_L with <f, c> = 0, i.e. <f_e, c> = 0. By Lemma 1 and Lemma 2,
N(f) = N(f_e) + N(f_o) <= 2|<f_e,c>|^2 - 2|<f_o,s>|^2 = -2|<f_o,s>|^2 <= 0. A 2-dimensional subspace meets the
hyperplane <f,c> = 0 in a non-zero vector, so N cannot be positive definite on it.
(b) Q_even = 2|<.,c>|^2 - N_even. If Q_even is negative definite on V then N_even >= 2|<f,c>|^2 - Q(f) > 0 on V\{0}.
Q_odd = -2|<.,s>|^2 - N_odd. If Q_odd is negative definite on V, then on V' = V intersect {<f,s> = 0}
(dim V' >= dim V - 1) we have N_odd = -Q_odd > 0. The total follows from kappa_+(N) = kappa_+(N_e) + kappa_+(N_o) and
kappa_-(Q) = kappa_-(Q_e) + kappa_-(Q_o) (Lemma 1 (i): the blocks are orthogonal for both forms).
(c) kappa_+(N_e) + kappa_+(N_o) <= 1 leaves (1,0), (0,1), (0,0); apply (b). QED

## 4. Theorem 4 (exact negative index). PROVED (self-contained apart from the explicit formula and N(T) = O(T log T))

For every L:   kappa_-(Q_L) <= nu,   kappa_-(Q_{L,even}) <= nu/2,   kappa_-(Q_{L,odd}) <= nu/2.
If nu < infinity there is L_0 such that for all L >= L_0:
      kappa_-(Q_{L,even}) = kappa_-(Q_{L,odd}) = nu/2   and   kappa_-(Q_L) = nu.
If nu = infinity then kappa_-(Q_{L,even}) and kappa_-(Q_{L,odd}) tend to infinity with L.
L -> kappa_-(Q_L) is non-decreasing. So  sup_L kappa_-(Q_L) = nu  exactly, and in each parity block the supremum is
the number of quartets.

Proof.
Step 1 (splitting). Q = Q^+ + sum_{z in Z} m_z q_z with
   Q^+(f,h) = sum_{gamma real} m_gamma fhat(gamma) conj hhat(gamma)        (positive semi-definite),
   q_z(f,h) = fhat(z) conj hhat(conj z) + fhat(conj z) conj hhat(z).
With u = fhat(z), v = fhat(conj z):  q_z(f) = 2 Re(u conj v) = (|u+v|^2 - |u-v|^2)/2, so kappa_-(q_z) <= 1.
Step 2 (upper bounds). If nu < infinity, Q = Q^+ + (sum of nu forms each with at most one negative square), and
Q^+ >= 0, so kappa_-(Q) <= nu: on a subspace V with dim V > nu the nu functionals f -> fhat(z) - fhat(conj z),
z in Z, have a common non-zero kernel vector f, and there Q(f) = Q^+(f) + sum m_z |fhat(z)+fhat(conj z)|^2/2 >= 0.
On even f: fhat is even, so for the partner z' = -conj z of z: fhat(z') = fhat(conj z), fhat(conj z') = fhat(z),
hence q_{z'} = q_z on even functions and only nu/2 distinct functionals occur: kappa_-(Q_even) <= nu/2.
On odd f: fhat(z') = -fhat(conj z), fhat(conj z') = -fhat(z), again q_{z'} = q_z; kappa_-(Q_odd) <= nu/2.
Step 3 (the multiplier: cosine shift times a horizontal localiser). CITED facts used: every gamma has |Im gamma| < 1/2
(no zeros on Re s = 0, 1) and |Re gamma| > 14. Put sinc(w) = sin(w)/w = int_{-1}^{1} (1/2) e^{iwx} dx, so
|sinc(w)| <= e^{|Im w|} for all w and |sinc(w)| <= e^{|Im w|}/|w|. For real a, t > 0 and an integer K >= t let
     E(z) = sinc(z - a)^K + sinc(z + a)^K,      M(z) = cos(tz) E(z),      (M f)^ := M fhat.
  (3a) M f is f convolved with a compactly supported measure/function: cos(tz) is the transform of
       (delta_t + delta_{-t})/2 and sinc(z -+ a)^K of the K-fold convolution power of (1/2) 1_{[-1,1]}(x) e^{-+iax}.
       Hence M maps D_eps into D_{t+K+eps}. M is even in z, so M preserves parity. conj(M(conj z)) = M(z).
  (3b) On the real axis |M| <= 2, hence Q^+(M f) <= 4 Q^+(f).
  (3c) Let R = e^2 and Near(a) = { z non-real gamma : |z - a| < R or |z + a| < R } (a finite set, closed under z -> -z
       and z -> conj z). For a non-real gamma z outside Near(a): |E(z)| <= 2 (e^{1/2}/R)^K = 2 e^{-3K/2} and
       |cos(tz)| <= e^{t/2} <= e^{K/2}, so |M(z)| <= 2 e^{-K} <= 2.
  (3d) At z = a + ib in Z with THIS a (b in (0, 1/2), |a| > 14): sigma := sinc(ib) = sinh(b)/b > 1 and
       tau := sinc(2a + ib), |tau| <= e^{1/2}/(2|a|) < 0.06. So E(z) = sigma^K (1 + eta), |eta| <= 0.06^K, and
       M(z)^2 = cos^2(tz) sigma^{2K} (1+eta)^2,   cos^2(tz) = e^{-2ita} e^{2tb}/4 + r,  |r| <= 3/4.
       For C != 0 choose t in the progression t_n = (arg C - pi)/(2a) + n pi/|a| inside [K - 1, K] (its step is
       pi/|a| < 1). Then e^{-2ita} C = -|C| and
          Re[ M(z)^2 C ] <= -|C| sigma^{2K} [ e^{2tb} (1 - 3|eta|)/4 - (3/4)(1 + |eta|)^2 ]  -> -infinity  as K -> infinity
       (e^{2tb} >= e^{2(K-1)b} -> infinity, sigma > 1).
Step 4 (a negative definite subspace of the even block of dimension k, for ANY k distinct quartets, whether nu is
finite or infinite). Pick representatives z_i = a_i + i b_i in Z of the k quartets. Let
   F = union over i of ( Near(a_i) union quartet i ):  a finite set closed under z -> -z and z -> conj z.
Let p_i(z) = product of (z^2 - zeta^2) over the classes {zeta, -zeta} of F not in quartet i: an even polynomial that
vanishes exactly on F minus quartet i. Let phi >= 0 be an even bump in D_eps, int phi = 1, with eps so small that
|phihat - 1| < 1/2 on F (possible: |phihat(z) - 1| <= e^{eps |z|} - 1). Let f_i = p_i(-i d/dx) phi: even, in D_eps,
fhat_i = p_i phihat vanishes on F minus quartet i and not on quartet i. Let g_i = M_i f_i, M_i the multiplier of Step 3
with a = a_i and parameters (t_i, K_i) to be chosen. Split Q(g_i, g_l) = Q^+(g_i, g_l) + sum_{z in Z} m_z [ ghat_i(z)
conj ghat_l(conj z) + ghat_i(conj z) conj ghat_l(z) ] according to where z lies:
  * z not in F: z, conj z are outside Near(a_i) and Near(a_l), so by (3c) the bracket is at most
    4(|fhat_i(z)||fhat_l(conj z)| + |fhat_i(conj z)||fhat_l(z)|); the sum over all such z is at most a constant
    B_{il} < infinity that does not depend on the t's and K's (absolute convergence: rapid decay of fhat_i).
  * z in F, outside quartets i and l: fhat_i(z) = fhat_i(conj z) = 0, the bracket vanishes.
  * z in quartet i and i != l: fhat_l(z) = fhat_l(conj z) = 0 (quartet i is in F and is not quartet l). Same for quartet l.
  * i = l and z in quartet i (two points of Z: z_i and -conj z_i; on even functions they give the same form, Step 2):
    total d_i = 4 m_{z_i} Re[ M_i(z_i)^2 C_i ],  C_i = fhat_i(z_i) conj(fhat_i(conj z_i)) != 0.
By (3b) and Cauchy-Schwarz |Q^+(g_i, g_l)| <= 4 sqrt(Q^+(f_i) Q^+(f_l)). So the Gram matrix is G = H + diag(d_i) with H
hermitian and ||H|| <= B := sum_{i,l} (4 sqrt(Q^+(f_i)Q^+(f_l)) + B_{il}), a bound independent of the parameters.
By (3d) choose K_i and t_i with d_i <= -(B + 1). Then x* G x <= -|x|^2: G is negative definite, the g_i are linearly
independent, and Q is negative definite on span{g_i}, a k-dimensional space of even functions in D_L,
L = max_i (t_i + K_i) + eps.
Odd block: replace phi by phi' (odd; (phi')^(z) = -iz phihat(z), non-zero on F since 0 is not in F). Same proof.
Step 5. Monotonicity: D_L is contained in D_L' for L < L'. With Step 2 this gives equality for L >= L_0 when
nu < infinity; when nu = infinity Step 4 applies to k quartets for every k. QED

(An earlier draft of this proof used the bare cosine shift cos(tz); that version is only valid when nu is finite,
because it cannot isolate k quartets from infinitely many others with larger |Im gamma|. The localiser E repairs it.)

Remarks.
* The bound |Re gamma| > 14 is used only to make |tau| < sigma in (3d); any a != 0 works with R and K adjusted.
* Multiplicity is invisible: a quartet of multiplicity m costs the same two negative squares.
* Nothing in Steps 1-5 uses the Euler product: the theorem holds for any Dirichlet series with the same kind of
  explicit formula. Control (COMPUTED by lane A, r1_A/PROGRESS.md): Davenport-Heilbronn at L = 1.9, 2.0 has
  negative eigenvalues (even ; odd) = (2 ; 2) while the off-line quartets below height 200 are four; the two
  with the smallest heights are the ones a window of that size has reached. Theorem 4 says the counts will end
  at (number of quartets ; number of quartets), never more.

## 5. Corollaries: the answers to (a) and (b). PROVED

C1 (k negative squares). If kappa_-(Q_L) <= k for every L, then zeta has at most 2 floor(k/2) distinct zeros with
   Re rho > 1/2, i.e. at most floor(k/2) off-line quartets (at most 4 floor(k/2) distinct off-line zeros).
   * k = 0: RH (Weil's criterion; Theorem 4 gives a self-contained proof of the hard direction).
   * k = 1: RH as well (nu is even). "At most one negative square on every window" is EQUIVALENT to RH.
   * k = 2 or 3: at most one quartet {rho, 1 - rho, conj rho, 1 - conj rho} (any multiplicity).
   Per block: if kappa_-(Q_{L,even}) <= k for all L (or the same for odd), then at most k quartets.
   In particular RH <=> Q_{L,even} >= 0 for all L <=> Q_{L,odd} >= 0 for all L: ONE parity block suffices.
C2 (idea #10, claim a). If N_L = primes - arch has at most one positive eigenvalue (kappa_+(N_L) <= 1) for every L,
   then zeta has at most ONE off-line quartet. Proof: Prop. 3(c) gives kappa_-(Q_L) <= 2; apply C1.
   Conversely RH implies kappa_+(N_L) <= 1 (Prop. 3(a)).
   So:   RH  =>  [N has at most one positive direction on every window]  =>  [at most one off-line quartet],
   and neither arrow is known to reverse; the second cannot be improved by linear algebra alone, because a
   configuration with exactly one quartet has kappa_-(Q_L) = 2 = 1 + 1 for large L, which is what Prop. 3(b)
   allows when kappa_+(N_{L,even}) = 1 and kappa_+(N_{L,odd}) = 0.
   [Whether a one-quartet configuration with zeta's Gamma factor and non-negative prime-side weights can
   actually have kappa_+(N) = 1 is NOT decided here; the judge's kill test (round 1, next-step 4) is the way.]
C3 (sharpening of WJ13). The statement in WJ13 "each quartet costs one negative square per block" was HEURISTIC;
   it is now PROVED (Theorem 4), with the precise meaning: for L >= L_0, exactly one per block per quartet.
C4. RH <=> N_{L,odd} <= -2<f,s>^2 for all L alone (odd block), and <=> N_{L,even} <= 2<f,c>^2 alone (even block).

## 6. Relation to Krein-Langer theory (CITED, from search summaries and memory; not read in full)

A kernel W(x - y) with kappa negative squares on an interval is the subject of the continuation theory of
M. G. Krein and H. Langer (classes P_kappa and P_{kappa;a}; "On some continuation problems which are closely
related to the theory of operators in spaces Pi_kappa", parts I-IV, 1977-1985; see Kaltenbaeck-Woracek, J. Operator
Theory 40 (1998), and Langer-Langer-Sasvari 2004, both found by search). Their generalised Bochner theorem
represents a function with kappa negative squares on R by a positive measure plus finitely many non-real
"spectral points" of total multiplicity <= kappa. Theorem 4 is the special, explicit case in which the
representation is handed to us by the explicit formula (measure = on-line zeros, non-real points = Z); in that
case the count is exact and elementary, and the continuation theory is not needed. Two cautions for anyone who
wants to use Krein-Langer on a single window: (1) the Weil kernel is a distribution (logarithmic singularity at 0
and atoms at log n), not a continuous function, so the classical P_{kappa;a} theory does not apply verbatim;
(2) on one window the continuation is not unique, so a bound on kappa_-(Q_L) at one L bounds nothing about zeta.

Novelty (owner rule 5). Searched (3 queries, result summaries only, no primary source opened):
"Weil quadratic form negative squares number of zeros off the critical line Pontryagin Krein-Langer";
"Krein Langer continuation hermitian functions finite number of negative squares P_kappa generalized Bochner";
"negative eigenvalues Weil explicit formula hermitian form equals the number of zeros off the critical line Bombieri".
Finding: one 2026 preprint (not opened) is reported to credit Bombieri with the observation that the negative index
of truncations of the Weil form counts off-line pairs, and to use signature (1,1) blocks. So Theorem 4 is KNOWN IN
SUBSTANCE (attribution unverified). Not found in what was read: the parity-block refinement (C1 last line, C4), the
statement C2 about "one positive direction of primes - arch", and the cosine-shift proof. Status: "not found", not "new".

## 7. Barrier check (owner rule 11 / preamble 6)
B1: Theorem 4 does not use the Euler product and is not a route to RH; it is a dictionary. B2: it holds for the
impostor and counts its quartets (control above). B3: no margin is claimed. B6: C1 with k = 1 is an equivalence,
not a reduction: its only new content is that ONE spare negative square, or one parity block, costs nothing.
