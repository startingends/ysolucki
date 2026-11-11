# PROOF_Uprime: unconditional uniqueness of the weights inside the summable class, and its exact relation to Johns's preprint

Seat S1-parity, seminar S1, turn 3 (2026-11-11). Written for the verification track. Labels: PROVED / CITED / KNOWN.
Board: claimed in B170 and B172. Depends on two files of the seat I speak for, both line-checked by the checker
R2-parity-ref and the judge: `rh/experiments/r2_parity/PROOF_uniqueness.md` (Theorem U, theory entry T43) and
`rh/experiments/r2_parity/PROOF_parity_index.md` (Theorem 4, Steps 1 to 4).

## 0. Setting (as in PROOF_parity_index.md, section 0)

* D = C_c^infinity(R), complex valued. fhat(z) = int f(x) e^{izx} dx. g_f(u) = int f(x) conj f(x-u) dx (autocorrelation);
  |g_f(u)| <= ||f||^2 (Cauchy-Schwarz), ||.|| the L^2 norm.
* Zeros rho = 1/2 + i gamma of zeta, multiplicity m_gamma. Zero-side form
      Q(f) = sum_gamma m_gamma fhat(gamma) conj fhat(conj gamma)        (absolutely convergent on D).
  CITED (Weil's explicit formula, theory entry T1): Q = pole + arch - primes, the prime part being
  Pi(f) = sum_n Lambda(n) n^{-1/2} (g_f(log n) + g_f(-log n)). Only the zero side is used in the proofs below; the
  explicit formula is used only to READ the statement as one about weights.
* A PERTURBATION is a real measure D = sum_j d_j (delta_{u_j} + delta_{-u_j}), u_j > 0 pairwise distinct, d_j real,
  0 < sum_j |d_j| < infinity. It acts on f by D(f) := sum_j d_j (g_f(u_j) + g_f(-u_j)) = 2 sum_j d_j Re g_f(u_j).
  Changing the prime-side weights from Lambda(n) n^{-1/2} at log n to any real weights m_n n^{-1/2}, at any
  positions, with sum |differences| finite, is the form Q + D with such a D (d_j = minus the change of weight).
* Z = set of distinct gamma with Im gamma > 0; RH <=> Z empty. Q^+ = the part of Q from real gamma (>= 0).

## 1. Statement

**Theorem U'.** For every perturbation D (section 0) there is f in D with Q(f) + D(f) < 0. No hypothesis.

**Corollary.** Let W be the set of weight systems (positions u_j > 0 and real weights) whose difference from
von Mangoldt's system is a perturbation or zero. The set of elements of W whose form is >= 0 on D (equivalently:
on every window) is {Lambda} if RH holds and is empty if RH fails.

