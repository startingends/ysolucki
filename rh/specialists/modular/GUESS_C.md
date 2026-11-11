# GUESS_C: an arithmetic pairing on Eisenstein / boundary cycles of the modular tower vs Weil's form (SP-modular, 2026-11-11)

Construction first. Nothing here proves RH. Labels: PROVED / KNOWN (read) / FROM MEMORY / COMPUTED / HEURISTIC / RISK.
READ: rh/GUESSES.md (incl. N117 as recorded there), my GUESS_A.md, MISSING_SPACE_CHECK.md, LIBRARY M1-M23 (Maass-Selberg, Zagier 1981:
read in session 1). One computation, prediction P13 in PROGRESS.md written first (HIT, all five items).
Notation: E(z, s) = sum over Gamma_inf\SL_2(Z) of Im(gamma z)^s; constant term y^s + c(s) y^(1-s), c(s) = xi(2s-1)/xi(2s), with
xi(s) = s(s-1)/2 pi^(-s/2) Gamma(s/2) zeta(s). Write w = 2s, so the unitary axis Re s = 1/2 is Re w = 1.

## 1. The setting
 - Level 1: X(1)/Z is P^1_j (genus 0). The Hodge bundle omega carries the Petersson metric ||f||^2 = |f|^2 (4 pi y)^k, log-singular at the cusp.
   Arithmetic intersection with such metrics is Burgos-Kramer-Kuehn's (pre-log-log Green objects; FROM MEMORY). The cusp S_inf is a
   section Spec Z -> X. The Kronecker limit formula (FROM MEMORY), E(z, s) = (3/pi)/(s-1) + (6/pi)(gamma - log 2 - log(sqrt y |eta(z)|^2)) + O(s-1),
   makes -log(y^6 |Delta|) (= -log ||Delta||_Pet up to constants) the Green function of the cusp class.
 - Level N: X_0(N)/Z with J_0(N) (genus >= 1 for N = 11, ...), cusps (0), (inf), and the Arakelov Green function (Abbes-Ullmo, FROM MEMORY).
 - The family indexed by a test function h on the spectral line: Psi_h := (1/4 pi) int h(t) E(., 1/2 + it) dt, a pseudo-Eisenstein series
   (smooth, bounded on X(1); FROM MEMORY, standard spectral theory). As an arithmetic cycle it is (0, Psi_h), a purely archimedean class,
   possibly added to multiples of S_inf. A Green function of a DIVISOR needs a log singularity; E(., s) has one only in the limit
   s -> 1 (Kronecker). So the h-family consists of archimedean classes (0, Psi_h), or of truncations Lambda^T E_h ("cusp-truncated Green
   functions").

## 2. The pairing, computed
 (2a) Untruncated (Gillet-Soule pairing of archimedean classes, FROM MEMORY conventions): <(0, Psi_h), (0, Psi_k)> = (1/2) int Psi_h dd^c Psi_k
     = -(1/2) <grad Psi_h, grad Psi_k>. Spectrally this is -(1/8 pi) int (1/4 + t^2) a_h(t) conj a_k(t) dt, with a_h linear in h and in the
     scattering c on the line. It is negative semidefinite UNCONDITIONALLY, and zeta enters only through the unimodular phase c(1/2 + it).
     No Lambda-weighted prime side, no digamma.
 (2b) Truncated at height T (Maass-Selberg, KNOWN shape, read session 1): for smooth h,
        ||Lambda^T E_h||^2 = int |h(t)|^2 [ 2 log T - (c'/c)(1/2 + it) ] dt + (oscillating terms in T^(2it), -> 0)   (normalisation 1/4 pi dropped).
     COMPUTED (P13, 5 values of t, mpmath 30 digits): |c| = 1 on the line, and
        -(c'/c)(1/2 + it) = 4 Re (xi'/xi)(1 + 2it) = 4 Re [ zeta'/zeta(1 + 2it) + 1/(1 + 2it) + 1/(2it) - (1/2) log pi + (1/2) psi((1 + 2it)/2) ]
     to 5e-17, and it is positive at every t tested (0.093 ... 7.60).
     So the regularised (Zagier) part of the pairing is EXACTLY Weil's distribution W for zeta in the variable w = 2s: prime side
     -4 Re sum Lambda(n) n^(-1-2it) (smoothed against |h|^2, i.e. Lambda(n)/n times a transform of |h|^2 at log n), archimedean term digamma
     psi((1+2it)/2) - log pi, plus the pole terms. The prime side and digamma DO appear.
 (2c) But it is the wrong quadratic form (PROVED, from (2b)). The test function W is applied to is |h(t)|^2 on the EDGE line Re w = 1. In the
     multiplicative variable that is k = f * conj(f) with f-hat(1 + 2it) = h(t): Mellin k-hat(w) = f-hat(w) conj f-hat(conj w). Weil's form is
     W(f * f^#), f^#(x) = conj f(1/x)/x, Mellin f-hat(w) conj f-hat(1 - conj w). On the zeros: Eisenstein gives sum_rho f-hat(rho) conj f-hat(conj rho),
     Weil gives sum_rho f-hat(rho) conj f-hat(1 - conj rho). The L^2 (Hermitian) structure of the continuous spectrum pairs w with conj w on
     Re w = 1. It never pairs w with 1 - conj w on Re w = 1/2. Its positivity is Re xi'/xi(1 + 2it) = sum_rho (1 - beta_rho)/|1 + 2it - rho|^2 > 0,
     which is UNCONDITIONAL (every zero has Re rho < 1). That is de la Vallee Poussin's positivity, not Weil's. (Lagarias, FROM MEMORY: RH iff
     Re xi'/xi(w) > 0 for all Re w > 1/2. The Eisenstein unitary axis reaches only Re w = 1.)
     Moving the parameter off the unitary axis (Re s = sigma < 1/2, i.e. Re w = 2 sigma in (1/2, 1)) would reach Lagarias' region. There,
     though, y^(1 - s) is not L^2, the truncated norm is dominated by T^(1 - 2 sigma), and the regularised remainder has no sign. The +1 shift
     again: c(s) = xi(2s-1)/xi(2s) puts the unitary axis at Re w = 1.
 (2d) Bost-Kuehn as a specialisation (HEURISTIC, constants not trusted from memory). log ||Delta||_Pet has constant term 6 log y - 2 pi y.
     Its non-constant Fourier coefficients come from 24 sum log|1 - q^n|, with coefficient -sigma_(-1)(m) at frequency m. Zagier's regularised
     Rankin-Selberg against E(., s) then gives Gamma(s-1)(2 pi)^(1-s) zeta(s) zeta(s-1) times elementary factors: the "zeta(s) zeta(s-1)" object,
     which is the weight-2 Eisenstein series at the residual point. Its Laurent constant at the pole s = 1 of E contains zeta'(2)/zeta(2) through
     1/xi(2s). COMPUTED (P13e): zeta'/zeta(-1) = log 2 pi - (1 - gamma) - zeta'(2)/zeta(2) to working precision (30 digits), so this is Bost-Kuehn's zeta'(-1)/zeta(-1).
     So omega-hat^2 is the SAME log-derivative 2 xi'/xi(2s) that builds c'/c, evaluated at the RESIDUAL point s = 1 (w = 2) instead of on
     the line. One value, outside the strip, no quadratic form. Consistent with MISSING_SPACE_CHECK 3c.

## 3. Checks N1, N2, and does Hodge index apply to the boundary at all
 - N1: X(1) = P^1_j has Pic^0 = 0, so it FAILS N1 (GUESS_A applies: Bost-Kuehn's number is a self-intersection on a genus-0 arithmetic
   surface). X_0(N) passes N1 (J_0(N) != 0).
 - Does Hodge index see the boundary? (PROVED from Faltings-Hriljac + Manin-Drinfeld, both FROM MEMORY.) Degree-zero cuspidal divisors,
   e.g. (0) - (inf) on X_0(p), are TORSION in J_0(N). So their Neron-Tate height is 0 and Faltings-Hriljac gives an EQUALITY,
   <D^ + Phi, D^ + Phi> = 0 (Phi the vertical correction at the bad primes): a formula for the Arakelov Green function at the cusps in terms
   of log p (Abbes-Ullmo's formulas, FROM MEMORY), not an inequality. Zeta lives in the equality case. The inequality is strict only on
   the non-torsion (cuspidal-form) part, which carries the Hecke spectrum (Gross-Zagier), where zeta does not occur. Archimedean classes
   (0, Psi_h) give only the unconditional energy (2a).
 - N2, CORRECTED: the cusp section supplies a second class. Fibre F = (0, 2) (arithmetic degree) and the section S_inf satisfy F^2 = 0,
   F . S = 1: the arithmetic analogue of the two rulings of C x C. Hodge index (signature (1, *)) is negativity on the orthogonal complement
   of <F, S> and the vertical components (FROM MEMORY). So "one degree condition versus two" was too strict: the boundary gives the second.
   But the orthogonal complement is J_0(N)(Q) tensor R plus archimedean classes: the Hecke spectrum (finite rank, MISSING_SPACE sec. 7)
   plus the unconditional energy. Zeta is in neither.

## 4. Verdict, next narrowing, ratings
 FAILS for a structural reason, which I propose as NARROWING N3: wherever positivity comes from the unitary (L^2 / Hermitian) structure of
 Eisenstein series, on any group where zeta enters through a constant term zeta(z)/zeta(z+1) (here c(s) = xi(2s-1)/xi(2s)), the Hermitian
 pairing is w <-> conj w on the line where z is imaginary, i.e. Re w = 1, the edge of the strip. It reproduces Weil's DISTRIBUTION exactly
 (prime side Lambda(n)/n, digamma: computed), but composed with the involution f -> conj f instead of Weil's f -> f^#, so its positivity
 is the zero-free line Re s = 1. Arithmetic Hodge index adds nothing there: the boundary classes are torsion (equality case), and the
 inequality lives on the Hecke spectrum. The tower does not change either point, since each level's boundary is torsion.
 What would be needed instead: a Hermitian structure in which the reflection w -> 1 - conj w is the adjoint. That is MISSING_SPACE_CHECK 1c
 again ("duality = complex conjugation"), now located: on Eisenstein series, conjugation and duality differ by exactly the +1 of c(s).
 Quality 7/10: a concrete computation (P13) shows the Eisenstein pairing carries Weil's distribution, with its prime side and digamma, and
 pins the failure to one involution. Bost-Kuehn is placed as its residual-point value. Not higher: the Gillet-Soule / BKK conventions,
 Abbes-Ullmo and Manin-Drinfeld are FROM MEMORY, and (2d)'s constants are not checked.
 Toward RH 1/10: Guess C dies at the same +1 as the H-2 table and N84 (P1). Not higher: no object with the right involution.
No commits.
