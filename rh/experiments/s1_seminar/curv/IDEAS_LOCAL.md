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

## #2 · Sum rules of Theorem A in closed form: even margin = 1/(t_e-1), odd margin = 1/(1+t_o), t = 2<pole vector, Q^-1 pole vector>
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: PROVED (F1, Sherman-Morrison). Never exactly saturated on a window with strictly positive Weil block; even margin positive iff lambda_1>0; checker's factor P_M = lambda_1/(mu_1(t_e-1)) <= lambda_1/(2<c,v_1>^2-mu_1). COMPUTED to 10 digits M=20..160.
- log:

## #3 · Parity differences: E(h_-)-E(h_+) = 4<phi,H phi>; ||Lh_-||^2-||Lh_+||^2 = 4<phi,{lambda_1-T,H}phi>; block pair = two-sided bound T+4s^2 <= H <= 4c^2-T on the mirror form
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: PROVED (F3, F4). The mirror (Hankel) form H of K enters the window statement with both signs; RH on the window is a two-sided squeeze of H by the half-window shift form T. COMPUTED: par(Op) vs 4UHU cosine 0.917 (blind prediction <0.5: MISS).
- log:

## #4 · Comb reduction: on narrow teeth at log a (a=2..A, tooth width < log(1+A^-2)/2) mirror form = multiplicative Hankel matrix [Lambda(ab)/sqrt(ab)], half-window shift form = D_eps I + multiplicative Toeplitz matrix [Lambda(a/b)/sqrt(a/b)] + O(eps)
- status: open
- source: S1-curv
- date: 2026-11-10
- claim: HEURISTIC, not written out or computed. Both forms become explicit integer matrices on one finite space; the block inequalities there read D_eps + G_A +- M_A <= pole terms (which are O(eps A)). D_eps ~ c_inf - log(1/eps): trivial as eps -> 0 at fixed A, content only when log(1/eps) is comparable with ||G_A +- M_A|| (I first believed it was trivial on all combs; row sums of G_A grow like sqrt(A), Rayleigh quotients I tried grow like log A; so NOT trivial at eps ~ A^-2). Candidate for S1-mirror's 'shift inequality on the lattice'.
- log:
