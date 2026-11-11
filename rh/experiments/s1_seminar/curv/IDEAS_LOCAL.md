<!-- local-idea-log owner=S1-curv -->
# Local idea log of S1-curv

Private working log of agent `S1-curv`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `S1-curv/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Integrated open-path term of the Bochner formula is a Hankel form in the two jumps: kernel 1_{W^c}(y+a+b), mirror at the middle point y
- status: open
- source: S1-curv
- date: 2026-11-10
- plain english: Take the walk on the window and look at two jumps made from the same starting box. Either the two jumps added together still land inside the window, or they overshoot the edge. The energy that measures mixing splits into an inside part and an overshoot part. Example with 40 boxes on the window of half-width 1: the overshoot part is never negative for any test function (smallest value 0.105 in natural units), while the inside part can go negative in exactly one way (-0.004). The overshoot part has the same mirror shape as idea 21's form (it depends only on the sum of the two jumps) but with a different weight.
- claim: PROVED (S1_ADDITIONS.md F2): sum_x pi_x O_x(f) = (1/2) sum_y sum_{a,b: y+a+b not in W} g_y(a) g_y(b), g_y(a)=k(a)u(y+a)(f(y+a)-f(y)); ||Lf||^2 = Cl + Op. CONJECTURE: Op >= 0 as a form in f; Cl has exactly one negative direction (odd). COMPUTED at L=1, M=40 only (zeta: Op min 0.105 lam1, Cl min -0.0043 lam1; Beurling 0.111, -0.0070).
- log:
  - 2026-11-10: Posted as answer B30. Blind prediction that the parity difference of Op is unrelated to the D5 Hankel form (|cos|<0.5): MISS, cos = 0.917/0.929 (zeta M=40/80), 0.919 Beurling. Explained by F3(ii). OPEN: prove Op >= 0; exact share of open paths in the anticommutator {lambda_1 - T, H}; whether 'Cl has exactly one negative direction' is stable in M and differs for Beurling (at M=40 it does not: 1 and 1).
  - 2026-11-11: audit: not promoted: merged into main #11

## #2 · Sum rules of Theorem A in closed form: even margin = 1/(t_e-1), odd margin = 1/(1+t_o), t = 2<pole vector, Q^-1 pole vector>
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: PROVED (F1, Sherman-Morrison). Never exactly saturated on a window with strictly positive Weil block; even margin positive iff lambda_1>0; checker's factor P_M = lambda_1/(mu_1(t_e-1)) <= lambda_1/(2<c,v_1>^2-mu_1). COMPUTED to 10 digits M=20..160.
- log:
  - 2026-11-11: audit: not promoted: merged into main #23

## #3 · Parity differences: E(h_-)-E(h_+) = 4<phi,H phi>; ||Lh_-||^2-||Lh_+||^2 = 4<phi,{lambda_1-T,H}phi>; block pair = two-sided bound T+4s^2 <= H <= 4c^2-T on the mirror form
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: PROVED (F3, F4). The mirror (Hankel) form H of K enters the window statement with both signs; RH on the window is a two-sided squeeze of H by the half-window shift form T. COMPUTED: par(Op) vs 4UHU cosine 0.917 (blind prediction <0.5: MISS).
- log:
  - 2026-11-10: Posted in B30/B31. S1-parity B25 has the sharper form of the same block difference: Q(f_e)-Q(f_o) = 4[E_+^2 - sum_{m>=1}E_m^2 - prime Hankel], one positive square (pole at s=1). S1-cubic B52: odd block entries are K(|x-y|) - K(x+y): shift minus mirror; sign fact lost exactly at prime atoms x+y=log n.
  - 2026-11-11: audit: not promoted: merged into main #21

## #4 · Comb reduction: on narrow teeth at log a (a=2..A, tooth width < log(1+A^-2)/2) mirror form = multiplicative Hankel matrix [Lambda(ab)/sqrt(ab)], half-window shift form = D_eps I + multiplicative Toeplitz matrix [Lambda(a/b)/sqrt(a/b)] + O(eps)
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: HEURISTIC, not written out or computed. Both forms become explicit integer matrices on one finite space; the block inequalities there read D_eps + G_A +- M_A <= pole terms (which are O(eps A)). D_eps ~ c_inf - log(1/eps): trivial as eps -> 0 at fixed A, content only when log(1/eps) is comparable with ||G_A +- M_A|| (I first believed it was trivial on all combs; row sums of G_A grow like sqrt(A), Rayleigh quotients I tried grow like log A; so NOT trivial at eps ~ A^-2). Candidate for S1-mirror's 'shift inequality on the lattice'.
- log:
  - 2026-11-10: COMPUTED (t1_comb.log; blind prediction NOTES.md 23:55:06, all four HIT): zeta A=12/24/48: -D_eps 4.25/5.63/7.02, top(G+Mm) 1.89/2.53/3.17 (ratio 0.445/0.448/0.452), comb Weil blocks lowest eig even 2.51/3.22/3.94 odd 2.91/3.63/4.32. Beurling 2->2.1 own lattice: positive too (3.55/4.26, 5.95/6.61). So the subspace where the mirror form is exactly the integer matrix is at O(1) distance from the tight directions and does not see the control. Posted B39. S1-mirror's own Model B (B46, wider teeth eps=0.05) agrees: 2.1 not detected.
  - 2026-11-11: audit: not promoted: merged into main #21

## #5 · The tilt control as a contraction: F_d >= 0 on a window iff multiplication by tanh(dx) is a contraction in zeta's Weil form; it couples the parity blocks; nu(L) = Bernstein constant of differentiation on the zeros
- status: open
- source: S1-curv
- date: 2026-11-11
- plain english: Multiply a test function by a gentle ramp (zero in the middle, going to plus and minus a small number at the two ends of the window). Ordinarily that makes a function smaller. Measured with zeta's own energy it can make it enormously larger: on the window of half-width 0.75 the ramp x turns the lowest even pattern (energy 0.0000000000000046) into an odd pattern of energy 0.000073, sixteen thousand million times more. The off-centre product zeta(s-d)zeta(s+d) passes the window test exactly when its ramp, of height tanh(d x), does not enlarge any pattern; so the window tolerates only d below 0.000008.
- claim: PROVED (S1_ADDITIONS.md G1): Q_d(f) = 2[Q(cosh(dx)f) - Q(sinh(dx)f)]; even block of F_d >= 0 iff Q_o(tanh(dx) g) <= Q_e(g). Small d: d*^2 = 1/nu, nu_eo = sup Q_o(xg)/Q_e(g) = sup sum|G'(gamma)|^2 / sum|G(gamma)|^2 over even G of type L. From the board at L=0.75: nu >= 1.6e10. COMPUTED in boxes only (too coarse): nu_eo = 6.2, 17.1, 55.5 (M=40,80,160).
- log:
  - 2026-11-11: Posted B99 (claim), B100 (question to SP-operator: Bernstein constant for the sampling norm on the zeros), B102 (question to S1-parity: evaluate Q_o(x v_e), nu at L=0.75 and 1). My box heuristic nu*mu_e ~ 0.01 does not transfer (withdrawn on the board). Process side (F2, gap, Bakry-Emery, open-path form) is tilt-blind: moves < 0.1% at d = 0.1.
  - 2026-11-11: audit: not promoted: merged into main #21

## #6 · Half-window integral of Gamma_2 = bulk terms in (T, H, lambda_1) + a mirror-crossing term with weight j = (Hu)/u; rho_half = 5/6 comes only from even-odd cross terms
- status: open
- source: S1-curv
- date: 2026-11-11
- claim: PROVED (G4): sum_{x in S} pi Gamma_2 = (1/2)<1_S,(Lf)^2> + (1/2)<1_S f, L^2 f> + (1/2)<L 1_S, Gamma(f) - f Lf>; L 1_S = -sign(x)(Hu)/u for the half window. COMPUTED rho_half/lam1 = 0.8384 (M=40), 0.8319 (M=160); Beurling 0.8158, 0.8071. Posted B97.
- log:
  - 2026-11-11: audit: not promoted: merged into main #24

## #7 · Derivative lemma: an edge-regular eigenfunction of the window form has its derivative as an eigenfunction of the other parity with the same eigenvalue; level crossings between parities = edge-regular eigenfunctions
- status: open
- source: S1-curv
- date: 2026-11-11
- plain english: Slide a pattern a tiny distance along the scale line and subtract the original: that difference is the pattern's slope. The energy we study does not care where on the line a pattern sits, only the window does. So if a lowest-energy pattern already touches zero at both ends of the window, sliding it costs nothing, and its slope is again a lowest-energy pattern, but of the opposite symmetry (the slope of a symmetric hill is an antisymmetric wave). Example on the window of half-width 0.447 with the prime 2 given weight 0.478 instead of 0.490: the symmetric and antisymmetric lowest energies coincide (0.00028 each) and the slope of the symmetric pattern matches the antisymmetric one to four digits; at weight 0.3 the match is only 93%.
- wall: W-curv-3 follow-up / S1-parity WP2 (end-point regularity of a null vector)
- claim: PROVED (S1_ADDITIONS.md H3) given: v abs. continuous, v(+-L)=0, v' in the form domain, C_c^inf a form core (Suzuki Thm 1.1). COROLLARY: a simple eigenvalue has an edge-singular eigenfunction; an edge-regular first null vector would be null in both parity blocks. COMPUTED (H4): at the weight where the two ground levels cross, overlap of (even ground state)' with the odd ground state = 1.0000, residual 0.9%; elsewhere 0.82..0.9985; the odd ground state gets its node where its level crosses the second even level.
- novelty: PARTLY SEARCHED: digests of Suzuki 2606.09096 (has the antisymmetry of d/dx for Q, Thm 1.5), Zhu, Yoshida, Connes-Consani by grep; corollaries not found. No web search this turn.
- log:
  - 2026-11-11: audit: not promoted: merged into main #8

## #8 · Edge-strip lemma on the first-prime window: prime-2 term = c x swap of two edge strips = +-2c x reflection about (log 2)/2; dominated by at most 16.3% of the killing energy
- status: open
- source: S1-curv
- date: 2026-11-11
- claim: PROVED (H1). Q >= Q_0 - c 1_strips. COMPUTED: the archimedean form Q_0 - c 1_strips is >= 0 for delta <= 0.029 (L <= 0.361). No control violates it. Admissible weight intervals of the atom at log 2 tabulated in H2.
- log:
  - 2026-11-11: audit: not promoted: merged into main #28
