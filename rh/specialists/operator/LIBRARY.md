# LIBRARY of SP-operator

The toolkit's theorems most likely to matter here. Each entry: exact statement with hypotheses, source, and
READ STATUS for this seat. "READ" = I had the text in front of me this session (how much is stated);
"from memory" = recalled, not checked against a source; such entries must be re-read before a route leans on them.
Local files: sources under rh/library/src/. Session 1: 2026-11-11.

Notation: F#(z) = conj F(conj z). HB = Hermite-Biehler class {E entire: |E#(z)| < |E(z)| for Im z > 0}.
N_kappa = generalised Nevanlinna class. Window = (-a, a) in the log variable; test functions carry primes
<= e^(2a).

## A. The Weil form as an operator (what is already established)

**L1. Weil form on a window = Friedrichs extension (Suzuki 2026).** READ IN FULL (arXiv 2606.09096 v3, TeX
source, all 8 sections; note in rh/library/suzuki-2606.09096.md).
Let g be the screw function of zeta (his eq. (1.3): g(t) = -4(e^{t/2}+e^{-t/2}-2) + sum_{n<=e^{|t|}} Lambda(n)
n^{-1/2}(|t| - log n) - (|t|/2)(psi(1/4) - log pi) - (1/4)(Phi(1,2,1/4) - e^{-|t|/2} Phi(e^{-2|t|},2,1/4)),
continuous, real, even), G_a = P_a G P_a the compression of convolution by g to mean-zero functions of
L^2(-a,a), D = i d/dx with Dirichlet conditions, B_a = D* G_a D on H_0^1(-a,a). Then:
- Thm 1.1: for each a > 0 the self-adjoint operator A_a with Q_W^a(v) = <A_a v, v> is the Friedrichs
  extension of B_a. Cor 1.2: lambda_a = inf of the Rayleigh quotient over C_c^inf(-a,a) (a form core).
- Thm 1.3: lambda_a is continuous in a. (Unconditional. Proof: compact embedding H^log -> L^2, rescaling to
  [-1,1], upper and lower semicontinuity.)
- Thm 1.4: for sufficiently small a, lambda_a > 0, simple, eigenfunction even (and positive a.e.), and
  lambda_a = log(1/a) + mu_1 - log(2 pi) + psi(2) - 1 + O(a), mu_1 > 0. (Dirichlet form + Kato. No range.)
- Thm 1.5: for lambda < lambda_a, T_a = A_a - lambda; i d/dx on C_c^inf(-a,a) is symmetric with deficiency
  indices (1,1) in the completion H(T_a); W(a,theta;z) = (z-i) vhat_+(z) + e^{i theta}(z+i) vhat_-(z) (v_+-
  = deficiency vectors, T_a v_+- = C e^{+-x}) is entire with ONLY REAL zeros, the spectrum of the extension.
  Unconditional; "relies essentially only on the fact that the prime contribution involves only finitely many
  primes for fixed a".
