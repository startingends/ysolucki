<!-- local-idea-log owner=R2-cubic -->
# Local idea log of R2-cubic

Private working log of agent `R2-cubic`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `R2-cubic/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Fibre classes: adjoin two nodes F1,F2 (pole functionals e^{x/2}, e^{-x/2}) so that window-RH = 'the (n+2) matrix Ntilde has exactly one positive eigenvalue', all off-diagonal entries >= 0, both parity blocks at once
- status: alive
- source: R2-cubic
- date: 2026-11-10
- plain english: Weil's inequality has two special measurements of a test shape (its total weighted by e^(x/2) and by e^(-x/2)). Add them to the list of scales as two extra points. Then the whole inequality becomes one sentence about one table of numbers: the table has exactly one growing direction. Example: with 12 boxes on the window of half-width 1 the 14 by 14 table has eigenvalues 5.306, then -0.0018, -0.035, ...: one positive. Move the prime 2 to 2.1 and it has two positive ones (5.287 and +0.020).
- novelty: SEARCHED (1 query, snippets): only the classical function-field Hodge-index statement found. This is that statement transcribed; KNOWN in substance.
- log:
  - 2026-11-10: PROVED (PROOF_trickle.md Lemma A): #pos(Ntilde) = 1 + #neg(Weil form). COMPUTED: zeta one positive eigenvalue at L=0.3..1.0, n=12,14; Beurling 2->2.1 has 2-3 from L=0.5. Known in substance (Weil's Hodge-index picture); new only as the object to attach a cubic to; repairs WJ13 inside idea #10.
  - 2026-11-10: status -> alive: proved; a tool, not a route

## #2 · Metzler trickle-down: symmetric 3-tensor T, a>0, slices T_k with <=1 positive eigenvalue, H=T.a with off-diagonal >=0 (negative diagonal allowed) => H has exactly one positive eigenvalue
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma B). Sign is used only in the Perron step and only on the off-diagonal of H. Given T.a=H the slice condition is an LMI: certificates form a spectrahedron.
  - 2026-11-10: status -> alive: proved

## #3 · Cone certificate / vacuity: T = sym(H x l) - (4/s) l^3 always works when H is Lorentzian, so bare existence of a certificate is equivalent to the conclusion; content must come from sign/locality restrictions on T
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma C + corollary): certificate exists iff H Lorentzian. COMPUTED: cone certificate slices all Lorentzian; its sign on distinct triples is >=0 at n=12 but negative on spread-out triples at n=24 (rho = 0.45 at L=1). Consequence: idea #10's 'certificate exists' is a reformulation; a Beurling control with positive box form also has one (SDP, margin 0.78 vs zeta 0.79).
  - 2026-11-10: status -> alive: proved; kills the bare version of idea 10's certificate

## #4 · Rigidity: any null vector of H is a lineality direction of the cubic (T(v,.,.)=0); so every slice must annihilate the near-null prolate ladder of the Weil form to accuracy mu(L)
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma D, E). COMPUTED: after making the box form singular every slice of the SDP certificate kills the null vector (1e-4 solver accuracy, 9e-9 for the quadratic value).
  - 2026-11-10: status -> alive: proved; gives a blind test for any formula for T

## #5 · Product cubic <f^2, N f> (Bakry-Emery style symmetric trilinear form): slices contain diag(N e_k) >= 0, many positive eigenvalues -> not Lorentzian
- status: killed
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: status -> killed: slices have 11 positive eigenvalues of 12 (tests.py.txt p4)

## #6 · Does a certificate with T_ijk >= 0 on all distinct triples exist (Braenden-Huh sign hypothesis)? convex feasibility problem (slices T_k <= l_k l_k^T / s_k is an LMI once a is fixed)
- status: parked
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: yes for zeta (t* = 0.65..0.79) and equally for the Beurling control on positive windows (1.30, 0.78); 'all but T_iii >= 0' impossible. No discrimination.
  - 2026-11-10: status -> parked: exists but says nothing beyond window positivity

## #7 · Certificate = lossless Bochner: with L = Doob transform (rates H_ij a_j/s_i), Lemma B's inequality H <= HDH is exactly 'L^2 + L >= 0' (gap >= 1), and a certificate is a site-by-site PSD decomposition of integral(Gamma_2 - Gamma) obeying a symmetry law; Bakry-Emery is one particular (non-symmetric?) such decomposition
- status: alive
- source: R2-cubic
- date: 2026-11-10
- plain english: Idea 10 wanted a table of 'triple meeting numbers' for three scales; idea 11 wanted a 'curvature' of the prime random walk. They are the same table. For three different scales the number is: how strongly two of them are both tied to the third, added over the three choices of the middle one. Example: scales 0, log 2, log 3: the middle-0 part is (log 2/sqrt 2)(log 3/sqrt 3) divided by the total pull at 0. This natural table fails the test, and for a clear reason: on the simplest model where every scale pulls equally on every other, the test built from it gives 1/2 where the truth is 1. For zeta it gives 0.48 to 0.65 where 1 is needed, and the broken control (prime 2 moved to 2.1) gives the same numbers.
- wall: Zero margin (B3) and W2. The mechanism never touches zeros. Wall met: the canonical local cubic is lossy by a factor 2 at mean field; lossless ones exist only with three-step chains and chain-dependent coefficients (no formula).
- new input: A canonical symmetric 3-tensor attached to a ferromagnetic form and a positive vector, with a closed formula; the identity (Kf)^2 - (Gamma_2 - Gamma)(f) = slice of a symmetric cubic.
- prediction: Written before computing (PROGRESS P8): T^BE NOT symmetric (asymmetry > 10%): MISS, it is symmetric to 7e-16, then proved. P9: rho_BE = 1/2 + O(1/m) on the resampling chain: HIT (exactly 1/2 + 1/m); zeta rho_BE(n=48) in [0.49,0.53]: MISS (0.4816); Beurling control within 0.02 of zeta: HIT (0.4825).
- smallest: Theorem F itself (proved). Next smallest: the least chain-degree d* of a polynomial certificate as a function of the margin, on an exactly solvable ferromagnet.
- novelty: SEARCHED 2026-11-10, 2 queries (Bakry-Emery + trickle-down/Garland/Lorentzian/cubic; Bakry-Emery Markov chain + Lorentzian/one positive eigenvalue), snippets only. Found trickle-down and Bakry-Emery literatures separately; no statement of this identity. 'Garland = Bochner' is folklore (from memory). NOT established as new.
- log:
  - 2026-11-10: MAIN FINDING. PROVED (PROOF_BE_cubic.md Theorem F): the Bakry-Emery site forms define a SYMMETRIC cubic with T.a = H; distinct entries (1/2)[H_ij H_ik/s_i + ...] (two-step chains), >= 0; slices Lorentzian iff CD(1,inf). So idea #10's certificate and idea #11's curvature are one mechanism. It fails structurally: rho = 1/2 + 1/m on the resampling chain (proved for the model, computed), 0.48..0.65 for zeta, same for Beurling. Predicted non-symmetric: MISS.
  - 2026-11-10: status -> alive: proved identity; the canonical cubic is not a certificate

## #8 · Locality radius R*: smallest spread of box triples a certificate needs; no-go for R=0 at a critical window (Lemma E)
- status: testing
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: R* = n-1 in all cases (zeta L=0.5,1.0 n=8,12; Beurling L=0.5); two solvers, infeasible by 0.8..5.8 when only the triples (0,j,n-1) are forbidden. PROVED only at R=0 for a critical window (Lemma E).
  - 2026-11-10: status -> testing: computed, not proved beyond R=0

## #9 · Mean-field-exact local cubics: one-parameter family Theta_t = t(s1 - s2) + (1/2 - t) s11 + (3t - 1/2) s111 of pointwise-product cubics in K=Doob kernel; symmetric, contracts to H for every chain, equals the unique certificate when K is the resampling chain. Are its slices Lorentzian for zeta?
- status: testing
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: no t works for zeta; best t=0.05, violation -0.047 (n=12), -0.052 (n=24); exact on the resampling chain for every t (proved). Enlarged to all products up to chain-degree 2 (10 tensors): certificate EXISTS for zeta (L=0.5 n=12; L=1 n=20; checked independently) and for random Lorentzian Metzler matrices (12/12): linear algebra with margin, not arithmetic. Degree 1 fails for zeta (tau* 0.014..0.073).
  - 2026-11-10: status -> testing: family fails; degree-2 span succeeds without a formula

## #10 · CONJECTURE: least chain-degree d* of a polynomial-in-K certificate is finite when the margin is positive and diverges as the margin closes; measure d*(margin) on a dialled family
- status: open
- source: R2-cubic
- date: 2026-11-10
- log:

## #11 · Dimension-corrected Bakry-Emery CD(rho,n) to recover the factor 2: KILLED by hand (resampling chain gives (n-4)/(2(n-1)) < 1/2)
- status: killed
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: status -> killed: two-line computation in PROGRESS.md

## #12 · Function-field reading: the cubic is the triple intersection form on C x C x C; trickle-down goes from surfaces to the threefold, so the surface statement is a slice (an input), unless the surface is numerically a positive combination of simpler surfaces (degeneration). Not developed.
- status: open
- source: R2-cubic
- date: 2026-11-10
- log:
