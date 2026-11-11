# GUESS_A: Weil's form as an Arakelov pairing of torsion divisors on G_m / P^1 over Z? (SP-modular, 2026-11-11)

Construction first. Nothing here proves RH. Labels: PROVED (argument here) / KNOWN (read) / FROM MEMORY / COMPUTED / HEURISTIC / RISK.
READ: rh/GUESSES.md (whole), rh/MISSING_SPACE.md sec. 7-8, rh/REVERSE.md. One computation (prediction P12 in PROGRESS.md, written first).
Conventions (Gillet-Soule, FROM MEMORY): an arithmetic divisor on X = P^1_Z is (D, g_D) with g_D a Green function for D(C);
<(D, g_D), (E, g_E)> = (D . E)_fin + (1/2) int g_D * g_E, and for D, E meeting properly the archimedean term is
(1/2) [g_D(E(C)) + int g_E omega_E], omega = dd^c g + delta. T_n := closure of the primitive n-th roots of unity, div Phi_n.

## 1. A1: the construction, and what the pairing actually is
 (1a) The anchor extends: COMPUTED (P12, HIT): for 1 <= n < m <= 60 (1770 pairs), |Res(Phi_m, Phi_n)| = p^phi(n) if m/n is a power of a
     prime p, and 1 otherwise (Apostol's formula). So (T_m . T_n)_fin = phi(n) Lambda(m/n) when n | m, and 0 otherwise. The finite pairing of
     torsion divisors is MULTIPLICATIVE in m/n, with weight phi(n): Lambda appears as a function of the ratio. That is better than the
     anchor (n = 1 only) and is the right shape for Weil's prime side sum_k Lambda(k) int f(k lambda) g(lambda).
 (1b) The cancellation, for EVERY metric (PROVED). Any Green function for T_m has the form g_m(z) = -sum_(zeta in mu_m^*) log|z - zeta|^2 + s_m(z),
     s_m smooth. The singular part evaluated on T_n gives -2 log prod |zeta - eta| = -2 log Res(Phi_m, Phi_n) (resultant = product of
     differences, all roots on the unit circle). Hence
         <T^_m, T^_n> = (1/2) [ sum_(eta in mu_n^*) s_m(eta) + int s_n dd^c s_m-type terms ]   (m != n; terms at infinity included in s),
     and the Lambda(m/n) of (1a) cancels EXACTLY against the archimedean singular part (the product formula for the resultant). Whatever
     the metric, the pairing is a function of the smooth parts s_n only.
 (1c) Degree zero means principal (PROVED). For real weights f with sum f(n) phi(n) = 0, D(f) = sum f(n) T_n = sum f(n) div(Phi_n/(x-1)^phi(n)),
     an R-combination of principal divisors. Phi_n is primitive, so there are no vertical components. So D^(f) = div^(Phi_f) + (0, s_f) with
     s_f = sum f(n) s_n, and since principal arithmetic divisors pair to 0 with everything,
         <D^(f), D^(f)> = <(0, s_f), (0, s_f)> = (1/2) int s_f dd^c s_f = -(1/2) ||grad s_f||^2 <= 0      (FROM MEMORY sign conventions).
     ARITHMETIC HODGE INDEX ON P^1_Z IS THE NEGATIVITY OF A DIRICHLET ENERGY ON P^1(C). No prime enters it.
 (1d) The candidate Green functions and their pairings. (i) Admissible (Arakelov) Green functions for a measure mu: the regular part is
     U_mu(x) + U_mu(y) + c, which is separable, so the matrix <T^_m, T^_n> has rank <= 3 in (m, n). Not W_infinity. (ii) Rotation-invariant
     (S^1 x S^1-invariant, natural for G_m): the regular part is constant on torus pairs, so the matrix is c phi(m) phi(n), rank 1. Not
     W_infinity. (iii) G_m-translation-invariant, R(x, y) = r(x/y): the pairing is sum_k r^(k) c_m(k) c_n(k) (Ramanujan sums), diagonal in the
     additive (Q/Z) basis; it is not a function of m/n (already <T_2, T_1> != <T_4, T_2> in general: c_1 = 1, c_2(k) = (-1)^k, c_4(k) in {0, +-2}).
     Not W_infinity. (iv) Free smooth parts s_n: anything, including Weil's form, by putting the WHOLE Weil distribution (prime side
     included, since (1b) removed it from the finite part) into the s_n by hand.
 RESULT (A1): no natural Green function gives W_infinity, exactly or up to a positive multiple. A tailored one gives all of I(f, g) and is
 circular: by (1c), "<D^(f), D^(f)> <= 0" then says that I is a Gram form of the vectors s_n in the Dirichlet space, which is possible iff
 I >= 0 on degree zero, i.e. RH. The impostor admits the same tailoring (A5): nothing distinguishes it.

