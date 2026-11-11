# SHORT_FAMILY: the mean square S(H, D) when the family is not longer than the sum (SP-modular, 2026-11-11)

Common object of rule 13 (b); SP-operator's answer NOT read. Nothing here proves RH or is claimed to lead to it.
Labels: PROVED (argument here, from statements read) / KNOWN (with what I read) / FROM MEMORY / CONJECTURE / RISK.
READ for this file: rh/NOTEBOOK.md N49, N53; digests openai-qrh-11-12.md (whole, session 1) and openai-qrh-7-8.md (sections
1-3); in the 11/12 paper itself (rh/library/src/qrh-short/6.txt, pdftotext of the PDF): section 2 (outline, lines 161-640),
Proposition 4.5 and the start of its proof (lines 880-935), Proposition 5.1 (1091-1104), Proposition 5.4, the proof of
Proposition 5.1 and section 5.6 (1270-1362). Sections 6, 7 (the proofs of the two inputs) NOT read. One web search
(summaries): Kuznetsov formulas over Q(omega) (Kodama 2004; Bruggeman-Motohashi; Livne-Patterson on cubic exponential
sums) exist; none read. No numerics.

Notation (paper's): A_u(D) = sum_n mu(n) nu(n) chi_n(u) W(N(n)/D), chi_n(u) = (u/n)_6; S(H,D) = sum_{0<N(u)<=H} |A_u(D)|^2. After the
first Poisson summation (in u) the dual row is h with N(h) << calH, calH ~ D^2/H, and the dual column sums are
B_h(X) = sum*_n a_xi(n) chi_n(h) U(N(n)/X), a_xi = alpha gamma_2 xi (cubic Gauss coefficients); E(calH, X) = X^(-1) sum_h |B_h(X)|^2,
target E << X^(1+eps); Sigma = XF the column scale (F the auxiliary twist; F = 1 in the sketch).

## 0. Two facts about S that hold for every H (PROVED)
(0a) The row u = 1 is in the family: S(H,D) >= |A_1(D)|^2. So a bound S(H,D) << D^(1+eta+eps) at H = D^eta gives
     A_1 << D^((1+eta)/2+eps), hence (Mellin, the paper's section 3) no zeros of L_K(s,nu) in Re s > (1+eta)/2, WITHOUT
     amplification. As eta -> 0 this is RH_K. So the short-family regime contains RH_K directly, as N53 says.
(0b) With amplification (the paper's (2.4): A_(p^6) = A_1 + (a Moebius sum of length D/N(p)), handled recursively, rows
     p^6 with N(p) ~ H^(1/6)), a diagonal bound S << H D^(1+eps) at H = D^eta gives A_1 << D^(1/2 + 5 eta/12 + eps), i.e. zero-free
     Re s > 1/2 + 5eta/12: 17/24 at eta = 1/2; below 3/4 iff eta < 3/5. (FROM the paper's (2.5), with the trivial D^2 H^(-1/3)
     term replaced by the recursion: HEURISTIC in that one step.)
(0c) Under GRH for the twists L_K(s, nu chi_.(u)) (conductor ~ N(u)): |A_u(D)| << (D N(u))^eps D^(1/2) for every u, so
     S << H D^(1+eps) for ALL H. So the diagonal bound is the expected truth in the short regime too; it is not provable by
     any method that is blind to the size of the individual A_u.

## 1. Which step needs H > D (answer to question 1)
(1a) The first Poisson summation in u is EXACT for every H (Lemma 4.2; it is Poisson over the lattice O). It produces
     the dual row length calH << C D^2/(H B^2) (Prop. 4.5, (4.11)) and the comparison (2.8):
        sum_{N(u)<=H} |A_u(D)|^2 <~ DH + (H/D) sum_{0<N(h)<<calH} |B_h(D)|^2,   target sum_h |B_h(D)|^2 <~ D^2   (2.9).
     Nothing here needs H > D; it only fixes calH = D^2/H.
(1b) THE STEP THAT NEEDS IT: the theta transformation in the column (h fixed) followed by the quadratic large sieve, (2.15):
        sum_{0<N(h)<<calH} |T_h(X)|^2 << (calH X)^eps (calH + calH^2/X).
     The second term is the factor L of "M + L" with L = calH^2/X the DUAL COLUMN LENGTH of the theta transformation
     ("the effective norm range in (2.13) is N(m) << N(h)^2/X"). The target is X, so (2.15) is useful iff calH^2/X <= X,
     iff calH <= X, iff (with calH = D^2/H, X = D) H >= D. The paper says it in one line: "At X = D and calH <= D, the
     heuristic comparison ... would therefore give the desired D^2 bound."
(1c) The STRICT inequality (a power) is needed by the cube-removal recursion: the cutoff (2.21) H_c = min(X^(1/3), X^(2/3)/calH^(2/3))
     is >= 1 iff calH <= X; and the induction of Prop. 5.1 terminates in O(1) steps only because each transfer contracts
        calH' < calH (calH/Sigma)^2 <= D^(-2 kappa) calH,
     which is hypothesis (5.1), calH <= Sigma D^(-kappa). At the self-dual point calH = Sigma the contraction is only by N(b)^3 >= 64
     per step (b primary, b != 1), so the number of steps is ~ log D and the per-step losses (D^(eps/3), and the derivative
     order J -> 4J + 12) compound to a power of D (PROVED from (5.11)-(5.12) as stated: the constants are not uniform in the
     number of steps). The paper's hypotheses also say it: Lemma 5.3 assumes calH <= Sigma, Prop. 5.4 assumes max{calH, LF} <= Sigma.
SUMMARY. Poisson (exact, any H) -> theta + quadratic large sieve (needs calH <= X, i.e. H >= D) -> recursion (needs calH <= X D^(-kappa),
i.e. H >= D^(1+kappa)). The quadratic large sieve itself is sharp in its regime ("M + L"); what fails is that L = calH^2/X exceeds the target.

## 2. The transfer step run formally at H = D^(1-theta) (answer to question 2)
Then calH = D^(1+theta) > X = D = Sigma (F = 1). PROVED, step by step, from the formulas quoted:
(2a) Completed mean square (2.15): calH + calH^2/X = D^(1+2theta) > X: the very first bound already misses the target by D^(2theta).
(2b) Cutoff (2.21): H_c = min(D^(1/3), D^(-2theta/3)) < 1: the "small divisor" part is EMPTY and every b, INCLUDING b = 1, falls in the
     part that is to be transferred.
(2c) Transfer at b = 1: L_1 = X, calH' = calH L_1/(Sigma F) = calH, X' = X: the map (calH, X) -> (calH/N(b)^3, X/N(b)^3) has the FIXED POINT
     b = 1. The recursion reads E(calH, X)/X <~ 1 + E(calH, X)/X + sup_{b != 1} ...: it returns the problem to itself. It neither
     closes nor diverges: it is vacuous. For b != 1 the ratio calH'/X' = calH/X = D^theta is preserved, so no member of the
     recursion ever enters the good regime calH <= X; it only shrinks to the empty sum.
(2d) What one actually gets in the short regime is the large-sieve bound for arbitrary coefficients. KNOWN, read (7/8 digest,
     Lemma 9.1, sextic large sieve, squarefree rows and columns): sum_{N(k)<=K} |sum_{N(n)<=D} c_n chi_n(k)^(+-1)|^2 << (KD)^eps (K + D + (KD)^(2/3)) sum|c_n|^2.
     At K = H = D^(1-theta): factor ~ D, so S(H,D) << D^(2+eps): by (0a) exactly the TRIVIAL bound for A_1. Equivalently (PROVED):
     Poisson + the large sieve in the dual, (H/D) * (calH + D) * D = D^2. So: the method returns the trivial bound, for a reason
     that is exact: every tool used is a DUALITY (Poisson in the row, theta automorphy in the column) and the large sieve,
     and dualities exchange H < D with calH = D^2/H > D; the short regime is the image of the long regime, not a new regime.

## 3. What object would give an exact formula for S(H,D) when H < D (answer to question 3)
(3a) WHY THE DUALITIES CANNOT DO IT (PROVED as a statement about lengths). Poisson in u has self-dual point H = D; the theta
     transformation in the column has self-dual point calH = X, which is again H = D. An identity built from them maps the pair
     (family H, column D) to (D^2/H, D) and the column (calH, X) to (calH, calH^2/X): exactly one side is short. At the self-dual point
     H = D both sides have the same shape, and the information is of convexity type: there (1b) gives E ~ X, S ~ D^2 = HD, the
     diagonal, but only with the log-many-step recursion of (1c), i.e. with a power loss. So "theta at the self-dual point" is
     where the method stops, not a way past it.
(3b) WHY THE MOEBIUS SIDE HAS NO DUALITY OF ITS OWN (KNOWN in substance; PROVED in this form): a short sum of coefficients of
     L(s) can be transformed because L has a functional equation (approximate functional equation: effective length ~ the
     square root of the conductor). The generating function of mu(n)nu(n)chi_n(u) is 1/L_K(s, nu chi_.(u)), which has poles at the zeros
     of L and no functional equation. The paper's device is that mu(n) times a SEXTIC Gauss sum IS a theta coefficient (Lemma 4.1:
     mu gamma_(-1) = chi_n(-1) G^(-1) alpha gamma_2): it buys a functional equation (theta automorphy) at the price of the first Poisson
     summation, i.e. only on the DUAL side. So for H < D the Moebius family itself is the side without a functional equation.
(3c) THE CANDIDATE OBJECTS, status:
     * Self-dual family at H = D: see (3a); exists, gives the diagonal with a power loss; nothing below D.
     * A Kuznetsov / Bruggeman-Motohashi-type formula over Z[omega], or a Kuznetsov formula on the cubic cover (KNOWN to
       exist from search summaries only: Kodama 2004 for Q(omega); Livne-Patterson for cubic exponential sums; not read).
       Its geometric side is a sum over MODULI c of Kloosterman sums (twisted by the cubic character), its spectral side
       metaplectic Maass forms with their coefficients, the theta function appearing in the residual spectrum. In it the
       family size enters only through the test function. But S(H,D), expanded, is a sum over PAIRS (z_1, z_2) of complete sextic
       Gauss sums gamma(chi_z1 conj chi_z2) (Step 5 of the digest), not a sum of Kloosterman sums over moduli; to bring it to
       Kuznetsov form one needs the Gauss sums written as Kloosterman sums (an identity of the kind "cubic exponential sums
       <-> Kloosterman sums" used by Patterson, Livne, Herman; FROM MEMORY). I did not find this done for S. RISK.
     * A metaplectic trace formula (Kazhdan-Patterson; Flicker's correspondence; FROM MEMORY): it compares spectra of the cover
       and of GL_2; it gives identities of L-functions, not mean squares of Moebius sums.
     WHAT EXISTS, honestly: no exact formula for S(H,D) with H < D in anything I read.
(3d) WHAT SUCH A FORMULA WOULD HAVE TO GIVE at H = D^(1/2), and why that is a hard statement. After the first Poisson the problem
     at H = D^(1/2) is sum_{N(h)<<D^(3/2)} |B_h(D)|^2 <~ D^(5/2+eps): twisted sums of cubic theta coefficients of length D with
     characters of conductor N(h) up to D^(3/2), i.e. sums SHORTER than the theta transformation's self-dual length N(h) for most
     h. For a single h this is the subconvexity / Lindelof range of the twisted theta L-series sum tau(n) chi_n(h) N(n)^(-s); the needed
     statement is Lindelof ON AVERAGE over h for that family (CONJECTURE; it would follow from GRH by (0c)). A spectral large
     sieve of Deshouillers-Iwaniec type for the cubic cover (FROM MEMORY: such sieves exist for Kloosterman sums on GL_2 over
     Q, with an exceptional-eigenvalue term) is the kind of tool that improves "M + L" when L > M; whether it applies to these
     Gauss-sum coefficients is the precise question I would ask a reader seat.
(3e) What it would give (PROVED from (0a), (0b)): S(D^(1/2), D) << D^(3/2+eps) would give zero-free Re s > 3/4 with no amplifier,
     and Re s > 17/24 with the sixth-power amplifier; S(D^eta, D) << D^(1+eta+eps) for every eta > 0 is RH_K.

## 4. Fake first (answer to question 4)
The impostor f = c L(s,chi) + conj(c) L(s, conj chi) mod 5 has 1/f with a pole at real part beta_0 = 0.808 (record); its Dirichlet inverse
c_n gives A_1^f(D) = sum c_n W(n/D) of size D^(beta_0) along a sequence of D (Mellin, the paper's section 3 run backwards: a pole of
1/f at beta_0 forbids A_1 << D^(beta_0 - eps)).
(4a) WHERE IT SHOWS (PROVED from (0a)): S^f(H,D) >= |A_1^f(D)|^2 >= D^(1.616 - eps). The diagonal target H D^(1+eps) is violated iff
     H < D^(2 beta_0 - 1) = D^(0.617). So the impostor is INVISIBLE to every bound in the long regime (H >= D: there H D >= D^2 > D^1.616)
     and is excluded exactly by the short-regime statements with eta < 0.617, in particular at eta = 1/2. Any exact identity giving
     S << H D^(1+eps) at H = D^(1/2) must therefore use something the impostor lacks.
(4b) AT WHICH STEP OF THE METHOD (PROVED as a dependency): in (3b). The conversion "mu x sextic Gauss sum = theta coefficient"
     needs c_n = mu(n) nu(n) pointwise (the -1 at each prime is mu; digest: gamma_2(p)^3 = -alpha(p)); for the impostor's c_n the dual
     coefficients are not theta coefficients, there is no automorphy and no dual functional equation at all. So in the long
     regime the impostor fails at the Gauss-Jacobi step (the digest's section 7), and in the short regime it fails at (4a):
     the short regime is where the impostor's pole forces S to be large, by the trivial inequality S >= |A_1|^2.
(4c) Consistency check (PROVED): by (0a) the bound S << H D^(1+eps) at H = D^eta is at least as strong as "no zero right of
     (1 + eta)/2". For the impostor (1 + eta)/2 < 0.808 iff eta < 0.617, the same threshold as in (4a). So, without
     amplification, the family adds nothing at that level beyond the single sum; it matters only through amplification (0b).

## 5. Ten-line summary
1. Poisson in u is exact for all H; it fixes the dual row calH ~ D^2/H.
2. The step that needs H > D is the theta transformation plus quadratic large sieve, (2.15): calH + calH^2/X <= X iff calH <= X iff H >= D.
3. A power H >= D^(1+kappa) is needed for the recursion to end in O(1) steps (contraction calH' < calH(calH/Sigma)^2; hypothesis (5.1)).
4. At H = D^(1-theta): the cutoff H_c < 1, b = 1 is a fixed point of the transfer, the recursion returns the problem to itself.
5. The short regime then gets only the large sieve: S << D^(2+eps), the trivial bound for A_1 (S >= |A_1|^2).
6. Both dualities have self-dual point H = D; they exchange short and long; at H = D they give convexity with a power loss.
7. The Moebius family has no functional equation of its own (1/L); the theta functional equation exists only on the dual side.
8. No exact formula for S(H,D), H < D, in anything read; candidates (cubic-cover Kuznetsov via a Gauss-to-Kloosterman identity, a
   spectral large sieve on the cubic cover) exist only as tools, unapplied, from memory or search summaries.
9. S(D^(1/2), D) << D^(3/2+eps) would give Re s > 3/4 without amplifier, 17/24 with it; for all eta it is RH_K (u = 1 is in the family).
10. Fake: the impostor's pole at 0.808 forces S >= D^1.616, visible exactly for H < D^0.617 and invisible in the paper's regime.
