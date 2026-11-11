# JUDGEMENT, round 2, verification track (agent R2-judge)

Written 2026-11-11. Two sessions: the first (23:51 to 00:08 UTC) did the recomputations J1 to J15 and stopped before
writing this file; the second re-read all six PROOF files line by line, redid every displayed computation by hand,
spot-checked the first session's logs, ran J16, J17, J18, and wrote this file. Commands, predictions and logs: `PROGRESS.md`.

Scope (owner, 2026-11-10): proofs and numbers only. I do not rank ideas and I do not say whether any approach is
likely to work. The idea verdicts of the "curv" checker are not used; only what it found about proofs and numbers.

Labels: PROVED / COMPUTED / HEURISTIC as in the preamble. "Checked" means I redid the step myself.
Levels: the project ladder (L2 = conditional lemma "if X then RH", fully proved; L3 = new unconditional theorem).

---------------------------------------------------------------------------------------------------------------
## 1. Statements claimed as proved

### 1.1 Seat "cubic" (PROOF_trickle.md, PROOF_BE_cubic.md)

| statement | verdict | level | what I checked |
|---|---|---|---|
| Lemma A (fibre classes): #pos(Ntilde) = 1 + #neg(Q), nullities agree | proved, known | none | U = span(F1,F2) has signature (1,1); U-perp = {(f, -<f,q>, -<f,p>)}; the form there is N - 2<f,p><f,q> = -Q (expanded by hand); Sylvester. It is inertia additivity for a Schur complement (Haynsworth 1968, cited from memory by the checker) and Weil's Hodge-index picture, as the seat says. |
| Lemma B (trickle-down with negative diagonal) | proved, known | none | Steps 1 to 5 checked. It is Braenden-Leake, arXiv 2304.13203v2, Lemma 2.8, at degree 3: I read the lemma and its proof. Their (1) d_i f(x) > 0 is s_i > 0 (d_i f(a) = s_i/2); their (2) is the slice condition; their (3) is word for word (B1); their inequality (d-1) Hess <= Hess Lambda Hess with Lambda = diag(x_i/d_i f) is H <= HDH; the Perron step is the same. They credit it "in essence" to their reference [17], Prop. 3 ([17] = Cordero-Erausquin, Klartag, Merigot, Santambrogio, "One more proof of the Alexandrov-Fenchel inequality", C. R. Math. Acad. Sci. Paris 357 (2019); reference list read, paper not opened). The seat's "probably folklore, relation unchecked" is corrected: it is in print. |
| Lemma B, remark 1 (slice condition <=> LMIs T_k <= l_k l_k^T/s_k; certificates form a convex set) | proved, trivial | none | Step 2 one way; a rank-one upper bound the other way (Weyl). |
| Lemma C (cone certificate) and the vacuity corollary | proved | none | Contraction (uses l.a = s), the slice decomposition (expanded by hand: total coefficient of l l^T is -2 l_k/s^2), Weyl. The hypothesis l >= 0 is used and is needed (J8: with some l_k < 0, 300 of 300 random Lorentzian H have a slice with two positive eigenvalues; with l >= 0, 0 of 300). Not found in what seat, checker and I read. No level: it is a statement about every matrix of the stated kind, not about zeta, and novelty is "not found", not established. |
| Lemma D (D1 to D4) and Lemma E | proved | none | Ga = 0 from Ds = a; P_k a = 0; D3; H vt = (-mu f, 0, 0) from Lemma A remark 3; D4 bound. Elementary. Two sentences attached to it are not the lemma: "every slice must vanish on the near-null ladder to accuracy 6e-30" is an extrapolation to a space that contains those functions (HEURISTIC; on the box spaces used the smallest eigenvalue is 1e-2 to 1e-3), and D4 bounds the quadratic value, not the vector T_k vt. |
| Theorem F (F1 to F5), Bakry-Emery cubic | proved | none | F1 by hand. The four collected lines of 4(Gamma_2 - Gamma) and their sum K^2(f^2) - 4K(fKf) + 2fK^2 f + 2(Kf)^2 - f^2 by hand. Pairing with g and comparison with Theta(g,f,f) by hand. F3 and the distinct-triple case of F5 by hand. Numerically (J7, my own code, 40 random mixed-sign H): definition vs F5 1.4e-14, vs Gamma_2 from its definition 2.1e-14, T.a - H 2.3e-14; control (coefficient 1/4 replaced by 0.3) breaks T.a = H by 0.1 to 0.6. No level: an algebraic identity for any reversible chain; novelty "not found" (two seat searches, checker's reading), not established. |
| Resampling chain: Gamma, Gamma_2, (Gamma_2 - Gamma)(f)(k) = (1/4)(<f^2> - f_k^2); best constant 1/2 + 1/m | proved (the constant was labelled COMPUTED by the seat; it is provable) | none | Formulas rederived. Ratio (3<f^2> + f_k^2)/(2(<f^2> + f_k^2)) with f_k^2 <= (m-1)<f^2>, equality at f = e_k - 1/m, gives (m+2)/(2m). Same statement as seat curv's Theorem C2 with pi = 1/m. Known (see Theorem C below). |
| Section 3 (U) uniqueness at rank one; (V) the family Theta_t | proved | none | (U) from D3. (V): the four contractions 1+2K, 1+2K^2, 2K+K^2, K^2 and the sum to K by hand; at K = projection the total is 3(1/2 - t) + 3t - 1/2 = 1. Needs total mass of pi equal to 1 for the displayed mean-field formula (checker's remark, correct). |
| Report sentence "CD(rho, n) gives at most (n-4)/(2(n-1)) < 1/2" | wrong as written (true only as m -> infinity) | none | Rederived by hand: the best constant on m points is rho = 1/2 - 2/n + (1 + 2/n)/m. Counterexample to the sentence: m = 40, n = 5 gives rho = 0.135 and the Lichnerowicz bound rho n/(n-1) = 0.16875 > 0.125 (J9: 0.135000, 0.281250, 0.427500 for n = 5, 8, 20). The seat's PROGRESS.md has the qualifier "up to O(1/m)"; the report dropped it. |

### 1.2 Seat "curv" (PROOF_bochner_parity.md)

| statement | verdict | level | what I checked |
|---|---|---|---|
| Theorem A (parity-block ground-state identity, two sum rules) | gap: the line "neg(-N_e) >= 1 because <u, N u> = lambda_1 > 0" | none | A0, the first lines of A1 and A2, the Haynsworth bookkeeping and all of A2 are right. lambda_1 > 0 is not a hypothesis and is false on small windows: J3 (lead's Arb builder, Fourier N = 30) gives top eigenvalue of N = -0.0728 at L = 0.10 and +0.119 at L = 0.12, with the Weil form positive (lowest eigenvalue 0.457 at L = 0.10). There A1's second line is false: the inequality holds, N_even has no positive eigenvalue. Smallest counterexample: N = [[-10, 1], [1, -10]] (N_even = -9). Repair: add "lambda_1 > 0". It is a reformulation in any case (the seat says so). |
| Theorem B (Bochner formula B1 to B4) | proved | none | B1 and B2 rederived by hand (the cancelling pair -Q Gamma + Q Gamma, and z = x allowed). B3: the symmetrised bracket (1/2)Delta^2 - AB by hand; numerically S + H + O = Gamma_2 to 2e-14 with my own code (J5). B4 is Dirichlet convolution plus Selberg's identity: trivial. The sentence drawn from it ("the curvature deficit comes from the window edge") is not supported by the numbers: see 2.3. |
| Theorem C (resampling chain: C1 to C4) | proved, known | none | C1 from B2: Gamma_2 = lambda^2 (a/4 + 3V/4), Gamma = (lambda/2)(V + a); C2 from V >= a pi_x/(1 - pi_x); C3: (lambda^2/4)(V - a) = (lambda/4) L(g^2); C4 standard. Citation as reported by the checker: Schmuckenschlaeger, MSRI Publ. 34 (1998), pp. 189-197 (I did not open it). It says nothing about the prime chain. |
| Theorem D (D1 to D5, reflection positivity) | proved, trivial | none | D1: Lambda(ab) != 0 with a, b >= 2 forces a, b powers of one prime; two lines; holds for any Beurling system. D3 termwise. D4, D5 correct. The reading "each part fails for the other's reflection" holds only off integer positions: D1 is itself the Hankel (total inversion) form of the prime measure on atoms at logs of integers >= 2. Example by hand: positions 3/2 and 4/3 (product 2) give [[0, 0.490], [0.490, 0]], eigenvalues -0.490, +0.490. |
| Theorem E (-arch = c ||f||^2 - Levy Dirichlet form, c = 5.3721834...) | proved, known in substance | none | The split, t = 2u, Gauss's integral. My own box matrix (first session) has its diagonal built from this formula and reproduces every number of the seat (J11), which checks the constant. Known: the seat's own search (abstract summary of an unrefereed 2026 Zenodo record); weak evidence, but the seat does not claim it as new. |
| (not in the proof file) "the exact calibration exists iff gap >= rho" | proved by the checker | none | The converse is a Poisson equation with pi-mean-zero right-hand side; two lines; standard. |

### 1.3 Seat "parity" (PROOF_parity_index.md, PROOF_first_failure.md, PROOF_uniqueness.md)

| statement | verdict | level | what I checked |
|---|---|---|---|
| Parity lemma (Lemmas 1, 2) | proved, trivial | none | P(f) = 2 Re(F_+ conj F_-), F_+- = <f_e,c> +- <f_o,s>. |
| Proposition 3 (RH => kappa_+(N_L) <= 1; kappa_-(Q_e) <= kappa_+(N_e); kappa_-(Q_o) <= kappa_+(N_o) + 1) | proved | none | One unwritten step: kappa_-(Q) <= kappa_-(Q_e) + kappa_-(Q_o) (standard: take maximal negative subspaces in each block and intersect a larger negative subspace with their Q-orthogonal complement). (a) is a consequence of RH; (b) is linear algebra. |
| Theorem 4 (exact negative index: kappa_-(Q_L) <= nu, <= nu/2 per parity block; attained for all large L; sup = nu) | proved; total count known in substance; per-block count not found | none yet | Every step redone: q_z = (|u+v|^2 - |u-v|^2)/2; q_{z'} = q_z on even and on odd functions; sinc bounds; (3c) |M| <= 2e^{-K} outside Near(a) (uses K >= t, |Im gamma| < 1/2); (3d) cos^2(tz) = e^{-2ita}e^{2tb}/4 + r with |r| <= 3/4, progression step pi/|a| < 1, bound -> -infinity; Step 4 all four cases of the Gram matrix, C_i != 0, ||H|| bounded independently of (t_i, K_i); odd block with phi'. No use of RH or of the Euler product. Kill test on zeta's own form with surgery (J17, section 2.14): one quartet gives (1,1), two give (2,2), never more, multiplicity invisible, on-line control (0,0). Toy check on the zero side alone (J13: two quartets among 40 real ordinates; never more than (2,2); (1,1) for one quartet; multiplicity invisible; (0,0) on the line; my first run undercounted because of my own threshold). Novelty: the total count, with the word "distinct" and the same hyperbolic-pair argument, is printed as "Theorem 1 (global signature)" in an unrefereed account of an agent research run hosted by Anthropic (section 6), which also reports, after fetching it, that Bombieri 2000 already has the upper-bound half for large truncations. Nobody in this project has opened Bombieri 2000 or Yoshida 1992. So: not new as a whole. The per-block count was not found in what I read (no mention of parity in that document's text). L3 is not earned while the primary sources are unread. |
| Corollary C1, k = 0, 1, 2, 3 ("at most one negative square on every window" is equivalent to RH) | proved | none yet (L2 on content; the brief's standard for L2 asks for three refuters, one ran; and the count behind it is known in substance) | Follows from Theorem 4 and the fact that nu is even (no zeros on the real segment (0, 1)). It is an equivalence, not a reduction, as the seat says. |
| Corollaries C1 last line and C4 (one parity block suffices) | proved, known | none | Yoshida 1992, Prop. 1, as reported on p. 2 of Suzuki arXiv 2606.09096v3, which I read: "Q_W(v) >= 0 for all non-zero odd v implies RH, while a similar condition for all non-zero even functions implies RH except for possible real zeros". The seat reported it as not found. |
| Corollary C2, first half (kappa_+(N_L) <= 1 on every window => at most one off-line quartet) | proved | none (the conclusion is not RH) | Prop. 3(c) plus C1. |
| Corollary C2, second half and wall WP1 ("cannot be improved by linear algebra") | gap: PROOF_parity_index.md section 5, C2, the sentence "the second cannot be improved by linear algebra alone, because ..." | none | Only consistency of the inequalities of Prop. 3(b) with one quartet is shown. No configuration with one quartet and kappa_+(N) = 1 is exhibited; the file says so two lines later. The summary's "PROVED" covers the implication only. Label for the second half: open. New evidence (section 2.14, J18): on surgery configurations of zeta with one quartet, N has three positive eigenvalues, not one. |
| Corollary C3 (WJ13's "one negative square per block per quartet") | proved | none | It is Theorem 4 for L >= L_0. Upgrades a HEURISTIC of round 1. |
| First-failure template: Lemma 1 (lambda(L) non-increasing), Lemma 2, Theorem 3 | proved given the cited theorems; known in substance | none | Jensen count O(r) against Selberg's c T log T (distinct zeros: yes, sign changes); (B) => (C) by continuity from both sides; (D) => (A). Points: Lemma 2(i) "lambda(L) > 0 strictly" also needs attainment of the infimum (it is in Theorem 3's list of inputs, not in the lemma). Monotonicity needs no assumption: Suzuki's Corollary 1.2 (read) says lambda_a is the infimum of the Rayleigh quotient over C_c^infinity(-a, a). The existence half of the template is in Suzuki's paper: p. 2 and the paragraph after Theorem 1.3 ("if RH is false, then Q_W^a must be degenerate for some value of a by continuity of lambda_a"; RH <=> non-degeneracy for every a is attributed to Yoshida 1992, Theorem 2). An equivalent form of "RH is false": no level. |
| Proposition 5 (a) to (d) (null vector: real, even or odd; support hull [-L_0, L_0]; exact type; energy identity) | proved given S1 and the domain facts | none | (a), (b) by translation, (c) including conj(psihat(conj z)) = +-psihat(z) and the equality of the two quartet contributions. (e), (f) are declared not proved. |
| Theorem U (under RH, no atomic l^1 perturbation keeps the Weil form non-negative on all of R) | proved, conditional on RH | none (it assumes RH; it is not of the form "if X then RH") | Step 1 (E = (1/pi) sum d_j cos(r u_j)); Step 2 (zero side O(T^-6), T^-1 D -> E(r_0) ||phihat||^2); Step 3 (means of E(1 +- cos(r u_k)) give +-d_k/(2 pi) >= 0). Presumed folklore (the lead's N14 says so); unsearched. |
| Theorem U, scope item "false on every single window" | gap: PROOF_uniqueness.md, "Exact scope", second bullet | none | Supported in the file only by a discretised computation, which by the seat's own WP4 says nothing about the full window. The checker's repair is right (under RH): |D(f * f~)| <= 2 sum|d_j| ||f||^2 and lambda(L) > 0 is attained, so Q_L + D >= 0 whenever 2 sum|d_j| <= lambda(L). |
| "All computed feasible intervals of idea #9 are outer bounds" | proved, trivial | none | A form >= 0 on L^2[-L, L] is >= 0 on every subspace. Infeasible in a subspace is a true statement about the window (up to arithmetic); feasible in a subspace is not. |

### 1.4 Statements added by the checkers

| statement | verdict | level |
|---|---|---|
| (curv checker) sum-rule margin 2c^T N_e^-1 c - 1 = det(Q_e)/|det N_e| = (mu_1(Q_e)/lambda_1) x P, P >= 1 | proved, known (matrix determinant lemma: det(2cc^T - N_e) = det(-N_e)(1 - 2c^T N_e^-1 c), and det(-N_e) < 0 when N_e has one positive eigenvalue; interlacing). J10: 5.592234356886e-4 against 5.592234356884e-4. | none |
| (curv checker) on integers >= 2 both [Lambda(ab)/sqrt(ab)] and [w(log ab)] are positive semidefinite | proved, trivial (D1; w(log ab) = sum_m (ab)^-(2m+1/2)) | none |
| (parity checker) under RH, Q_L + D >= 0 whenever 2 sum|d_j| <= lambda(L) | proved (one line, given attainment of lambda(L)) | none |
| (judge, J18) on a finite-dimensional subspace with invertible blocks: kappa_+(N_even) = kappa_-(Q_even) + [c^T Q_e^-1 c > 1/2] and kappa_+(N_odd) = kappa_-(Q_odd) - [s^T Q_o^-1 s < -1/2], N = pole - Q | proved, elementary (Haynsworth on [[Q_e, c],[c^T, 1/2]] and [[Q_o, s],[s^T, -1/2]]; it contains curv's Theorem A as the case kappa_-(Q) = 0 and sharpens parity's Prop. 3(b)); COMPUTED in 36 rows | none |

Nothing in round 2 has earned L2 or L3. Nearest: Corollary C1 (k = 1) on content, and the per-block part of Theorem 4,
both waiting on the primary sources (Bombieri 2000, Yoshida 1992) and, for L2, on the brief's three-refuter standard.

---------------------------------------------------------------------------------------------------------------
## 2. Disputes between a seat and its checker, settled

2.1 **Lemma B: folklore or in print?** In print (Braenden-Leake Lemma 2.8, read by me). Checker right.

2.2 **CD(rho, n) sentence.** Checker right; exact constant 1/2 - 2/n + (1 + 2/n)/m (hand and J9).

2.3 **"The curvature deficit sits in the window-edge terms" (curv, wall W-curv-5).** The seat's raw numbers reproduce
(smallest eigenvalue of the Hessian piece -0.0343, of the open-path piece -1.5691 at the centre; J5). They do not
support the sentence. Measured as the constant in Gamma_2 >= rho Gamma, in units of lambda_1 (J5, my own code):
squares only 0; squares + Hessian 0.2405; squares + open paths 0.1999; all three 0.5222 (centre). Edge site: 0,
0.0056, -0.2269, 0.4963. Removing the open-path term lowers the constant. Also the raw smallest eigenvalue depends on
the normalisation: restricted to f(x) = 0 it is -0.0337 and -0.0515 for the two pieces. Checker right; W-curv-5 as
worded is not a fact.

2.4 **"Both sum rules saturate; it creeps up to exactly 1/2" (curv).** The margins reproduce (5.59e-4, 1.56e-4,
4.99e-5; odd 3.21e-2 at M = 40, J14). By the determinant identity the even margin is det(Q_e)/|det N_e|, strictly
positive whenever the Weil block is. "Exactly 1/2" is a statement about a limit of box spaces; on a fixed window with a
positive Weil form the continuum margin is positive. Checker right.

2.5 **"The centre curvature tends to 1/2; the factor 2 is structural" (curv).** PROVED for the resampling model only
(Theorem C). For the prime chain the centre constant is 0.5061, 0.4965, 0.4908 at M = 80, 160, 320 (J15; 320 is new):
below 1/2 and falling. The minimum over sites is 0.4415 (M = 160) and 0.4302 (M = 320), and from M = 160 it is not at
the edge box (site 4 of 160, site 9 of 320). The total jump rate is 5.165, 5.871, 6.572, 7.269 at M = 20 to 160: it
grows by about 0.70 per doubling. Checker right: for the prime chain the statement is COMPUTED, and the value is not 1/2.

2.6 **Per-site negative index (curv).** 38/40, 50/80 reproduce; at M = 160 it is 4/160 for zeta and 0/160 for the
Beurling control (J6; histogram 4, 116, 34, 4, 2 sites with index 1 to 5). The seat's own kill line is met.

2.7 **Theta_t "best t = 0.05, worst -0.047" (cubic).** A 0.05-grid artefact. On a 0.001 grid: best t = 0.014 with
-0.01836 (L = 1, n = 12); t = 0.034, -0.03794 (n = 24); t = 0.057, -0.02170 (L = 0.5); Beurling t = 0.014, -0.02389
(J4). "No t works" stands.

2.8 **Random matrices, degree 1 (cubic).** Seat 11 of 12, checker 7 of 12 on its own instances. Different random
draws; the count depends on the instances. I did not rerun it. The reportable fact is "works for some, fails for
those with second eigenvalue above about -0.28 (checker)".

2.9 **Degree-2 certificate "exists" (cubic).** The seat's evidence (smallest eigenvalue 1e-12, solver status
"inaccurate") cannot separate 0 from 1e-9, because every P_k annihilates a. The checker's margins on the complement
of a (1.19e-3, 4.6e-4, 2.6e-4; two solvers) are the usable numbers. I did not rerun the SDPs.

2.10 **Right end of the feasible positions at L = 0.5 (parity).** Seat: "about [1.9996, 2.0085]". J2 (lead's builder):
N = 30: 2.0080 +4.74e-5, 2.0085 -2.86e-4; N = 60: 2.0080 +9.99e-6, 2.0085 -3.24e-4, 1.9996 +4.15e-7. Checker, N = 120:
2.0080 -1.6e-6, 1.9996 -1.04e-7. Since "infeasible in a subspace" is a true statement, the feasible positions lie
inside (1.9996, 2.0080). 2.0085 is infeasible in every basis. Checker right. The seat's qualitative claim (an interval,
2 within 4e-4 of its left end, most room near 2.0075) stands.

2.11 **Background sign change (parity vs lead).** Odd block: +0.0332, +0.0217, +0.0103, -0.0039, -0.0178 at L = 0.362,
0.366, 0.370, 0.375, 0.380 (N = 30); +0.0075 and -0.0066 at 0.370 and 0.375 (N = 60); checker +0.0055 and -0.0087
(N = 200). Even block 0.00106 on the whole range, 0.00063 at 0.40. So: negative at 0.375 (a true statement about the
window, up to arithmetic), positive at 0.370 in every basis tried up to N = 200 (an outer statement; 1/N extrapolation
+0.0046, HEURISTIC). The seat's "(0.37, 0.38)" is right and the checker's "(0.370, 0.375)" is sharper.

2.12 **Theorem A.** Checker right (1.2 above).

2.13 **"One parity block suffices: not found" (parity).** Found: Yoshida 1992 Prop. 1 via Suzuki p. 2. Checker right.

2.14 **Theorem 4's kill line, and C2's second half ("the signature of N cannot see one quartet").** New computation
(J17, J18; implementation B for zeta's prime-side form, 110 digits, int and half lattices, N = 30, 30, 40, 56 at
L = 0.5, 0.75, 1.0, 1.25). Surgery is exact and of finite rank: remove the real pairs +-gamma_1, +-gamma_2 and add the
quartet +-a +- ib with a = 17.578, using the closed-form transforms of the basis functions. Check of the
normalisation: zeta minus the two pairs stays positive definite (lowest eigenvalue 3.1e-11, 1.4e-21, 4.8e-38, 1.5e-64).

| configuration | negative squares of Q (even, odd) at L = 0.5, 0.75, 1.0, 1.25 | positive eigenvalues of N = pole - Q (even, odd) |
|---|---|---|
| zeta | (0,0) at every L | (1,0) at every L |
| control: the two pairs merged on the line (b = 0) | (0,0) at every L | (1,0) at every L |
| one quartet, b = 0.3 | (1,1) at every L; lowest eigenvalues -1.2e-3, -0.040, -0.097, -0.230 (even). Same counts for b = 0.05, b = 0.45 and for weight 3 on the quartet | (2,1) at every L: three in total (computed for b = 0.3 only) |
| two quartets (also gamma_3, gamma_4 -> 27.718 + 0.3i) | (2,1), (2,2), (2,2), (2,2) | (2,1), (3,2), (3,2), (3,2) |
| Beurling control (2 -> 2.1), L = 0.5 and 1.0 | (1,1) and (2,2) | (2,1) and (3,2) |

Facts: (a) the per-block count never exceeds the number of quartets and reaches it by L = 0.75; Theorem 4's kill line
is not met (this tests the theorem together with RH for the untouched zeros). (b) The round-1 kill line "a one-quartet
configuration keeps N at exactly one positive eigenvalue" is not met: N has three. (c) The exact relation is the
identity in 1.4: kappa_+(N) = kappa_-(Q) + [c^T Q_e^-1 c > 1/2] - [s^T Q_o^-1 s < -1/2]. A one-quartet configuration
has kappa_+(N) = 1 exactly when c^T Q_e^-1 c <= 1/2 and s^T Q_o^-1 s < -1/2 together; in the computed surgery rows
c^T Q_e^-1 c lies between 5.8e5 and 7e53. (d) The Beurling counts 3 and 5 reported by all three seats are 1 + kappa_-(Q).
Limits: finite subspaces, one implementation of the base form, a surgery configuration is not a system with a
non-negative prime side; whether C2's second arrow can be reversed in general stays open.

---------------------------------------------------------------------------------------------------------------
## 3. Numbers

Implementations: (L) lead's Arb builder r1_A/weil.py.txt; (B) seat parity's wb.py.txt; (C) parity checker's wc.py.txt;
(J) my own box matrix jbox.py.txt; seat and checker codes of cubic and curv. "Mine" = recomputed in this folder.

### 3.1 The lead's numbers (ideas #9, #10)

| claim | verdict | detail |
|---|---|---|
| #10: N = primes - arch has one positive eigenvalue at L = 0.5, 0.75, 1.0, 1.25; second eigenvalue -0.012, -9.1e-10, -2.1e-23, -2.5e-47; no primes: four at L = 1 | reproduced | (B), (C) for the first three rows; L = 1.25 by me with (B), J16: 5.668358, -2.4514e-47, -3.7731e-44, digit for digit. The second eigenvalue is basis dependent: -0.013284 (half lattice, L = 0.5), -1.74e-23 (N = 60, L = 1), -2.610e-47 (half lattice, L = 1.25). Beurling control: 3, 5, 9 positive eigenvalues at L = 0.5, 1, 1.25. |
| #9: "with no atom the form is negative from about L = 0.362" | reproduced with correction | Sign change in (0.370, 0.375), in the odd block; the even block is positive to at least 0.40. The lead's 0.362 is a linear interpolation between his values at 0.36 and 0.38, which belong to different parity blocks. |
| #9: feasible interval of the weight at 6, L = 1: [-1.15e-13, 1.78e-14] | reproduced with correction | Exact end points (generalised eigenvalues, 90 digits, J12): [-1.2504e-13, +1.8239e-14]; the lead's bisected values are inside by 8% and 2.4%. Upper end set by the even block, lower end by the odd block. Half lattice N = 60: [-1.051e-13, 1.520e-14] (checker). All are outer bounds. Control: at the Beurling base point no weight at 6 gives a non-negative form (best lowest eigenvalue -0.434). |
| #9: sieve digits n = 2..8: 2.0, 3.5, 4.5, 5.4, 6.2, 6.8, 7.4 | reproduced (seat and checker; not redone by me) | (B) int: 1.98, 3.47, 4.48, 5.39, 6.14, 6.80, 7.44; (C): 1.979, 3.456, 4.481, 5.384, 6.129, 6.782, 7.430; half lattice within 0.1. |
| #9 / N27: one atom at L = 0.5 is feasible only at x = 2.000; 1.994 and 2.014 fail; best weight 0.4895 | grid values reproduced; the claim "only at 2.000" not reproduced | 1.994: -2.18e-4; 2.000: +1.578e-5 with weight 0.489498. Feasible positions form an interval inside (1.9996, 2.0080); most room at about 2.0075 (+2.58e-4, best weight 0.5096). |

### 3.2 Seat "parity"

| claim | verdict | detail |
|---|---|---|
| Implementation B agrees with the lead's builder to 3e-50 entrywise; control 0.899 | reproduced (checker: third implementation, 5.2e-60) | Q(f) against 5000 zeros (1.1e-15): not redone. |
| Feasible positions "about [1.9996, 2.0085]" | not reproduced at the right end | See 2.10. |
| Joint feasible set at L = 1: scaled all-plus 0.1715, mixed up to 1.60 | reproduced on 8 of 26 patterns (checker: 0.1699, 0.1698, 1.595); not redone by me | Within the bisection factor. |
| Background fails first in the odd block | reproduced | 2.11. |
| Beurling control: 3 and 5 positive eigenvalues of N | reproduced | (B), (C), curv seat, curv checker, mine (J11: 5 at L = 1 in boxes). |

### 3.3 Seat "cubic"

| claim | verdict | detail |
|---|---|---|
| Ntilde, zeta L = 1 n = 12: 5.306, -0.0018, -0.035; Beurling 5.287, +0.020 | reproduced | Checker and mine (J11): 5.305946, -1.811519e-3, -3.467240e-2; 5.286899, +1.995303e-2. |
| Box matrix validated only by convergence | repaired by the checker | Digamma-side check to 10 digits; entries against 20000 zeros to 1e-6. My box matrix (built from Theorem E) agrees with both seats to every printed digit. |
| Bakry-Emery cubic: symmetric, T.a = H, every slice has 2 positive eigenvalues; rho_BE 0.590, 0.528, 0.482; Beurling 0.586, 0.523, 0.483; resampling 0.7, 0.6, 0.55, 0.525 | reproduced | Checker exactly; mine (J4, J9): symmetry 2e-16, T.a - H 7e-16, two positive eigenvalues per slice, worst P_k -4.138, -6.148, -2.215; resampling values equal the formula. |
| Theta_t: best t = 0.05, -0.047 | reproduced with correction | 2.7. |
| Cone certificate rho: 1.0005 (n = 12), 0.45 (n = 24) | reproduced by the checker; not redone by me | |
| Sign-constrained SDP margins 0.785, 0.776, 1.300, 0.658; Beurling L = 1 infeasible | reproduced by the checker (two solvers); not redone by me | Checker adds the two cases where the seat's solver failed: 0.73877, 0.67750. |
| Locality slack -5.800, -3.190, -2.300, -1.434, -0.8209 (n = 2..8), "two solvers" | reproduced with correction (checker) | "Two solvers" holds for n = 2, 3, 4 only. At L = 0.5, n = 8 the slack is only -0.069. Not redone by me. |
| Degree-1 family fails: 0.014, 0.036, 0.073 | reproduced by the checker | 0.014424, 0.035727, 0.072570. |
| Degree-2 certificate exists (zeta and a positive-window Beurling control); Beurling L = 1: 5e-3 | reproduced with correction (checker) | 2.9; Beurling 5.992e-3 with two solvers. |
| Random Lorentzian matrices: degree 2 for 12 of 12; degree 1 for 11 of 12 | reproduced with correction | 2.8. |
| Rigidity: identity 1.321e-2; singular form 1.07e-4 / 9.5e-9 | reproduced (identity); same size (singular form: checker 1.23e-4 / 3.7e-8 with another objective) | |
| CD(rho, n) values | reproduced with correction | 1.1. |
| "All entries but T_iii" mode; chain degree 3; L = 2 rows; the seat's smooth-function validation value | not checked | By nobody. |
| Nothing is interval-certified; impostor and theta-dial controls not run | true as stated by the seat | |

### 3.4 Seat "curv"

| claim | verdict | detail |
|---|---|---|
| lambda_1 4.303094; gap/lambda_1 - 1 = 3.36e-3; Bakry-Emery worst 0.4963, centre 0.5222 (L = 1, M = 40) | reproduced | Checker and mine (J11), every digit; M = 20, 80, 160 as well. |
| Bakry-Emery under refinement: worst 0.54, 0.50, 0.46, 0.44; centre -> 1/2 | reproduced with correction | 2.5: centre 0.4908 at M = 320; worst site not the edge from M = 160. |
| Beurling: 3 and 5 positive eigenvalues; gap 0.982, 0.914; Bakry-Emery 0.499 against 0.496 | reproduced | J11: 5, 0.9141, 0.4989. |
| Ollivier (Lin-Lu-Yau) minimum -0.14, -3.5, -6.2, -10.2; Dobrushin 0.60 -> 0.29 | reproduced by the checker with a different method (CDF formula); not redone by me | |
| Impostor 5.5% negative box couplings; dial n = 1.4: 14.6% | reproduced by the checker (5.51%, 14.62%); not redone by me | The lead's "51% of the impostor's couplings negative" counts coefficient signs, a different quantity. |
| Even and odd sum-rule margins | reproduced | J10, J14. Reading corrected in 2.4. |
| Bochner pieces: identity to 3e-14; raw smallest eigenvalues -0.034, -1.57 | reproduced; the conclusion drawn is not supported | 2.3. |
| Calibrated constant 0.792 (zeta), 0.769 (Beurling) | reproduced | J14: 0.7923 at (0.299, 0.210), 0.7694. |
| Hankel form: arch 0 negative; zeta -1.12, 9 of 20; Beurling -1.17 | reproduced | J14. The seat kept no log file for this run. |
| Per-site index 38/40, 50/80 | reproduced; fails at M = 160 | 2.6. |
| Exact calibration: rank 36 of 39, overlap 0.955 | not checked | By nobody. |
| Dial runs with unadapted constant and pole terms for n != 1 | not checked | Stated by the seat. |

---------------------------------------------------------------------------------------------------------------
## 4. Corrections to the lead's notes (ideas #8 to #11, notebook N24 to N32) and to round 1

1. Idea #9 log and N27: "positivity is possible only if the atom sits at 2.000". Not so at L = 0.5: every position in
   an interval inside (1.9996, 2.0080) is feasible in the bases tried, with most room at about 2.0075. What holds:
   2 is within 4e-4 of the left end. "The Gamma factor knows the first prime is exactly 2" is too strong on this window.
2. Idea #9 log: "with no atom the form is negative from about L = 0.362". The sign change is in (0.370, 0.375), and it
   is in the odd block; the even block stays positive to at least L = 0.40.
3. Idea #9 log: the interval at 6 is [-1.2504e-13, +1.8239e-14] in the lead's own basis; every interval and every
   "digits pinned" figure of idea #9 is an outer bound from a truncated basis.
4. Idea #11 and N29 step 3: "N has at most one positive eigenvalue iff the gap is at least lambda_1" needs
   lambda_1 > 0. For L <= 0.10 the top eigenvalue of N is negative (-0.073 at L = 0.10) and N has no positive direction.
5. N25: the local-to-global step for one Hessian with negative diagonal needs no sign condition on the cubic tensor,
   and it is in print (Braenden-Leake Lemma 2.8).
6. N29 step 5 ("close to resampling at rate lambda_1"): the box chain's total jump rate is 5.17, 5.87, 6.57, 7.27 at
   M = 20, 40, 80, 160; it grows with refinement. The resampling-exact calibration alone gives 0.4555, below the plain
   0.4963. The picture is HEURISTIC and these numbers do not support it.
7. N32: "seat R2-curv showed the factor 2 is structural". Proved for the resampling model only. For the prime chain the
   computed constant is not 1/2: centre 0.4908, minimum 0.4302 at M = 320, still falling.
8. Wall W-curv-5 ("the deficit is carried by the window edge") should not be carried forward as a fact (2.3).
9. KEY_LEMMA_SHAPE "Honest status" and KNOWLEDGE (Suzuki row): "no first-failure / null-vector argument found in
   Suzuki 2026". Suzuki's paper states the existence half: p. 2 and the paragraph after Theorem 1.3 (failure of RH is
   equivalent to a degenerate element at some a; Yoshida 1992 Thm 2). "No monotonicity found": it is immediate from
   Suzuki's Corollary 1.2.
10. Round 1, WJ13: "each quartet costs one negative square per block" is now PROVED for L >= L_0 (Theorem 4), and each
   block inequality alone is equivalent to RH (Yoshida 1992 Prop. 1). Round-1 next step 4 asked for the count "via
   Krein-Langer extension"; it is not needed.
11. Round 1, WJ13 and its kill lines: the linear-algebra relation between the signature of N and that of Q is not only
   the inequality "kappa_-(Q) <= kappa_+(N) + 1": it is an identity with two indicator terms (1.4, 2.14). On surgery
   configurations of zeta with one quartet, N has three positive eigenvalues, so the statement "one positive direction of N
   allows one off-line quartet" describes what the inequality permits, not what was observed in any computed case.
12. Round 1 / idea #20 context: the count "negative squares = distinct off-line zeros" is not new; it is printed in at
   least one unrefereed document, which credits Bombieri 2000 with the upper-bound half. KNOWLEDGE lists Yoshida 1992
   and Bombieri's paper as "not yet read"; they still are.

---------------------------------------------------------------------------------------------------------------
## 5. Prediction record

Hard evidence of order exists only where a git commit separates prediction from result: commit 1e3f60a (22:47:54 UTC).

- **cubic**: 13 rows (P1a to P12). Hits 5 (P1a, P3, P4, P5, P10); misses 8 (P1b, P2, P6, P7, P8, P9, P11, P12; P9 and
  P12 are part hits). Order verified by the commit for P5 and P6. P1 to P4 and P7: their logs are in the same commit,
  so not provable. P8 to P12: no snapshot; consistent with file times, not provable. Controls computed: Beurling in
  P1b, P3, P5, P9, P10, P11; random matrices in P12; none for P2, P4, P6, P7. Impostor and dial not run (stated).
- **curv**: 14 rows. Hits 7; misses 7. The commit holds the 22:38, 22:44 and 22:47 prediction blocks and no result
  section, so the Hankel prediction is verified as written before its result was recorded (the run has no log file).
  The 22:38 and 22:44 blocks precede their logs by file time; the logs are in the same commit. The per-site index
  (typed 22:51) and exact-calibration (typed 22:53) predictions: their logs are stamped 22:50:35 and 22:51:47 by the
  system and the file was last written 22:52:03 although it contains a line typed "22:54". Typed times ran ahead of
  the system clock, so the order of these three rows cannot be verified either way. All reported controls were computed.
- **parity**: 11 rows. Hits 5 (P1, P2, P3a, P5, P6); misses 6. One commit, one file time: order not provable; written
  times are consistent with file times. The control named in P5 had no log line; I ran it (J12: best lowest
  eigenvalue -0.434 at the Beurling base).
- **checkers**: each reports writing its expectations before its runs; two of the three (cubic, curv) note that their
  first typed clock times were estimates or ran ahead of the system clock, and corrected them in their files.
- **mine**: 18 predictions, all written before computing (J12 to J18 with times from the system clock; J16 to J18
  with the time written by a command). 14 clean hits; J13 missed at first run because of my own threshold and hit on
  the corrected rerun; J15 hit on the values and missed on which site is worst; J17 hit except my guess at L = 0.5
  (I guessed the quartet would not be seen there; it is); J18 hit except one row (two quartets at L = 0.5). Most were reproductions of values on which seat and
  checker already agreed, so they carry little information; the ones that settled something are J1, J2, J3, J4, J5,
  J6, J9, J15, J16, J17, J18.
- Predictions made after the fact: none proved. Three curv rows and all of parity's and most of cubic's cannot be
  shown to have come first.

---------------------------------------------------------------------------------------------------------------
## 6. Literature (rule 5): queries, sources, how much read

Read in extracted PDF text, with my own eyes:
- Braenden, Leake, "Lorentzian polynomials on cones", arXiv 2304.13203v2: Lemma 2.8, its proof, the credit line
  (about 50 lines; nothing else).
- Suzuki, "Weil's quadratic form via the screw function", arXiv 2606.09096v3: the lines on Yoshida and Bombieri on
  p. 2, Theorem 1.1, the text around (1.7), Corollary 1.2, Theorem 1.3 and the paragraph after it (about 80 of about
  2100 lines). Session 1 also searched the whole text for "negative square", "Pontryagin", "monoton": no hits.
- "How the two-thirds argument was found: two agent runs and their literature" (PDF hosted on www-cdn.anthropic.com;
  its first page says the mathematics in it has not been independently verified). About 150 of about 5400 lines: its
  Theorem 1 (global signature: negative index = number of distinct zeros with Re > 1/2, hyperbolic-pair proof,
  nondecreasing finite-level index tending to it) and its statements that Bombieri 2000 has the negative-index half
  for large truncations. Searched its text for "parity", "even block", "odd block", "even functions", "odd functions":
  no hits. It is not a refereed source; it shows the statement exists in print, and it points to Bombieri 2000.

Web searches in session 2 (result summaries only):
1. "Weil explicit formula quadratic form restricted to interval number of negative eigenvalues equals number of zeros
   off the critical line Bombieri 'Remarks on Weil's quadratic functional'": refused (weekly search limit).
2. "Weil positivity 'negative squares' OR 'Pontryagin space' zeros off the critical line finite number hermitian form
   explicit formula Burnol OR Bombieri OR Yoshida": returned the document above and general Pontryagin-space papers.
3. "Bombieri 'Weil's quadratic functional' restricted support interval negative eigenvalues finitely many zeros off
   critical line 'negative' index truncation": returned Suzuki 2606.09096, arXiv 2608.24827, 2602.04022 and others
   (summaries only; none says anything about a negative-index count).
Session 1 ran one more search; its query was not saved before that session stopped.

Not opened by anyone in the project: Bombieri 2000 (Rend. Lincei), Yoshida 1992, Schmuckenschlaeger 1998 (the last
is cited on the checker's reading).

---------------------------------------------------------------------------------------------------------------
## 7. Not done

- No interval-arithmetic certification of any inequality (mine are 40 to 110 digit mpmath or double precision).
- SDP results of seat cubic: reproduced by its checker only.
- Ollivier and Dobrushin numbers, impostor and dial fractions: reproduced by the curv checker only.
- Exact-calibration rank and overlap; cubic's chain-degree 3, "all but T_iii" mode, L = 2 rows: checked by nobody.
- J17 and J18 use one implementation of zeta's form (B) and one position of the quartet (plus one second quartet);
  no scan over heights, and no window above L = 1.25.
- The domain facts behind PROOF_first_failure (the seat's assumption CORE) were checked by the parity checker against
  about 15% of Suzuki's text; I re-read only the lines listed in section 6.
