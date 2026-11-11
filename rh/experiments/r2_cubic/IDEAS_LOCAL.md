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
  - 2026-11-11: audit: not promoted: merged into main #23

## #2 · Metzler trickle-down: symmetric 3-tensor T, a>0, slices T_k with <=1 positive eigenvalue, H=T.a with off-diagonal >=0 (negative diagonal allowed) => H has exactly one positive eigenvalue
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma B). Sign is used only in the Perron step and only on the off-diagonal of H. Given T.a=H the slice condition is an LMI: certificates form a spectrahedron.
  - 2026-11-10: status -> alive: proved
  - 2026-11-11: audit: not promoted: merged into main #10

## #3 · Cone certificate / vacuity: T = sym(H x l) - (4/s) l^3 always works when H is Lorentzian, so bare existence of a certificate is equivalent to the conclusion; content must come from sign/locality restrictions on T
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma C + corollary): certificate exists iff H Lorentzian. COMPUTED: cone certificate slices all Lorentzian; its sign on distinct triples is >=0 at n=12 but negative on spread-out triples at n=24 (rho = 0.45 at L=1). Consequence: idea #10's 'certificate exists' is a reformulation; a Beurling control with positive box form also has one (SDP, margin 0.78 vs zeta 0.79).
  - 2026-11-10: status -> alive: proved; kills the bare version of idea 10's certificate
  - 2026-11-11: audit: not promoted: merged into main #10

## #4 · Rigidity: any null vector of H is a lineality direction of the cubic (T(v,.,.)=0); so every slice must annihilate the near-null prolate ladder of the Weil form to accuracy mu(L)
- status: alive
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: PROVED (Lemma D, E). COMPUTED: after making the box form singular every slice of the SDP certificate kills the null vector (1e-4 solver accuracy, 9e-9 for the quadratic value).
  - 2026-11-10: status -> alive: proved; gives a blind test for any formula for T
  - 2026-11-11: audit: not promoted: merged into main #10

## #5 · Product cubic <f^2, N f> (Bakry-Emery style symmetric trilinear form): slices contain diag(N e_k) >= 0, many positive eigenvalues -> not Lorentzian
- status: killed
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: status -> killed: slices have 11 positive eigenvalues of 12 (tests.py.txt p4)
  - 2026-11-11: audit: not promoted: merged into main #24

## #6 · Does a certificate with T_ijk >= 0 on all distinct triples exist (Braenden-Huh sign hypothesis)? convex feasibility problem (slices T_k <= l_k l_k^T / s_k is an LMI once a is fixed)
- status: parked
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: yes for zeta (t* = 0.65..0.79) and equally for the Beurling control on positive windows (1.30, 0.78); 'all but T_iii >= 0' impossible. No discrimination.
  - 2026-11-10: status -> parked: exists but says nothing beyond window positivity
  - 2026-11-11: audit: not promoted: merged into main #10

