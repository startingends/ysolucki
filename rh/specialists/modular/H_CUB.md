# H_CUB: the dual mean square of the two-variable cubic family (SP-modular, 2026-11-11; rule 13(b): SP-sieve's verifier answer NOT read)

Nothing here proves RH or leads to it. At best (H_cub) improves the October zero-free half-plane (7/8 -> 0.8136 in SP-sieve's model),
which is quasi-RH, with the architecture's floor above 1/2. Labels: PROVED (argument here) / KNOWN (with what I read) / HEURISTIC /
CONJECTURE / RISK. No numerics this task (no prediction needed; none made).
READ for this task: rh/NOTEBOOK.md N76; rh/specialists/sieve/S3_SLOPE.md sec. 1 and sec. 7 (A1-A5, C0/C1/C2); my CUBIC_ABSORB.md;
digest openai-qrh-11-12.md steps 5-8. Sources (rh/library/src/sp_modular_misc/, untrusted text, read with python -I):
 - 2410.03048 (David-de Faveri-Dunn-Stucky, "Non-vanishing for cubic Hecke L-functions", DDDS24): abstract; sec. "Twisted sums of cubic Gauss sums" (def. (psizetadef), Lemma psi_convexity,
   FE (F_functional_eq), Lemma "Lindelof on average for second moment" with the opening of its proof); proof sketch of the cross term (t2)
   and the unbalanced polar term in the outline. NOT read whole (314k; I read the statements of sec. 5-6 and the outline).
 - 2109.07463 (Dunn-Radziwill): sec. 2 ((cuberel), (twistmult)), sec. 5.1 ((cubiccoeff) = Patterson Thm 8.1), Prop typeI with remarks,
   sec. "Improved cubic large sieve" in full (Thm cubicHBloc = Heath-Brown Thm 2, Thm hboptimal and its proof, Prop main, Prop adj),
   Definition seqdef.
 - 2403.13151 (Dunn): abstract, section list, sec. "The cubic large sieve" in full (Thm HBcubic, Cor cubiccor), Lemma rankinselbound.

## 1. Question (3) first: what the dual really is (PROVED, from (I3) of CUBIC_ABSORB and two read identities)
Family (CUBIC_ABSORB 3a): A_(u1,u2)(D) = sum_n mu(n) nu(n) (u1 u2/n)_3 W(N(n)/D), rows N(u_i) <= H; nu a ray-class/Hecke character
(digest step 5: "nu enters only as a ray class character"). Expand |A|^2; columns (n1, n2), coprime after extracting the gcd.
 (a) Poisson in u1 over O modulo n1 n2 for psi(u) = (u/n1)_3 conj((u/n2)_3): frequency h1 gives g(psi, h1) = conj(psi(h1)) g(psi)
     (substitution x -> h1^(-1) x; (-1/n)_3 = 1 so the sign of the frequency is irrelevant). Same in u2 with h2.
 (b) CRT: g(psi) = psi_1(n2) psi_2(n1) g((./n1)_3) g(conj(./n2)_3) with psi_1(n2) psi_2(n1) = (n2/n1)_3 conj((n1/n2)_3) = 1 by cubic
     reciprocity (primary n1, n2). So NO cocycle couples n1 and n2: the double sum factors as |sum_n ...|^2 up to the weight.
 (c) Per column: mu(n) gamma_2(n)^2 conj((h/n)_3) with h = h1 h2; by (I3) mu gamma_2^2 = alpha conj gamma_2, so the coefficient is
          alpha(n) conj( gamma_2(n) (h/n)_3 ) = alpha(n) conj( gamma_2(h^2; n) ),
     since g(r, n) = conj((r/n)_3) g(1, n) and conj((h^2/n)_3) = (h/n)_3. The weight Phihat(h1 sqrt(H)/(n1 n2)) Phihat(h2 ...) is separated
     by Mellin in |.| and Fourier in the angle: twists N(n)^(it) (n/|n|)^l, uniformly bounded families (smooth Phi).
 RESULT: the dual is sum_h d-weight(h) | sum_n b_n conj((h/n)_3) conj gamma_2(n) |^2, b_n = alpha(n) nu(n) (n/|n|)^l N(n)^(it) W(N(n)/D):
 a MULTIPLICATIVE twist of the conjugate cubic Gauss sum (theta-bar coefficient) by the cubic symbol of h. Not an additive shift. PROVED.
 (d) PRECISION ON N76's FORMULA (PROVED from (twistmult): g~(hn) = conj((h/n)_3) g~(h) g~(n), n, h coprime squarefree): the theta
     coefficient along the dilation, tau(hn) ~ conj g~(hn) = (h/n)_3 conj g~(h) conj g~(n), carries (h/n)_3; the family carries the
     OPPOSITE sign conj((h/n)_3) = (h^2/n)_3. So the family's object is "frequency h^2", not "dilation h n". For any large sieve the sign
     is irrelevant (|sum b (n/h)^2| = |sum conj(b) (n/h)|). It matters for main terms and for the post-theta character (sec. 3).

## 2. Question (1): is (H_cub) known? YES, in the shape SP-sieve used, from Heath-Brown's cubic large sieve
 KNOWN (read, Thm cubicHBloc of 2109.07463 = Heath-Brown 2000, Thm 2): for beta supported on squarefree b,
    sum_(N(a)<=A, a = 1 mod 3) mu^2(a) | sum_(N(b)<=B) beta_b (b/a)_3 |^2 << (A + B + (AB)^(2/3)) (AB)^eps ||beta||^2.
 The frequency shift IS a cubic character in h: conj((h/n)_3) = conj((n/h)_3) (cubic reciprocity, primary; units and lambda through the
 supplementary laws: finitely many twists of n mod 9, absorbed in b_n). Take beta_n = b_n conj gamma_2(n) (supported on squarefree n by
 (cuberel), |beta_n| <= |b_n|). Then, PROVED (one line):
   (H_cub, correct sign, l^2-normalised)  sum_(N(h)<=K) mu^2(h) | sum_n b_n conj gamma_2(h^2; n) |^2 << (K + L + (KL)^(2/3)) (KL)^eps ||b||^2,
 uniformly in alpha, nu, l, t: Heath-Brown's coefficients are ARBITRARY, so "uniformity in the twist alpha(n)" (S3_SLOPE sec. 7) is free.
 The published model of exactly this move: Dunn-Radziwill's proof of Thm hboptimal (read): "sum_a mu^2(a)|sum_b conj g~(b) W (b/a)_3|^2 =
 sum_a mu^2(a)|sum_b W g~(ab)|^2 (by (cuberel) and (twistmult))"; and DDDS24's cross-term step: "chi_c(l n2) conj g~(l n2) ... clump l n2
 together. Applying the cubic large sieve". So CUBIC_ABSORB 3(c)'s "no character left in h to give orthogonality" was WRONG (it was
 labelled HEURISTIC; correction note added there). Corrections to the statement in N76: (i) the right side needs the factor ||b||^2 ~ L
 (or the left side the normalisation by L), as in A2's exponents; (ii) the sign of (d).
 Remaining gaps, each closed or bounded (PROVED unless labelled):
  - h = h1 h2 is not squarefree. Write h = a b^2 c^3 (a, b squarefree coprime). Cubes c^3: (h^2/n)_3 does not see c (for (c, n) = 1);
    these are the copies a^3 e of A1, already in the model. Squares: the character is (n/a)_3^(+-2)(n/b)_3^(+-1); fix the smaller of
    a, b and apply Heath-Brown in the other (allowed: |sum beta (n/a)^2| = |sum conj beta (n/a)|). Dyadic N(a) ~ A', N(b) ~ B', A'B'^2 <= K:
    the cost is A'B' + min(A',B') L + min(A',B')^(1/3) (A'B' L)^(2/3); the third term is <= (KL)^(2/3) on the whole range (checked: both
    cases reduce to A'B'^2 <= K), the second is <= K^(1/3) L. So for all h: (K + K^(1/3) L + (KL)^(2/3)) (KL)^eps ||b||^2.
    In S3_SLOPE's A2 the exponents are K = Z^M, L = Z^(2M-1) (that is how "max(M, 2M-1)" and "(2/3)(3M-1)" arise), so L <= K for
    M <= 1 and K^(1/3) L <= (KL)^(2/3): NO LOSS. If anywhere L > K, the loss is a factor (L/K)^(1/3) on the excess term.
    Fallback with no squarefree condition on h (KNOWN, read: Dunn 2403.13151, Thm HBcubic): M^(1/3) (M + N) ||Psi||^2. Worse; not needed.
  - (h, n) != 1: conj gamma_2(h^2; p) = 0 when p | h (sum of a nontrivial character), so coprimality is automatic.
  - Answer to "which power can be lost": in A2's range none is lost. SP-sieve's own slack (C1 = 0.8136 vs 7/8) is not used up here.
 What the other two papers add (KNOWN, read):
  - DDDS24, Lemma (Lindelof on average): sum_(N(m)<=M) |psi(hm, sigma + it)|^2 << N(h)^(1/2) M^(1+eps) (1+|t|)^2, 1 < sigma <= 5/4. Its proof
    "follows Heath-Brown Lemma 3": cubic large sieve + a GL_1 approximate functional equation (FE s <-> 2 - s, conductor N(r)). It is a
    CONSEQUENCE of the same sieve, not a new input. Contour shift (W smooth, Re w from 1 to 1/2 + eps, crossing the pole at 4/3) gives
    sum_(N(r)<=K) |sum_n g~(r, n) W(N(n)/L) - MT(r)|^2 << (KL)^(1+eps): no "L" term, but only for smooth W with no nu/alpha twist, and for the
    family's frequencies r = h^2 (conductor N(h)^2, AFE length K) the same argument gives K^(4/3) L, not K L. Since L <= K in A2, this is
    WORSE than Heath-Brown there. Useful only for L >> K^(4/3).
  - Dunn-Radziwill Thm hboptimal: the excess (AB)^(2/3) is attained under GRH, with witness beta_b = conj g~(b) W, i.e. the DILATION sign
    of 1(d): the sum is the main term A (B^(5/6)/A^(1/6))^2 from Prop typeI (the theta residue). Prop main ("improved cubic large sieve"):
    after subtracting that main term, for beta in C_eta(B, w) (|beta| <= 1, squarefree, w-rough, square-root cancellation against every
    cubic and angular twist, axiom (eq:can), which they verify under GRH) the remainder is A^(2/3) B^(5/3) w^(-9/10) + (power-saving terms).
  - Dunn 2403.13151: no mean square of theta coefficients along dilations (searched "dilat", "mean square", "second moment", "Lindel":
    one hit, fixed dilations of cusp forms in Type II). Its large-sieve input is Thm HBcubic above.

