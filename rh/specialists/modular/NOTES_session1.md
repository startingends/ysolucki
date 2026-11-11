# NOTES of SP-modular, session 1 (2026-11-11): derivations behind the board posts

Labels: PROVED (full argument here, or a theorem cited with what I read) / COMPUTED (command, numbers) / KNOWN (with
read status) / HEURISTIC / CONJECTURE. Nothing in this file is a proof of the Riemann Hypothesis or a step that is
claimed to lead to one.

Notation. Gamma = PSL2(Z), z = x + iy, dmu = dx dy / y^2. xi(w) := pi^(-w/2) Gamma(w/2) zeta(w) (poles at w = 0, 1;
xi(w) = xi(1-w)). E(z,s) = sum over Gamma_inf\Gamma of Im(gamma z)^s; E*(z,s) = xi(2s) E(z,s) (Zagier's (4)).
Constant term of E: y^s + phi(s) y^(1-s), phi(s) = xi(2s-1)/xi(2s) = sqrt(pi) Gamma(s-1/2)/Gamma(s) * zeta(2s-1)/zeta(2s);
phi(s) phi(1-s) = 1, |phi(1/2+it)| = 1, the only pole of phi in Re s >= 1/2 is s = 1, residue 3/pi.
The project's Weil form: Q(f) = sum over zeros rho = 1/2 + i gamma of fhat(gamma) conj(fhat(conj gamma)),
fhat(r) = int f(x) e^(irx) dx (rh/experiments/r1_A/weil.py.txt, docstring). F_d(s) = zeta(s-d) zeta(s+d),
G_d(s) = zeta(s) L(s-d,chi_4) L(s+d,chi_4).

---
## D1. F_d is the L-function of the Eisenstein series E(., 1/2 + d). PROVED from Zagier's (14), (18) (read).
Zagier (18): Delta E(z,s) = s(s-1) E(z,s), T(n) E(z,s) = n^s sigma_(1-2s)(n) E(z,s) (his unnormalised T(n)); (14): the
n-th Fourier coefficient of E*(z,s) is 2 sqrt(y) n^(s-1/2) sigma_(1-2s)(n) K_(s-1/2)(2 pi n y) cos(2 pi n x).
With nu = s - 1/2: n^nu sigma_(-2nu)(n) = sum_{ab=n} (a/b)^nu, so sum_n n^nu sigma_(-2nu)(n) n^(-w) = zeta(w-nu) zeta(w+nu).
Hence: Hecke eigenvalues (normalised by n^(-1/2)) of E(., 1/2+d) are sum_{ab=n}(a/b)^d = n^(-d) sigma_(2d)(n), local roots
p^d, p^(-d), Laplace eigenvalue s(1-s) = 1/4 - d^2, L-function F_d. K-atlas's B147 identification is CONFIRMED.
d real in (0,1/2): complementary-series parameter at infinity and non-tempered at every p; d in iR: tempered;
d = 1/2: the constant function (residue of E at s = 1), L-function zeta(s-1/2) zeta(s+1/2).

## D2. Hecke's integral: the window variable is the geodesic. PROVED (Mellin transform of K_nu from memory).
Let E~*(z,s) = E*(z,s) minus its constant term. For Re S > 1 + |Re d|:
   xi(S+d) xi(S-d) = 2 int_0^inf E~*(iy, 1/2+d) y^(S-1/2) dy/y.
Proof: int_0^inf sqrt(y) K_nu(2 pi n y) y^(S-1/2) dy/y = (1/4)(pi n)^(-S) Gamma((S+nu)/2) Gamma((S-nu)/2); sum with D1.
So the completed F_d is the Mellin transform, along the geodesic {iy}, of the Eisenstein series of parameter 1/2 + d;
u = log y is the variable of the project's windows, and u -> -u is the element z -> -1/z of Gamma.
The same two-variable function Xi(S,d) = xi(S+d) xi(S-d) is symmetric under (S - 1/2) <-> d (functional equation).
So "tilt d" and "spectral parameter of the Eisenstein series" are one variable. Zagier's toroidal integral for the
split torus (his D a square, eq. (33)) is the case of a UNITARY character of the torus; F_d for real d is the same
integral against the non-unitary character y^d.

## D3. Maass-Selberg on the unitary axis. KNOWN (formula read in arXiv 1809.07605, eq. (MaasSelexp), and in
Lagarias-Suzuki eq. (402)); the evaluation below is PROVED from it.
For T >= 1, E^T(z,s) := E(z,s) - (y^s + phi(s) y^(1-s)) on {y > T} inside the standard fundamental domain:
   int |E^T(z,s)|^2 dmu = [T^(2 sigma-1) - |phi(s)|^2 T^(1-2 sigma)]/(2 sigma - 1) + [conj(phi(s)) T^(2it) - phi(s) T^(-2it)]/(2it).
