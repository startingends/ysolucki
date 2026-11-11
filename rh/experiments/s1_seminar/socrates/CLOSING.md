# Seminar S1: closing summary (moderator S1-socrates, 2026-11-11)

Board `s1`, posts B1 to B216, then the closing note (rh/board/s1.md). Opened by the lead on idea 21 (mirror positivity as a bridge to the
shift inequality). Seats: S1-cubic, S1-curv, S1-parity, S1-mirror, lead; from turn 2 SP-reflection, SP-operator;
later K-atlas, FORMAL, SP-modular. I asked 30 questions and wrote 2 notes. I rank nothing below: this is a record
of what was asked, what came back, and who said it. "PROVED" is the author's label unless a check is named.
What I did not read: the seats' own files except where named; the Lean sources; the foothold seat's certificates.

## 1. The questions, in order, and what the answers turned out to be

| # | asked by -> to | question | answer (who, where) |
|---|---|---|---|
| B3 | lead -> all | weakest statement "mirror + Gamma + integers => block inequalities" not false for Beurling? | No such statement with those hypotheses: F_d = zeta(s-d)zeta(s+d) satisfies all of them and has no zero on the line (S1-mirror B15); Beurling passes the same hypotheses (S1-curv B31). Idea 21 killed by the lead (B69). |
| B4 | me -> mirror | which way does the bridge's inequality point? | Mirror positivity gives only an ordering N(f_o) <= N(f_e); RH needs upper bounds (B17). Exact form: positivity on [-L,L] <=> \|H_W\| <= T_W on (0,L] (B60; same algebra S1-curv B31, S1-parity B25). |
| B5 | me -> mirror | one prime: is the shift inequality true? | The one-prime system passes every hypothesis of idea 21 and fails from L in (0.54, 0.56), odd block first (B18; reproduced S1-parity B43). |
| B6 | me -> mirror | test about zeros or about local roots? | Local roots. L(chi)L(chi-bar) mod 5: c(4) = -2 log 2, min eig -3.89 (B16, second route B23); lead had predicted it (B12). |
| B7 | me -> curv | restate wall W-curv-3 | "One reflection, two test spaces" (B29, B27); one positive point in the window L = 1. Later named: Widder's theorem, extended to distributions (SP-reflection B146). |
| B8 | me -> curv | edge term = mirror form? | Integrated open-path term is a Hankel-type form with a moving mirror (F2); cosine 0.92 with the D5 form; parity difference of integrated Gamma_2 is the mirror form dressed by lambda_1 - T (F3) (B30). |
| B9 | me -> cubic | is the end pair the obstruction; integers used? | End pair not special; every pair fails alone; nothing in the seat uses integers or Euler product (B51, B105). |
| B10 | me -> parity | does one block inequality give the other via D5? | No; exact missing term; the m = 0 Gamma square cancels half the pole; no proof step uses integers (B25). |
| B11 | me -> lead | is the hypothesis list just "F is zeta"; what is the new input? | At zeta yes; new input "nothing proved" (B12). |
| B33 | parity -> cubic | does the odd block of Ntilde keep the sign? | Lost exactly at prime mirror entries; kept with no primes; odd block borrows Perron from the whole (B52). |
| B34 | parity -> mirror | any phi in L^2 with mirror positivity of primes? | Only bumps narrower than about e^(-2L), i.e. at or above the horizon (B45). |
| B35, B41 | parity <-> curv | definitions of the Hankel matrix; meaning of t_e | B53 (basis, drift of -1.12 to -1.63); t_e = Krein Q-function at 0, exact count formulas (B56). |
| B40 | curv -> mirror | mirrors at other points; a third test space? | Each mirror has its own comb; no third test space; half the directions negative because of the zeros (B54). |
| B42, B66 | curv <-> cubic | "summed" certificate; two-halves constant | Block-averaged curve (1+3 theta)/(2+2 theta), zeta on it (B62); 0.838 on the fibre-free chain; deficit in the mirror-crossing term (B97). |
| B48, B67 | mirror, cubic -> parity | sign pattern of feasible intervals; is nodelessness a property of zeta? | Reduces to Fact 1 + Fact 3 + "folded ground states one-signed" (B58); on 11 positive rows incl. the impostor: conjecture "block >= 0 => nodeless", not sufficient (B119). |
| B49, B65 | mirror <-> cubic | one fibre node?; which blocks does a mirror mechanism test? | One-field form with E = e^(\|x-y\|/2) (B63); a mirror mechanism is an odd-block mechanism, no window-by-window route to the even block (B95). |
| B50 | mirror -> lead | which of positions / completeness / weights is barrier B10? | Positions only; the other two recorded as new (B69). |
| B70 | lead -> mirror | kink at d = 0? | No: analytic in d^2, lambda(d) = lambda(0) - c(L) d^2; first failure d = 7.9e-6 at L = 0.75 (B90; S1-parity B91). |
| B71 | me -> lead | "not about the integers at all" against the one-prime and Beurling rows | Withdrawn; list of necessary items with one control each (B111). |
| B72 | me -> mirror | does "one pole" separate from "roots of modulus 1"? | Yes: G_d = zeta L(s-d,chi_4) L(s+d,chi_4) has one pole and zeros off the line (B81); it fails the window form at L = 0.846 (S1-parity B118). |
| B73 | me -> parity | which part of the kernel knows d = 0? | Each single tilt fails earlier than the consistent one; "the window tests mutual consistency of the three parts" (B113); L_d ~ (1/2) log log(1/d) (B112, B113). |
| B74, B83 | me, mirror -> SP-reflection | condition on c equivalent to roots of modulus 1 | Positive definiteness for the OTHER involution (Toeplitz/Herglotz); finite tests; all prime by prime (B117, B120). |
| B75, B84 | me, mirror -> SP-operator | is the doubling step known; a kernel-side theorem? | Toeplitz +- Hankel (Basor-Ehrhardt); no kernel-side theorem known; for F_d the failing hypothesis is "symbol is a positive measure on the real axis" (B122, B123). |
| B76-B78, B87 | me -> parity, curv, mirror, cubic | nominations for machine check | B92, B98, B82, B109; then FORMAL B141-B144, B166, B167, B173, B189, B190, B192. |
| B79 | me -> SP-reflection | reconstruction with one wrong-sign square | Pontryagin index 1 on the comb; no theorem relating comb (real exponents) and L^2 (imaginary exponents) (B121, B146). |
| B80 | me -> SP-operator | the operators T_m; is d = 0 an operator identity? | T_p is a projection for zeta, T_p^2 = T_p <=> c(p^(k+1)) = c(p^k); cannot extend to the window (B124). |
| B86 | me -> cubic | Lemma A for F_d | Four fibre nodes, target "two positive eigenvalues"; d = 0 is a rank drop on the pole side only (B108). |
| B89 | me -> mirror | one test that F_d, G_d and the 1.01 control fail | "Rank one per prime, root of modulus 1": c(p^2) = c(p^4) = +-c(p^3) > 0; it is B50(iii) split into named parts (B96). |
| B93, B115 | parity, cubic -> SP-operator | are B56, Theorem 4 known; a t-indexed certificate? | Haynsworth; Krein-Langer; RH <=> q in N_1 (B125, B131); de Branges chain exists while Q_t > 0, vacuous as existence (B127). |
| B100-B102, B107 | curv -> operator, reflection, parity, cubic | Bernstein constant; two involutions; cross-check of slopes | Norm of differentiation in H(E_L), no kernel bound (B126); reflection-positive <=> lambda >= 0, window theorem does not apply (sign) (B129); slopes confirmed to 8 digits from the zeros (B136); 0.05 heuristic withdrawn (B110, B114). |
| B116 | cubic -> SP-reflection | an infrared bound giving an upper bound? | None found; hypotheses sit on the mirror side (B130, B139). |
| B134, B138 | operator <-> reflection | Widder for distributions; Suzuki's Hankel kernel; determinacy | B146; K_d[t] not >= 0, infinitely many continuations at every window (B150). |
| B135 | operator -> parity | t_1(L) and its log-derivative at prime entries | Table for zeta and the impostor (B159). |
| B147-B149, B188 | K-atlas -> mirror, parity, curv | F_d as Eisenstein L-function; missing prime; one-zero tilt; (N)+(C) splitting | B178 and SP-modular B211; B170, B209; B184; B207 (splitting fails on 3 of 7 failed rows). |
| B151, B152 | me -> parity, operator | check B140; what is published on the no-prime window | Odd block on a no-atom window is a Perron operator: theorem with proof (B169; independently B163; S1-mirror B174). Full-form positivity on the whole no-prime window: computed, not proved in the digests read (B163(d)). |
| B153, B160 | me -> mirror, K-atlas | what a one-signed ground state forces about the first prime | First-prime lemma (B174); one-vector version with explicit polynomial (B168); overlap sorted in B179. |
| B154 | me -> lead | two intervals for the weight at 2; is the one-prime candidate more than Fact 3? | His interval was a projection; nothing beyond Fact 3; candidate withdrawn (B165). |
| B155 | me -> curv | edge strips for the prime 2 | Proved bound, closes numerically only for 2L - log 2 <= 0.029; no control fails it (B183, B185). |
| B156 | me -> cubic | even block: which eigenvector; t*(L) | Second eigenvector; Fiedler says nothing; t* >= 1 on 13 of 13 positive rows, by a margin shrinking under refinement (B180). S1-curv: t* is the even/odd level crossing (B201). |
| B157 | me -> FORMAL | Perron step in mathlib? | No; P1-P3 typed and machine-checked (B187, B189). |
| B158 | me -> all | name ONE statement (provable now / not in the papers / violated by a control) | Lines from SP-reflection B161, SP-operator B164, S1-parity B172, S1-mirror B175, S1-cubic B181, S1-curv B185. Every holder reported which of the three conditions its statement fails; the one line offered with violating controls is S1-mirror's B175 (odd-block Perron + first-prime inequality), whose author adds "it selects nothing". No single statement was agreed. |
| B177 | FORMAL -> curv | sign of the even margin in F1(a) | Objection B193 with a machine-checked counterexample; accepted (B198). |

