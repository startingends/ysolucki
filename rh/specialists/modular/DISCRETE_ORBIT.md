# DISCRETE_ORBIT: the S = {infinity, p} setting, Hecke-equivariant truncation, and where a discrete orbit meets zeta (SP-modular, session 3)

Construction only, no computation. Nothing here proves RH. Labels: PROVED (argument here) / KNOWN (read) / FROM MEMORY / HEURISTIC / RISK.
READ: rh/NOTEBOOK.md N87, N88; my TRIANGLE.md, LOCAL_PARAMETERS.md. Setting: Gamma = SL_2(Z[1/p]) acting on X = H x T_p, T_p the
(p+1)-regular Bruhat-Tits tree. FROM MEMORY (Serre, Trees; strong approximation): Gamma acts on the vertices of T_p with two orbits by
parity, with vertex stabiliser SL_2(Z), so functions on Gamma\(H x T_p) on even vertices are functions on SL_2(Z)\H, and the tree adjacency
is the Hecke operator T_p. Adelically this is GL_2(Q)\GL_2(A)/K^S with K_l maximal for l outside S.

## 1. Question 1: is there a T_p-equivariant truncation or cuspidalisation of E(., s)? NO (two proofs), and N87's premise needs a correction
 Coordinates at the (unique) cusp: y > 0 on H, Busemann level n in Z on the tree toward the end of the Borel. S-height h = y p^n, u = log h.
 The constant term of E is a function of h alone, h^s + phi(s) h^(1-s), phi(s) = xi(2s-1)/xi(2s): the FULL xi, because K_l is maximal for
 every l not in S (PROVED: the quotient is SL_2(Z)\H). On functions of u, T_p acts as a two-term difference operator with step log p
 (f(u + log p) + p f(u - log p), up to normalisation; one neighbour up, p down, far up the cusp).
 (1a) PROVED. A multiplication operator m(u) commutes with a difference operator of step log p iff m is (log p)-periodic. A truncation needs
     m = 1 low in the cusp and m = 0 high in it; no periodic function does that. The lattice p^Z gives PERIODIC multipliers, never cutoffs.
     Equivalently: the T_p-invariant functions of the height are functions on the circle R_+/p^Z, which has no "top of the cusp".
 (1b) PROVED (given the standard fact, FROM MEMORY, that moderate-growth eigenfunctions are Eisenstein series plus cusp forms). Any
     operator Lambda commuting with T_p maps E(., s) into the T_p-eigenspace of lambda_p(s) = p^(s-1/2) + p^(1/2-s): the span of
     E(., +-s + 2 pi i k/log p), k in Z, plus cusp forms with that T_p-eigenvalue. The Eisenstein part has constant term
     y^s (sum_k c_k y^(2 pi i k/log p)) + ..., a (log p)-periodic Fourier series in log y times y^s; it vanishes only if every c_k = 0. The cusp
     part needs a cusp form with T_p-eigenvalue lambda_p(rho) = p^(beta + i gamma) + p^(-beta - i gamma). T_p is self-adjoint on cusp forms, so
     the eigenvalue is real: beta = 0, or gamma log p in pi Z (a lattice of exceptional heights for ONE prime; for two primes p, q the two
     lattices meet only at gamma = 0, since log p/log q is irrational). So an equivariant cuspidalisation of E(., rho) is zero for an
     off-line rho except on one lattice of heights, and even on the line it needs a cusp form with T_p-eigenvalue exactly 2 cos(gamma log p):
     a measure-zero coincidence. No natural Lambda.
 (1c) CORRECTION to N87 (PROVED by (1a) with p replaced by q): over F_q(t) the truncation is NOT Hecke-invariant either: T_q moves the
     level on the cusp ray by +-1, and a T_q-invariant cutoff on Z is constant. What the lattice gives there is different (FROM MEMORY):
     (i) the spectral parameter lives on a circle (q^(-s)), so Eisenstein data are rational and cohomology finite-dimensional;
     (ii) Harder: cusp forms over a function field have COMPACT support modulo the centre, because high in the cusp the unipotent quotient
     is a finite group whose non-trivial characters die, so a cuspidal function vanishes above a fixed level. The fixed bound is support,
     not invariance. In the S-arithmetic setting over Q the analogue is only decay: at tree level n only frequencies m in p^n Z survive, and
     the cusp form decays like exp(-2 pi |m| y p^n) = exp(-2 pi |m| h): decay in the S-height h, never support, because h is continuous.

