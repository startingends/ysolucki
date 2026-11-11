# OBJECT_PHI: Phi(s) = E*(omega, s) in the toolkit of SP-reflection (session 2, 2026-11-11)

Written before reading the other specialists' answers. Labels: PROVED (argument given here) / KNOWN (with what I read; "from
memory" = not read this session) / COMPUTED / CONJECTURE / RISK. Read for this file: rh/HUNCHES.md parts A, A', D, E2, F;
rh/library/openai-qrh-11-12.md sections 3 and 8; the closing summary of seminar S1 (questions table). Two web searches (at
the end). Two sanity computations: tests_orbit_omega.py.txt, tests_bsy_omega*.py.txt (+ logs).

## 0. Normalisation (PROVED, three lines)
E(z,s) = sum over Gamma_inf\Gamma of Im(gamma z)^s, E*(z,s) = pi^-s Gamma(s) zeta(2s) E(z,s) = (1/2) pi^-s Gamma(s)
sum'_{(m,n)} y^s |mz+n|^-2s. At z = omega: y = sqrt3/2 and |m omega + n|^2 = N(n + m omega), six units, so
   Phi(s) = E*(omega, s) = 3 (sqrt3/2pi)^s Gamma(s) zeta_K(s) = 3 Lambda_K(s),  K = Q(sqrt-3),  Phi(s) = Phi(1-s).
Phi depends on s only through lambda = s(1-s): Phi(s) = Psi(lambda), Psi meromorphic of order 1/2 in lambda (poles only at
lambda = 0). Write xi*(2s) := pi^-s Gamma(s) zeta(2s), so E(omega, s) = Phi(s)/xi*(2s). Zeros of Phi in 0 < Re s < 1 = zeros
of zeta_K there. "RH+" below means: every zero has Re s = 1/2 OR is real (a Siegel-type zero in (0,1)).

## 1. Spherical functions, Godement, and what is free
**1.1 KNOWN (from memory: Bargmann 1947; Godement 1957; Helgason, Groups and Geometric Analysis Ch. IV).** G = PSL_2(R),
K = PSO(2). The spherical function phi_s(g) = int_K Im(k g i)^s dk depends on d(i, g i), phi_s = phi_(1-s), Laplace eigenvalue
s(1-s). phi_s is positive definite on G iff s is on the line Re s = 1/2 or in the real segment [0,1], i.e. iff lambda =
s(1-s) is real and >= 0. Spherical Bochner (Godement): the continuous K-biinvariant positive definite functions on G are
exactly int phi_s dmu(s), mu a finite positive measure on that set (equivalently on lambda in [0, inf)).
**1.2 PROVED (reading).** So: RH+ for zeta_K  <=>  phi_rho is positive definite for every zero rho of Phi in the strip
<=> the zero set of the entire-type function Psi(lambda) lies on the real axis (then automatically in (0, inf)).
The complementary series is exactly what a Siegel zero would be. This is the same dichotomy as session 1 (real exponents =
Hankel side, unimodular = Toeplitz side): here the two pieces of the unitary dual are the two real forms of lambda real.
**1.3 E(omega, s) is NOT a lattice sum of the spherical function.** It is the lattice sum of the N-invariant function y^s
(the K-fixed vector of the principal series I(s) pushed through the Eisenstein intertwiner, evaluated at the K_omega-fixed
point). The spherical function enters one step later, and that step is where positivity is free:
**1.4 KNOWN (Selberg's pre-trace formula at (omega, omega); from memory, Iwaniec, Spectral Methods, Ch. 7) + COMPUTED.**
The Gamma-orbit of omega is a positive definite measure on K\G/K = [0, inf):
   D_omega = sum over gamma in Gamma of delta at d(omega, gamma omega),
positive definite because D_omega(f* * f) = || sum_gamma f(. , gamma omega) ||^2 in L^2(Gamma\H): it is the diagonal matrix
coefficient of the quasi-regular representation of G on L^2(Gamma\G) at the distribution vector delta_omega (GNS object:
exists). Its Bochner-Godement measure is the spectral measure of the point,
   mu_omega = (3/pi) delta_(lambda=0) + sum_j |u_j(omega)|^2 delta_(lambda_j) + (1/4pi) |E(omega, 1/2+it)|^2 dt,
with |E(omega,1/2+it)|^2 = |Phi(1/2+it)|^2 / |xi*(1+2it)|^2. COMPUTED (tests_orbit_omega.log, exact integer count, m <= 40):
cosh d(omega, gamma omega) = 1 + (2/3) N(beta), beta = (b+c) + (a-d+c) omega, and
   #{gamma in SL_2(Z): N(beta) = m} = eps(m) r(m) r(m+3),  r(n) = #{x in Z[omega]: N x = n}, eps = 1 if 3 | m, else 1/2.
So D_omega is the SHIFTED CONVOLUTION of the norm form with itself, and 1.4 reads: the correlation sequence
m -> eps(m) r(m) r(m+3) has a Kallen-Lehmann representation int phi_s(1 + 2m/3) dmu_omega(s) with a positive measure whose
continuous density is |zeta_K(1/2+it)|^2/|zeta(1+2it)|^2 up to an explicit constant (the binary additive divisor problem for
the form x^2+xy+y^2; the general formula is classical, the instance was not searched).
Equivalent free statements (PROVED from 1.4): t -> p_t(omega, omega) (heat kernel) is completely monotone with Bernstein
measure mu_omega; u -> <cos(u sqrt(Delta - 1/4)) delta_omega, delta_omega> is a positive definite distribution on (R, +).
**1.5 What kind of statement RH is here.** NOT a positivity of the kernel summed over the lattice orbit: that positivity is
1.4 and is free; it sees |Phi|^2 on the line and nothing off the line. Zeros of Phi on the line are zeros of the DENSITY of
mu_omega (values of t at which delta_omega is orthogonal to the generalised eigenfunction). "Zeros of the spherical transform
of a positive definite measure lie in the unitary dual" is false in general (Fourier transforms of positive measures have
complex zeros freely), so RH is not an instance of a known type of positivity theorem in this language.
**1.6 KNOWN (from memory: Waldspurger 1985; not read).** Locally the density is a norm: for a unitary spherical parameter,
int over the torus T_p = K_p^x/Q_p^x of the local spherical function = ||P_(T_p) f_0||^2 >= 0 (integral of a positive definite
function over a subgroup), and it equals the local factor of |Phi|^2/|xi*(2s)|^2. So |Phi|^2 on the line is "W = T*T" place by
place. This is positivity of the modulus, again not of the zeros.