## 2. Statements labelled PROVED in the seminar

| statement | where | checked by |
|---|---|---|
| D1: [Lambda(ab)] on a,b >= 2 is a sum of squares, one per prime | r2_curv/PROOF_bochner_parity.md; B27 | FORMAL B141; round-2 judge |
| Mirror criterion, a,b >= 2 (Theorem 2) and Corollary 3 | s1_seminar/mirror/PROOF_mirror_criterion.md | Thm 2 read line by line by SP-reflection (B120); Cor. 3 real-root case FORMAL B141; negative-eigenvalue count and complex roots not formal. Cor. 3 = Hermite-Jacobi (B137) |
| Twist invariance of mirror positivity; F_d obstruction | B13, B15 | Schur product theorem (B137); numbers by S1-parity B91, B112; identification with Eisenstein series SP-modular B211 |
| Dial n = 4: exactly one negative square from the factor at 2 | B16 | independent proof S1-parity B23 |
| Folding identity; two-sided bound T + 4s^2 <= H <= 4c^2 - T; m = 0 cancellation | B25 (parity NOTES D), B31 (curv F4), B60 | folding FORMAL B142; three seats independently |
| Count formulas kappa_+(N_e) = kappa_-(Q_e) + [t_e > 1] etc.; Lemma A count; B32 | B56, B32; r2_cubic/PROOF_trickle.md | FORMAL B166 (T32), B167 (T50), B142 (Step 2). Known: Haynsworth, Krein-Langer (B125, B131) |
| Fact 1, Fact 3 (first-order caps) | B58, B92 | FORMAL B142 (T45). The equality "caps ARE the intervals" is computed only (B92) |
| Lemma B Perron step; Lemma C; trickle inequality | r2_cubic; B36 | FORMAL B144, B190 (except the spectral-theorem step). Lemma B = Braenden-Leake 2.8 |
| Pair bound B51(b); block curve and block Lemma B (B62); r-block certificates (B104); one-field form (B63); Lemma A for F_d (B108) | s1_seminar/cubic/TURN1-3.md | no second seat; rho_half reproduced numerically by S1-curv (B97) |
| Twist identity Q_d(f) = 2Q(e^(dx)f, e^(-dx)f); F_d >= 0 <=> tanh(dx) is a contraction in Q | B90, B99 (G1), B103, B133 | four seats independently; zero-side numbers to 8 digits (B136) |
| F1 formulas, F2, F3, G2, G4, H1 (edge strip), H3 (derivative lemma, given hypotheses) | s1_seminar/curv/S1_ADDITIONS.md | F1 formulas FORMAL B143; Theorem B3 FORMAL B173; F2, F3, G4, H1, H3 not checked by a second seat |
| Toeplitz test for root size; boundedness tests; Helson positivity of zeta^t iff t <= 1; q_d as moments of a product measure; Widder for distributions | B117, B120, B138, B146; rh/specialists/reflection/ | none posted |
| T_p idempotent at d = 0; window space is a de Branges space while Q_a > 0 (P1); RH <=> q in N_1 (P4); multiplier form of B11 | B124, B131, B125, B133; rh/specialists/operator/PROOFS.md | none posted (B124 agrees with B117, B120) |
| Odd block on a no-atom window: simple lowest eigenvalue, one-signed eigenfunction | S1-parity B169 (NOTES Q); SP-operator B163 (PROOFS.md P7); S1-mirror B174 | three independent write-ups; finite Perron step FORMAL B189; existence of a minimiser is cited, not proved; continuum statement not formal |
| First-prime lemma: sign and lower bound for the weight of a repairing atom | s1_seminar/mirror/PROOF_first_prime.md; B174; one-vector form K-atlas B168 | P3 FORMAL B189; the recomputation of 1.0966 asked in B179 was not posted |
| Theorem U' (any summable atomic perturbation fails on some window) | s1_seminar/parity/PROOF_Uprime.md; B170, B195 | RH half checked earlier (checker, judge); the new line not checked; overlaps Johns Prop. 3.2 (B195) |
| Barta-type bracket for the critical pole strength, given (F) | lead B186 | S1-cubic B191 |
| Plank 5 (Theorem 5.1), plank 7 (Thm 7.1, Cor. 7.2), plank 6 (Prop. 6.2) | rh/specialists/operator/PROOF_bridge.md; B205, B206, B208 | numerics to 13-15 and 48 digits by the same seat; no second seat |
| The impostor has a Poisson map; kappa_K -> 0 for fixed companions | S1-mirror B199; S1-parity B204 | none posted |
| Maass-Selberg / pseudo-Eisenstein identities; F_d, G_d violate only (H2); Weil form at constant terms f_F (a third test class); theta dial: 2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8) | SP-modular B211-B216; rh/specialists/modular/ (PROOF_dial.md) | none posted; dial identity nominated to FORMAL in B215, not taken before closing |
Referenced, not posted by its authors: the foothold seat's two computer-assisted theorems (rh/experiments/foothold/
PROOF_window_prime2.md, PROOF_forcing_prime2.md); S1-parity's second-route check B196 reproduces the numbers and
does not cover the Arb certificate; two quoted Rayleigh-Ritz values in those files were not reproduced (B196).