## 2. Question 2: the lead's prediction, tested
 Prediction: "Sym^k at p plus truncation sees only the p-Euler factor; the zeros live in zeta^(p), whose Hecke orbits are dense."
 (2a) PARTLY BROKEN. In S = {infinity, p} the zeros ARE visible: the quotient is SL_2(Z)\H, and phi(s) is the full xi-ratio (1). The other
     primes' Hecke operators need not be respected, and their density is NOT what blocks the truncation: (1a) blocks it with one prime
     and a lattice. The real obstruction is the ARCHIMEDEAN continuum in the height: h = y p^n ranges over R_+, not over p^Z.
 (2b) PROVED (structural): if G over Q has a cusp, it has a Q-split torus, which is R-split (Q is inside R), so every cusp has a continuous
     archimedean height coordinate y in R_+, and the S-height group contains R_+ whatever S is. A lattice of heights is possible only with
     no archimedean place (function fields). For G anisotropic over Q (compact quotient) there are no cusps and no Eisenstein series.
     So over Q: a cusp forces a continuous height, and no cusp means no Eisenstein series.
 (2c) Sym^k at p: Sym^k of the Satake parameter p^(+-(rho - 1/2)) is local data; the zero condition is a GLOBAL period (TRIANGLE sec. 1), so
     Sym^k at p sees only the p-factor of P_rho. HEURISTIC agreement with the prediction on this half.
 (2d) A third option? Within automorphic forms on reductive groups over Q, NO, by (2b): the function-field mechanism (Harder's compact
     support) needs a cusp without an archimedean direction. Third options must leave reductive groups over Q (sec. 3).
 So the dichotomy becomes, in my wording: "a cusp (Eisenstein series, hence zeta) forces an archimedean continuum of heights; a lattice of
 heights forces either no archimedean place (function fields) or no cusp (zeta invisible)". It is not the dense subgroup of the log p
 that blocks the truncation (one prime already fails); it is R_+ at the infinite place.

## 3. Question 3: settings with a discrete orbit, and what fails
 NO-GO (PROVED; uniqueness of generalised Dirichlet series, FROM MEMORY as a standard fact): if Z(s) = sum a_lambda e^(-lambda s) has all its
 frequencies in a group Lambda, then so do products and quotients. zeta(s) = sum n^(-s) has frequency set {log n}, which generates a DENSE
 subgroup of R. So zeta is not a product or quotient of zeta functions (Euler products over periodic orbits, Ihara-type) of systems whose
 orbit lengths lie in a lattice c Z. Directly: such a Z has period 2 pi i/c, and zeta(s + i tau) = zeta(s) forces n^(-i tau) = 1 for all n, so
 tau = 0. Any discrete-orbit setting can see zeta only through a non-Dirichlet channel: a scattering matrix, or a period with an
 archimedean integral.
| setting | zeros of zeta visible | orbit discrete | positivity | fails |
|---|---|---|---|---|
| definite quaternion algebra split at p, Gamma acting on T_p with finite quotient (Ihara; Lubotzky-Phillips-Sarnak; FROM MEMORY) | NO: spectrum = T_p-eigenvalues of weight-2 forms (Eichler, Jacquet-Langlands); zeta enters only as the trivial representation, eigenvalue p+1 | YES (finite graph) | YES: unitarity, and Ramanujan by Deligne (RH of the Ihara zeta) | zeros: Satake parameters of cusp forms, not zeros of zeta |
| compact quotient by an indefinite quaternion order | NO in the spectrum (no Eisenstein series); periods give L(1/2, pi_K), not zeta | NO: lengths 2 log eps, dense group | YES on the spectrum (self-adjoint) | zeros and discreteness |
| SL_2(Z)\H, Selberg zeta (FROM MEMORY: non-spectral zeros at rho/2 from the scattering determinant) | YES, at rho/2 | NO: lengths 2 log eps_D generate a dense group | NO at rho/2 (non-spectral half: Re rho/2 < 1/2; RH means they sit on Re s = 1/4, which self-adjointness does not see) | discreteness and positivity |
| S = {infinity, p} (sec. 1-2) | YES (scattering) | in the tree direction only; archimedean height continuous | NO equivariant truncation (1a, 1b) | discreteness at infinity |
| Connes-Consani arithmetic site / adele class space (FROM MEMORY) | YES, through the trace formula summed over ALL primes | per orbit YES: the periodic orbit of the place p has period lattice (log p) Z; jointly dense | Weil positivity = RH, not available | each lattice is a one-prime system (no zeros, the no-go above); the zeros need all orbits |
| function field (control) | the zeros of zeta_C | YES ((log q) Z) | YES (Weil, Deligne; Harder's compact support) | nothing; the archimedean place is absent |

## 4. Answer, and what moved since session 2
Session 2: the missing ingredient is decay at the cusp, i.e. cuspidality. Session 3: a Hecke-equivariant truncation exists in no setting,
not even over a function field (1c); there the fixed bound is the compact support of cusp forms, which comes from having no archimedean
place. Over Q every cusp has a continuous archimedean height (2b), and a zeta function with lattice orbit lengths cannot be zeta (sec. 3).
So the wall is located at the infinite place: the object that would make it trivial is a "cusp without an archimedean direction" seeing
zeta's zeros, which is what Spec Z over F_1 is supposed to be. Known in spirit (Connes-Consani; Deninger); the two no-go statements (2b),
(sec. 3) are elementary but, I think, cleanly stated here for the first time on the record (novelty not searched).

## 5. Ratings
 Quality 6/10: two clean elementary no-goes (equivariant cutoffs are periodic; zeta has no lattice-frequency factorisation), a correction to
 N87, and the archimedean place as the exact location. Not higher: (1b) and the Harder and Selberg-zeta facts are FROM MEMORY.
 Toward RH 1/10: it shows the S-arithmetic route cannot work and points to F_1, a known open programme. Not higher: no new object.
No commits.