- Cor 1.6 (conditional): if e^{phi(a,z)} W(a,theta;z) -> xi(1/2-iz)/(xi(1/2-iz)+xi'(1/2-iz)) locally uniformly in
  the upper half-plane, then RH. The author: "does not appear to provide a simple route".
- Facts quoted there with attribution: Q_W^a lower bounded, closed (Connes-Consani 2023, Prop. 2.1); discrete
  spectrum, ground state (Connes-Consani-Moscovici, arXiv 2511.22755, Thm 3.6, Cor 3.7); RH <=> positive
  definite on every window; odd functions alone suffice (Yoshida 1992, Prop. 1); RH <=> non-degenerate
  (Yoshida Thm 2); RH <=> g is a screw function in Krein-Langer's sense (Suzuki, JLMS 2023, Thm 1.2);
  Q_W(v) = Q_G(Dv) (ibid. Prop. 3.1). Form domain: D(Q_W^a) = {v: |Q(v)| finite} inside H^log(-a,a);
  symbol: Q(v) = (1/2pi) int (log|z| - log 2pi)|vhat|^2 + O(a)||v||^2.
- Sec. 7 (under RH): the completion of C_c^inf(R) for Q_W is isometric to K = H(E)/E, E = xi(1/2-iz)+xi'(1/2-iz);
  the generator of translations there is a Hilbert-Polya operator (M_{pi/2}); Fourier image of the window space
  is a de Branges space H(E_a). (I extended the last statement to "whenever Q_a > 0": PROOFS.md P1.)

**L2. Canonical systems equivalent to GRH (Suzuki 2021).** READ IN FULL (arXiv 1606.05726, TeX source, all
sections; note in rh/library/suzuki-1606.05726.md). For L in the real Selberg class S_R, E^{w,nu}(z) =
xi_L(1/2 + w - iz)^nu, Theta = E#/E, K = inverse Fourier transform of Theta:
- Prop 2.2: E^{w,nu} in HB for every w > 1/2 unconditionally, and for 0 < w <= 1/2 under GRH(L).
- Prop 4.3: [L(s) != 0 for Re s > 1/2 + w0] <=> [E^{w,nu} in HB for every w > w0] <=> [Theta^{w,nu} meromorphic
  inner for every w > w0]. (nu irrelevant.)
- Prop 4.1: K(x) = eps^nu sum_{n <= e^x} q^{w,nu}(n) n^{-1/2} G^{w,nu}(x - log n) for x > 0, K = 0 for x < 0;
  q = Dirichlet coefficients of (L(s-w)/L(s+w))^nu; G explicit from the Gamma factor; K continuous iff
  nu w d_L > 1.
- Thm 2.1: under nu w d_L > 1, K[t] f(x) = 1_{x<t} int_{-inf}^t K(x+y) f(y) dy is Hilbert-Schmidt, self-adjoint
  on L^2(-inf,t), zero for t <= 0, and +-1 are not eigenvalues for 0 <= t < tau (some tau > 0), unconditionally.
- Thm 2.2: H(t) = diag(1/gamma(t), gamma(t)), gamma = (det(1+K[t])/det(1-K[t]))^2, is a Hamiltonian on [0,tau) and
  explicit A(t,z), B(t,z) solve the canonical system with E(0,z) = E^{w,nu}(z). No GRH.
- Prop 4.4 / Thm 2.3: if E^{w,nu} in HB-bar then ||K[t]|| < 1 for all t >= 0 (so H extends to [0,inf)) and
  J(t;z,w) -> 0 as t -> inf.
- Thm 2.4: GRH(L) <=> exists (w_n, nu_n), w_n decreasing to 0, nu_n w_n d_L > 1, det(1 +- K[t]) != 0 for all
  t >= 0, and J(t;z,z) -> 0 for z in C_+. Variant (sec. 6.3): the same with w_n -> w0 characterises the
  zero-free half-plane Re s > 1/2 + w0.
- Closing remarks: (1) Ramanujan (S4) not needed for Thms 2.1-2.3; (2) Euler product (S5) essential.
- arXiv 1204.1827 (the zeta-only predecessor, w > 1, nu = 1): source downloaded, NOT read.

**L3. Real zeros of the transform of a simple even ground state (Connes-van Suijlekom 2025).** READ: abstract
and theorem list only (arXiv 2511.23257, TeX source downloaded). Statement of the abstract: for a real
distribution D on [0,L] with even extension, if the form with kernel D~(x-y) defines a lower-bounded
self-adjoint operator on L^2[-L/2, L/2] whose lowest spectral value is a simple isolated eigenvalue with even
eigenfunction xi, then all zeros of xihat are real. Mechanism: Caratheodory-Fejer structure of singular positive
Toeplitz matrices (kernel vector of a PSD Toeplitz matrix of rank n-1 has its zeros on the circle), a
continuous analogue, Hurwitz. Whole paper still to read.

## B. de Branges spaces and canonical systems

**L4. Axiomatic characterisation (de Branges 1968, Thm 23).** from memory (restated in Suzuki 2606.09096
sec. 7.9, which I read). A Hilbert space H of entire functions, not {0}, is equal isometrically to some H(E),
E in HB-bar, iff (H1) F(w) = 0, w non-real => F(z)(z - conj w)/(z - w) in H with the same norm; (H2) point
evaluation at each non-real w is continuous; (H3) F# in H with the same norm. Then K(w,z) =
[conj E(w) E(z) - conj E#(w) E#(z)] / (2 pi i (conj w - z)).

**L5. Ordering theorem and inverse theorem (de Branges 1968, Thms 35, 40).** from memory (Thm 40 is quoted in
Suzuki 1606.05726 sec. 1, read: for E in HB-bar there is a Hamiltonian H on [t0,t1) and a solution with
E(t0,z) = E(z), E(t,.) in HB-bar, J(t;z,z) -> 0). Ordering: if H(E1), H(E2) sit isometrically in one L^2(mu) and
E1/E2 has bounded type in C_+ with no real zeros/poles problems, then one contains the other. Type formula
(Krein, de Branges): exponential type of E_t = int_0^t sqrt(det H). pi K_t(0,0) = int_0^t h_11 when
(A,B)(t,0) = (1,0).

**L6. Multiplication operator in H(E).** READ as quoted in Suzuki 1606.05726 sec. 7 (from Kaltenbaeck-Woracek
1999): M: F -> zF is closed symmetric with deficiency indices (1,1), no eigenvalues; if dom M is dense its
self-adjoint extensions M_theta have the zeros of S_theta = e^{i theta}E - e^{-i theta}E# as simple eigenvalues,
eigenfunctions S_theta(z)/(z - gamma) forming an orthogonal basis. dom M not dense iff sum Im(zeros of E#) finite
(de Branges Thm 29; Baranov).

**L7. Bernstein inequality / differentiation in model and de Branges spaces (Dyakonov; Baranov).** from memory.
Differentiation is bounded on K_Theta (resp. H(E)) iff Theta' is bounded on R, with norm comparable to
sup|Theta'|; phase derivative phi'(x) = pi K(x,x)/|E(x)|^2. TO READ before use (asked about in B100).

## C. Positive definite and screw functions on an interval; negative squares

**L8. Krein's extension theorem (1940) and its screw-function form (1944).** from memory. A continuous hermitian
f on (-2a, 2a) with f(x-y) positive definite on (0,2a) is the restriction of the Fourier transform of a
positive finite measure; the extension is unique or the set of extensions is parametrised by Nevanlinna
functions through a 2x2 entire matrix. Screw (helical) version: g continuous, g(-t) = conj g(t), kernel
g(t-s) - g(t) - g(-s) + g(0) >= 0 <=> g(t) = g(0) + i b t + int (e^{i l t} - 1 - i l t/(1+l^2)) d sigma(l)/l^2,
int d sigma/(1+l^2) finite (Krein; von Neumann-Schoenberg; Kolmogorov: structure functions of processes with
stationary increments). Source to read: Krein-Langer, IEOT 78 (2014) 1-69 (cited by Suzuki).

**L9. Hermitian functions with kappa negative squares on an interval (Krein-Langer; Grossmann-Langer).**
READ: Kaltenbaeck-Woracek, J. Operator Theory 40 (1998), pp. 1-6 of 37 (pdftotext). Def 1.1: f in P_{kappa,a}
if f continuous hermitian on [-2a,2a] and for all n, t_i in (-a,a) the form sum f(t_j - t_i) xi_i conj xi_j
has at most kappa negative squares, exactly kappa for some choice. KNOWN ([GL] quoted there): f in P_{kappa0,a}
has at least one extension to R in P_{kappa0}; either exactly one or infinitely many. Lemma 1.3: the generator
A(f) of the partial shifts in the Pontryagin space H(f) is symmetric with defect (0,0) or (1,1); not
self-adjoint iff e^{izx} in H(f) for at least kappa0 + 1 points z in C_+. Prop 1.6: f is determining iff A(f)
self-adjoint; otherwise extensions in P_{kappa0} <-> Nevanlinna parameter tau via
i int_0^inf e^{izt} f~(t) dt = (w11 tau + w12)/(w21 tau + w22). Main result (their intro): a number Delta(f)
decides whether extensions with MORE negative squares exist. Pages 7-37 not read.

**L10. Generalised Nevanlinna functions (Krein-Langer).** READ: Luger-Ou, arXiv 2202.13246, sec. 3.2
(pdftotext). Def: q meromorphic in C_+, Nevanlinna kernel (q(z) - conj q(w))/(z - conj w) with kappa negative
squares. Thm 6: q generalised Nevanlinna <=> q(z) = conj q(z0) + (z - conj z0)[(I + (z - z0)(A - z)^{-1}) v, v]
with A a self-adjoint relation in a Pontryagin space; minimal representation has negative index kappa.
Consequence stated there: q in N_kappa has at most kappa poles in C_+ and at most kappa real points (incl.
infinity) that are generalised poles not of positive type. Thm 7 (Dijksma-Langer-Luger-Shondin;
Derkach-Hassi-de Snoo): q in N_kappa <=> q = r f r#, f Nevanlinna, r rational of degree kappa.
Applied here (PROOFS.md P4): q(z) = i(Lambda'/Lambda)(1/2 - iz), Lambda = pi^{-s/2}Gamma(s/2)zeta(s), lies in
N_kappa with kappa = 1 + #{zeros with Re > 1/2}; RH <=> q in N_1.

**L11. Inertia of bordered forms (Haynsworth 1968).** from memory. M = [[A,B],[B*,D]] hermitian, A invertible:
In(M) = In(A) + In(D - B* A^{-1} B). This is S1-cubic's Lemma A and S1-parity's B32, B56. Rank-one case:
Aronszajn-Krein formula, eigenvalues of A + t<.,c>c are the roots of 1 + t<c,(A - z)^{-1}c> = 0.

## D. Toeplitz, Hankel, Wiener-Hopf

**L12. Borodin-Okounkov identity on the line (Basor-Chen 2002).** READ IN FULL (arXiv math/0202062, TeX).
K in L^1(R), int |x||K| finite, F = transform of K bounded and in L^1, 1 - F of index zero and bounded away from
zero, 1 - F = phi_+ phi_- with phi_+- analytic in the upper/lower half-plane, = 1 at infinity. Then
det(I - K_{[0,alpha]}) = Z e^{c alpha} det(I - L_{[alpha,inf)}), c = (1/2pi) int log(1 - F),
Z = det(W(phi)W(1/phi)) = exp int_0^inf z (log(1-F))_z (log(1-F))_{-z} dz, and L has kernel
int_0^inf (phi_-/phi_+ - 1)_{x+z} (phi_+/phi_- - 1)_{-z-y} dz. Proof: W(phi_+-) triangular, A =
W(1/phi_+)W(phi)W(1/phi_-), Jacobi-type identity det(P A P) = det A det(Q A^{-1} Q), A^{-1} =
W(phi_-/phi_+)W(phi_+/phi_-). Fails for the sine kernel (factorisation fails): stated in the paper.
Discrete originals: Geronimo-Case 1979; Borodin-Okounkov 2000; Basor-Widom 2000; Boettcher 2001 (not read).

**L13. Wiener-Hopf plus/minus Hankel (Basor-Ehrhardt 2005).** READ through a machine summary of the first
100k of 147k characters of arXiv math/0502039 (not verbatim). For a - 1 in L^1, W_R(a) f = f + int_0^R k(x-y)f,
H_R(a) f = int_0^R k(x+y) f. Eq. (13): for even a, det W_{2R}(a) = det(W_R + H_R) det(W_R - H_R) (block form
[[W,H],[H,W]]). Prop 3.13: W_R(a) +- H_R(a) = W_R(a_+) (P_R (I +- H(psi))^{-1} P_R) W_R(a_-), psi = a~_+ / a_+;
det(W_R(a_-)W_R(a_+)) = G[a]^R. Lemma 3.15: det(P (I+A)^{-1} P) = det(I + QAQ)/det(I+A). Verbatim read still owed.

**L14. Widom's identity.** from memory. T(ab) = T(a)T(b) + H(a)H(b~), H(ab) = T(a)H(b) + H(a)T(b~) on H^2,
b~(t) = b(1/t). (Used implicitly in L12: H(b)H(c~) = I - T(b)T(c) when bc = 1.) Source to read: Boettcher-
Silbermann, Analysis of Toeplitz Operators.

**L15. Szego-Kolmogorov-Krein.** from memory. For a measure w dx + singular part on R, the one-step prediction
error is positive iff int log w(x)/(1+x^2) dx > -infinity. If it fails (e.g. purely discrete measure) the
process is deterministic: the future lies in the closed span of the past; no outer function, no Wiener-Hopf
factorisation. Krein systems version: Denisov, "Continuous analogs of polynomials orthogonal on the unit circle
and Krein systems" (IMRS 2006): Szego condition <=> coefficient condition. TO READ.

**L16. Schur product theorem (1911).** KNOWN, standard. Entrywise product of PSD kernels is PSD. Used for the
multiplier duality (PROOFS.md P3).

**L17. Bernstein-Widder (exponentially convex functions).** READ only as reported by SP-reflection (B129:
Neeb-Olafsson 2018, Ch. 4, read by that seat). k(x+y) positive definite on an interval <=> k(t) =
int e^{-lambda t} d mu(lambda), mu >= 0 on all of R; with boundedness, mu on [0,inf) and then k(|t|) is
positive definite (Kallen-Lehmann form). SP-reflection owns this entry.

## E. Positivity of ground states

**L18. Beurling-Deny / irreducibility (as used by Suzuki Thm 1.4).** READ inside 2606.09096 sec. 5. A closed
form E with E(|v|) <= E(v) and the Markov property is a Dirichlet form; if irreducible, e^{-tT} is positivity
improving (Lenz-Stollmann-Veselic 2009, Thm 1.4, as cited) and the ground state is simple and positive a.e.
Applies to L(v) = (1/4) int int |v(x)-v(y)|^2/|x-y| - (1/2) int log(1-x^2)|v|^2. For the full Weil form:
Q(|v|) <= Q(v) holds for arch and prime parts and fails for the pole term (my remark, B131).

## Still to read (priority order for session 2)
1. Burnol, Sonine spaces / "Scattering, determinants, hyperfunctions in relation to Gamma(1-s)/Gamma(s)" and
   the 2011 paper Suzuki builds on: the closed-form chain for the archimedean-only window (promised in B127).
2. Suzuki, JLMS 2023 (screw function; Thm 1.2, 1.3) and Suzuki, Canad. J. Math. (Hilbert space from the Weil
   distribution; Thms 1.1, 1.4, 5.5).
3. Krein-Langer IEOT 2014 (screw functions, classes G_kappa); Kaltenbaeck-Woracek 1998 pp. 7-37.
4. Basor-Ehrhardt math/0502039 verbatim; Boettcher-Silbermann for Widom's identities.
5. Connes-van Suijlekom 2511.23257 (whole); Suzuki 1204.1827; Suzuki's "Su19_1" (inverse problem paper).
6. Dyakonov / Baranov on differentiation in model spaces; Denisov on Krein systems.
7. Lagarias 1999 / Hinkkanen 1997 (Re xi'/xi > 0 iff RH) to replace "from memory".