## 3. Withdrawn or refuted, with the post that did it

(Correction of my own closing note B217, which says "30 items are listed": the table has 23 rows, several of
which bundle more than one statement, about 39 statements in all. The board was closed before I counted.)

| statement | whose | by |
|---|---|---|
| Idea 21, claim "mirror positivity tracks zeros on the centre line" | lead | dropped by S1-mirror B16 (lead agreed in advance, B12) |
| Idea 21's bridge | lead | F_d (B15), one-prime (B18), Model A/B (B19, B46, B47); killed B69 |
| "The hypothesis the bridge was missing is not about the integers at all" (B69) | lead | withdrawn B111 |
| Split of the list into root size and root phase; "d4 tighter than d2" (B111) | lead | withdrawn B128 |
| "Exactly one pole" as a necessary item | lead / S1-mirror B45 | dropped B111; hope withdrawn B81 |
| Barrier B11's "F_d fails only the size of its roots" | lead | corrected by S1-parity B118 (three tilts; G_d is the witness) |
| One-prime contraction as a candidate; interval [-6.9e-11, +3.4e-13] quoted for the axis | lead | withdrawn B165 |
| "Feasible only at x = 2.000"; background fails "between 0.36 and 0.38" | lead | S1-parity B21; then (1.9996, 2.0080) B57, B61 |
| B140: anti-maximum principle for the even block; "t*(L) >= 8 whenever the block is >= 0" as an even-block statement | lead | B180 (does not obviously apply); B201 (it compares the two blocks) |
| Bridge 1: impostor "has no Poisson map" (expectation in plank 9) | lead | S1-mirror B199 |
| Bridge 1, plank 10 (intruder level) and plank 12 (oscillation of the ratio) | lead | FAILED, rh/BRIDGE.md; a statement to the owner based on an integration error withdrawn (plank 4) |
| W-curv-3 as "primes reflect coordinatewise, Gamma totally" | S1-curv | B27, B29 |
| Sum rules "saturated"; centre constant "tends to 1/2"; "deficit in the edge terms"; per-site index; Theorem A without lambda_1 > 0 | S1-curv | conceded B28 (checker), B202 (judge) |
| F1(a): "both margins strictly positive when the Weil block is" | S1-curv | FORMAL objection B193, accepted B198 |
| Heuristic "nu x mu stays near 0.01" (B102) | S1-curv | own B106 |
| "Certificates are maximally non-local"; "non-degenerate" in B63; heuristic d = 0.05 at L = 1 (B103) | S1-cubic | B51/B64; B109; B110, B114 |
| "(F) holds exactly when the even block is >= 0" (B181) | S1-cubic | own B191 |
| "The caps ARE the feasible intervals"; right end 2.0085; L = 0.70 rows; novelty of first-failure items; Beurling-Deny "obstacle" of B119 | S1-parity / S1-mirror (L = 0.70 rows) | B92; B57; B55; B57; B169 |
| Theorem U' as a candidate | S1-parity | own B195 |
| "No intrinsic condition gives the lower half of Ramanujan" (B83) | S1-mirror | SP-reflection B120 |
| Threshold 1e-3 for the rung count; "a Hankel term remains on the window" (B206) | SP-operator | B145; own B208 |
| "Mirror positivity holds exactly where Hecke operators exist" (pairing sentence of the roster, as quoted in B216) | roster | SP-modular B216(5); also its own shortened quotation in B214(4) corrected there |
| Conjecture B119 in the weight family (odd block >= 0 with a node at weight 0.6, L = 0.497) | S1-parity | contested by S1-curv B197, offered "to be recomputed"; not recomputed |

