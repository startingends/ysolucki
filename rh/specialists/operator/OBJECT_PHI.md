# OBJECT_PHI: Phi(s) = E*(omega, s) in the operator toolkit

SP-operator, session 3, 2026-11-11. Written before reading any other seat's answer. No source was opened this
session: every KNOWN below is "from memory" unless it says "read" (then it was read in sessions 1-2). No numerics.
Labels: PROVED (argument given, modulo the KNOWN facts named) / KNOWN / CONJECTURE / RISK.

## 0. Conventions and two exact normalisations
X = PSL_2(Z)\H, Delta = -y^2(d_x^2 + d_y^2) >= 0, E(z,s) = sum over Gamma_inf\Gamma of Im(gamma z)^s,
Lambda(s) = pi^(-s/2) Gamma(s/2) zeta(s), E*(z,s) = Lambda(2s) E(z,s) = E*(z,1-s), scattering coefficient
phi(s) = Lambda(2s-1)/Lambda(2s). Spectral variable z: s = 1/2 - iz, lambda = s(1-s) = 1/4 + z^2; the PHYSICAL
sheet is Re s > 1/2, i.e. Im z > 0. F#(z) := conj F(conj z).
(N1) PROVED: E(omega,s) = 3 (sqrt3/2)^s zeta_K(s)/zeta(2s) and Phi(s) = 3 (sqrt3/(2 pi))^s Gamma(s) zeta_K(s),
     K = Q(sqrt-3) (|c omega + d|^2 = c^2 - cd + d^2, six units). Phi has simple poles at s = 0, 1 and is real on
     the critical line; Phi(s) = Phi(1-s).
(N2) E_0(z) := xi(1 - 2iz), xi(s) = (1/2)s(s-1)Lambda(s). KNOWN (zeta has no zero on Re s >= 1; this is Suzuki's
     Prop. 2.2 at shift 1/2, read in session 1): E_0 is Hermite-Biehler UNCONDITIONALLY; Theta_0 := E_0#/E_0 =
     -((z - i/2)/(z + i/2)) phi(1/2 - iz) is a meromorphic inner function. Its zeros and poles sit at s = 1 - rho/2
     and s = rho/2 (zeros of zeta(2s-1), zeta(2s)): the "wrong parameter". H(E_0) is the de Branges space of the cusp (Pavlov-Faddeev, Lax-Phillips).