Limit sigma -> 1/2:   || E^T(., 1/2+it) ||^2 = 2 log T - (phi'/phi)(1/2+it) + Im( conj(phi(1/2+it)) T^(2it) ) / t.
With phi'/phi(s) = 2 (xi'/xi)(2s-1) - 2 (xi'/xi)(2s) and the functional equation: -(phi'/phi)(1/2+it) = 4 Re (xi'/xi)(1+2it).
With (xi'/xi)(w) = sum_rho 1/(w-rho) - 1/w - 1/(w-1) (symmetric sum):
   || E^T(., 1/2+it) ||^2 = 2 log T + 4 sum_rho (1-beta)/((1-beta)^2 + (2t-gamma)^2) - 4/(1+4t^2) + Im(conj(phi) T^(2it))/t >= 0.
Reading. It sees zeta on Re w = 1 (w = 2s). Every zero rho = beta + i gamma contributes a POSITIVE Poisson kernel of
width 1 - beta, whatever beta in (0,1) is: the inequality is the classical positivity of Re xi'/xi on Re w = 1, i.e. the
spectral density of the Weil kernel damped by e^(-|u|/2) (notebook N35, epsilon = 1/2; SP-operator B133 (3)).
(Cross-check: the search summary of arXiv 1705.05488 quotes the same norm as 2 log T - 2 log pi + 2 Re Gamma'/Gamma(1/2+it)
+ 4 Re zeta'/zeta(1+2it), which is 2 log T + 4 Re xi'/xi(1+2it).)
For sigma != 1/2 the same formula bounds |phi(s)| on Re s > 1/2: no pole of phi there except on (1/2,1], i.e. zeta(w) != 0
for Re w > 1 (and, at the edge, on Re w = 1: Zagier sec. 1, read: if zeta(1+it) = 0 then E(z, 1/2 + it/2) would be a
non-zero function of rapid decay with constant term 0 and norm 0).
Why it does not reach Re w = 1/2: (i) the unitary axis of L^2(Gamma\H) is Re s = 1/2, and s enters phi only as
xi(2s-1)/xi(2s): arguments 2s and 2s-1 on Re = 1 and Re = 0; (ii) at Zagier's points s = rho the norm of E^T(., rho)
contains xi and xi' at 2 rho and 2 rho - 1 only; zeta(rho) = 0 does not enter any term of the formula.

## D4. Norm of a pseudo-Eisenstein series: totients enter below height 1. PROVED (unfolding) + COMPUTED (two routes).
For psi on (0, inf) (bounded, compact support in (0,inf)), E_psi(z) := sum over Gamma_inf\Gamma of psi(Im gamma z).
(a) Constant term: a_0(E_psi)(y) = psi(y) + sum_{c>=1} phi_E(c) int_R psi( y/(c^2 (x^2+y^2)) ) dx, phi_E = Euler's totient.
    Proof: Gamma_inf\Gamma <-> coprime pairs (c,d) up to sign; c = 0 gives psi(y); for c >= 1 sum over d in Z coprime to c
    and integrate x over [0,1]: phi_E(c) copies of the integral over R.
(b) Unfolding: <E_psi1, E_psi2> = int_0^inf psi1(y) conj(a_0(E_psi2)(y)) dy/y^2.
(c) Put psi(y) = y^(1/2) f(log y), v = log y. Then, with kappa(w) = (1 - e^(-w))^(-1/2) for w > 0 and 0 for w <= 0,
       || E_psi ||^2 = int |f|^2 dv + sum_{c>=1} (phi_E(c)/c) int int f(v) conj(f(v')) kappa( -(v+v') - 2 log c ) dv dv'.
    A MIRROR (Hankel) form added to the identity: kernel K(v+v'), atoms at -2 log c, weights phi_E(c)/c = Dirichlet
    coefficients of zeta(2s-1)/zeta(2s) at c^(-2s) (shifted by 1/2), convolved with the archimedean kernel kappa.
(d) If supp psi is in (T, inf): the term c is non-zero only for c < 1/T. For T >= 1 NO term: psi -> E_psi is an isometry
    of L^2((T,inf), dy/y^2) into L^2(Gamma\H). c = 1 enters at T < 1, c = 2 at T < 1/2, c = 3 at T < 1/3: the arithmetic
    that enters below height 1 is the Farey / totient arithmetic of overlapping horoballs, not the primes with weight log p.
(e) Spectral form (Selberg's spectral theorem for incomplete Eisenstein series, from memory; constants checked numerically):
       || E_psi ||^2 = (3/pi) |int f(v) e^(-v/2) dv|^2 + (1/4 pi) int_R | fhat(-t) + phi(1/2 - it) fhat(t) |^2 dt.
    So the Gram form is  || f ||^2 + Re <f, S f> + (pole square),  S = (reflection v -> -v) composed with multiplication
    by the unimodular phi(1/2 + it): S is a unitary involution, and 1 + S >= 0 trivially. All of it lives on Re s = 1/2,
    i.e. zeta on Re w = 1, for EVERY T > 0. Lowering T brings in more totients and never moves the line.
(f) COMPUTED (gram_check.py.txt, gram_check.log; mpmath 25 digits; bump f on [-1.2, 0.3]; 7.7 min): geometric route
    0.286868370825 (c = 1, 2, 3 contribute), spectral route 0.286868351035 (t cut at 60), ratio 1.00000007.
    Prediction written first (PROGRESS P4): HIT.

## D5. The half-shift is Suzuki's dial at w = 1/2, and it is the scattering theory of the modular surface.
PROVED (one line): in Suzuki's notation (digest rh/library/suzuki-1606.05726.md: xi_S(s) = s(s-1) xi(s), s = 1/2 - iz,
E^{w,nu}(z) = xi_S(1/2 + w - iz)^nu, Theta = E#/E), at (w, nu) = (1/2, 1) and with 2s' = 1 - iz:
     Theta^{1/2,1}(z) = xi_S(-iz)/xi_S(1-iz) = ((s'-1)/s') * phi(s').
The factor (s'-1)/s' is a Blaschke factor of the upper half z-plane (zero at z = i, i.e. s' = 1: the constants / the pole).
Consequences (each PROVED from statements read):
(a) Lagarias-Suzuki Thm 1.2 (read): I(T,s) = -xi(2s) T^(s-1)/(s-1) + xi(2-2s) T^(-s)/s has all zeros on Re s = 1/2 for T >= 1.
    In this language: I(T,s) = 0 <=> Theta(s) = T^(2s-1) (ratio of the two terms), and |Theta| < 1 <= |T^(2s-1)| on Re s > 1/2
    when T >= 1. The input "|Theta| < 1" is their Theorem 2.1 (Polya type): F real on R, F(s) = +-F(1-s), zeros in
    |Re s - 1/2| < a, then |F(s+c)/F(s-c)| > 1 on Re s > 1/2 for every c >= a. For xi the known a is 1/2 (in the variable
    w = 2s: unit shift). This is atlas F17's half-shift wall as a published theorem with its exact hypothesis.
(b) It FAILS for T < 1 (Lagarias-Suzuki: "The hypothesis T >= 1 cannot be relaxed ... fails to hold for all values
    0 < T < 1"; Hejhal 1990 for the constant term: zeros off the line "with arbitrarily large real part"). COMPUTED
    (hejhal_check.py.txt, mpmath 30 digits, not certified): a_0(y,s) = xi(2s) y^s + xi(2s-1) y^(1-s) has the zero
    s = 4.70686244206 + 18.1261394951 i at y = 0.9 (predicted real part 1/2 + log(t/pi)/(4 log(1/y)) = 4.659: HIT),
    four zeros with real part 1.259 .. 1.458, 15 <= Im s <= 30, at y = 0.5, and none found at y = 1.1.
(c) By D4, 1 + (compressed Hankel operator of phi) is the Gram operator of pseudo-Eisenstein series supported above
    height T; ||K[t]|| < 1 at w = 1/2 (Suzuki Prop. 4.4) is the unitarity of the scattering operator.
    IDENTIFICATION (HEURISTIC until the normalisations x <-> 2 log y, the Blaschke factor and Suzuki's G are matched):
    Suzuki's K^{1/2,1}[t] = the off-diagonal part of the constant-term operator on pseudo-Eisenstein series supported in
    y > e^(-t/2)-ish, with atoms q(n) n^(-1/2) = phi_E(n)/n; his Hamiltonian gamma_{1/2}(t) = (det(1+K)/det(1-K))^2 is
    then an unconditional function determined by totients.
(d) Structural reason for the shift 1 (FROM MEMORY: Langlands 1971, Gindikin-Karpelevich; confirmed in ONE case by the
    formula read in Lapid-Rallis: M(s) v_0 = L(s,pi)/L(s+1,pi) * L(2s,pi,wedge^2)/L(2s+1,pi,wedge^2) v_0): every constant
    term of every Eisenstein series is a product of ratios L(z)/L(z+1). On the unitary axis this is a unimodular ratio
    of values on Re = 0 and Re = 1. A scattering function xi(w)/xi(w+k) with 0 < k < 1 (atlas F17 "needs") is not produced
    by any Eisenstein series in my toolkit.

## D6. Where norms DO see the critical line: only at real points. PROVED (structural) + KNOWN (read).
(a) KNOWN (Lapid-Rallis, Annals 157 (2003), introduction read): for pi symplectic cuspidal on GL_n, the Eisenstein
    series on Sp_n induced from pi has a pole at s = 1/2 iff L(1/2,pi) != 0; the residue is square-integrable; "the
    inner product of two such residues is given by the residue of the intertwining operator at s = 1/2. Thus [it] is a
    positive semi-definite operator", whence L(1/2,pi) >= 0. Their words: GRH would give it; "the latter is not known
    even in the case of quadratic Dirichlet characters"; "our method is not applicable to that case".
(b) PROVED: a residue of an Eisenstein series that is square-integrable is an L^2 eigenfunction of a self-adjoint
    operator, so its parameter gives a REAL eigenvalue; in rank one, s0(1-s0) real with Re s0 > 1/2 forces s0 real.
    So norms of residues see L-functions at real points only; inside the critical strip the centre is the only one
    reached (through the pole of the wedge^2 factor at 2s = 1).
(c) Run on the controls: the completed F_d at 1/2 is xi(1/2+d)^2 >= 0 and its quadratic twists are
    Lambda(1/2+d,chi) Lambda(1/2-d,chi) = Lambda(1/2+d,chi)^2 >= 0 for every real d. A central-value positivity cannot
    see a real tilt: PROVED (functional equation).

## D7. Zagier's representation and the Weil form. Zagier 1981 read whole (OCR). Derivation: mine.
What Zagier proves (his Theorem, sec. 3, and sec. 4): for D in Z, D = 0 or 1 mod 4, and Phi even, rapidly decaying
(integral 0 if D is a square), L_D Phi(z) := (1/2) sum over integral binary quadratic forms [a,b,c] of discriminant D of
Phi((a|z|^2 + bx + c)/y) is Gamma-invariant; calE := { F : F = O(y^(1-eps)), F orthogonal to all L_D Phi } contains
d^m/ds^m E*(z,s) at s = rho for m < (order of the zero rho of zeta(s)); it is stable under Delta and the Hecke operators
(his (36): T(p) L_D = L_{Dp^2} alpha_p + (D/p) L_D + p L_{D/p^2} beta_p); calV := the corresponding space on Gamma\G contains
the principal series P_rho for every zero rho. "P_s is unitarizable iff s in (0,1) or Re s = 1/2. Thus the existence of
a unitary structure on V would imply the Riemann hypothesis" and also simple zeros; "there cannot be any generally
applicable way" (other fields have multiple zeros); if the zeros are simple and on the line and calE is spanned by the
v_rho, V is unitarizable "in infinitely many ways ... a natural choice seems to be ||v_rho|| = |zeta*(2 rho)|".
Note: his zeros enter at s = rho (toroidal periods give zeta(s) L(s,chi_D) "at the same argument"), not at s = rho/2
(the poles of phi, the resonances of Lax-Phillips).

(a) PROVED. Zero-side identity. For F on Gamma\H smooth of rapid decay, C(F;y) its constant term,
    f_F(x) := e^(-x/2) C(F; e^x). Zagier's (10): I(F;s) = int F(z) E(z,s) dmu = int_0^inf C(F;y) y^(s-2) dy. So
    fhat_F(r) = I(F; 1/2 + ir), and the zero side of the project's form is
        Z(F) := sum_rho I(F;rho) conj(I(F; 1 - conj rho)) = sum_rho <F, E*(., rho)> conj<F, E*(., 1 - conj rho)> / (xi(2 rho) xi(2 - 2 rho)),
    = sum_rho |<F, E*(., rho)>|^2 / |xi(2 rho)|^2 under RH. This is the hermitian form on test functions DUAL to the
    norm ||v_rho|| = |xi(2 rho)| on calE: Zagier's "natural choice" is exactly the Weil normalisation. So:
    Weil's form restricted to constant-term profiles = the invariant hermitian form on the dual of Zagier's space, with
    his natural norm; it exists unconditionally as a hermitian form (it pairs rho with 1 - conj rho) and is >= 0 iff RH.
    Difference: Weil positivity is a positive SEMI-definite form on test functions and allows multiple zeros;
    unitarity of V itself forces simple zeros (Jordan blocks). Zagier's obstruction does not apply to the dual form.
(b) PROVED. The automorphic test functions are OUTSIDE the project's window class, and outside the class of the
    explicit formula. I(F;s) has poles at s = rho'/2 (poles of E(z,s): zeros of xi(2s)), i.e. fhat_F has poles at
    Im r = (1 - beta')/2 in (0,1/2), inside the strip |Im r| <= 1/2 where the explicit formula needs analyticity;
    f_F(x) decays only like e^(-(1-Theta)|x|/2) as x -> -inf (Zagier sec. 1: C(F;y) = kappa + O(y^(1 - Theta/2 - eps))).
    So Z(F) is NOT equal to the prime-side expression of weil.py.txt; the difference is the sum of the residues of
    (xi'/xi)(s) I(F;s) conj(I(F; 1 - conj s)) at the points rho'/2 and 1 - rho'/2.
(c) PROVED (zero count; the argument of Suzuki's Prop. 4.4 at w = 1/2). No non-zero F of rapid decay has f_F of compact
    support. Proof: G(s) := xi(2s) I(F;s) satisfies G(s) = G(1-s) (Zagier (13)). If f_F has support in [-L, L] then
    I(F;.) is entire of exponential type L, so G vanishes at the zeros rho'/2 of xi(2s), hence at 1 - rho'/2, where
    xi(2s) = xi(2 - rho') != 0; so I(F;.) vanishes at all points 1 - rho'/2: about (T/pi) log T zeros up to height T,
    against O(T) for exponential type. Hence I(F;.) = 0.
    So {constant-term profiles} and {window functions} meet only in 0: the same kind of disjointness as "comb versus L^2"
    for idea 21.
(d) PROVED. The bridge is the scattering involution. For F = E_psi, psi(y) = y^(1/2) f(log y), unfolding gives
    I(E_psi; s) = psi^(s) + phi(s) psi^(1-s) with psi^(1/2 + ir) = fhat(r); so at a zero rho = 1/2 + i gamma:
        I(E_psi; rho) = fhat(gamma) + phi(rho) fhat(-gamma),
    i.e. f_F = (1 + S) f with S = (reflection) composed with (multiplication by phi), and for real f, under RH
    (|phi(rho)| = 1, zeros symmetric under gamma -> -gamma):
        Z(E_psi) = sum_rho |fhat(gamma) + phi(rho) fhat(-gamma)|^2 = 2 [ T_W(f) + Re H_W^phi(f) ],
        T_W(f) = sum_rho |fhat(gamma)|^2 (the Weil form of f),   H_W^phi(f) = sum_rho phi(rho) fhat(-gamma)^2,
        phi(rho) = xi(2 rho - 1)/xi(2 rho): the board's mirror sum H_W(f) = sum_rho fhat(gamma)^2 twisted by phi(rho).
    Without RH the same expansion holds with fhat(gamma) conj fhat(conj gamma) in place of the squares of moduli.
    Compare the board's B25/B60: Q(f +- Rf) = 2 [T_W +- H_W](f) with R the reflection x -> -x. So:
    the project's parity blocks symmetrise by R; automorphy symmetrises by S = R composed with the multiplier phi.
    Both are unitary involutions of L^2; the window [-L, L] is R-invariant and not S-invariant.
    Under RH |phi(rho)| = 1 and |H_W^phi| <= T_W trivially; an off-line zero has |phi(rho)| != 1.
(e) KNOWN (read): what has been done with Zagier's programme. Cornelissen-Lorscheid, J. Number Theory 129 (2009)
    (arXiv 0710.2994, read whole): for the three elliptic function fields of class number one (q = 2, 3, 4) the toroidal
    condition for ONE torus plus repeated application of ONE Hecke operator Phi_inf confines unramified toroidal forms to
    a (q+2)-dimensional Phi_inf-stable space with eigenvalues 0, +-q; a toroidal Eisenstein series has eigenvalue
    q^s + q^(1-s) with zeta(s) = 0; hence Re s = 1/2: "an automorphic proof" of RH for those three curves, "without
    actually computing zeta". The mechanism is a DIMENSION COUNT WITH AN EXACT RECURSION (apply the Hecke operator to the
    toroidal condition), not a norm. Residues (the constants, eigenvalue q + 1: the function-field F_{1/2}) are never
    toroidal. Lorscheid (arXiv 1012.3223, abstract, introduction, sec. on temperedness read): Cor.: if at one place x
    every Phi_x-eigenvalue on unramified toroidal forms lies in [-2 sqrt(q_x), 2 sqrt(q_x)] then RH for F; Thm: every
    irreducible subquotient of the toroidal space is tempered, PROVED BY USING Hasse-Weil and Drinfeld (no independent
    proof); for other elliptic function fields "by direct calculations it could only be shown that the irreducible
    subrepresentations are unitarizable". Cornelissen-Lorscheid (arXiv 0906.5284, abstract and introduction read):
    for number fields the toroidal space = derivatives of Eisenstein series at zeros of L_F(omega, s) + cusp forms with
    L(pi,1/2) = 0; no toroidal residues; the temperedness programme "seems for now an elusive programme".
(f) Number-field form of Lorscheid's corollary (PROVED, two lines, from Zagier (18)): p^(-1/2) T(p) acts on E(., rho) by
    p^(rho - 1/2) + p^(1/2 - rho), which is real and in [-2,2] iff Re rho = 1/2 (rho non-real). So RH <=> for one prime p
    the normalised Hecke operator has all its eigenvalues on the toroidal Eisenstein series in [-2, 2]: RH is
    "Ramanujan at p for toroidal Eisenstein series". The zero rho of zeta is a Satake parameter p^(rho-1/2) of E(., rho)
    exactly as the tilt d is the Satake parameter p^d of E(., 1/2+d) (D1): in this picture B11's condition on a control
    and RH for zeta are the SAME kind of statement about two different automorphic forms. Reformulation; no new input.

## D8. The quadratic mechanism (Rankin-Selberg + Landau), its hypotheses, and what F_d, G_d violate.
KNOWN (read: Milne arXiv 1509.00797, sec. "Landau, Rankin, and the Ramanujan conjecture"; Blomer-Brumley arXiv
1003.0559, introduction):
- Landau: a Dirichlet series with coefficients >= 0 has a singularity at the real point of its abscissa of absolute
  convergence sigma_0; if it is an Euler product prod_p prod_j (1 - a_{p,j} p^(-s))^(-1) then |a_{p,j}| <= p^(sigma_0).
- Rankin 1939: sum |c(n)|^2 n^(-s) continues with singularities only at s = k, k-1 (weight 2k); hence |c(n)| = O(n^(k-1/5)).
- Langlands 1970: if L(s, sigma, pi) is analytic for Re s > 1 for ALL sigma, take sigma = rho (x) rho-bar: log D has
  coefficients |trace rho^n(t_p)|^2 >= 0, Landau gives a bound, and the powers m lambda give |lambda(t_p)|^(2m) <= p for all m,
  so |lambda(t_p)| = 1.
- Jacquet-Shalika: H_n(1/2) (every cuspidal pi on GL_n has local parameters |sigma| <= 1/2, stated as "showed", proof not
  read); Luo-Rudnick-Sarnak 1/2 - 1/(n^2+1); Kim-Sarnak 7/64 for GL_2 over Q; "the Rankin-Selberg L-function is known to
  converge absolutely on Re s > 1 for cusp forms on GL_n"; "Prior to [Duke-Iwaniec] one needed an L-series with positive
  coefficients ... This in turn required the use of the Rankin-Selberg L-function".
Hypotheses of the mechanism, exactly: (H1) Euler product (then log of the Rankin-Selberg square has coefficients
|s_F(p^k)|^2/k >= 0: AUTOMATIC, it is not an extra hypothesis); (H2) the Rankin-Selberg square is holomorphic on the real
axis to the right of 1 (for cusp forms: because the unfolded integral int |f|^2 E(z,s) dmu converges wherever E(z,s) is
holomorphic; this is where square-integrability of the automorphic form is used); (H3) Landau.
PROVED (computation): F_d x F_d-bar = zeta(s)^2 zeta(s-2d) zeta(s+2d) (times a factor holomorphic and non-zero near
Re s >= 1), G_d x G_d contains zeta(s-2d): rightmost pole at 1 + 2d. Both satisfy (H1) and VIOLATE (H2):
sum_{n<=x} |a_n|^2 grows like x^(1+2d). On the automorphic side: E(., 1/2+d) is not square-integrable (growth y^(1/2+d)).
Note: both controls SATISFY the conclusion of the one-step bound (|alpha_p| = p^d < p^(1/2)); they are excluded by the
hypothesis, or by the amplified conclusion (all tensor powers: pole of the k-th power at 1 + kd-type points, S1-mirror B178).
Selberg-class bookkeeping (axioms read in Conrey-Ghosh math/9204217, sec. 1): (1) (s-1)^m F entire of finite order;
(2) a_n << n^eps; (3) functional equation with Q^s prod Gamma(w_i s + mu_i), w_i > 0, Re mu_i >= 0; (4) log F = sum b_n n^(-s),
b_n supported on prime powers, b_n << n^theta, theta < 1/2.
   F_d: violates (1) (poles at 1+d, 1-d), (2) (a_n = n^(-d) sigma_(2d)(n) >= n^d), (3) (Gamma((s-d)/2): mu = -d/2 < 0);
        satisfies (4) with theta = d < 1/2.
   G_d: violates (2) only (a_p = 1 + chi_4(p)(p^d + p^(-d))); satisfies (1) (one simple pole at 1), (3) (mu = (1 -+ d)/2 > 0),
        (4) with theta = d. So G_d shows the Ramanujan axiom is independent of the other three.
   Conrey-Ghosh Remark (3) (read): Re mu_i >= 0 is imposed because a Maass cusp form with an exceptional eigenvalue
   would satisfy Ramanujan at the primes, have Re mu < 0, and violate RH (its L-function vanishes at a pole of the Gamma
   factor inside the strip). That is an archimedean cousin of the tilt; no such form is known for congruence groups.

## D9. The Hecke-Gram matrix: an Euler product is a rank-one (extreme) point of a positive cone. PROVED (3 lines).
Let H be a commutative algebra of self-adjoint operators T_n on a Hilbert space (Hecke operators on cusp forms, with
T'_m T'_n = sum_{d|(m,n)} T'_{mn/d^2} after normalisation, level 1). For f != 0 put G_f = [ <T'_m f, T'_n f> ]_{m,n}.
(i) G_f is positive semidefinite (a Gram matrix). (ii) f is a simultaneous eigenvector <=> rank G_f = 1 <=> equality in
Cauchy-Schwarz <T f, f>^2 = <T^2 f, f><f,f> for every T in H. Proof of (ii): ||T f - l(T) f||^2 = (l(T^2) - l(T)^2)||f||^2
with l(T) = <Tf,f>/<f,f>. (iii) In coefficients: for f = sum_i c_i f_i (normalised eigenforms, real eigenvalues
lambda_i(n)), the "Hecke-Hankel" matrix [ sum_{d|(m,n)} a_f(mn/d^2) ] equals sum_i c_i lambda_i(m) lambda_i(n): it is
positive semidefinite iff all c_i >= 0 and has rank one iff f is one eigenform. For degree one (GL_1) the Hecke algebra is
the semigroup algebra of (N, x) and this matrix is SP-reflection's Helson matrix [a(mn)].
So "has an Euler product" is NOT an inequality: it is the extreme-ray / rank-one condition inside a cone defined by an
inequality. Examples: theta^6 = 16 [zeta(s-2) L(s,chi_4)] - 4 [zeta(s) L(s-2,chi_4)] (from memory): signature (1,1);
Davenport-Heilbronn = c L(chi) + conj(c) L(chi-bar): [a(mn)] has rank 2, signature (1,1).

## D10. The theta dial: what singles out the special points. See PROOF_dial.md for statements and proofs.
(a) PROVED (polynomial identity; machine-checked at 16 rational points, exact arithmetic):
        2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8).
    So r_n(m)/(2n) can be multiplicative only for n in {1, 2, 4, 8}.
(b) PROVED: r_n(2) = 2n(n-1) < 0 on (0,1); r_n(3) = (4/3)n(n-1)(n-2) < 0 on (1,2);
    r_n(7) = n(n-1)(n-2)(n-3)[8/3 + (8/315)(n-4)(n-5)(n-6)] < 0 on (2,3).
    COMPUTED: negative coefficients at n = 3.1, 3.5, 3.9; none among the first 1000 for n = 4.5, 5.5, 6.5, 7.5.
(c) With Bondarenko-Radchenko-Seip Prop. 3.1 (read in the TeX source): for 0 < n <= 3 a non-zero 2-periodic holomorphic
    f = sum_{m>=0} a_m e^(pi i m tau) with a_m >= 0 of polynomial growth and f(-1/tau) = (tau/i)^(n/2) f(tau) exists
    iff n in {1, 2, 3}.
(d) KNOWN (read, arXiv 2011.07796 Lemma "thetaeigenform"): Theta^3, Theta^5, Theta^7 are eigenforms of T(p^2), p odd,
    eigenvalues 1 + p, 1 + p^3, 1 + p^5 (the lemma's statement prints 1 + p^kappa; its proof gives these).
(e) KNOWN (read, Long's survey arXiv 0707.3315): Berger's theorem: for a finite-index subgroup Gamma with congruence
    closure Gamma^0 and p not dividing the level, T_p f = T_p^(Gamma^0)(Tr f): Hecke operators vanish on forms that are
    genuinely non-congruence.
(f) FROM MEMORY, UNREAD: for real non-half-integral weight the automorphy factor lives on a cover of SL2(R) of degree > 2;
    Hecke operators need the cover to split compatibly over the commensurator (an adelic cover split over SL2(Q));
    over Q such covers exist only of degree 2 (Kubota, Moore, Matsumoto: the metaplectic kernel is the group of roots
    of unity of the field). Wohlfahrt 1957 (Math. Nachr. 16) is the classical reference on Hecke operators for real
    weight: citation confirmed by search, statement NOT read.

## D11. Corrections to sentences in the record that concern my toolkit.
(1) Roster: "on the theta dial, mirror positivity holds exactly where Hecke operators exist". As a general statement
    this is FALSE: mirror positivity at p <=> local roots real with positive multiplicities (S1-mirror Cor. 3 /
    Hermite-Jacobi); a Hecke eigen CUSP form of weight >= 2 has complex conjugate roots by Deligne, so it is mirror
    NEGATIVE (L(Delta): -3.62 on the board). True statement: among Hecke eigenforms, mirror positive <=> Eisenstein type
    with real characters and no numerator factor (roots real); together with Ramanujan this leaves roots +-1 only
    (S1-mirror B90). On the dial it is true only for n <= 2 (n = 4, 8 have a ramified numerator at 2: one negative square).
(2) Atlas F17 "Classical fact (from memory): sum sigma_2d(n) n^(-d-s) = zeta(s-d) zeta(s+d), the L-function of the
    Eisenstein series of spectral parameter 1/2 + d": CONFIRMED (D1).
(3) Idea 13 / F20: "Hecke operators exist only at special points of the dial" needs three levels: none for non-integer n
    (D10 (f), unread); T(p^2) only for odd n; full Euler product only for n in {1,2,4,8} (D10 (a), proved).