## #7 · Certificate = lossless Bochner: with L = Doob transform (rates H_ij a_j/s_i), Lemma B's inequality H <= HDH is exactly 'L^2 + L >= 0' (gap >= 1), and a certificate is a site-by-site PSD decomposition of integral(Gamma_2 - Gamma) obeying a symmetry law; Bakry-Emery is one particular (non-symmetric?) such decomposition
- status: alive
- source: R2-cubic
- date: 2026-11-10
- tags: W2,B3,T55,T56,T62,T65,ideas10and11
- plain english: Idea 10 wanted a table of 'triple meeting numbers' for three scales; idea 11 wanted a 'curvature' of the prime random walk. They are the same table. For three different scales the number is: how strongly two of them are both tied to the third, added over the three choices of the middle one. Example: scales 0, log 2, log 3: the middle-0 part is (log 2/sqrt 2)(log 3/sqrt 3) divided by the total pull at 0. This natural table fails the test, and for a clear reason: on the simplest model where every scale pulls equally on every other, the test built from it gives 1/2 where the truth is 1. For zeta it gives 0.48 to 0.65 where 1 is needed, and the broken control (prime 2 moved to 2.1) gives the same numbers.
- wall: Zero margin (B3) and W2. The mechanism never touches zeros. Wall met: the canonical local cubic is lossy by a factor 2 at mean field; lossless ones exist only with three-step chains and chain-dependent coefficients (no formula).
- new input: A canonical symmetric 3-tensor attached to a ferromagnetic form and a positive vector, with a closed formula; the identity (Kf)^2 - (Gamma_2 - Gamma)(f) = slice of a symmetric cubic.
- claim: PROVED and CHECKED (Theorem F; rh/THEORY.md T55; recomputed by hand by the checker and the judge, and numerically to 2e-14). For any symmetric H and a > 0 with s = Ha > 0, the Bakry-Emery forms Gamma and Gamma_2 of the Doob-transformed chain K = S^-1 H A define a SYMMETRIC 3-tensor T with T.a = H. For distinct i, j, k: T_ijk = (1/2)[H_ij H_ik/s_i + H_ij H_jk/s_j + H_ik H_jk/s_k] (two-step chains through a middle scale; >= 0 when the couplings are >= 0). Every slice of T has at most one positive eigenvalue iff Gamma_2 >= Gamma at every site (the curvature condition CD(1, infinity)). So idea #10's cubic certificate and idea #11's curvature bound are ONE mechanism. (The '(non-symmetric?)' in the title was the seat's prediction before computing; it missed, the cubic is symmetric.) This canonical cubic is NOT a certificate: on the resampling (mean-field) chain on m points its best constant is exactly 1/2 + 1/m where 1 is needed; for zeta at L = 1 it is 0.590, 0.528, 0.482 at 12, 24, 48 boxes and every slice has two positive eigenvalues; the Beurling control (2 -> 2.1), whose form is not positive, gives 0.586, 0.523, 0.483: the cubic cannot tell them apart.
- prediction: Written before computing (PROGRESS P8): T^BE NOT symmetric (asymmetry > 10%): MISS, it is symmetric to 7e-16, then proved. P9: rho_BE = 1/2 + O(1/m) on the resampling chain: HIT (exactly 1/2 + 1/m); zeta rho_BE(n=48) in [0.49,0.53]: MISS (0.4816); Beurling control within 0.02 of zeta: HIT (0.4825).
- smallest: Theorem F itself (proved). Next smallest: the least chain-degree d* of a polynomial certificate as a function of the margin, on an exactly solvable ferromagnet.
- first test: Done (seat, checker, judge J4, J7, J9): symmetry to 2e-16, T.a - H to 7e-16, formula against Gamma_2 from its definition to 2e-14 on 40 random mixed-sign H (control: the coefficient 1/4 replaced by 0.3 breaks T.a = H by 0.1 to 0.6); resampling chain 0.7, 0.6, 0.55, 0.525 for m = 5, 10, 20, 40; zeta and Beurling as in the claim. The neighbours of the canonical cubic were then tried (product cubic, dimension-corrected criterion, the mean-field-exact family Theta_t); they are in the notes below. Not run: the Davenport-Heilbronn impostor and the theta dial (they have negative couplings, so the Perron step of the local-to-global lemma does not apply to them).
- kill line: None was fixed by the seat for this entry before computing. The kill lines of its two parents apply: idea #10 ('no certificate on the smallest discretisations, or a certificate that also exists for a Beurling system: kill the mechanism') and idea #11 ('curvature constant <= 0: the tool is dead'). Outcome: the constant is positive but 0.48 to 0.65 where 1 is needed, exactly 1/2 + 1/m on the mean-field model, and the same for the control to within 0.005. The identity stands as a proved lemma; as a certificate the canonical cubic is dead. Unparks only with a rule for the coefficients of a lossless cubic that does not use the spectrum of the window form (THEORY T62); the measurable form of that wall is #25.
- novelty: SEARCHED 2026-11-10. Seat: 2 web queries (Bakry-Emery with trickle-down / Garland / Lorentzian / cubic; Bakry-Emery Markov chain with Lorentzian / one positive eigenvalue), snippets only: the trickle-down and Bakry-Emery literatures appear separately, no statement of this identity. Checker: not found in 2 further searches, in section 2 of Braenden-Leake arXiv 2304.13203 (read, pp. 6-9), or in a machine summary of Shenfeld-van Handel arXiv 1811.08710 (no Markov chain or Gamma_2 there). KNOWN parts: the local-to-global lemma it plugs into is Braenden-Leake Lemma 2.8, whose ancestor (Cordero-Erausquin, Klartag, Merigot, Santambrogio 2019) is itself a Bochner-method argument, so 'this lemma is a Bochner statement' is known in convex geometry; the constant 1/2 + 1/m on the complete graph is Schmuckenschlaeger 1998 (MSRI Publ. 34); 'Garland's method is a Bochner argument' is folklore (seat, from memory). Journal J4 lists Theorem F as 'still only ours' after the whole-paper readings. Status: not found, NOT established as new.
- evidence: rh/experiments/r2_cubic/PROOF_BE_cubic.md (Theorem F; sections 2 to 4), be.log, be2.log; rh/experiments/r2_judge/JUDGEMENT.md 1.1, 2.7, 3.3. Prediction order (judge, section 5): the seat's P8 and P9 have no snapshot separating them from their results; consistent with file times, not provable. Double precision; nothing interval-certified.
- log:
  - 2026-11-10: MAIN FINDING. PROVED (PROOF_BE_cubic.md Theorem F): the Bakry-Emery site forms define a SYMMETRIC cubic with T.a = H; distinct entries (1/2)[H_ij H_ik/s_i + ...] (two-step chains), >= 0; slices Lorentzian iff CD(1,inf). So idea #10's certificate and idea #11's curvature are one mechanism. It fails structurally: rho = 1/2 + 1/m on the resampling chain (proved for the model, computed), 0.48..0.65 for zeta, same for Beurling. Predicted non-symmetric: MISS.
  - 2026-11-10: status -> alive: proved identity; the canonical cubic is not a certificate
  - 2026-11-11: promoted to main #24 by R2-AUD
  - 2026-11-11: auditor R2-AUD replaced the 'novelty' field before promotion; the agent's original text was: SEARCHED 2026-11-10, 2 queries (Bakry-Emery + trickle-down/Garland/Lorentzian/cubic; Bakry-Emery Markov chain + Lorentzian/one positive eigenvalue), snippets only. Found trickle-down and Bakry-Emery literatures separately; no statement of this identity. 'Garland = Bochner' is folklore (from memory). NOT established as new.