## 3. The post-theta step (where SP-sieve's A3 and the low estimate actually apply the sieve)
A2/A3 apply the cubic sieve to sums of length L = calH^2/X, i.e. AFTER a theta transformation of the column sum (paper's step 7). The
pre-theta bound of sec. 2 has length D, not calH^2/X; using it instead changes the geometry (A3 would need calH + D + (calH D)^(2/3) <= X).
So the question is whether the post-theta twist of the row is still a non-trivial cubic character.
 HEURISTIC (sign bookkeeping from the digest's statement of (2.14), not re-read in App. A.2): twisting theta coefficients gamma_2 by
 chi_p^e gives the Fourier factor chi_p^(-e); Kubota's multiplier contributes chi_p^(-2) for theta (the paper: e = 1 gives
 chi^(-1) chi^(-2) = chi^(-3)), chi_p^(+2) for theta-bar. The family (1c): theta-bar coefficient conj gamma_2 twisted by conj((h/n)_3) =
 chi^(-2): product chi^(+2) chi^(+2) = chi^4 = chi^(-2), a NON-TRIVIAL cubic character. (Conjugating the whole sum: gamma_2 with chi^(+2),
 product chi^(-4): the same.) Consistency check: N76's dilation sign (chi^(+2) on conj gamma_2) gives chi^(-2) chi^(+2) = 1, a TRIVIAL
 twist, which is exactly the case with a theta main term tau(h) != 0 (Dunn-Radziwill's witness): trivial twist <-> residue present.
 And for the family's sign the residue vanishes: the pole of psi(r, s) at 4/3 has residue c_0 tau_3(r)/N(r)^(1/6) (DDDS24, Lemma
 psi_convexity) and tau_3 is supported on lambda^k c d^3, c squarefree ((cubiccoeff) = Patterson Thm 8.1, read), so tau_3(h^2) = 0 for
 squarefree h != 1 prime to 3. Two independent reads agree: NO theta main term, non-trivial cubic character after theta.
 So, CONDITIONAL on this bookkeeping (RISK R1 below), the post-theta mean square is again a Heath-Brown sum and (H_cub) holds there with
 the same shape, provided the post-theta coefficients (theta at other cusps, Patterson-type, supported on c d^3) are grouped by their
 squarefree part c before applying the sieve: |tau(c d^3)| / |tau(c)| ~ N(d)^(-1) in the normalised scale, so the grouping costs a
 convergent factor (PROVED from (cubiccoeff) at the cusp infinity; RISK R2 at the other cusps, not read).

## 4. Question (2): beyond (H_cub) -- removing the excess (KL)^(2/3) (C0 = 0.766 in S3_SLOPE instead of C1 = 0.8136)
 Why it is plausible for THIS sign (HEURISTIC): Dunn-Radziwill's lower bound uses the residue; for the family's sign it is zero (sec. 3).
 Natural routes and the step where each fails:
  (a) Dispersion (Dunn-Radziwill Prop main): needs axiom (eq:can) for b_n, square-root cancellation of b_n against every cubic and
      angular twist. For b_n = alpha nu (n/|n|)^l N(n)^(it) W this is GRH for cubic-twisted Hecke L-functions over Q(omega): circular for a
      zero-free-region theorem. Even granted, the remainder keeps A^(2/3) B^(5/3) w^(-9/10): only a log-power saving. FAILS here.
  (b) Voronoi in the level aspect (Prop typeI, with angular twists l): pointwise error U^(1/12) N(r)^(7/12) (also GRH, for the squarefree
      restriction); squared and summed over N(r) <= K it beats the sieve only for U >= K^5. FAILS by length.
  (c) Rankin-Selberg of theta against a theta-twisted Eisenstein series: gives the diagonal sum |tau|^2 (Lemma rankinselbound-type
      X^(1+eps)) and the exact identity of OBJECT_PHI, never the off-diagonal sum_(n1 != n2) tau(n1) conj tau(n2) sum_h chi_h(n1/n2). FAILS at
      the off-diagonal: it needs shifted convolution sums of theta coefficients with MULTIPLICATIVE shifts, which Rankin-Selberg does not see.
  (d) Spectral theory of the cubic cover: the off-diagonal is an inner product of |theta|^2 against level-h Poincare series; a spectral
      large sieve for the cover, uniform in the level, would bound it by the spectrum. HEURISTIC: the (KL)^(2/3) term is the contribution of
      the residual point (theta itself, the exceptional eigenvalue at s = 2/3 on the 3-fold cover), and its vanishing for the family's sign
      is the vanishing of tau(h^2). FAILS: I know no Kuznetsov formula for the cubic cover uniform in the level with an explicit treatment
      of the residual spectrum (FROM MEMORY; RISK that it exists in the Proskurin / Livne / Louvel literature, not searched this task).

## 5. Risks, fake first, honest scope
 R1 (main): the multiplier sign in sec. 3 is taken from the digest's (2.14), not from App. A.2 of the paper. If it is wrong the post-
    theta twist is trivial, the dual sums are copies, and only the pre-theta route of sec. 2 remains (length D, worse geometry).
 R2: post-theta coefficients at cusps other than infinity: their support (c d^3?) not read.
 R3: A2's "half of the excess" and A4 are SP-sieve's modelling, not checked here. Nothing here touches them.
 Fake first: the impostor fails before this point (absorption needs mu pointwise; CUBIC_ABSORB sec. 5). Over Q there is no cubic symbol.
 Scope: if R1-R3 hold, 0.8136 rests on published results (Heath-Brown 2000, Patterson 1977) plus SP-sieve's model, not on an open
 hypothesis. Still a zero-free half-plane Re s > 0.81: quasi-RH, not RH. No commits.

QUESTIONS (one each, for SP-sieve, not posted): Q1: in A2, is the sieve applied to rows calH and post-theta length calH^2/X (so L <= K)?
Q2: if R1 failed, can the comparison system take the pre-theta length D in A3, and what exponent results?
