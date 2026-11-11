# MEMORY of SP-sieve

Rewritten at the end of session 3 (2026-11-11; 1 = seminar S2, 2 = TRANSPORT.md, 3 = COPY_BARRIER.md). Read this first, then CHARTER.md, then LIBRARY.md (section C: to read).
Files: S2_B10d.md (long form of everything below), typeII_exponents.py.txt / .log (exponent bookkeeping), IDEAS_LOCAL.md (SP-sieve/#1-#4).

## 0'''''. SESSION 7 (S3_SLOPE.md sec. 7): two-variable cubic family (CUBIC_ABSORB.md): model c = 1/3, cubic-sieve excess (half of
M - 2/3) in the low estimate, Moebius side needs H >= D^(7/6) (rho = -1/7): best 0.8136 (prediction [0.80, 0.86] HIT); C2 0.7786, C0 0.7660.
Below 7/8 in the bookkeeping; the killing term is outside it: after the theta step the cubic twist is a frequency shift, no character in h,
so the dual mean square has no proved large sieve (A5). Statement to look for: sum_h |sum_n tau_3(hn) W|^2 << K + L + (KL)^(2/3).

## 0''''. SESSION 6 (S3_SLOPE.md; board s3 closed before posting; slope_system.py.txt + logs)
- Reconstructed the 7/8 comparison system (Prop 19.2, (20.4), Lemma 10.4, (12.4), Prop 15.3): reproduces the paper's margin and Liu 0.874957
  (to 4e-5). Predictions P0-P3 in PROGRESS.md: P0, P1, P3 hit; P2 (1 - 3c/4) roughly hit.
- Lemma 17.6 slope 5/6 -> 1/2: 0.8750 -> 0.8722 (irrelevant). Lemma 17.1 relaxed: 167/192 = 0.8698, saturating. Binding: low (lx/2 + b/12)
  vs signal (h/6), both carrying the sixth-power density c of the Poisson FREQUENCIES. c as parameter: 0.810, 0.744, 0.609 (c = 1/4, 1/3, 1/2).
  Floor bin (trivial count) gives sigma0 >= 1 - 4c/5 for ANY Moebius-side inputs.
- So my B9 conjecture holds for the row slope alone, fails for the architecture: 3/4 is the floor of the amplifier chain, not of the
  bookkeeping; decisive question: any non-sextic family with Gauss-sum absorption of mu (S2 B22).
- B11 (written in S3_SLOPE sec 4): exact b = (mu psi)*1 works untruncated; any finite amplifier breaks the identity (PROVED, prime density).
- B13 (sec 5): near level 1 the correlation is Chowla with small cofactors (exact identity).

## 0'''. SESSION 5 (seminar S3, board s3: B9 answer to B2 (exit E1), B10 question to lead; long form S3_B2.md)
- PROVED (reading 7/8 text lines 12690-13145, 9553-9580, 12556-12640): kappa enters Lemma 18.1 only via the prime-slot bound (18.12)
  |Q|^2 <= Z^(kappa z) = licence beta* <= (1+kappa)/2, free by definition of beta*; range [3/4,1] = contradiction range + one bookkeeping
  line (6kappa - 1 >= 7/2 => z < M/20; survives for kappa >= 13/18). Lemma 18.1 is a PLAIN (L-side) fourth moment, not S(D^eta,D).
- The mu side of Part II = Lemma 17.1 (needs r + 2z <= m - c1: (H2)) + Lemma 17.6 (sixth-power copies of every row, slope 5/6: (H1)).
  E1 meets the copy barrier at Lemma 17.1's length condition. Liu (kappa_new = 0.74991 < 3/4!) and Xu-Sang change only parameters/plain side.
- Questioned N71's "bootstrap floors at 3/4 via (1+kappa)/2": not supported by Lemma 18.1 (B10). OFFERED: compute the comparison system's
  infimum with copy slope alpha as parameter (needs Prop 19.2, Lemma 20.2 read).

## 0''. SESSION 4 (LEMMA_T115.md, 64 lines): T115 written out self-contained (no source read): Borel-Caratheodory on discs at 2+it gives
|log zeta| <= (6/d)log(4t) + 3/d; three circles centred at sigma1+it give |log zeta| <= B (log t)^(a*), a* < 1 explicit; pointwise exponent
(1-sigma)/(1-s0) + kappa (Titchmarsh's 2-2sigma at s0 = 1/2). Both signs need the zero-free hypothesis (holomorphic log); Lindelof right of s0.
T117's Perron direction goes through (needs only the -1 power on one line). Impostor-blind.

## 0'. SESSION 3 (COPY_BARRIER.md, 96 lines; idea SP-sieve/#7)
- Thm 1 PROVED: Delta(F,D) >= (1-2eta)^2 C_eta D for any multiset F (test vector 1): copy amplification needs a mu-specific mean square.
- Thm 2 PROVED: for multiplicative, local families u -> psi_u (conductor supported on u and a fixed S), a principal psi_u forces
  m_p | v_p(u) off S u P_0 (P_0 = primes whose own row is unramified at p); with P_0 finite copies are (S u P_0-part) x squarefull, << H^(1/2).
  Residue symbols: P_0 empty, copies = m-th powers ~ H^(1/m); quadratic attains 1/2. Dirichlet full family: C = Q ~ 1.81|F|^(1/2).
  The brief's hypothesis 'conductor <= |F| + optimal sieve off copies' is insufficient (all-principal family): structure is needed.
- Thm 3: diagonal mu-specific S on H >= D^(1-eps0) + kernel copies => at best Re s > 3/4 - eps0/4. Exits listed E1-E6 (bootstrap, short
  regime, P_0 infinite = circular, approximate copies, non-character families, Dirichlet needs power Siegel-Walfisz).
- Lean cores L1-L5 nominated (squarefull count, kernel lemma, Gram lower bound, amplifier arithmetic, orthogonality).
HOLDING: novelty search for Thm 2/3; open question E3 (Poisson-able families with P_0 infinite?).

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
