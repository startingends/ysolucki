# MEMORY of SP-sieve

Rewritten at the end of session 2 (2026-11-11; session 1 = seminar S2, session 2 = TRANSPORT.md). Read this first, then CHARTER.md, then LIBRARY.md (section C: to read).
Files: S2_B10d.md (long form of everything below), typeII_exponents.py.txt / .log (exponent bookkeeping), IDEAS_LOCAL.md (SP-sieve/#1-#4).

## 0. SESSION 2 (TRANSPORT.md, 101 lines; same object as SP-modular, whose answer I did NOT read)
Asked: (1) converse of Bettin-Gonek (zero-free half-plane => long-mollifier upper bounds?); (2) hybrid family (sextic u x t) for zeta_K;
(3) exact copies inside a t-family (rule 13 (c)). Answered:
- PROVED: at BOUNDED height the dictionary is an equivalence: no zeros in Re s > sigma <=> I_N(0,T0) = O(N^(2sigma-1+eps)) (Perron + the
  Titchmarsh 14.2-type lemma 1/zeta << t^eps right of a zero-free half-plane, FROM MEMORY; Bettin-Gonek's proof with T fixed).
  theta = 1/(2sigma-1) is just this growth with N = T^theta. Impostor-blind.
- PROVED: the half-plane + MVT control no dyadic block at height T^x, x > 0, when theta = 1/(2sigma-1) > 1. HEURISTIC: the coupled form needs a
  weighted zero-density bound sum N^(2beta-1)|zeta(1/2+i gamma)/zeta'(rho)|^2 << T^(1+eps), stronger than DH near 1/2 for theta > 1.
  So N65's "October is ahead at theta = 4/3" is true only on the bounded-height axis, where BCR/Conrey do not operate.
- Hybrid (u, t): Prop 3.1 survives for |t| <= D^(o(1)) (weights W(y)y^-it, finite derivative order; RISK beyond); gives zeta_K
  I^K_N(0,T0) << N^(3/4+eps), equivalent to 7/8 (restatement). t dilutes copies.
- Copies: none in t (Kronecker); depth/Postnikov family has exact copies but is a finite group: copy bound trivial or circular (PROVED,
  orthogonality) = N49 (c). Structural: copies need a homomorphic parametrisation with kernel of intermediate density (m-th powers, mu_m).
HOLDING from session 2: search whether the bounded-height equivalence (1a) is in print (Bettin-Gonek only state one direction);
check the Titchmarsh 14.2 lemma under a general half-plane in the text; ask whether a weighted density bound of (1b)'s shape is known
(Conrey-Ghosh-Gonek-type sums over zeros of 1/zeta'(rho)).

## 1. What I was asked (lead's brief, session 1)
(1) create the seat; (2) answer SP-modular's B10 (d): does Vaughan / Type I-II give any power saving over D^2 for S(H, D) at
H = D^(1/2), the sparse sextic family; (3) is the short-family wall the parity problem; what parity-breaking inputs exist here and
for the t-family; (4) one structure outside the toolkit and its seat.

## 2. What I answered (board s2: B21 result, B22 and B23 questions to SP-modular, B24 a reference fix)
- PROVED: Vaughan's identity holds for any invertible Dirichlet series (1/F = 2G_U - F G_U^2 + (1/F)(1 - F G_U)^2). So "the impostor has no
  Vaughan identity" is false; the first impostor-false line of the route is the coefficient normalisation (1/f_DH has poles in Re s > 1:
  Saias-Weingartner, KNOWN from abstract; inverse coefficients not O(N^eps) on average).
- PROVED: Type I at H = D^(1/2) is negligible on every non-copy row for U <= D^(1/4) (Poisson over O); Type II needed on M in [D^(1/4), D^(1/2)].
- PROVED: in L^2 no bilinear inequality for bounded coefficients beats D^2 in any (M, N) (one row's conjugate characters attain it); over
  ALL rows the general norm is >= H^(1/6) D^2 (copies). Correction to SHORT_FAMILY 2(d): its D^2 is the squarefree-row bound; S << D^2 for mu
  over all rows would already give Re s > 23/24.
- PROVED (bookkeeping, checked in typeII_exponents.log): in L^1 (BV normalisation) primitive rows get total D^(7/6) at H = D^(1/2) for every
  a in [1/4, 1/2], per-row D^(2/3); total D for H <= D^(1/5). This is zero-density information, multiplicity-blind: nothing on copies.
- Parity: Type I complete + Type II empty = the parity situation, but the residue is A_1 at power strength, beyond parity. KNOWN (read):
  FI 1998 Thm 1 gives error O(log delta/log Delta) from (B); FI 2022: Siebert/Granville, fixed improvement of the linear sieve in APs
  => no exceptional zeros; "the exceptional character pretends to be the Moebius function". HEURISTIC model: the wall has that shape one
  level up. Only parity-sensitive input in the sextic family: gamma_2^3 = mu alpha (dual side, long regime). t-family: nothing.
- Outside: order strata of rows (orders 1, 2, 3, 6; counts H^(1/6), H^(1/3), H^(1/2), H); question B22 to SP-modular on whether the first
  Poisson on the quadratic stratum absorbs mu.

## 3. What I hold (open)
(a) B22, B23 to SP-modular: answers pending. If B23's answer is "0.808 is only the strip zero", N55's impostor threshold H < D^0.617
    must be restated (impostor visible at the normalisation, both regimes).
(b) CONJECTURE (SP-sieve/#2): a Siebert-type theorem for the sextic family: constant-factor improvement of the copy-direction mean square at
    H < D => de la Vallee Poussin-width zero-free region. Next: read Granville 2020 for the exact mechanism (LIBRARY C).
(c) Check whether Saias-Weingartner's proof transfers to c L_K(s,psi) + conj c L_K(s, conj psi) over K = Q(sqrt -3) (RISK in S2_B10d 5c).
(d) Not yet done: Davenport ch. 28 re-read (my B3 is from memory); Heath-Brown x^3 + 2y^3 section 3 (Type II with cubic symbols).
