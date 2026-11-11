# MISSING_SPACE_CHECK: adversarial check of rh/MISSING_SPACE.md (SP-modular, 2026-11-11)

Read whole: rh/MISSING_SPACE.md; context rh/REVERSE.md, NOTEBOOK N111-N114. No computation. Nothing here proves RH.
Labels: PROVED (argument here) / KNOWN (read) / FROM MEMORY (standard, NOT re-read this session; most literature here is from memory) /
HEURISTIC / RISK. Brief: do not soften.

## 1. Section 2 (group law; Rosati = functional equation). Verdict: CORRECT WITH FIX. The design principle as worded is WRONG.
 (1a) The formulas are right (FROM MEMORY, Mumford, Abelian Varieties sec. 21): Tr(phi phi') = (2g/Theta^g)(Theta^(g-1) . phi^*Theta), and
     Rosati positivity on Q[pi] with pi' = q/pi (the Verschiebung) gives |alpha|^2 = q. On Q[pi] the Rosati involution is pi -> q/pi for
     every F_q-rational polarisation (it commutes with pi), so there it does not depend on the polarisation.
 (1b) WRONG: "the group law is what converts signed combinations into geometric maps, and that is exactly what extends (S4) to all f".
     Signed combinations of Frobenius graphs are already DIVISORS on C x C. Weil's first proof (Castelnuovo-Severi; in the Mattuck-Tate /
     Grothendieck form, Hodge index on the surface) treats them with no group law. Weil's theorem (FROM MEMORY): divisorial correspondences
     modulo degenerate ones = End(J), with transposition of correspondences = Rosati, and Castelnuovo positivity = Rosati positivity.
     The two proofs are ONE positivity in two packagings. In both, what turns a signed class into something effective is an AMPLE class
     plus Riemann-Roch: on C x C, D^2 > 0 implies that nD or -nD is effective (quadratic growth of h^0); on J it is the ampleness of Theta,
     itself proved from Riemann's theorem on W_(g-1), i.e. Riemann-Roch on C. The group law only moves the problem from "RR on the
     square" to "Theta is ample". Pull-back preserving effectivity is not special to group objects either: any morphism whose image avoids
     the support pulls an effective divisor back to an effective one. What is used is that pull-backs of ample classes are NEF.
     So the gap between (S4) and Weil positivity is "ample class + amplifier", the L3-L4 of REVERSE.md, not a group law. Section 2 rediscovers
     the missing link already named there, under a second name.
 (1c) The transcription "Rosati = f -> f-check, f-check(lambda) = f(1/lambda)/lambda" is right on the spectrum (PROVED): the Mellin
     transform of f-check at s is f-hat(1 - s), so on eigenvalues it is rho -> 1 - rho (Poincare duality). For complex f, Weil's involution
     also carries complex conjugation, f^#(lambda) = conj f(1/lambda)/lambda, giving f-hat(rho) conj f-hat(1 - conj rho). What is lost: in the
     abelian-variety case Rosati positivity is NOT the positivity of a Hilbert-Schmidt trace; it comes from a positive Riemann form
     E(x, y) on H_1 with E(phi x, y) = E(x, phi' y). Over Q, (J3) + (J5) ask for a positive Hermitian form on the "H^1" (the zeros) for which
     rho -> 1 - rho is the ADJOINT, i.e. for which duality equals complex conjugation. That is RH, stated as a Hilbert-Polya
     self-adjointness. The polarisation is extra data, and over Q it is the whole content. (J1), (J2), (J4) are cheap next to it.

## 2. Section 3 (collapse). Verdict: WRONG AS STATED; true only for homotheties.
 (2a) PROVED: if lambda acts on a group G by an endomorphism that is a SCALAR (G an R-vector space, lambda a homothety), then
     sum a_i [lambda_i] acts by the scalar sum a_i lambda_i, one character. Same for the adeles with R_+^* embedded at infinity: you get
     sum a_i lambda_i at infinity and sum a_i at the finite places, i.e. the two poles s = 1 and s = 0, no zeros. So far the file is right.
 (2b) PROVED counterexamples to "no known group": once lambda acts by a LINEAR OPERATOR rather than a scalar, End sees every character.
     (i) G = L^2(R_+^*) or a space of functions on the idele class group, lambda acting by translation: Z[R_+^*] -> End is the regular
     representation, with all characters lambda^(it) (or lambda^s on weighted spaces) as joint eigenvalues. This is what Connes uses.
     (ii) The big Witt vectors W(C) with the Frobenius operators F_n (FROM MEMORY: W(A) tensor Q = A^N by the ghost map, F_n acting by
     (w_m) -> (w_(nm))). The element with ghost components w_m = m^(-s) is a joint eigenvector, F_n w = n^(-s) w, so sum a_n F_n has
     eigenvalue sum a_n n^(-s): every Dirichlet polynomial, every s in C. Z[N^x] -> End(W) is injective. This is Borger's F_1
     (Lambda-rings as descent data to F_1; FROM MEMORY, Borger 2009).
     (iii) Not counterexamples: Lubin-Tate and formal groups over Z_p (End = O_K, one prime); the solenoid A/Q (End = Q); the dual of Q_+^*,
     i.e. the torus T^infinity (huge End, but no functional equation: N88). Bost-Connes (FROM MEMORY): N^x acts by endomorphisms and zeta is
     the partition function at beta > 1; KMS states, never zeros.
 (2c) The corrected obstruction: groups whose End sees every character EXIST. They see too much (all s, not the zeros), and they select the
     zeros only through the kernel of the dilation-sum operator E = sum_n F_n, whose eigenvalue at m^(-s) is zeta(s) (PROVED formally,
     Re s > 1; the continuation is the problem). That is Nyman-Beurling / Connes' map E again, i.e. REVERSE R5. And they carry no
     archimedean place, so no polarisation (J3), (J5). Also (PROVED): Connes' adele class space Q^*\A is a quotient of the additive group by a
     multiplicative action, so it is NOT a group. The scaling action and the group law separate exactly where the zeros appear.

## 3. Section 4 (Arakelov; GKZ; Faltings-Hriljac). Verdict: CORRECT WITH FIX.
 (3a) Faltings-Hriljac (FROM MEMORY): on an arithmetic surface, Neron-Tate height = minus the Arakelov pairing of degree-zero divisors made
     orthogonal to the fibre components, so arithmetic Hodge index on such classes is POSITIVITY OF THE NEron-TATE HEIGHT. That is again
     an ampleness statement (Theta on J), the same mechanism as (1b). Gross-Zagier / GKZ (FROM MEMORY): heights of Heegner points are
     coefficients of a weight-2 form (a Jacobi form in GKZ), and on f-isotypic parts h(y_f) = c L'(f, 1) L(f, chi_D, 1), so positivity gives
     L'(f,1) L(f,chi_D,1) >= 0. Indexed by Hecke eigenforms f, as the file says.
 (3b) FIX to "zeta enters only through a torsion Eisenstein part of height 0": the cuspidal divisor classes are torsion (Manin-Drinfeld,
     FROM MEMORY), so zeta has no isotypic height. But zeta does enter the CONSTANTS of arithmetic intersection: Green functions are built
     from E(., s), whose constant term carries xi(2s-1)/xi(2s), and the self-intersection of the Hodge bundle carries zeta'(-1)/zeta(-1). It
     never enters as a quadratic form in a test function.
 (3c) THE MOST IMPORTANT QUESTION: where does an arithmetic intersection number produce zeta'/zeta? Known instances, all FROM MEMORY,
     closest first:
   1. Bost and Kuehn: the arithmetic self-intersection of the metrised Hodge bundle omega on the modular curve of level 1 (the stack
      M_(1,1) over Z) is an explicit multiple of zeta(-1)(2 zeta'(-1)/zeta(-1) + c), c an explicit rational constant (normalisation not
      trusted from memory). This is the closest instance for zeta ITSELF: a genuine Arakelov intersection number on an arithmetic
      surface equal to zeta'/zeta at ONE point. RISK: I do not trust the constant from memory; the dependence on zeta'(-1)/zeta(-1) I do.
   2. Gillet-Soule arithmetic Riemann-Roch: the R-genus has coefficients 2 zeta'(-m)/zeta(-m) + harmonic numbers, universal for every
      arithmetic variety (Bismut-Lebeau). zeta'/zeta at negative integers, built into arithmetic RR itself.
   3. Chowla-Selberg / Colmez (averaged Colmez proved by Andreatta-Goren-Howard-Madapusi Pera and Yuan-Zhang): Faltings heights of CM abelian
      varieties are L'(0, chi)/L(0, chi) plus explicit terms: Artin / Dirichlet log-derivatives at s = 0.
   4. Kudla-Rapoport-Yang: arithmetic degrees of special cycles on Shimura and modular curves are Fourier coefficients of the derivative
      of an incoherent Eisenstein series; the coefficients involve L'/L(s, chi_t) at special points.
   5. For the explicit formula AS a trace formula, not an intersection: Connes-Consani's semilocal trace formula (proved) and Deninger's
      conjectural Lefschetz formula. Arakelov Riemann-Roch on Spec O_K (van der Geer-Schoof: h^0(D) = log sum_x exp(-pi ||x||_D^2), RR =
      Poisson) gives zeta_K(s) as an integral over the Arakelov class group (Tate's thesis), but on a CURVE: no square, no Hodge index.
 So: no known arithmetic surface has an intersection pairing that yields Weil's explicit formula for zeta as a quadratic form in a test
 function. Every known instance gives zeta'/zeta (or L'/L) at isolated special points (s = -1, -m, 0), where Hodge index has nothing to
 say about zeros. The closest precise instance is Bost-Kuehn's omega-hat^2 on M_(1,1) (item 1).

## 4. Verdicts and candidate object
 Sec. 1: not checked in detail (the session's planks); consistent with N111-N114. Sec. 2: CORRECT WITH FIX (formulas right; the principle
 should be "ample class + Riemann-Roch amplifier", with the group law as one equivalent packaging; (J3) + (J5) = RH as self-adjointness).
 Sec. 3: WRONG AS STATED (collapse only for homotheties; Witt vectors and function spaces see every character). Sec. 4: CORRECT WITH FIX
 (zeta does enter the constants: Green functions, omega-hat^2, the arithmetic RR R-genus). Sec. 5's one-sentence specification stands
 once "group law" is read as "ample class with an amplifier".
 Candidate, partial: three objects each carry two of the three ingredients. (a) Big Witt vectors / Lambda-rings (Borger's F_1): a group,
 with End seeing every Dirichlet character n -> n^(-s), and the zeros only as the formal kernel of sum F_n; no archimedean place, no
 polarisation. (b) Connes' adele class space: the zeros as spectrum and the scaling flow, but no group law, and positivity is RH.
 (c) Jacobians of modular curves (or their tower) with Arakelov metrics: group law, polarisation, Hodge index (Faltings-Hriljac), Hecke
 endomorphisms; but End sees the Hecke spectrum, not zeros, and zeta enters only through constants (Bost-Kuehn). No object has all three.
 The nearest gluing would be an archimedean (Arakelov) completion of the Witt-vector picture: a Lambda-ring object with a metrised theta
 divisor at infinity. I know of no such construction (novelty not searched).

## 5. Ratings
 Quality 6/10: two of the file's claims are corrected with explicit counterexamples (Witt vectors; C x C without the group law), and the
 closest Arakelov instance is named. Not higher: almost all literature here is FROM MEMORY (Bost-Kuehn's constant is not trusted), nothing
 re-read, nothing searched. Toward RH 1/10: the check shows the specification's new ingredient (the group law) is not new: it is the ample
 class of L3-L4. No object is closer. Not higher: no construction.
No commits.