## #8 · Locality radius R*: smallest spread of box triples a certificate needs; no-go for R=0 at a critical window (Lemma E)
- status: testing
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: R* = n-1 in all cases (zeta L=0.5,1.0 n=8,12; Beurling L=0.5); two solvers, infeasible by 0.8..5.8 when only the triples (0,j,n-1) are forbidden. PROVED only at R=0 for a critical window (Lemma E).
  - 2026-11-10: status -> testing: computed, not proved beyond R=0
  - 2026-11-11: audit: not promoted: merged into main #10

## #9 · Mean-field-exact local cubics: one-parameter family Theta_t = t(s1 - s2) + (1/2 - t) s11 + (3t - 1/2) s111 of pointwise-product cubics in K=Doob kernel; symmetric, contracts to H for every chain, equals the unique certificate when K is the resampling chain. Are its slices Lorentzian for zeta?
- status: testing
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: COMPUTED: no t works for zeta; best t=0.05, violation -0.047 (n=12), -0.052 (n=24); exact on the resampling chain for every t (proved). Enlarged to all products up to chain-degree 2 (10 tensors): certificate EXISTS for zeta (L=0.5 n=12; L=1 n=20; checked independently) and for random Lorentzian Metzler matrices (12/12): linear algebra with margin, not arithmetic. Degree 1 fails for zeta (tau* 0.014..0.073).
  - 2026-11-10: status -> testing: family fails; degree-2 span succeeds without a formula
  - 2026-11-11: audit: not promoted: merged into main #24