## 2. The semigroup of ideals of Z[omega]: three involutions, what is trivially true
I_K = ideals of Z[omega] under multiplication = free abelian semigroup on the prime ideals; group of fractional ideals J_K.
Involutions: (i) identity (mirror; dual = real semicharacters); (ii) inverse on J_K (shift; dual = unitary characters);
(iii) NEW relative to session 1: Galois conjugation a -> a-bar, for which a a* = (N a): the norm IS "s s*". A semicharacter
for (iii) satisfies chi(a-bar) = conj chi(a).
TRUE for trivial reasons (each PROVED in one line):
- T1. The constant 1 (coefficients of zeta_K) and a -> N(a)^-sigma are semicharacters for all three involutions.
- T2. Over K the function zeta_K has degree ONE: Lambda_K on ideals a, b != (1) has mirror matrix = sum over prime ideals of
  rank-one squares (session-1 D1 verbatim), every local root is 1, T_p is a projection. Pushed forward to norms n, the local
  roots are (1, 1) at split p, (1, -1) at inert p, (1) at 3: real with positive multiplicity AND of modulus 1. So zeta_K
  passes both local tests of session 1 (mirror and Herglotz). Nothing here distinguishes K from a Beurling system.
- T3. A cubic residue character a -> (u/a)_3 is positive definite for (ii) always, for (iii) when u is rational, and NOT
  for (i) (complex values: the mirror test rejects it, as it rejected L(chi)L(chi-bar) mod 5).