Proof of the Corollary from the Theorem. A system other than Lambda has form Q + D with D != 0: not >= 0 by the
Theorem. Lambda itself has form Q, and Q >= 0 on D <=> RH (CITED: Weil 1952; the direction "RH false => Q(f) < 0
for some f in D" is also Theorem 4, Step 4 with k = 1, and "RH => Q >= 0" is Q = Q^+). []

Covered by the Theorem: one prime q removed (D has d = +log q q^{-k/2} at k log q, sum finite); one weight changed;
finitely many atoms moved (Beurling 2 -> 2.1: remove the powers of 2, add the powers of 2.1). NOT covered: the real
tilts F_d, G_d of the seminar (the Gamma factor or the pole changes; and sum Lambda(n) n^{-1/2}(cosh(d log n) - 1) diverges).
The Theorem names no window and gives no rate.

## 2. Proof of Theorem U'

**Case 1: RH holds.** This is Theorem U (PROOF_uniqueness.md): if Q + D >= 0 on D then D = 0. Its three steps, for the
reader: (1) D(f) = int |fhat(r)|^2 E(r) dr with E(r) = (1/pi) sum_j d_j cos(r u_j), bounded and continuous;
(2) localisation f_T(x) = phi(x/T) e^{-i r_0 x} at a real r_0 that is not an ordinate: Q(f_T) = O(T^{-6}) because all
gamma are real and discrete, and T^{-1} D(f_T) -> E(r_0) ||phihat||^2, so E >= 0 everywhere; (3) the mean value of
E (1 +- cos(r u_k)) is +- d_k/(2 pi), so d_k = 0. Since here D != 0, positivity fails: some f in D has Q(f) + D(f) < 0.

**Case 2: RH fails.** Then Z is not empty. Take one quartet, with representative z_1 = a + ib in Z (b in (0, 1/2),
|a| > 14; CITED classical facts, as in Theorem 4). Theorem 4, Steps 3 and 4 with k = 1 give (all PROVED there):
 * a finite set F of non-real ordinates containing the quartet, and an even function f_1 in D_eps with fhat_1 = 0 on
   F minus the quartet and C_1 := fhat_1(z_1) conj fhat_1(conj z_1) != 0;
 * for integers K and real t in [K-1, K], the multiplier M(z) = cos(tz) [sinc(z-a)^K + sinc(z+a)^K] with:
   (3a) g := M f_1 is in D (support in [-(t+K+eps), t+K+eps]) and is even;
   (3b) |M| <= 2 on the real axis;
   (3c) |M| <= 2 at every non-real ordinate outside F (and at its conjugate);
   (3d) for a suitable t = t(K) in [K-1, K]: d_1(K) := 4 m_{z_1} Re[M(z_1)^2 C_1] -> -infinity as K -> infinity;
 * the splitting  Q(g) = Q^+(g) + (sum over z in Z outside F) + d_1(K),  with
   Q^+(g) <= 4 Q^+(f_1) by (3b) and |sum over z outside F| <= B_11 < infinity independent of K, t, by (3c) and the
   absolute convergence of the sum for f_1. (The ordinates in F outside the quartet contribute 0 because fhat_1
   vanishes there.)
So  Q(g) <= 4 Q^+(f_1) + B_11 + d_1(K).
New line: by Plancherel and (3b), ||g||^2 = (1/2pi) int |M(r)|^2 |fhat_1(r)|^2 dr <= 4 ||f_1||^2. Hence
|D(g)| <= 2 sum_j |d_j| |g_g(u_j)| <= 2 sum_j |d_j| ||g||^2 <= 8 (sum_j |d_j|) ||f_1||^2 =: C_D, independent of K.
Therefore  Q(g) + D(g) <= 4 Q^+(f_1) + B_11 + C_D + d_1(K) < 0  for K large. []

Remarks on the proof.
 * Case 2 uses of D only that it is a bounded quadratic form on L^2: |D(f)| <= C ||f||^2. So in Case 2 the conclusion
   holds for EVERY bounded perturbation, zero included (that is Theorem 4). Atomicity, "no atom at 0" and D != 0 are
   used in Case 1 only.
 * The window in Case 2 has half-width t + K + eps with K as large as needed; no estimate of K is made.
 * Nothing arithmetic is used in either case beyond: the ordinates are discrete with N(T) = O(T log T), |Im gamma| < 1/2,
   no ordinate has real part 0. The same Theorem holds for any Dirichlet series with an explicit formula of this
   type; for one whose form is not >= 0 (the Davenport-Heilbronn function) it says: no summable perturbation repairs it.

## 3. What is each essential (examples; PROVED by the example or CITED)

 * "all windows": on ONE window, under RH, Q_L + D >= 0 whenever 2 sum|d_j| <= lambda(L), lambda(L) > 0 the lowest
   eigenvalue (theory entry T44; the checker's line). So the Theorem is false window by window.
 * "atomic" and "no atom at 0" (Case 1 only): D = e^{-u^2} du and D = delta_0 are positive definite and can be added.
 * "summable": needed for E to be a function in Case 1 and for boundedness in Case 2. (Conductor 5: the two L-functions
   mod 5 with complex characters share the Gamma factor and differ by non-summable weights.)

## 4. Exact comparison with N. Johns, "Positive solutions of the explicit formula for zeta(s)" (Part I, v1.4, Oct. 2026; unreviewed)

Read by me: the digests rh/library/johns-positive-solutions.md and johns-2026-part1.md (in full where they treat
sections 2 and 3), and from the TeX in rh/library/src/johns/repo/paper/sections/: Definition 2.x "Admissible pairs"
(02-setting.tex l. 95-112), Theorem 2.9 "Logic" and the paragraph after it (l. 202-215), Proposition 3.2 "Two-sided
rigidity" with the paragraph after it and Proposition 3.3 (03-uniqueness.tex l. 40-80), and the proof of 3.2
(B-proofs.tex l. 139-152, the low-pass balance). Not read: the rest of the appendix, Part II.

Johns's objects. An admissible pair is (mu, nu), both POSITIVE Radon measures, mu even on R (zero side), nu on
[xi_2, infinity), xi_2 = log 2/(2 pi) (prime side, in his frequency normalisation), satisfying the explicit-formula
identity Arch(F) = int F dmu + (1/pi) int Fhat dnu for every F in a class of functions analytic in a strip. K = set of
admissible pairs; p_zeta = (mu_zeta, nu_zeta) built from the real ordinates and the prime powers. (E): K non-empty.
(U): K is contained in {p_zeta}. His statements closest to Theorem U':

 (J1) Theorem 2.9(b): "If (mu, nu_zeta) in K for some mu, then RH holds and mu = mu_zeta." Proof idea quoted in the text:
      for an off-line zero the Gaussians F_u = g_u(. - gamma_0) + g_u(. + gamma_0) make the sum over zeros grow like
      e^{pi u (beta_0 - 1/2)^2} while int F_u dmu stays bounded.
 (J2) Proposition 3.2(b): for a difference Delta = (Delta mu, Delta nu) of the space he calls D (differences of pairs,
      with his growth bounds, Delta nu carried by [xi_2, infinity)) and a countable set Z: "If 0 not in Z, Delta mu >= 0
      off Z and (Delta nu)_- is a finite measure, then Delta = 0." Applied by him "under RH, with Z = Z_zeta": no admissible
      pair other than p_zeta arises from zeta's pair "by only adding mass on one side, or by deleting a finite amount of
      mass on either side". Proof: low-pass balance, which uses the spectral gap (-xi_2, xi_2).
 (J3) Theorem 2.9(c),(d): (U) <=> [(E) => RH] and [RH => K = {p_zeta}]; (U) and not RH => K empty. (U) itself is a
      conjecture in Part I ("Nothing here proves RH, (E), (S) or (U)").

Translation. A weight system m in W whose form is >= 0 on D is, by the Bochner-Schwartz theorem (CITED, Schwartz 1951:
a positive-definite distribution is the Fourier transform of a positive tempered measure), the same as a positive
zero-side measure mu paired with the prime-side measure nu_m; if moreover all weights are >= 0 and no atom lies
below log 2, (mu, nu_m) is an admissible pair in Johns's sense, PROVIDED the identity extends from |fhat|^2,
f in D, to his test class. I have NOT written out that extension; the reader seat R-read-2 flags the same
translation as "this seat's, not in the paper, not written out". With that proviso:

 | | Theorem U' (this file) | Johns |
 |---|---|---|
 | RH true, perturbation with atoms at positions >= log 2, perturbed weights >= 0 | D = 0 (Case 1 = Theorem U) | CONTAINED in (J2) Prop. 3.2(b), which needs only (Delta nu)_- finite: the added mass may be infinite and diffuse |
 | RH true, atoms below log 2, or perturbed weights of both signs | D = 0 (Case 1) | not covered: his nu is a positive measure on [xi_2, inf) and his proof uses the gap |
 | RH false, D = 0 | Q not >= 0 (Theorem 4 / Weil) | (J1) Theorem 2.9(b), for a positive mu |
 | RH false, D != 0 summable | Q + D not >= 0 (Case 2) | NOT STATED in what I read. (J3) gives it only under the conjecture (U). His Gaussian argument for (J1) would extend to nu = nu_zeta + (finite measure) in one line, exactly as my Case 2 extends Theorem 4; he does not say so. |
 | class of test objects | quadratic form on |fhat|^2, f in C_c^inf; no positivity of the weights assumed | pairs of positive measures tested on functions analytic in a strip |
 | method, RH case | localisation at a non-ordinate + mean values of an almost periodic function; no gap needed | low-pass balance in the gap (-xi_2, xi_2) |
 | status | checked line by line by a checker and a judge inside this project (Theorem U, Theorem 4); the gluing line of Case 2 is new in this file and unchecked | unreviewed preprint; (J1) is an axiom in its Lean ledger |

Conclusion on novelty (owner rule 5). Theorem U' is NOT new in substance: its RH half overlaps Johns's Prop. 3.2(b)
(neither contains the other: mine allows atoms below log 2 and signed weights and uses form positivity; his allows
infinite added mass), and its not-RH half is the bounded-perturbation extension of his Theorem 2.9(b) / of Weil's
criterion, which I did not find stated but which is one line. What I did not find in what was read: the statement of
the Corollary as a dichotomy ({Lambda} or empty, unconditionally) for the summable class. Searches run by me this
turn: none on the web; only the two digests and the TeX lines listed above. Status: "overlapping, presumably folklore".

## 5. Barrier check (PROJECT_BRIEF standard)

B1: no use of the Euler product. B2: the statement holds for the impostor's data as well (its set is empty); no control
violates it, so by the lead's third condition it is not the seminar's "one statement". B3: no margin. B6: the
Corollary is "uniqueness without existence": existence is RH. It removes nothing from RH; it says that inside the
summable class the bootstrap of idea 9 has at most one solution on the whole line, and names no window.

## 6. For the checker: the steps I would check first

 1. Case 2, the inequality ||M f_1||_2 <= 2 ||f_1||_2: needs |M(r)| <= 2 for REAL r, which is (3b): |cos(tr)| <= 1 and
    |sinc(r -+ a)| <= 1 for real r, a.
 2. Case 2, |D(g)| <= 2 sum|d_j| ||g||^2: |g_g(u)| <= ||g||^2 and D(g) = sum d_j (g_g(u_j) + g_g(-u_j)).
 3. That Theorem 4, Step 4 with k = 1 really gives Q(g) <= 4Q^+(f_1) + B_11 + d_1 with B_11 independent of (K, t):
    PROOF_parity_index.md lines 114-125 (the four cases of the splitting).
 4. Case 1 needs D != 0 with no atom at 0 and distinct positive positions: as assumed in section 0.