## #10 · CONJECTURE: least chain-degree d* of a polynomial-in-K certificate is finite when the margin is positive and diverges as the margin closes; measure d*(margin) on a dialled family
- status: open
- source: R2-cubic
- date: 2026-11-10
- tags: B3,T62,proposal,ideas10and11
- plain english: Round 2 learned two things about 'certificates' for the one-growing-direction property of idea #10. Some certificate always exists whenever the property holds, so bare existence says nothing; and the one certificate with a simple formula (#24) loses a factor of two. Between these there is a ladder. Allow the certificate to be built only from the walk's own one-step table K: products of three functions, each smoothed by K at most d times. Call d the rung. The conjecture: the lowest rung that works is finite whenever the property holds with room to spare, and climbs without bound as the room shrinks to nothing. Example from the computations: for zeta's table on the window of half-width 1 cut into 12 boxes, rung 1 fails (it misses by 0.014) and rung 2 works, with a safety margin of 0.00046; with 20 boxes, where the box table has less room, the rung-2 margin drops to 0.00026. Random tables behave the same way: rung 1 works for those with a lot of room and fails for those with little. RH is true with no room to spare (on this window the true room is about 0.00000000000000000000002). So if the conjecture is right, no fixed rung can ever certify it, and this whole family of formula-built certificates is closed for good; if instead rung 2 keeps working as the room closes, there is one formula to look for. Either answer is about the method, not about the zeros.
- wall: FAILS RULE: it does not get past a wall, it measures one. The wall is the one that parked idea #10 and #24: no rule is known for a lossless cubic certificate (THEORY T62), while bare existence of a certificate is vacuous (Lemma C). The proposal asks whether the complexity a certificate needs stays bounded as the zero margin (barrier B3) is approached. If d* diverges, the wall is permanent for every certificate that is a polynomial of fixed degree in the one-step kernel; if d* stays at 2, the wall reduces to finding one formula.
- new input: A grading of cubic certificates by chain-degree (how many steps of the Doob chain K each factor may take) and the number d*(H) it attaches to any ferromagnetic form with one positive direction, studied as a function of the margin. It grows from recorded results (owner rule 9): Lemma C (existence is vacuous), Theorem F (#24: the degree-1 formula loses a factor 2) and the seat's computations at degrees 1 and 2.
- claim: CONJECTURE (seat R2-cubic; not attempted). For a symmetric H with non-negative off-diagonal entries and exactly one positive eigenvalue, with a its Perron vector and K the Doob chain, let d*(H) be the least d such that some combination, with free coefficients and T.a = H imposed, of the symmetrised products [K^a g, K^b f, K^c h], a, b, c <= d (4 tensors for d = 1, 10 for d = 2, 20 for d = 3, 35 for d = 4), has every slice with at most one positive eigenvalue. Then d*(H) is finite whenever the second eigenvalue of H is < 0, and d* is unbounded as the second eigenvalue tends to 0.
- prediction: FAILS RULE: no number for d* as a function of the margin was stated before computing. On record from the seat's neighbouring blind predictions (their order cannot be proved: no snapshot; judge, section 5): P11 'no degree-2 certificate for zeta, slack between 0.005 and 0.05': MISS, a degree-2 certificate exists. P12 'degree-2 certificates exist for all random Lorentzian matrices with non-negative off-diagonal': HIT (12 of 12); 'degree 1 fails for most of them': MISS (it works for 11 of 12 on the seat's draws and 7 of 12 on the checker's; it fails for those with second eigenvalue above about -0.28). Control, forced by the local-to-global lemma and observed: no certificate at any degree for the Beurling control at L = 1, whose form is not positive.
- smallest: In the seat's words: the least chain-degree d* as a function of the margin on an exactly solvable ferromagnet (the seat did not name the model). A first provable piece: one explicit small family on which degree 1 fails and degree 2 succeeds, with the margin of the degree-2 certificate as an explicit function of the second eigenvalue.
- worth if true: A divergence of d* at zero margin would be a no-go theorem for the whole family of local, formula-built cubic certificates (ideas #10 and #11 and #24 in one stroke) and would say what a certificate at zero margin cannot be (a fixed-degree polynomial in the one-step kernel). A bounded d* would leave a finite search: the formula of the degree-2 certificate.
- first test: Partly done (seat; reproduced by its checker with two solvers; not redone by the judge). Zeta: degree 1 fails (slack 0.0144 at L = 1 with 12 boxes, 0.0357 at L = 0.5 with 12 boxes, 0.0726 at L = 1 with 20 boxes); degree 2 exists, with margins 1.19e-3, 4.6e-4, 2.6e-4 on the complement of a (checker's robust test: maximise t with P_k >= t(I - aa^T/|a|^2); the seat's own evidence, a smallest eigenvalue of 1e-12, cannot separate 0 from 1e-9). A Beurling control on a window where its form is still positive also has a degree-2 certificate (6.7e-3). To do: a one-parameter family H(eps) with second eigenvalue -eps, d*(eps) for eps from 1 down to 1e-6 with the robust margin; zeta's own box forms at growing numbers of boxes are a second family (their margin shrinks with refinement).
- kill line: Seat's own: if d* stays at 2 as the margin is dialled to zero, the conjecture is dead and the question becomes the formula of the degree-2 certificate on the simplest solvable model. Practical stop: degrees 3 and 4 gave solver failures in double precision (ill-conditioned powers of K); if d* cannot be decided beyond 2 in higher precision either, park it.
- novelty: UNSEARCHED for the conjecture itself. The seat's four web searches of 2026-11-10 (result lists and snippets only: Bakry-Emery with trickle-down / Garland / Lorentzian / cubic; Braenden-Leake; Weil positivity with Lorentzian / trickle-down / Bakry-Emery; Bakry-Emery Markov chain with Lorentzian / one positive eigenvalue) found nothing on degree hierarchies of such certificates. Degree hierarchies for sum-of-squares certificates are standard in optimisation (recall, not searched, so not evidence). Status: not established as new.
- evidence: rh/experiments/r2_cubic/PROOF_BE_cubic.md section 4; rh/experiments/r2_cubic/PROGRESS.md (P11, P12, 'what the wall suggests next (b)'); rh/experiments/r2_cubic/refuter/PROGRESS.md; rh/experiments/r2_judge/JUDGEMENT.md 2.8, 2.9, 3.3. Double precision; the semidefinite-programming results were reproduced by the checker only.
- log:
  - 2026-11-11: promoted to main #25 by R2-AUD

## #11 · Dimension-corrected Bakry-Emery CD(rho,n) to recover the factor 2: KILLED by hand (resampling chain gives (n-4)/(2(n-1)) < 1/2)
- status: killed
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-10: status -> killed: two-line computation in PROGRESS.md
  - 2026-11-11: audit: not promoted: merged into main #24

## #12 · Function-field reading: the cubic is the triple intersection form on C x C x C; trickle-down goes from surfaces to the threefold, so the surface statement is a slice (an input), unless the surface is numerically a positive combination of simpler surfaces (degeneration). Not developed.
- status: open
- source: R2-cubic
- date: 2026-11-10
- log:
  - 2026-11-11: audit: not promoted: a proposal that is not precise enough to compute (the owner's second test fails): 'the cubic is the triple intersection form on C x C x C, and the surface statement is a slice of it' names no object on the number-field side from which a number can be calculated; the seat marked it 'not developed', and its PROGRESS.md says the slice at a fibre node 'was not identified'. Newness was not assessed. If someone defines the fibre-node slice as a window form, enter it as a note on main #24.
