# PROOFS of SP-operator (short proofs cited on board s1; session 1, 2026-11-11)

Notation. Window (-a, a). fhat(z) = int f(x) e^{izx} dx. Gamma = zeros of xi(1/2 - iz) with multiplicities
m_gamma (non-real gamma allowed; the set is invariant under gamma -> -gamma and gamma -> conj gamma).
Q(f, h) = sum_gamma m_gamma fhat(gamma) conj(hhat(conj gamma)) = Weil form (explicit formula, CITED: Weil 1952;
in this form Suzuki arXiv 2606.09096 sec. 3.1, read). Q_a = its restriction to the window, a closed form with
form domain D(Q_a) = {v in L^2(-a,a): int log^+|z| |vhat(z)|^2 dz finite} (Suzuki sec. 3.1; Connes-Consani
Prop. 2.1 as cited there), C_c^infinity(-a,a) is a form core (Suzuki Thm 1.1, proof, and Cor. 1.2).
All labels: PROVED means the full argument is here, given the facts marked CITED.

---------------------------------------------------------------------------------------------------------
## P1. The window space is a de Branges space whenever Q_a > 0 (no RH needed). PROVED given CITED facts.

Statement. Let a > 0 with lambda_a > 0 (lowest eigenvalue of Q_a; e.g. all sufficiently small a, Suzuki Thm 1.4,
unconditional; all a under RH). Let H_a = {vhat : v in D(Q_a)} with norm ||vhat||^2 = Q_a(v). Then H_a is a
de Branges space: there is an entire E_a with |E_a#(z)| < |E_a(z)| for Im z > 0 and H_a = H(E_a) isometrically.

Proof. By de Branges' axiomatic characterisation (CITED: de Branges 1968, Thm 23, from memory; restated in
Suzuki sec. 7.9) it suffices to check, for a Hilbert space of entire functions:
(H1) point evaluations are continuous: |vhat(z)| <= ||v||_{L^1} e^{a|Im z|} <= (2a)^{1/2} e^{a|Im z|} ||v||_{L^2}
     <= (2a/lambda_a)^{1/2} e^{a|Im z|} Q_a(v)^{1/2}. (Completeness: Q_a is closed and Q_a >= lambda_a ||.||^2.)
(H2) F -> F#, F#(z) = conj F(conj z), is an isometry of H_a: F# is the transform of x -> conj v(-x), and the
     kernel of Q is real and even, so Q is unchanged by complex conjugation and by reflection.
(H3) if F = vhat in H_a and F(w) = 0 with w non-real, then G(z) = F(z)(z - conj w)/(z - w) is in H_a with the
     same norm. Membership: G = F + (w - conj w) F/(z - w); F/(z - w) is entire of exponential type <= a and
     |F(x)/(x - w)| <= |F(x)|/|Im w| on the real axis, so it is uhat for some u in L^2(-a,a) (Paley-Wiener) with
     int log^+|x| |uhat|^2 finite, i.e. u in D(Q_a).
     Norm: first let v in C_c^infinity(-a,a) with vhat(w) = 0. Then u(x) = -i int_{-a}^x e^{-iw(x-t)} v(t) dt
     solves i u' - w u = v, vanishes near -a, and vanishes near +a because vhat(w) = 0; so u, and g with
     ghat = G, are in C_c^infinity(-a,a) and the zero-side formula applies to g:
         Q(g) = sum_gamma m_gamma G(gamma) conj(G(conj gamma))
              = sum_gamma m_gamma [ (gamma - conj w)/(gamma - w) ] conj[ (conj gamma - conj w)/(conj gamma - w) ]
                                 F(gamma) conj(F(conj gamma)),
     and conj[(conj gamma - conj w)/(conj gamma - w)] = (gamma - w)/(gamma - conj w), so the bracket product is 1
     for EVERY gamma, real or not: Q(g) = Q(v). (For real gamma this is |Blaschke factor| = 1; for non-real
     gamma the two factors at gamma and conj gamma cancel. This is the point: the isometry holds for the
     indefinite form.)
     General F: the functional v -> vhat(w) is continuous on D(Q_a) (by H1), so C_c^infinity intersected with
     its kernel is dense in the kernel (a dense subspace meets a closed hyperplane densely). The map v -> g is an
     isometry on that dense set, hence extends to an isometry of the hyperplane; Q-convergence implies
     L^2-convergence, hence locally uniform convergence of transforms, so the extension is still
     multiplication by (z - conj w)/(z - w). QED

Remarks. (1) Suzuki states "hat H(A_a) is a de Branges space" in sec. 7.9 under RH, using
||vhat||^2 = sum m |vhat(gamma)|^2. The proof above only needs positivity on the one window.
(2) If Q_a is indefinite with kappa negative squares and non-degenerate, the same three checks give a de
Branges PONTRYAGIN space (Kaltenbaeck-Woracek; from memory, not read).
(3) Consequences used on the board: K_a(w, z) = <e_z, Q_a^{-1} e_w> (e_z(x) = e^{-izx} on the window) is the
reproducing kernel; K_a(z,z) = sup |vhat(z)|^2 / Q_a(v) is non-decreasing in a; S1-curv's t_e, t_o are
combinations of K_a at z = +-i/2. For a < b with Q_b > 0, H(E_a) sits isometrically in H(E_b): a chain, hence
(de Branges, CITED from memory) a canonical system; the Hamiltonian is diagonal because Gamma = -Gamma.

---------------------------------------------------------------------------------------------------------
## P2. The twist as a conjugation, and the sign of its curvature. PROVED.

F_d(s) = zeta(s-d) zeta(s+d). Its zeros in the z-variable are gamma +- id, so its Weil form is
Q_d(f) = sum_gamma m_gamma [ fhat(gamma+id) conj fhat(conj(gamma+id)) + fhat(gamma-id) conj fhat(conj(gamma-id)) ].
With (e^{-dx} f)^(z) = fhat(z + id) and (e^{dx} f)^(z) = fhat(z - id):
    Q_d(f) = Q(e^{-dX} f, e^{dX} f) + Q(e^{dX} f, e^{-dX} f),   X = multiplication by x,
i.e. Q_d = e^{dX} Q e^{-dX} + e^{-dX} Q e^{dX} = 2 cosh(d ad_X) Q as forms on every window (e^{+-dX} are bounded
with bounded inverse on the window and preserve the form domain). The kernel of ad_X^n Q is (x-y)^n k(x-y).
(Same identity: S1-mirror B90, S1-curv B99 G1, S1-cubic B103, found independently.)
Curvature. Let Q psi = lambda_0 psi, ||psi|| = 1. Then
    <psi, [X,[X,Q]] psi> = <psi, (X^2 Q - 2 X Q X + Q X^2) psi> = 2 lambda_0 <X psi, X psi> - 2 <X psi, Q X psi>
                         = -2 <X psi, (Q - lambda_0) X psi>.
If lambda_0 is the bottom of the spectrum (of the block containing X psi, or of the whole form) this is <= 0.
Hence, by the Rayleigh principle, lambda_min(Q_d) <= <psi, Q_d psi> = 2 lambda_0 - 2 d^2 <X psi,(Q-lambda_0)X psi>
+ O(d^4). Note X psi has the opposite parity to psi, so for the even ground state the bound is
c_even = 2 <x psi_e, (Q_odd - lambda_e) x psi_e> >= 2 (lambda_odd - lambda_e) ||x psi_e||^2 >= 0.
Mirror form of the tilt: if R psi = eps psi (R = reflection, eps = +-1) and phi = e^{dX} psi, then
e^{-dX} psi = eps R phi and Q_d(psi) = 2 eps Re Q(R phi, phi).