## 2. A2: canonical metrics, and the forced metric
 For the canonical (Zhang, max) metric the regular part vanishes on the unit circle, so <T^_m, T^_n> = 0 for m != n: torsion has height 0
 and the pairing is identically zero on these divisors (Bilu/Zhang, FROM MEMORY; here PROVED directly by (1b)). The metric is forced
 to be non-canonical, but (1b) says more than A2 predicted: the forced metric must carry the PRIME SIDE as well as W_infinity, because the
 finite intersection numbers Lambda(m/n) cancel for every metric, not only the canonical one. The anchor cannot survive into the pairing.

## 3. A3: the toric narrowing
 The narrowing is RIGHT in conclusion, but for a deeper reason than concavity of roof functions. P^1, G_m, G_m^2, P^1 x P^1 and every
 smooth projective toric variety have Pic^0 = 0 (PROVED for P^1 above; FROM MEMORY for toric). So numerically trivial classes on the
 generic fibre are principal, finite parts cancel by the product formula, and the arithmetic Hodge index reduces to an archimedean
 energy (for dimension >= 2, -int ds ^ d^c s ^ c_1(H)^(d-1) <= 0, Moriwaki / Yuan-Zhang, FROM MEMORY). Positivity there is local AT INFINITY,
 not "local at each place". The construction above does NOT escape it; no construction on a variety with trivial Picard variety can.
 NEXT NARROWING (N1): the generic fibre must have a NON-TRIVIAL Picard variety, so that degree-zero classes are not principal and the
 finite intersections survive in a Neron-Tate height (Faltings-Hriljac: <D^, D^> = -2 h_NT(D) + archimedean energy).

## 4. A4: Hodge-index hypotheses in Weil's language, and the deeper mismatch
 - deg D_Q = 0 is sum f(n) phi(n) = 0: ONE condition, with weight phi(n) ~ (6/pi^2) n, not Weil's lambda^(+-1/2). Faltings-Hriljac adds
   orthogonality to vertical fibre components (one family per bad prime), not a second pole condition. Weil's two conditions
   g^(+-i/2) = 0 are the two rulings of C x C. An arithmetic surface X -> Spec Z has ONE ruling (its fibres); the second ruling
   ("pt x Spec Z") does not exist. So A4 does NOT match: one degree condition against two.
 - The structural reason (PROVED as a dimension count, HEURISTIC as a dictionary): Hodge index on X/Z controls H^1 of the GENERIC FIBRE X_Q
   (Neron-Tate heights on Jac(X_Q), hence central values of L(Jac X_Q, s) via Gross-Zagier), not H^1 of the BASE Spec Z. Weil's proof uses
   the constant family C x C -> C, whose fibre is the curve itself. Its arithmetic analogue would need a family over Spec Z whose generic
   fibre "is" Spec Z, but Spec Z over Q is a point. The fibre's H^1 is a finite-rank motive with algebraic Frobenius, where by MISSING_SPACE
   sec. 7 (six exponentials) no zero of zeta can sit.
 - NEXT NARROWING (N2): a single arithmetic surface (or arithmetic variety of finite type over Z) cannot carry zeta's zeros in its Hodge
   index. Allowed by sec. 7: a COMPLETED infinite-rank tower of generic fibres (the modular tower, Guess C), or an infinite-dimensional
   adelic limit (Yuan-Zhang adelic line bundles over a pro-system).

## 5. Verdict and ratings
 A1 FAILS for a structural reason, in two layers. (i) On P^1 / G_m / toric X: Pic^0 = 0 plus the product formula. Lambda(m/n) is an honest
 finite intersection number (1a, computed), but it cancels against the archimedean singular part for every metric, and Hodge index
 becomes an archimedean Dirichlet energy, into which Weil's form can be put only by hand (circular, impostor-blind). (ii) On any single
 arithmetic surface: Hodge index sees the fibre's finite-rank H^1, never the base's, and has one degree condition where Weil has two.
 What survives of Guess A: Guess C's tower (infinite-rank completed fibres) is the only Arakelov setting not excluded by (i), (ii) and sec. 7.
 Exact missing computation for Guess C: an arithmetic pairing on the boundary / Eisenstein cycles of the modular tower, indexed by a test
 function on the spectral line, compared with Weil's form for zeta(2s) (Kuehn, Burgos-Kramer-Kuehn generalised arithmetic intersection
 with log-singular metrics, FROM MEMORY).
 Quality 6/10: the anchor is extended to all pairs (computed, 1770/1770) and the failure is located by proofs, not impressions. Not higher:
 the Gillet-Soule sign conventions and the toric Pic^0 / Yuan-Zhang statements are FROM MEMORY.
 Toward RH 1/10: it kills Guess A in its concrete form and passes the question to the modular tower. Not higher: no object built.
No commits.