- T4. Gauss sums. |g(c)|^2 = N(c) is Plancherel on the finite group O/c: r -> g(r, c) = conj chi_c(r) g(1, c) is the Fourier
  transform of a unimodular function. As a function of the modulus, g~ = g/sqrt N is unimodular and multiplicative only up
  to the cocycle (a/b)_3 (b/a)_3: a unitary character of a central extension of J_K by mu_3 (the metaplectic structure
  behind Kubota's theta function), not of J_K. "g~^3 = mu times a unit" (digest of the 11/12 paper, step 5) says: mu on
  squarefree ideals is the cube of such a projective character. For mu itself: the kernel mu(a) mu(b) is rank one >= 0
  (trivial); the mirror kernel mu(ab) is NOT >= 0 (local moments 1, -1, 0: determinant -1).
IS THERE A POSITIVE-DEFINITENESS ON THE SEMIGROUP WHOSE TRUTH IS RH_K? I found none, and I think the honest answer is
structural: on the semigroup the statements equivalent to RH are CYCLICITY statements (equality cases), not positivities.
- KNOWN (Nyman-Beurling; Baez-Duarte 2003 for integer dilations; KNOWLEDGE.md E5; from memory, and for zeta, not zeta_K):
  in L^2(R, dnu), dnu = |zeta(1/2+it)|^2 dt/|1/2+it|^2, RH <=> 1/zeta lies in the closed span of {n^-it : n >= 1}. In my
  language: c(m/n) = int (m/n)^-it dnu is a positive definite function on the GROUP of positive rationals (free); RH says its
  GNS space is already generated by the SEMIgroup orbit of the cyclic vector.
- PROVED (easy direction, any weight): let nu' = |F(1/2+it)|^2 dt with F analytic in Re s > 1/2, F h in H^2 for a fixed
  outer h; if the closed span of {N(a)^-s F h} contains a function not vanishing at a point rho with Re rho > 1/2, then
  F(rho) != 0. With F = zeta_K this is a sufficient condition for RH_K on the ideal semigroup.
- OBSERVATION (PROVED): the continuous part of mu_omega is such a measure: |zeta_K(1/2+it)|^2 times the weight
  c/|zeta(1+2it)|^2, and 1/zeta(2s) is analytic and zero-free in Re s > 1/2. So the Nyman-Beurling Hilbert space of zeta_K is,
  up to an outer weight, the cyclic subspace of delta_omega in the continuous spectrum of the modular surface, and
  multiplication by n^-it is the dilation y -> ny of the height on incomplete Eisenstein series (Mellin variable), i.e. a
  ONE-SIDED operator (f(z) -> f(nz), level-raising), not a Hecke operator (Hecke operators are self-adjoint and act by the
  real functions sum_{d|n} (n/d^2)^it; their span is dense for trivial reasons).

## 3. The wall "no slack" (B3): which object would make it trivial
**3.1 What is free.** GNS for D_omega: H = L^2(Gamma\H), operator Delta, vector delta_omega. Matrix coefficients p_t(omega,
omega), the wave two-point function, the spectral measure mu_omega. All contain Phi only as |Phi(1/2+it)|^2.
**3.2 What would have to be a matrix coefficient for RH+ (PROVED, 6 lines).** Let lambda_k = rho_k(1 - rho_k) over the zeros
(each pair rho, 1-rho once), Theta_Phi(t) := sum_k e^(-t lambda_k), t > 0 (absolutely convergent: Re lambda_k > 0 and
sum 1/|lambda_k| < inf). CLAIM: RH+ <=> Theta_Phi is completely monotone on (0, inf) <=> Theta_Phi(t + t') is a positive
definite kernel (semigroup (R_+, +), identity involution) <=> -(lambda Psi)'/(lambda Psi) = sum_k 1/(lambda_k - lambda)
is a Nevanlinna function of lambda (the pole of Phi at lambda = 0 removed; with it, class N_1, as SP-operator's B125). Proof of the non-trivial direction: by Bernstein Theta_Phi = int e^(-xt) dsigma(x),
sigma >= 0 on [0, inf); Laplace transform in t gives sum_k 1/(lambda_k - lambda) = int dsigma(x)/(x - lambda) for lambda << 0;
the right side is analytic off [0, inf), the left has a pole at every lambda_k: all lambda_k >= 0.  QED. So the object is a
triple (H, A >= 0, v) with <v, e^(-tA) v> = Theta_Phi(t): Hilbert-Polya in the variable lambda, with v the "trace vector"
(v in H_(-1), not in H). Equivalent: Phi(s) = c det(A - s(1-s)). KNOWN in substance (Grommer 1914 / Laguerre-Polya class;
from memory): a reformulation, no new input. Theta_Phi has an explicit prime-side formula (Weil's formula with a Gaussian).
**3.3 The natural candidate and exactly what is missing.** Candidate: H = L^2(Gamma\H) (or of the cubic cover), A = Delta
restricted by "u(omega) = 0", v built from delta_omega. Three precise gaps:
 (a) THE VECTOR IS NOT IN THE SPACE, twice. delta_omega is in H^(-1-eps): <delta_omega, (Delta - lambda)^-1 delta_omega>
     diverges logarithmically (an infinite atom at the identity, as for the Weil distribution in session 1). And the
     functions E(., rho) that vanish at omega are not in L^2 (they grow like y^(Re rho) in the cusp), so "symmetric operator
     => real eigenvalue" does not apply to them: a point has zero capacity in dimension 2, the condition u(omega) = 0 does
     not change the Friedrichs operator, and its other self-adjoint extensions have spectrum {m_omega(lambda) = c}, not
     {Phi = 0}. (Contrast, KNOWN from memory: Colin de Verdiere's pseudo-Laplacian "constant term vanishes at height a"
     DOES make the truncated E(., s) square integrable, which is why those look-alikes have their zeros on the line.)
 (b) A DENSITY, NOT A MATRIX COEFFICIENT. In mu_omega the zeros of Phi are zeros of the density; RH needs a measure with
     ATOMS at the zeros. Passing from |Phi|^2 dt to sum delta_(gamma) is a logarithmic derivative, which preserves no
     positivity.
 (c) A SIGN. Phi(1/2+it) is REAL. The free object knows Phi^2; RH is about the real square root. Exactly (PROVED modulo the
     factorisation theorem quoted in 4): E(omega, 1/2+it) = Phi(1/2+it)/xi*(1+2it) has modulus^2 = 4 pi (density of
     mu_omega) and phase = (scattering phase -arg xi*(1+2it), the same for every point z) + pi (number of sign changes of Phi
     up to t). RH_K <=> this is the MINIMUM-PHASE (outer) square root of the density, after the normalisation of section 4.
**3.4 So the trivialising object in my toolkit is not a positivity but a CAUSAL structure:** a unitary one-parameter group
with an outgoing subspace (Lax-Phillips; in Neeb-Olafsson Ch. 4 this is the normal form of a reflection positive
one-parameter group, read in session 1), in whose spectral representation delta_omega is represented by E(omega, 1/2+it);
then RH_K <=> that vector is CYCLIC for the forward semigroup (Beurling-Lax). The outgoing subspace exists (waves in the
cusp); what is missing is any reason for cyclicity. Note the reversal against session 1: the measure of the ZEROS fails the
Szego condition (deterministic, SP-operator B150); mu_omega SATISFIES it, and RH is the statement about its canonical factor.

## 4. The risk: a non-negative "defect function" on the modular surface whose zeros are the RH points
For z in H let ht(z) = max over gamma of Im(gamma z) (so ht >= sqrt3/2, with equality exactly on the orbit of omega), and
   A(z) := (1/2pi) int log|E(z, 1/2+it)| dt/(1/4+t^2)     (Poisson mean, at the point s = 1, of half the log of the
                                                            continuous spectral density of the point z).
**STATEMENT (PROVED given the standard inner-outer factorisation; see caveats).**
   A(z) = log(3/pi) - (1/2) log ht(z) + Dfc(z),   Dfc(z) := sum over zeros rho of E(z, .) with Re rho > 1/2 of log|rho/(1-rho)| >= 0.
Proof. G(s) := ((s-1)/s) E(z,s) ht(z)^-s is analytic in Re s > 1/2 (the pole at s = 1 is cancelled; the poles of E are at
zeros of zeta(2s), Re s < 1/2), has |G(1/2+it)| = |E(z,1/2+it)| ht^(-1/2), tends to a non-zero constant as s -> +inf (so no
singular inner factor e^(-cs)), and is of bounded type (polynomial growth in vertical strips). Hence G = (Blaschke product
over its zeros) x (outer), and at s = 1, where G(1) = Res_(s=1) E / ht = (3/pi)/ht and |b_rho(1)| = |1-rho|/|rho|:
log((3/pi)/ht) = [A(z) - (1/2) log ht] - Dfc(z).  QED.
CHECK without numerics (PROVED): at z = omega, assuming RH for zeta and L(., chi_-3) so that Dfc = 0, the left side computed
from E(omega,s) = 3 (sqrt3/2)^s zeta(s) L(s,chi_-3)/zeta(2s) with the Balazard-Saias-Yor value 0 for zeta, the values
L(1,chi_-3) = pi/(3 sqrt3) and zeta(2) = pi^2/6, is log(sqrt2 3^(3/4)/pi); the right side log(3/pi) - (1/2) log(sqrt3/2) is
the same number. The constant 3/pi = 1/vol(Gamma\H) is the atom of mu_z at lambda = 0.
COMPUTED (tests_bsy_omega*.log; crude midpoint rule in theta, t = (1/2) tan theta, double precision, one implementation):
A(i) = -0.04380, -0.04609 (N = 500, 2000) against log(3/pi) = -0.04612; A(omega) = 0.0395, 0.0287, 0.0252 (N = 500, 2000,
5000) against 0.0258. Agreement to the accuracy of the rule (3e-5 at i, about 1e-3 and not monotone at omega).
**READING.** Dfc is a continuous non-negative function on the modular surface; Dfc(z) = 0 iff the Epstein zeta function at z
has no zero off the line. RH for zeta_K, K = Q(sqrt-3), <=> Dfc(omega) = 0 <=> the Poisson-Szego entropy A of the spectral
density of the point omega attains the lower bound log(1/vol) - (1/2) log ht, and omega is where that lower bound is
largest. The inequality A >= bound is Jensen, free, valid at every point; "no slack" = its equality case.
WHY I THINK IT MAY BE NEW: Balazard-Saias-Yor (1999) is this identity for zeta (KNOWN; confirmed by search summaries: weight
1/|s|^2, Blaschke product over zeros right of the line). Two searches did not find it for Epstein zeta functions / as a
function on the modular surface, nor the reading "RH points = zero set of a defect function", nor the height term.
(Found and NOT read: Lagarias-Suzuki, arXiv math/0412039, RH for certain integrals of Eisenstein series against measures on
the modular surface: the closest neighbour; must be read before anyone builds on this.)
WHY IT PROBABLY FAILS AS A ROUTE: (i) it is a reformulation (owner rule 2): at one point it IS Balazard-Saias-Yor for zeta_K.
The only new input is the FAMILY in z; (ii) Dfc is expected to be flat to infinite order at omega: near omega low zeros
cannot leave the line (they leave only in colliding pairs), so Dfc(z) is carried by zeros at height -> inf as z -> omega,
exactly the seminar's "a window of size L sees a tilt only above exp(-c L e^(2L))"; a minimum-principle argument would have
to work at infinite order; (iii) for generic z and for CM points of class number > 1, Dfc > 0 (KNOWN from memory:
Davenport-Heilbronn; Bombieri-Hejhal), so any proof must use what is special at omega: exactly the Euler product, B1.
WHAT I WOULD NEED TO KNOW TO DECIDE: (1) is z -> A(z) real-analytic, and does it satisfy a differential inequality on
Gamma\H (log|u| for a Laplace eigenfunction u is "superharmonic plus nodal terms"; averaged over t with the Cauchy weight,
what is Delta_z A?). If Delta A had a sign off the nodal contribution, the nine class-number-one points would be
characterised variationally. (2) The value of Dfc at one point where zeros off the line are tabulated (a class number 2
CM point), to see the size. (3) Whether Lagarias-Suzuki already contains the identity. (4) From SP-operator: in the
Lax-Phillips representation, is the vector of delta_omega known to lie in the outgoing subspace after a shift by log ht?
(5) From SP-modular: is A(z), a Poisson mean in s of log|E(z,s)|, a known automorphic function (a Kronecker-limit-type
integral)? At s -> 1 Kronecker's limit formula gives log(y^(1/2)|eta(z)|^2); A(z) is a companion built on the line.

## 5. Searches (rule 5)
(1) "Balazard Saias Yor log|zeta| integral criterion ... Epstein zeta function Eisenstein series outer function Jensen":
BSY and variants found (Bui-Lester-Milinovich; Sekatskii-Beltraminelli; arXiv 1306.0856); no Epstein / Eisenstein version
in the results. (2) "Eisenstein series E(z,s) as function of s Nyman-Beurling OR outer function OR Szego CM point ...
Lax-Phillips minimum phase": Lagarias-Suzuki math/0412039 found (title and summary only); nothing on a minimum-phase or
Szego description. Summaries only; no paper was read for this file. Status: "not found in two queries", not "new".