BLIND PREDICTION attached to this (IDEAS_LOCAL #1, 00:21 UTC, before reading S1-parity's F_d logs): first
failing half-width L*(d) about 0.28-0.33 (d = 0.25), 0.35 (d = 0.1), 0.38-0.40 (d = 0.05). RESULT (S1-parity,
fd_first.log / B112): 0.436, 0.476, 0.505 (even block). MISS by 0.12 to 0.15 in L. Reason: I guessed c(L) of
order a^2; it is far smaller (1.5e-4 at L = 0.75) because x psi_even is nearly in the near-null odd ladder.
The formula was right, my estimate of its coefficient was not.

---------------------------------------------------------------------------------------------------------
## P3. Multiplier duality. PROVED (two lines).

cosh(d(x-y)) = cosh dx cosh dy - sinh dx sinh dy: as a kernel in (x,y) it has rank 2 and signature (1,1).
cosh(d(x+y)) = cosh dx cosh dy + sinh dx sinh dy: rank 2, positive semidefinite.
cos(t(x-y)) = cos cos + sin sin: positive semidefinite.   cos(t(x+y)) = cos cos - sin sin: signature (1,1).
Schur product theorem (KNOWN: Schur 1911): the entrywise product of two positive semidefinite kernels is
positive semidefinite. So multiplying a kernel k(u) by cosh(du) preserves positivity of every Hankel form
[k(x+y)] and may destroy positivity of the Toeplitz form [k(x-y)]; multiplying by cos(tu) does the opposite.

---------------------------------------------------------------------------------------------------------
## P4. Poisson splitting and the Weyl function. PROVED given the KNOWN facts named.

W(u) = sum_gamma m_gamma e^{-i gamma u} (Weil distribution). 2cosh(du) = e^{-d|u|} + e^{d|u|}.
For d > sup |Im gamma|: int e^{-d|u|} e^{-i gamma u} e^{i xi u} du = 2d/(d^2 + (xi-gamma)^2) and, pairing gamma
with conj gamma, sum_gamma m_gamma 2d/(d^2+(xi-gamma)^2) = 2 Re (xi'/xi)(1/2 + d + i xi)  [from xi'/xi(s) =
sum_rho 1/(s - rho), symmetric summation]. Each term Re 1/(s - rho) = (sigma - beta)/|s - rho|^2 is > 0 when
sigma > beta; so for d >= 1/2 the density is positive UNCONDITIONALLY, and it is positive for all d > 0 iff RH
(KNOWN: Re xi'/xi > 0 on Re s > 1/2 iff RH; Hinkkanen 1997, Lagarias 1999; from memory).
m(z) := i (xi'/xi)(1/2 - iz). For z = x + iy, y > 0: Im m(z) = Re (xi'/xi)(1/2 + y - ix). So m is Nevanlinna in
the upper half-plane iff RH; m(. + id) is Nevanlinna for d >= 1/2 unconditionally; m(. - id) has poles at
gamma + id, in the upper half-plane for every real gamma: infinitely many, so it is in no class N_kappa
(KNOWN: a function of N_kappa has at most kappa poles in C_+; Luger-Ou arXiv 2202.13246 sec. 3.2, read).
{d : m(. + id) is Nevanlinna} is a half-line [d0, inf), d0 = sup Re rho - 1/2 >= 0.

Class N_1 and the pole. Lambda(s) = pi^{-s/2} Gamma(s/2) zeta(s), q(z) = i (Lambda'/Lambda)(1/2 - iz).
xi = (1/2) s(s-1) Lambda gives q = m + R, R(z) = -i [1/s + 1/(s-1)] at s = 1/2 - iz. Since 1/2 - iz = -i(z + i/2)
and -1/2 - iz = -i(z - i/2): R(z) = 1/(z + i/2) + 1/(z - i/2) = 2z/(z^2 + 1/4), a real rational function of degree
2 with one pole in C_+: class N_1. m = m_real + sum over non-real pairs {gamma, conj gamma} of
-m_gamma [1/(z-gamma) + 1/(z - conj gamma)] (plus the conditionally convergent bookkeeping of the Hadamard
product, which does not affect the kernel count), m_real Nevanlinna, each pair of class N_1 (same computation as
for R, any positive weight). Negative squares are subadditive under sums of kernels, and the number of poles in
C_+ is a lower bound. Hence kappa(q) = 1 + #{distinct gamma with Im gamma > 0} when that number is finite, and
RH <=> q in N_1. (If there are infinitely many off-line zeros, q is in no N_kappa.)
[Not checked line by line: the convergence bookkeeping for infinitely many real zeros. Label for the board
statement: PROVED modulo that standard point.]

---------------------------------------------------------------------------------------------------------
## P5. Suzuki's dial: symmetry and the control. PROVED.

E_d(z) = xi(1/2 + d - iz). E_d#(z) = conj xi(1/2 + d - i conj z) = xi(1/2 + d + iz) = xi(1/2 - d - iz) = E_{-d}(z)
(xi real on the real axis; xi(s) = xi(1-s)). So Theta_d := E_d#/E_d satisfies Theta_d Theta_{-d} = 1.
Expansion: E_{+-d} = xi +- d xi' + O(d^2) at s = 1/2 - iz, so conj E_d(w) E_d(z) - conj E_d#(w) E_d#(z)
= 2d [conj xi(w) xi'(z) + conj xi'(w) xi(z)] + O(d^3), which is d times the same expression for E = xi + xi'.
Control. Zeros of E_w(z) = xi(1/2 + w - iz): z = -gamma' - iw for the zeros gamma' of xi(1/2 - iz). Such a
zero lies in the open upper half-plane iff -Im gamma' > w; the zero set is symmetric, so E_w has a zero in C_+
iff w < d0, and E_w is Hermite-Biehler iff w > d0 (Suzuki Prop. 4.3). For F_d the completed function on the
shifted line is E_{w-d}(z) E_{w+d}(z); a product of Hermite-Biehler functions is Hermite-Biehler, and the first
factor fails as soon as w - d < d0. So the dial of F_d ends at w = d + d0: at distance d from its symmetry
point when RH holds for zeta.

---------------------------------------------------------------------------------------------------------
## P6. Derivative of the parity determinants in the window (for operators I + K, K with continuous even kernel).

Let K_L have kernel k(x-y) on (-L, L), k even and continuous, I + K_L invertible, Gamma_L = kernel of
I - (I + K_L)^{-1}. Then (d/dL) log det(I + K_L) = Gamma_L(L,L) + Gamma_L(-L,-L) (standard: the derivative of a
Fredholm determinant in an endpoint is the resolvent kernel there). The even block is the operator on (0,L)
with kernel k(x-y) + k(x+y), whose resolvent kernel is Gamma_L(x,y) + Gamma_L(x,-y); the odd block has
Gamma_L(x,y) - Gamma_L(x,-y). Hence
   (d/dL) log [ det(even block) / det(odd block) ] = 2 Gamma_L(L, -L).
PROVED for this class. For the Weil form (unbounded, logarithmic order, atoms) the statement needs a regularised
determinant; NOT proved. The regularisation-free substitute is h_1(L) dL = pi dK_L(0,0) (P1, Remark 3).

---------------------------------------------------------------------------------------------------------
## P7. Odd block on the no-prime window: simple, one-signed ground state for EVERY L <= (1/2) log 2.
PROVED given the two cited theorems; one point not checked line by line (marked).

Setting. 0 < L <= (1/2) log 2, so no prime power enters: Q = pole + arch on [-L, L]. For phi on (0, L] let
f_o(x) = sign(x) phi(|x|) and E_o(phi) := Q(f_o).
Kernels (off the diagonal). arch: Suzuki 2606.09096 eq. (2.3)-(2.5) with no primes:
 Q_arch(v) = (1/4) int int |v(x)-v(y)|^2/|x-y| - (1/2) int log(L^2-x^2)|v|^2 - (2A+1)||v||^2 - int int r_1''(x-y) v(y) v(x),
 r_1''(t) = w(|t|) - 1/(2|t|), w(u) = e^{-u/2}/(1 - e^{-2u}) = 1/(e^{u/2} - e^{-3u/2}).
 The cross term of the first form has kernel -(1/2)/|x-y|, so the total off-diagonal kernel of Q_arch is
 -w(|x-y|). w is positive and strictly decreasing on (0, inf) (the denominator has derivative
 (1/2)e^{u/2} + (3/2)e^{-3u/2} > 0).
pole: P(f_o) = -2 <f_o, sinh(x/2)>^2 = -8 (int_0^L phi s)^2, s(x) = sinh(x/2) > 0 on (0, L]
 (PROOF_parity_index Lemma 1).
Folding: for odd f_o the off-diagonal kernel of E_o in the variables x, y in (0, L] is, up to positive
constants, -[w(|x-y|) - w(x+y)] - s(x)s(y) =: -J(x,y), and J > 0 on (0,L]^2.
Hence E_o(phi) = (1/2) int int J(x,y)(phi(x) - phi(y))^2 dx dy + int V(x) phi(x)^2 dx with a real potential V
(the logarithmic term above, constants, and the diagonal compensations), first on the folded core
(smooth, compactly supported in (0, L)), then on the closure.
[NOT CHECKED LINE BY LINE: that the closed odd form of Q_L is the closure of this expression on that core. It
follows from Suzuki Cor. 1.2 (C_c^inf(-L,L) is a form core) restricted to odd functions, provided odd
functions in C_c^inf(-L,L) vanishing near 0 are still a core of the odd part; a function of the form domain
need not vanish at 0, but points have zero capacity for a form of logarithmic order (H^log does not embed in
continuous functions), which is the standard reason; to be written out.]

Cited theorems (FROM MEMORY: Reed-Simon, Methods of Modern Mathematical Physics IV, Thm XIII.50 (first
Beurling-Deny criterion) and Thms XIII.43-44 (Perron-Frobenius for positivity preserving semigroups). READ: the
same pair as used in Suzuki 2606.09096 sec. 5.2, with Lenz-Stollmann-Veselic 2009 Thm 1.4):
 (i) for a closed lower-bounded real form E with operator T: e^{-tT} positivity preserving <=> E(|u|) <= E(u)
     for all u in D(E) (with |u| in D(E));
 (ii) if moreover the semigroup is irreducible and inf spec T is an eigenvalue, it is simple with an a.e.
     strictly positive eigenfunction.
Verification. (i): (|phi(x)| - |phi(y)|)^2 <= (phi(x) - phi(y))^2 and J >= 0; the potential term is unchanged.
Irreducible: if A, A^c in (0, L] both have positive measure, E_o(1_A u, 1_{A^c} u) = - int_A int_{A^c} J u u != 0
for u > 0, since J > 0 everywhere (Suzuki's argument for the kernel 1/|x-y|). inf spec is an eigenvalue:
discrete spectrum (Connes-Consani-Moscovici Thm 3.6, as cited by Suzuki). No Markov property is used.
Conclusion. For every 0 < L <= (1/2) log 2 the lowest eigenvalue of the odd block is simple and its
eigenfunction, folded to (0, L], is positive a.e. Nothing is said about the sign of the eigenvalue.

Scope. (1) Not arithmetic: the same proof works for any Gamma kernel that is positive and decreasing and any
pole term whose odd fold is <= 0 off the diagonal (impostor: rates 2m + 3/2, no pole; Beurling on the same
window). (2) Breaks exactly at L = (1/2) log 2: the prime 2 contributes to the odd fold
-Lambda(2) 2^{-1/2} [delta(|x-y| - log 2) - delta(x+y - log 2)]; the second (mirror) term is a NEGATIVE jump
rate and criterion (i) fails (S1-cubic B52), although one sign is still observed numerically (S1-parity B119).
(3) Even block: Gamma fold -[w(|x-y|) + w(x+y)] has the right sign, the pole +8 c(x)c(y) the wrong one; the
even ground state is not covered (it is covered for small L by Suzuki Thm 1.4, by perturbation).
(4) Relation to Suzuki Thm 1.4: same mechanism; he applies it to the a-independent principal form and then
perturbs, which is why his statement has "sufficiently small a"; on the odd subspace the pole has the right
sign and no perturbation is needed.