## 4. Open when the board closes, and the seat best placed

1. Recompute S1-curv's rows against conjecture B119 (B197) and the overlaps of (ground state)' with the other block's ground state at L = 0.75, 1 for zeta: S1-parity.
2. Is the sixth rung of F_d at L = 1 negative on the window (truncation or rung interaction, B171)? Spectrum of the pencil (tanh(dX) Q_o tanh(dX), Q_e): S1-parity with S1-curv.
3. What the primary sources prove on the full no-prime window (Yoshida 1992; Connes-Consani 2006.13771), B163(d): a reader seat.
4. Lower bound for (phi*phi)(log 2) of a one-signed phi in terms of E_+^2 minus the Gamma squares (the cone statement (C) on (1/2) log 2 < L < (1/2) log 3; B188, B207): K-atlas with S1-parity. SP-operator's question whether the doubling step's extremal vector is a Perron vector (B164) was not answered: S1-mirror.
5. Is candidate (F) (N_e^(-1) cosh one-signed) provable on the one-prime window, given that it is as sharp in the weight as positivity (B191)? S1-cubic with the foothold seat.
6. Closed form of the de Branges chain on the no-prime window (B127; Burnol unread): SP-operator.
7. Recomputation of the Beurling number 1.0966 of the first-prime lemma (B179): K-atlas or S1-parity. Uniform window for a missing prime q (B170): S1-parity.
8. Second implementation of the impostor's ladder and explicit impostor vectors (B199); rerun of e27 with smooth companions (B206): S1-parity, lead.
9. Tensor powers W(u)(2cosh du)^j beyond first order (B178); the table c_gamma(L) per zero (B184): S1-mirror, S1-parity.
10. "At which window is a given non-real spectral point first counted" (B93, B125, B162): SP-operator. "Zero margin <=> no Szego condition <=> determinate in the limit" as a theorem on the line (B161, B150): SP-operator.
11. A quantity that is a correlation of the product-measure family behind q_d (SP-reflection's question to all, B139): unanswered by every seat.
12. Novelty not established: Theorem 5.1 (Burnol to be read), first-prime lemma (no web search), Theorem 2 with the term w (BCR Ch. 8 unread), the U' dichotomy.

## 5. The one question I would put to the next seminar

Given where bridge 1 ended (the near-null ladder comes from the functional equation alone and the impostor has it;
the bulk below the band edge 2 pi e^(2L) is where a window function can resolve zeros; the next hunch must use the
functional equation together with something the impostor lacks) and given notebook N42 (a zero-free half-plane
Re s > 7/8 reported proved in October 2026 from a power saving for smoothed Moebius sums, as summarised second-hand):

**In the Moebius-inverted coordinates of plank 7 (f = Z psi on the window, psi = Z^(-1) f a finite Moebius sum of f;
Corollary 7.2, B208), what is the first inequality, written so that it can be typed, in which the functional
equation and the Moebius inverse both appear in the same line and which concerns a window function living below
the band edge; and when that one line is run on the impostor (functional equation, no Moebius function), on the
one-prime system (Moebius inverse, no functional equation) and on F_d and G_d, at which symbol does each of them
stop being true?**

Sub-questions that make it answerable, in the seminar's usual order. Definition: what exactly is "a window function
below the band edge" as a subspace or a cone one can build (S1-mirror's B200 and S1-parity's B209 give two
vectors: the bottom rung, and the impostor's null vector at frequency 86 against a band edge of 78 to 92). Smallest
case: the window with only the prime 2, where Z has two terms. What would change a mind: which number, computed for
zeta and for the impostor on that line, must differ, and by how much. And the question nobody wants: if a power
saving of exponent theta for Moebius sums is the input, is the line's conclusion on windows anything other than the
damped statement of N42(b) (the Weil kernel times e^(-(theta - 1/2)|u|) positive definite), and if it is only
that, in what sense is it a statement about zeta's own window form?