(N3) eps(z) := E(omega, 1/2 - iz) = F_omega(z)/E_0(z) up to an elementary factor, F_omega(z) := s(1-s)Phi(s) at
     s = 1/2 - iz: a REAL entire function (F_omega# = F_omega) whose zeros are exactly the zeros of zeta_K.

## 1. The point interaction at omega
KNOWN (Krein; Berezin-Faddeev; Albeverio-Gesztesy-Hoegh-Krohn-Holden for R^2; Colin de Verdiere "Pseudo-
laplaciens I" for surfaces): Delta restricted to C_c^inf(X \ {omega}) has deficiency indices (1,1) (the Green
function G_s(., omega) is in L^2 in dimension 2). Its self-adjoint extensions are Delta_alpha, alpha in
R u {inf}; alpha = inf is Delta itself. Krein's formula: (Delta_alpha - lambda)^(-1) = (Delta - lambda)^(-1)
+ (alpha - Q(lambda))^(-1) <., G_conj(lambda)(.,omega)> G_lambda(.,omega), with the Krein function
Q(lambda) = lim_{z->omega} [G_lambda(z,omega) + (m/2pi) log d(z,omega)] (m = 3 the order of the stabiliser),
a NEVANLINNA function of lambda, unconditionally, with spectral measure
  d rho = sum_j |u_j(omega)|^2 delta_{lambda_j} + (3/pi) delta_0 + (1/4pi)|E(omega, 1/2+it)|^2 dt   (cusp forms u_j).
(1a) PROVED from this: on the cut, Im Q(1/4 + t^2 + i0) = |E(omega,1/2+it)|^2/(4t)
     = |Phi(1/2+it)|^2 / (4t |Lambda(1+2it)|^2). So Phi is the FORM FACTOR of delta_omega (boundary value of the
     generalised eigenfunction at the point), not the Krein function; Q is the Stieltjes transform of |form
     factor|^2 plus the cusp-form atoms. Positivity of the density is free; reality of the zeros is not in it.
(1b) KNOWN (Selberg; Iwaniec's book): G_s - G_{1-s} = E(z,s)E(w,1-s)/(1-2s) (normalisation from memory). Hence,
     for the meromorphic continuation of Q in s,
        Q(s) - Q(1-s) = J(s) := E(omega,s)E(omega,1-s)/(1-2s) = Phi(s)^2 / ((1-2s) Lambda(2s) Lambda(2-2s)).
     PROVED consequence: {zeros of Phi} = {s : the Krein function takes the same value at s and 1-s}, i.e.
     the points where its two sheets agree. On the line this reads Im Q = 0. Phi^2 measures exactly the failure
     of the regularised automorphic Green function at the CM point to be a function of s(1-s).
(1c) PROVED (Aronszajn-Donoghue criterion for rank-one perturbations, KNOWN): if Phi(1/2 + i gamma) = 0 then
     G_s(.,omega) at s = 1/2 + i gamma is in L^2 (the pole of the spectral integral is cancelled by the zero of
     the form factor), Q(lambda_gamma) =: alpha(gamma) is real, and lambda_gamma = 1/4 + gamma^2 is an EMBEDDED
     EIGENVALUE of exactly one extension, Delta_{alpha(gamma)}, with eigenfunction the Green function itself.
     So every zero on the line IS an eigenvalue of a self-adjoint operator: but each zero of its own operator.
     alpha(gamma) = S(lambda_gamma), S := (Q(s)+Q(1-s))/2 = (p.v. Hilbert transform of the density) + sum_j
     |u_j(omega)|^2/(lambda_j - lambda) + const; by Waldspurger-Zhang (KNOWN) |u_j(omega)|^2 is a multiple of
     L(1/2,u_j) L(1/2,u_j x chi_-3)/L(1,sym^2 u_j). No reason is known for alpha(gamma) to be constant.
(1d) PROVED: a zero rho off the line is NOT a resonance or eigenvalue of any self-adjoint Delta_alpha
     (resonances solve alpha = Q on the second sheet; at rho that value is Q(rho), not real). It is an eigenvalue
     of the non-self-adjoint extension with complex coupling alpha = Q(rho), as is every other point of the
     physical sheet; what singles rho out is only that this eigenvalue coincides with a second-sheet resonance.
     Scattering form: Theta_alpha(z) = Theta_0(z)(alpha - M(-z))/(alpha - M(z)), M(z) := Q(1/4+z^2); the zeros of
     Phi are the z at which the scattering coefficient does not depend on alpha (transparent energies).
(1e) PROVED: with E_alpha := E_0 (alpha - M) (the structure function of Delta_alpha, meromorphic),
     E_alpha E_beta# - E_alpha# E_beta = (alpha - beta)(E_0 E_1# - E_0# E_1), E_1 := -E_0 M, and E_0 E_1# - E_0# E_1 =
     E_0 E_0# (M(z) - M(-z)) = F_omega^2 times an elementary rational function: Phi^2 is the symplectic
     (Wronskian) pairing of the structure functions of any two extensions.
ANSWER to "which Herglotz or generalised Nevanlinna function": none has the zeros of Phi as its zeros. Q is
Nevanlinna in lambda; in the variable z it has exactly one pole in the upper half-plane, z = i/2 (the constant
eigenfunction, i.e. the pole of E at s = 1: the analogue of the "+1" of PROOFS.md P4; whether z M(z) is
exactly of class N_1 I have NOT checked). The zeros of Phi are the zeros of the ODD part M(z) - M(-z) =
(i/2z) eps(z) eps(-z) (normalisation as in (1b)), a difference of two sheets, which is in no such class.

## 2. The de Branges reading
Three different systems carry Phi; none makes "zeros on the line" a Hermite-Biehler property for free.
(2a) THE STRING OF THE POINT (PROVED given de Branges' inverse theorem). rho is a positive measure with
     int d rho/(1+lambda^2) finite, so it is the spectral measure of a unique canonical system / Krein string.
     Its chain parameter is wave time: int cos(tk) d rho(k) is the diagonal wave kernel at omega, and by the
     pre-trace formula (KNOWN, Selberg) it equals a sum over the orbit Gamma.omega; on |t| < T only orbit
     points within distance T enter (finite propagation speed). This is the exact analogue of the Weil form on
     windows (finitely many primes per window) WITH POSITIVITY FREE. But Phi sits in the DENSITY of the measure,
     |Phi|^2/|xi(1+2it)|^2: the chain knows |Phi| on the line, and RH_K is a statement about the analytic
     continuation of a density, on which de Branges theory is silent.
(2b) THE CUSP SPACE H(E_0). PROVED (Eisenstein transform = Lax-Phillips spectral representation, KNOWN): the
     continuous part of delta_omega is represented by eps = F_omega/E_0; (z^2+c)^(-1) eps is the transform of the
     Green function. eps(z) ~ e^{i tau z} as Im z -> +inf with tau = log(2/sqrt3) > 0 (max Im(gamma omega) =
     sqrt3/2 < 1). Inner-outer factorisation in the upper half-plane: eps = (pole factor) e^{i tau z} B(z) O(z),
     B = Blaschke product over the zeros of zeta_K with Re s > 1/2. Hence, by Beurling's theorem (KNOWN):
        RH for zeta_K  <=>  B = 1  <=>  e^{-i tau z} eps is OUTER  <=>  the Green function at omega, pushed
        tau into the cusp, is a CYCLIC vector for the one-sided (outgoing) translation semigroup of the wave
        equation in the continuous spectrum (multiplication by e^{iaz}, a >= 0; its identification with wave
        propagation into the cusp is the Lax-Phillips translation representation, KNOWN, from memory).
     The Colin de Verdiere functions are the same statement where it is trivial: for the constant term at
     height a the representative is the A-function of E_a = a^{-iz} E_0 (a free string segment of length
     log a glued to the cusp), Hermite-Biehler as a product. F_omega is a real entire function ASSOCIATED with
     H(E_0) but it is not A_t or B_t of any member of a chain I can name.
(2c) SUZUKI'S DIAL FOR zeta_K (read in full in session 1; zeta_K is in his class). E_d^K(z) = xi_K(1/2+d-iz),
     Theta_d^K = xi_K(1/2-d-iz)/xi_K(1/2+d-iz); zeta_K has no zero right of 1/2+d0 iff Theta_d^K is inner for all
     d > d0 iff the Hamiltonians H_d^K(t) exist for all t; unconditional for d > 1/2. THE HYPOTHESIS NOBODY
     CAN VERIFY: |Theta_d^K| <= 1 in the upper half-plane for 0 < d <= 1/2 (equivalently det(1 +- K_d[t]) != 0
     for all t). WHAT KIND OF OBJECT WOULD MAKE IT AUTOMATIC: an inner function is inner for free when it is
     the scattering function of a Lax-Phillips system (a unitary group with orthogonal incoming and outgoing
     subspaces) or the characteristic function of a contraction (Sz.-Nagy-Foias); KNOWN, and conversely every
     inner function arises so. So the trivialising object is a wave equation with a "cusp" whose scattering
     coefficient is xi_K(s-d)/xi_K(s+d) for arbitrarily small d. PROVED observation: every arithmetic cusp
     gives d = 1/2 exactly. For Q the modular surface gives xi(w-1/2)/xi(w+1/2), w = 2s - 1/2; for K the
     Bianchi orbifold PSL_2(Z[omega])\H^3 gives Lambda_K(s-1)/Lambda_K(s) (KNOWN; Langlands-Shahidi constant
     terms are always L(s)/L(s+1)). The dial at d < 1/2 is the complementary series (the local intertwining
     forms are positive for |d| < 1/2, KNOWN; there is no global unitary structure off the unitary axis).
     In the second form of the answer: zeros are real for free when the function is a KREIN FUNCTION (Herglotz:
     outer, real interlacing zeros and poles), not a form factor. Phi is the form factor in every construction
     of this note. The object that would make the wall trivial is a rank-one problem in which Phi (or
     Phi'/Phi: PROOFS.md P4 for zeta_K) is the Q-function; equivalently an identity writing
     (Phi(s) conj Phi'(w) + ...)/(s + conj w - 1) as a Gram kernel, the analogue for the value at omega of the
     Maass-Selberg relation (which is that Gram identity for E_a, at the edge).
IMPOSTOR FIRST (rule H1). PROVED: nothing in sections 1-2 uses that omega is special. For any point w of X the
same statements hold with E*(w,s); for a CM point of class number 2 (e.g. w = i sqrt5, form x^2 + 5y^2) E*(w,s)
is an Epstein zeta function with functional equation and zeros OFF the line (KNOWN: Davenport-Heilbronn 1936,
Stark, Bombieri-Hejhal), and it passes (1a)-(1e), (2a), (2b) verbatim. So the point-interaction picture is
impostor-blind. What omega has and i sqrt5 lacks is not its stabiliser of order 3 (the class-number-one points
of discriminants -7, -8, -11, ... have trivial stabiliser): it is that the Hecke correspondences T_p return
omega to itself (complex multiplication), which is the Euler product of zeta_K. No statement above uses T_p.

## 3. Colin de Verdiere, and why "value at omega" gives no theorem
KNOWN (Colin de Verdiere 1981-83; the zero statement also Lagarias-Suzuki 2006, cited by Suzuki): for a >= 1
the functional T_a: f -> constant term of f at height a is continuous on the form domain H^1; Delta_a := the
Friedrichs extension of Delta on ker T_a is self-adjoint; the truncated Eisenstein series Lambda^a E(., s) is an
L^2 eigenfunction exactly when a^s Lambda(2s) + a^{1-s} Lambda(2s-1) = 0; so these zeros have s(1-s) real.
Two things make it work, and the point fails both.
(3a) FORM-BOUNDEDNESS. A curve has positive capacity: restriction to it is continuous on H^{1/2+} inside H^1.
     A point in dimension 2 has capacity zero: delta_omega is in H^{-1-e} but not H^{-1}; {f in H^1 : f(omega) =
     0} is not closed and the closure of C_c^inf(X \ omega) in H^1 is all of H^1. PROVED consequence: the
     pseudo-Laplacian of the functional "value at omega" is Delta itself. The extensions Delta_alpha exist
     (delta_omega is in H^{-2}) but none of them is "vanish at omega": the functions of the operator domain
     that vanish at omega are the common core of all of them, a symmetric operator, not a self-adjoint one.
(3b) SEPARATION. The eigenfunction in the horocycle case is the generalised eigenfunction CUT at the curve; the
     cut function is in L^2 and in the form domain because {y = a}, a >= 1, separates the cusp from the core
     and the constant term decouples there. A point, a closed geodesic, a horocycle at height < 1 separate
     nothing. PROVED general statement (rank-one theory): for a form-bounded functional T that does not
     separate, the pseudo-Laplacian's eigenvalue equation is Q_T(lambda) = 0 for the Krein function Q_T =
     <T,(Delta - lambda)^(-1) T>, and an embedded eigenvalue needs BOTH Re Q_T = 0 and form factor = 0. Zeros
     of the form factor alone are eigenvalues only in the separating case. Only horospheres at a cusp
     separate; so self-adjointness reaches only constant terms, hence only L(s)/L(s+1), hence d = 1/2.
The proposed repairs, each with what appears in place of Phi:
 * A smaller form domain (form of Delta^2, or any p(Delta) of degree > 1, whose domain lies in C^0). PROVED:
   "vanish at omega" is then closed, the operator is self-adjoint, eigenfunctions are (G_{l1} - G_{l2})(., omega)
   with p(l1) = p(l2) = mu, and the eigenvalue equation is Q(l1) = Q(l2): equal values of the Krein function
   at two ROOTS on the physical sheet. The zeros of Phi are equal values at the two SHEETS over one lambda
   (1b). No polynomial p converts sheets into roots. No L-function zero appears.
 * The cover on which omega is a branch point. PROVED: PSL_2(Z) = Z/2 * Z/3 has a character chi of order 3,
   nontrivial on the stabiliser of omega; every chi-automorphic function vanishes at omega, so there the
   condition is automatic and the Laplacian on L^2(X, chi) is self-adjoint. But chi(T) != 1 on the parabolic
   generator, the cusp is closed, there is no Eisenstein series and the spectrum is discrete: Maass cusp forms
   on the normal subgroup of index 3 (which contains Gamma(3); level 9 after z -> 3z, KNOWN). In place of
   Phi: nothing; the eigenvalues are those of cusp forms, whose L-functions are of degree 2 and cuspidal.
 * A closed geodesic C through or near omega. Form-bounded; Delta_C self-adjoint; form factor = the period of
   E over C = a zeta function of a real quadratic field (Hecke, KNOWN), Gamma factor Gamma(s/2)^2. By (3b) its
   zeros are not eigenvalues. In place of Phi: zeta_{K'}, K' real quadratic, again as a form factor.
 * The horocycle through omega has height sqrt3/2 < 1: form-bounded, but it does not separate, and its form
   factor is the edge function a^s Lambda(2s) + a^{1-s} Lambda(2s-1) with a < 1 (not covered by the theorem).
 * A space where the CM locus has codimension one: the Bianchi orbifold of K. There zeta_K is in the CUSP:
   scattering coefficient Lambda_K(s-1)/Lambda_K(s), and Colin de Verdiere's construction gives the theorem
   "a^s Lambda_K(s) + a^{2-s} Lambda_K(s-1) has its zeros on Re s = 1" (my statement of it; CONJECTURE until
   the constants are checked). Phi appears, at the two arguments s and s - 1: the dial at d = 1/2 for zeta_K.
   The modular surface inside it is a codimension-one cycle, form-bounded, and its period is a form factor.

## 4. One risk
RISK (construction). Let the coupling depend on the energy and choose it by the functional equation:
   alpha(lambda) := S(lambda) = (Q(s) + Q(1-s))/2,
a single-valued meromorphic function of lambda = s(1-s). PROVED: the pencil equation Q(s) = S(lambda) is
J(s) = 0, i.e. its spectrum is exactly the zero set of Phi (with Lambda(2s)Lambda(2-2s) in the denominator
contributing no zeros), all of it, on or off the line, and nothing else. KNOWN (Pavlov's models with internal
structure; Shondin, Dijksma-Langer-Shondin for the indefinite case): an energy-dependent point interaction
with coupling alpha_0 - n(lambda) is a self-adjoint operator on L^2(X) + K_int when n is Nevanlinna (K_int a
Hilbert space), and on a Pontryagin space when n is in N_kappa. So IF -S were Nevanlinna, the zeros of zeta_K
would be eigenvalues of a self-adjoint operator and RH_K would follow; if -S were in N_kappa, at most kappa
exceptional pairs.
WHY IT PROBABLY FAILS, exactly. PROVED: for Re s > 1/2, S = Q(s) - J(s)/2, Q is regular off the real lambda
axis, and J(s) contains E(omega, 1-s), which has poles where zeta(2 - 2s) = 0, i.e. at s = 1 - rho/2 for every
zero rho of zeta, unless Phi(s) vanishes there. These are non-real values of lambda, infinitely many. A function of class
N_kappa has at most kappa non-real poles. So -S is in no class N_kappa: the edge resonances of the cusp (the
zeros of zeta(2s)) enter the coupling as complex poles. The internal space must contain the Lax-Phillips
resonance space with its DISSIPATIVE generator, and self-adjointness is lost exactly there. The "wrong
parameter" wall (HUNCHES F1 (i)) is not avoided by evaluating at omega; it moves from the spectral parameter
into the coupling.
WHAT I WOULD NEED TO KNOW TO DECIDE. (i) Whether S minus its resonance part is Nevanlinna: write
S = S_res + S_0 with S_res the sum of the principal parts at lambda = (rho/2)(1 - rho/2) (residues are explicit:
Phi(1 - rho/2)^2 over derivatives of Lambda), and ask whether -S_0 is Nevanlinna. That is a statement about the
Hilbert transform of |Phi|^2/|xi(1+2it)|^2 and the cusp-form values |u_j(omega)|^2, i.e. about central L-values;
it is unconditional in form and I do not know its answer. (ii) Whether the same construction at a
class-number-2 CM point fails at a DIFFERENT place (it must fail; if it fails at the same place, the
construction has no arithmetic content and should be dropped). (iii) Whether the Hecke correspondences fixing
omega act on the deficiency space {G_s(., omega)} in a way that makes S_0 computable: T_p G_s(., omega) is a sum
of Green functions at the Hecke translates of omega, among them omega itself with multiplicity 1 + chi_-3(p);
this is the only place where the Euler product could enter the operator picture, and nothing in sections
1-3 uses it.

## 5. Summary in the toolkit's words
Phi is the form factor of delta_omega; its square is the difference of the Krein function on the two sheets,
the Wronskian of the structure functions of two extensions, and the numerator of the spectral density of the
string of the point. "Zeros only on the line" is: the Green function at omega is cyclic for the outgoing
semigroup; or: Suzuki's inner functions for zeta_K exist down to d = 0. Self-adjointness makes real the zeros
of Krein functions and of separating constant terms, never of form factors; arithmetic cusps realise only
d = 1/2; and the whole picture is shared by Epstein zeta functions that violate RH. The object that would make
the wall trivial is one in which Phi is a Q-function or a scattering coefficient at shift d < 1/2.
