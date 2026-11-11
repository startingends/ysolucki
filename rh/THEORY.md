# Theory document

Lemmas with dependencies. This is where results accumulate into a structure (owner, 2026-11-10).
Written through `python3 tools/records.py theory ...` (add / set / status / check / tree / frontier).

Statuses: `open` stated, no accepted proof · `proved` full written proof, not yet independently checked ·
`checked` an independent verifier went through it line by line · `formal` machine-checked ·
`known` in the literature (citation given), not reproved here · `refuted` false (counterexample in the note).
A lemma is established when it is checked, formal or known; `checked` and `formal` are refused while a
dependency is not established. **Any lemma a live route depends on must reach `formal` or `known`.**
`routes` names the ideas (main-log numbers) that use the lemma.

## T1 · Weil's positivity criterion
- statement: RH holds iff the Weil functional W(f * f~) = pole + arch - primes is >= 0 for every test function f of compact support (equivalently on every window [-L, L]).
- status: known
- source: Weil 1952 (from memory). Text read: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3, section 1.1: Weil's criterion 'RH is equivalent to Q_W(v) >= 0 for all v in C_c^inf(R)', and Yoshida 1992 'observed that RH is equivalent to its positive definiteness [on C_c^inf(-a,a)] for every a > 0' (read by the lead, KNOWLEDGE section 7; re-read by K-theory 2026-11-11 through a quoting fetch of the HTML)
- routes: #2, #8, #9, #10, #21
- note: 2026-11-10 -> known: citation recorded; not reproved here

## T2 · Continuity of the lowest window eigenvalue
- statement: The lowest eigenvalue of the Weil form on (-a, a) is continuous in a, for all a > 0, unconditionally; for small a it is positive, simple, with even ground state.
- status: known
- source: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3, Thm 1.3 ('The lowest eigenvalue lambda_a is continuous in a') and Thm 1.4 (for small a: positive, simple, even eigenfunction, lambda_a = log(1/a) + const + O(a)); quoted from the text by the lead (KNOWLEDGE section 7), by R2-judge (PDF) and by K-theory 2026-11-11 (HTML fetch)
- routes: #2, #8
- note: 2026-11-10 -> known: citation recorded

## T3 · Symmetrisation lemma (Hermite-Biehler form)
- statement: If A(s) = sum_{n<=N} c_n n^(-s) with real c_n has no zeros in Re s > 1/2 and w >= (1/2) log N, then f(t) = 2 Re[e^(iwt) A(1/2 + it)] has only real zeros.
- status: refuted
- proof: rh/NOTEBOOK.md (entry N2)
- source: lead; classical in substance (Polya, de Branges), not searched
- routes: #6
- note: REFUTED AS STATED (K-theory, 2026-11-11; rh/experiments/k_theory/PROGRESS.md Finding 1). Counterexample: A(s) = 2^-s + 4^-s = 2^-s (1 + 2^-s) (real coefficients, zeros only on Re s = 0), N = 4, w = log 2 = (1/2) log 4: f(t) = 2 Re[e^{iwt} A(1/2+it)] = sqrt 2 + cos(t log 2), which is >= sqrt 2 - 1 on R and has infinitely many zeros, none real (z log 2 = pi + 2 pi k +- i arccosh(sqrt 2)); COMPUTED check to 4e-16. The proof in N2 fails at '|R| is bounded as Im z -> infinity when w >= (1/2) log N', which needs c_1 != 0. The repaired statement is T25 (open). | 2026-11-11 -> refuted: counterexample A(s) = 2^-s + 4^-s, w = log 2 (c_1 = 0): f = sqrt 2 + cos(t log 2) has no real zero

## T4 · Sign of the arithmetic kernel
- statement: Notation of T7 (only the definitions; the explicit formula is not used). For f, h in D_L with disjoint supports, N(f,h) = int int f(x) conj(h(y)) K(x-y) dx dy, where K is the positive measure K = w(|u|) du + sum_{n>=2} Lambda(n) n^{-1/2} (delta_{log n} + delta_{-log n}) on u != 0, and w(u) = e^{u/2}/(2 sinh u) = sum_{m>=0} e^{-(2m+1/2)u} > 0. In words: off the diagonal the kernel of N = primes - arch is pointwise >= 0; all negativity of N sits on the diagonal (the g(0) terms).
- status: checked
- proof: rh/NOTEBOOK.md (entry N24, two lines); made precise by rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem E, 'Consequence'
- source: lead (N24); R2-curv (Theorem E)
- routes: #10, #11, #21
- depends: (none)
- checked by: R2-curv-ref (r2_curv/refuter/PROGRESS.md: 'E: correct', which contains the kernel statement); K-theory (N24 read off the formula, check C17 in k_theory/PROGRESS.md)
- note: 2026-11-11 -> checked: two-line proof read line by line; Theorem E confirmed by the seat's checker

## T5 · Parity-block form of RH on a window
- statement: Notation of T7. RH holds iff for every L > 0 and every real f in D_L: N(f) <= 2 <f, c>^2 if f is even, and N(f) <= -2 <f, s>^2 if f is odd. (Equivalent to Q_L >= 0 for all L by T26; 'N has at most one positive eigenvalue on every window' alone is weaker: T31.)
- status: checked
- depends: T1, T7, T26
- source: round-1 judge (wall WJ13); proof written by R2-parity
- routes: #10, #11, #21
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Lemma 2
- note: A reformulation of RH (block form of Weil's criterion), entered once. Each block alone already suffices: T30. | 2026-11-11 -> checked: checker's verdict: correct; all dependencies established
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1, Lemma 2: correct. Trivial (two lines each)'

## T6 · Bridge: mirror positivity implies the block inequalities
- statement: OPEN, and not yet a precise statement: for the kernel of T4 (mirror-positive on the integers, completely monotone Gamma part) the block inequalities of T5 hold on every window. Must fail for a Beurling system.
- status: open
- depends: T4, T5
- source: idea #21
- routes: #21

## T7 · Weil's explicit formula in the project's normalisation (and the notation used by later entries)
- statement: NOTATION. L > 0; D_L = C_c^inf((-L,L)), complex valued, D = C_c^inf(R); for f, h in D: g(u) = int f(x) conj(h(x-u)) dx; fhat(z) = int f(x) e^{izx} dx; w(u) = e^{u/2}/(2 sinh u) for u > 0. Arithmetic side: P(f,h) = int g(u) 2 cosh(u/2) du [pole]; A(f,h) = -log(pi) g(0) + int_0^inf [ g(0) e^{-2u}/u - w(u) (g(u) + g(-u)) ] du [archimedean]; Pi(f,h) = sum_{n>=2} Lambda(n) n^{-1/2} (g(log n) + g(-log n)) [primes]; N = Pi - A; Q = P - N = P + A - Pi; q(f) means q(f,f); subscript L = restriction to D_L; f_e, f_o = even and odd parts; c(x) = cosh(x/2), s(x) = sinh(x/2), <f,c> = int f c. Zero side: Qz(f,h) = sum over the zeros rho = 1/2 + i gamma of zeta in the strip 0 < Re s < 1 (gamma complex, multiplicity m_gamma) of m_gamma fhat(gamma) conj(hhat(conj gamma)). STATEMENT: Qz(f,h) = Q(f,h) for all f, h in D.
- status: known
- source: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3, section 1.1 (the five terms of W(f): int f(x)(e^{x/2}+e^{-x/2})dx - sum Lambda(n) n^{-1/2} f(log n) - sum Lambda(n) n^{-1/2} f(-log n) - (log 4pi + C_0) f(0) - int_0^inf {f(x)+f(-x)-2e^{-x/2}f(0)} e^{x/2}dx/(e^x-e^{-x}); Q_W(v1,v2) = W(v1 * v2~)) and eq. (3.1) ('the Weil explicit formula yields' Q_W(v1,v2) = sum_gamma m_gamma v1^(gamma) conj(v2^(conj gamma))). Text read by K-theory 2026-11-11 (HTML, through a quoting fetch: pieces of at most 125 characters); the same paper was read in part by the lead, R2-parity-ref (PDF pp. 2, 4-5, 11-14) and R2-judge. Original: Weil 1952 (not read).
- routes: #2, #8, #9, #10, #11, #21
- note: Normalisation matched by hand by K-theory (k_theory/PROGRESS.md Finding 2): Suzuki's constant term equals the project's because int_0^inf (1/sinh u - e^{-2u}/u) du = -psi(1/2) = C_0 + 2 log 2, so -(log 4pi + C_0) + C_0 + log 4 = -log pi. COMPUTED on record: prime side = zero side to 1e-15 (lane A), again by R2-parity (v1.log), two builders agree to 5e-60 (R2-parity-ref), box matrix against 20000 zeros to 6e-7 (R2-cubic-ref). Caveats: read through a quoting model, not the PDF; Suzuki states (3.1) on his form domain and cites his [14] for it. | 2026-11-11 -> known: definition of W and the zero-side formula quoted from a text that was read; normalisation matched by hand; four numerical validations

## T8 · Classical facts about the nontrivial zeros (strip, symmetry, counting, lowest ordinate)
- statement: Write the zeros of zeta in the critical strip as rho = 1/2 + i gamma. (i) Every nontrivial zero has 0 < Re rho < 1, i.e. |Im gamma| < 1/2. (ii) The set of zeros (with multiplicities) is invariant under rho -> conj(rho) and rho -> 1 - rho, i.e. under gamma -> -conj(gamma) and gamma -> -gamma. (iii) N(T) := number of zeros with 0 < Im rho <= T satisfies N(T) = (T/2pi) log(T/2pi) - T/2pi + O(log T); in particular N(T) = O(T log T) and the zeros are a discrete set. (iv) The zero with the smallest non-negative imaginary part is 1/2 + 14.1347...i; hence zeta has no zero on the real segment (0,1) (no gamma is purely imaginary) and |Re gamma| > 14 for every gamma.
- status: known
- source: Classical: Hadamard and de la Vallee-Poussin 1896 (no zeros on Re s = 1), von Mangoldt 1905 (counting formula). Text read by K-theory 2026-11-11 (quoting fetch): en.wikipedia.org 'Riemann zeta function' ('any non-trivial zero lies in the open strip', 'symmetric about the real axis and the line sigma = 1/2', 'the zero with smallest non-negative imaginary part is 1/2 + 14.13472514... i'), 'Riemann hypothesis' ('Hadamard (1896) and de la Vallee-Poussin (1896) independently proved that no zeros could lie on the line Re(s) = 1'), 'Riemann-von Mangoldt formula' (the formula; 'finally proved by Mangoldt in 1905'). Primary sources not read.
- routes: #8, #9, #10
- note: Tertiary source only (Wikipedia); a textbook reference (Titchmarsh, chapters 2, 3, 9) should replace it when someone has the text. The first ordinates 14.1347, 21.0220, 25.0109 are also reproduced by tools/rhlib.py (tests). | 2026-11-11 -> known: textbook facts; statements quoted from pages that were fetched and read

## T9 · Selberg: a positive proportion of the zeros lie on the line, counted as distinct points
- statement: There are c > 0 and T_0 such that for T >= T_0 the number of DISTINCT real t in (0, T] with zeta(1/2 + it) = 0 is at least c T log T.
- status: known
- depends: T8
- source: Selberg 1942 (not read). Text read by K-theory 2026-11-11: Milinovich and Ng, arXiv 1306.0854 v1, p. 2 (PDF, pdftotext): 'Selberg's method [49] shows that a positive proportion of the non-trivial zeros of the Riemann zeta-function are on the critical line. This is accomplished by counting sign changes of Hardy's function Z(t) and every zero detected by this method has odd multiplicity.' Also en.wikipedia.org 'Riemann hypothesis': 'Selberg (1942) proved that at least a (small) positive proportion of zeros lie on the line.'
- routes: #8
- note: The distinct-point form (needed by T36) follows from the quoted sentence: sign changes of Z(t) are distinct points, and a positive proportion of N(T) is >= c T log T by T8 (iii). Secondary source (the introduction of a 2013 paper); Selberg's paper itself was not read. | 2026-11-11 -> known: quoted from a fetched text; the distinct-zero form is what the quoted sentence says

## T10 · Operator realisation of the window form: closed, bounded below, discrete spectrum, infimum over smooth functions
- statement: Notation of T7. For each a > 0 let Q_W^a be the restriction of the Weil form Q (= Qz) to its form domain Dom_a = {v in L^2(-a,a) : |Q(v)| < infinity} (v extended by zero). Then: (1) Q_W^a is bounded below and lower semicontinuous (closed); (2) the associated self-adjoint operator A_a is the Friedrichs extension of the symmetric operator defined on C_c^inf(-a,a); (3) the spectrum of A_a is bounded below and discrete, so lambda_a := inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is an eigenvalue (attained); (4) lambda_a equals the infimum of the same quotient over C_c^inf(-a,a); (5) because Q_W^a is the restriction of one form, Dom_a is contained in Dom_b for a < b, a translate by c of v in Dom_a lies in Dom_{a+|c|} with the same value of Q, and the zero-side formula Q(v1,v2) = sum_gamma m_gamma v1^(gamma) conj(v2^(conj gamma)) holds on Dom_a.
- status: known
- depends: T7
- source: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3: Thm 1.1 (Friedrichs extension), Cor 1.2 (infimum over C_c^inf), section 1 quoting Connes-Consani ('lower bounded and lower semicontinuous', their Prop 2.1) and Connes-Consani-Moscovici Thm 3.6 ('the spectrum of the self-adjoint operator A_a is bounded below and discrete'), eq. (3.1). Read by R2-parity-ref (PDF pp. 2, 4-5, 11-14: the domain and item (5)), R2-judge (Thm 1.1, Cor 1.2, p. 14), K-theory 2026-11-11 (quoting fetch: Thm 1.1, Cor 1.2, the two citations). The Connes-Consani(-Moscovici) papers themselves were not read.
- routes: #2, #8, #9
- note: This replaces the assumption 'CORE' of PROOF_first_failure.md: R2-parity-ref checked it against the PDF. NOT stated by Suzuki and not used: 'Dom_a = {int log(2+|r|)|vhat|^2 < infinity}' (he proves only an inclusion, p. 13-14). | 2026-11-11 -> known: statements quoted from the paper by three readers

## T11 · Connes-van Suijlekom: simple isolated even ground state has a transform with only real zeros
- statement: If the quadratic form defined by a real even distribution on a window (-a, a) has a simple isolated lowest eigenvalue whose eigenfunction is even, then the Fourier transform of that eigenfunction has only real zeros.
- status: known
- source: A. Connes, W. van Suijlekom, 'Quadratic Forms, Real Zeros and Echoes of the Spectral Action', arXiv 2511.23257 v1; quoted from the text by the lead (KNOWLEDGE section 7: first 40k of 118k characters verbatim)
- routes: #2, #20
- note: Statement as recorded in KNOWLEDGE section 7 (the exact hypotheses on the distribution are in the paper, not in the project's files). | 2026-11-11 -> known: quoted from the text (KNOWLEDGE section 7)

## T12 · Equivalence (Nyman-Beurling, Baez-Duarte): RH iff chi lies in the closed span of the integer dilates
- statement: Let rho(x) = x - [x], chi = indicator of (0,1), e_k(x) = rho(1/(kx)) in L^2(0,infinity). RH holds iff chi belongs to the closed linear span of {e_k : k = 1, 2, 3, ...}; equivalently d_N := dist(chi, span{e_k : k <= N}) -> 0.
- status: known
- source: L. Baez-Duarte, 'A strengthening of the Nyman-Beurling criterion for the Riemann Hypothesis', arXiv math/0202141 (abstract read by K-theory 2026-11-11: 'the Riemann hypothesis is equivalent to the stronger statement that chi [lies in the closure of the] subspace generated by {rho_a | a in N}'); Nyman 1950, Beurling 1955 not read
- routes: #5, #14, #15
- note: A reformulation of RH (owner rule 2); entered once because T20 and T21 are stated in its terms. | 2026-11-11 -> known: abstract of the paper states exactly this

## T13 · Burnol's lower bound for the Nyman-Beurling distance
- statement: With d_N as in T12: liminf_{N -> infinity} d_N^2 log N >= sum over the zeros rho of m(rho)^2/|rho|^2 (m = multiplicity), unconditionally. In particular d_N^2 >= (C + o(1))/log N with C > 0.
- status: open
- depends: T12
- source: J.-F. Burnol, 'A lower bound in an approximation problem involving the zeros of the Riemann zeta function', arXiv math/0103058 (Adv. Math. 2002)
- routes: #5, #14
- note: Cited from memory, unverified. K-theory read the abstract only (2026-11-11): it says the paper 'slightly improve[s] the lower bound of Baez-Duarte, Balazard, Landreau and Saias'; the form of the bound is not in the abstract. Used by the round-1 judge (wall WJ6) and by r1_B/critic section 4.

## T14 · Krein's extension theorem applied to the window form
- statement: Notation of T7. Q_L >= 0 on D_L iff the Weil distribution restricted to (-2L, 2L) (which contains only the prime powers n < e^{2L}) is the restriction of the Fourier transform of some positive measure on R.
- status: open
- source: M. G. Krein 1940, as quoted by lane A (rh/experiments/r1_A/PROGRESS.md, 'T1 [PROVED, classical, from memory]')
- routes: #9
- note: Cited from memory, unverified. Caution recorded in PROOF_parity_index.md section 6: the Weil kernel is a distribution (logarithmic singularity at 0, atoms at log n), not a continuous function, so the classical theorem does not apply verbatim; the distributional version would have to be cited or proved.

## T15 · Krein-Langer: Pick matrices of a generalised Nevanlinna function
- statement: If S is a generalised Nevanlinna function with kappa poles in the open upper half-plane (kappa possibly infinite), then every finite Pick matrix [(S(u_i) - conj S(u_j))/(u_i - conj u_j)] has at most kappa negative eigenvalues, the count is non-decreasing when nodes are added, and it reaches kappa on a set of uniqueness.
- status: open
- source: Krein-Langer 1977-1985, as quoted by rh/experiments/r1_C/critic/PROGRESS.md section C2 ('PROVED, classical')
- routes: #1
- note: Cited from memory, unverified (no text read). Used by the round-1 judge's cross-link 2 ('three counts of the same integer'). The project's own exact count for the Weil form is T29, which does not use this.

## T16 · Equivalence (Suzuki): RH iff a canonical-system Hamiltonian exists for every parameter value
- statement: (Statement as recorded, not exact.) GRH for an L-function in the Selberg class is equivalent to the existence, for every value a > 0 of a parameter, of the Hamiltonian of a canonical system built from the L-function by an inverse problem.
- status: open
- source: M. Suzuki, arXiv 1606.05726 (J. Funct. Anal. 2021) and arXiv 1204.1827
- routes: #8
- note: Cited from search-result summaries only (KNOWLEDGE section 7, notebook N22): papers not fetched, exact statement not recorded. A reformulation of RH; relevant because lane A's 'kicked Krein system' (merged into idea #8) is this in substance.

## T17 · Positive-solutions duality and the conductor threshold (Johns preprint)
- statement: (Statement as paraphrased in KNOWLEDGE section 7, not exact.) An 'admissible pair' is a positive measure on the zero side together with a positive measure on the prime side (any positions beyond log 2) solving the explicit formula with zeta's Gamma factor and pole. Claims: (a) an admissible pair exists iff a prime-free, zero-free inequality kappa* >= 0 holds (conic LP duality); (b) uniqueness under restrictions on the zero-side support; (c) with a conductor q as parameter, an admissible pair exists unconditionally for q >= 1.0172.
- status: open
- source: N. Johns, 'Positive solutions of Weil's explicit formula for zeta(s)', github.com/nic410/zeta-positive-solutions (preprint, October 2026)
- routes: #9
- note: UNVERIFIED: AI-produced preprint whose README says no human has checked the proofs; the lead read the README and sections 1-3 in paraphrase only. Nothing in the project may rest on it. The project's own proved statements in this area are T43 and T44.

## T18 · Hecke's dimension count: the functional equation of the theta dial has a unique solution for 0 < n < 8
- statement: For real 0 < n < 8 the space of Dirichlet series with the functional equation of Z_n(s) = sum r_n(m) m^-s (r_n = coefficients of theta^n; Hecke signature (2, n/2, 1)) is one-dimensional (dimension formula 1 + [k/4] with k = n/2).
- status: open
- source: Hecke; Berndt's dimension formula as seen in a search snippet of arXiv 2007.13844 (round-1 judge, JUDGEMENT.md sections 5.3 and 7)
- routes: #9, #12, #13
- note: Cited from memory plus one search snippet, unverified ('Not read' in the judge's own words). It is the basis of the statement 'uniqueness of the solution of the functional equation does not force RH' (idea #13).

## T19 · Moment criterion for multiplicative Hankel (Helson) matrices indexed by a, b >= 1
- statement: Let alpha(n) = O(n^a) for some a. The matrix [alpha(nm)], n, m >= 1, is non-negative iff alpha(n) = int t^kappa dmu(t) (n = p^kappa in multi-index notation, t = (t_p)_p in R^infinity) for a positive measure mu on R^infinity; mu is unique. Without a growth condition the statement is false already in two variables.
- status: known
- source: Perfekt and Pushnitski, 'On Helson matrices: moment problems, non-negativity, boundedness, and finite rank', Proc. London Math. Soc. 116 (2018), arXiv 1611.03772, Theorem 3.3 (credited there to Berezansky-Kondratiev, Berg-Christensen-Ressel, Samoilenko); sections 1 to 3 read in full text by S1-mirror (s1_seminar/mirror/PROOF_mirror_criterion.md, Theorem 1 and 'Novelty')
- routes: #21
- note: The matrix that idea #21 needs is indexed by a, b >= 2 (for Lambda the matrix on a, b >= 1 is not >= 0, T70); that variant is T76. | 2026-11-11 -> known: theorem quoted from a paper whose sections 1-3 were read in full

## T20 · Missing-prime floor: the prime-filtered Nyman-Beurling distance D_S is positive when S omits a prime
- statement: Let rho(x) = x - [x], e_k(x) = rho(1/(kx)), chi = indicator of (0,1), all in L^2(0,infinity). For a set S of primes let <S> be the set of integers k >= 1 all of whose prime factors lie in S, and D_S := dist(chi, closed span{e_k : k in <S>}). If there is an integer q >= 3 coprime to every prime of S (this holds whenever S omits a prime), then D_S^2 >= m(q) > 0, where m(q) is the minimum over real (lam, u, v) of lam^2 + int_1^2 (u - lam y)^2 dy/y^2 + int_{q-1}^{q} (v - lam y)^2 dy/y^2 + int_q^{q+1} (v + u - 1 - lam y)^2 dy/y^2.
- status: checked
- proof: rh/experiments/r1_B/critic/PROGRESS.md, sections 2 (y-space reformulation) and 3
- source: R1-B critic
- routes: #5, #14, #15
- note: The critic's text allows any q > 1; for q = 2 the intervals [1,2) and [q-1,q) coincide and the displayed sum would count one interval twice (the judge notes the same overlap for his own bound), so the entry is stated for q >= 3, which is always available (q = the omitted prime if it is odd, q = 4 if only 2 is omitted). Numerical sandwich for S = {2}, {2,3}: agreement to 6 digits between the critic's lower bounds and the proposer's upper bounds. | 2026-11-11 -> checked: judge's file says checked line by line
- checked by: round-1 judge (rh/experiments/r1_judge/JUDGEMENT.md section 1.4: 'checked line by line, correct'; section 2: 'Critic's three-interval proof is correct')

## T21 · An off-line zero puts a floor under the Nyman-Beurling distance (resolution lemma behind wall WJ6)
- statement: Notation of T12. If zeta(rho_0) = 0 with 1/2 < beta = Re rho_0 < 1, then for every N and all complex c_1, ..., c_N: || chi - sum_{k<=N} c_k e_k ||^2 >= (2 beta - 1) / ( |rho_0|^2 (1 + (2 beta - 1)/|rho_0 - 1|^2) ).
- status: checked
- proof: rh/experiments/r1_B/PROGRESS.md, Step 5 (first item)
- source: R1-B (lane B proposer); quoted as 'Proved' in wall WJ6 of the round-1 judgement
- routes: #5, #14
- note: Uses the classical Mellin identity int_0^inf rho(1/y) y^{s-1} dy = -zeta(s)/s for 0 < Re s < 1 (textbook, from memory; not entered as a lemma). The round-1 critic and judge reproduced the lane's numbers but neither file records a check of this proof; the check on record is K-theory's. | 2026-11-11 -> checked: proof is seven lines; every step re-derived
- checked by: K-theory (line by line, check C1 in rh/experiments/k_theory/PROGRESS.md)

## T22 · Dissipation identity for the zero dynamics of the heat flow (finite systems)
- statement: Let z_1(t), ..., z_n(t) be pairwise distinct complex numbers, the set closed under complex conjugation, solving dz_k/dt = 2 sum_{j != k} 1/(z_k - z_j) on an interval; y_k = Im z_k. Then d/dt sum_k y_k^2 = -4 sum_{j<k} (y_j - y_k)^2/|z_j - z_k|^2 <= -4 x (number of conjugate pairs of non-real z_k).
- status: checked
- proof: rh/experiments/r1_B/PROGRESS.md, Step 6 (last item)
- source: R1-B; known in spirit (de Bruijn 1950, from memory)
- routes: #4
- note: That the zeros of the de Bruijn-Newman family H_t obey this ODE is NOT part of the lemma (it is COMPUTED in lane B to 7e-9 .. 2.5e-6 and recalled from the literature). Wall WJ10: every functional found is monotone in the direction that does not help. | 2026-11-11 -> checked: two-line computation re-derived
- checked by: K-theory (two lines, check C2 in rh/experiments/k_theory/PROGRESS.md); the identity was also confirmed numerically by the R1-B critic on a random system (-152.47633545 against -152.47633546)

## T23 · Equivalence (Fejer-window test, Lemma F): RH iff S_X(t) >= 0 for all t and X
- statement: For X > 1, V = log X and real t let S_X(t) := sum over the zeros rho = 1/2 + i gamma of k_V(gamma - t), k_V(r) = (4/V) sin^2(rV/2)/r^2 (the Fourier transform of the triangle (1 - |x|/V)_+). Then RH <=> S_X(t) >= 0 for all real t and all X > 1 <=> the same for all real t and an unbounded sequence of X.
- status: proved
- depends: T1, T7
- proof: rh/experiments/r1_C/PROGRESS.md, section E1 ('Lemma F')
- source: R1-C (lane C proposer)
- routes: #1
- note: A reformulation of RH (the Weil form restricted to a two-parameter family; barrier B6), entered once. The critic ('correct and reproduced') and the judge ('Lemma F is correct') accept it, but neither file records a line-by-line check of the limiting step P(T_V h) - P(h) = -P(|x| h)/V -> 0, so it stays `proved`. COMPUTED: zeta never negative for X <= 1e6; the impostor fails at X in (50, 70].

## T24 · Loewner (Pick) form of a truncated convolution form in the exponential basis
- statement: (As recorded by the R1-A critic.) Let D be a real even kernel distribution on (-2L, 2L), Q_D the form f, h -> int int f(x) conj(h(y)) D(x-y) on L^2[-L,L], e_w(x) = e^{iwx}, H(w) := int_0^{2L} D(u) e^{-iwu} du. Then for real w != w': Q_D(e_w, e_w') = Im[ e^{iL(w-w')} (H(w) + conj H(w')) ] / (w - w') up to the normalising constant of the basis.
- status: open
- source: R1-A (lattice case), R1-A critic (off-lattice)
- routes: #2, #9
- proof: rh/experiments/r1_A/critic/PROGRESS.md, section '21:55 A5 off-lattice check' (statement and numerics only)
- note: NOT PROVED IN WRITING: the critic says 'derived by hand (3 lines)' but the derivation is not in the file. COMPUTED: both sides agree to 1e-30 at three (L, w, w') for zeta with the explicit H. Judge: 'proved off the lattice, generic to every truncated convolution form; a tool'. To become `proved` the three lines must be written, with the exact constant.

## T25 · Symmetrisation lemma (Hermite-Biehler form), repaired statement
- statement: Let A(s) = sum_{n<=N} c_n n^-s with real c_n, c_1 != 0, and no zeros in Re s > 1/2; let w >= (1/2) log N and f(z) = e^{iwz} A(1/2 + iz) + e^{-iwz} A(1/2 - iz) (so f(t) = 2 Re[e^{iwt} A(1/2 + it)] for real t). If f is not identically zero, all zeros of f are real.
- status: open
- source: lead; classical in substance (Polya, de Branges), not searched
- routes: #6
- proof: rh/NOTEBOOK.md (entry N2): sketch
- note: OPEN: sketch only. N2 says 'By Phragmen-Lindelof |R| < 1' for R = E/E*, but gives no growth bound for R in the open upper half-plane (boundedness as Im z -> infinity is not enough: 1/E* is not obviously bounded in a strip 0 < Im z < delta). Standard repair, from memory and not written: R is of bounded type, meromorphic across the real axis with |R| = 1 there, has no poles above, mean type <= 0, so |R| <= 1 by Nevanlinna factorisation. The hypothesis c_1 != 0 was added by K-theory; without it the statement is false (T3).

## T26 · Parity decomposition of the window forms and the pole in the two parity blocks
- statement: Notation of T7 (definitions only). Let R f(x) = f(-x). (i) Each of P, A, Pi, N, Q satisfies q(Rf, Rh) = q(f, h); hence q(f_e, h_o) = 0 and q(f) = q(f_e) + q(f_o). (ii) For every f in D: P(f) = 2 |<f_e, c>|^2 - 2 |<f_o, s>|^2 (for real f: 2<f_e,c>^2 - 2<f_o,s>^2).
- status: checked
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Lemma 1
- source: R2-parity; the block statement goes back to the round-1 judge (wall WJ13)
- routes: #8, #9, #10, #21
- note: Finite linear algebra plus one integral identity; a formalisation candidate. The zero-side form Qz is R-invariant as well, by T8 (ii). | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1, Lemma 2: correct'

## T27 · Negative squares of Q are bounded by positive squares of N (per parity block), with no hypothesis
- statement: Notation of T7. For a hermitian form q let kappa_-(q) (kappa_+(q)) be the supremum of the dimensions of subspaces on which q is negative (positive) definite. For every L > 0: kappa_-(Q_{L,even}) <= kappa_+(N_{L,even}); kappa_-(Q_{L,odd}) <= kappa_+(N_{L,odd}) + 1; hence kappa_-(Q_L) <= kappa_+(N_L) + 1. In particular 'kappa_+(N_L) <= 1 for all L' implies kappa_-(Q_L) <= 2 for all L.
- status: checked
- depends: T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Proposition 3 (b), (c)
- source: R2-parity; round-1 judge (WJ13: 'linear algebra PROVED')
- routes: #10
- note: The inequalities become equalities in finite dimension with invertible blocks: T32. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Prop. 3 (a),(b),(c): correct', with one unwritten standard step (kappa_-(Q) <= kappa_-(Q_e) + kappa_-(Q_o): project a negative subspace on the two blocks)

## T28 · RH implies that N = primes - arch has at most one positive direction on every window
- statement: Notation of T7, kappa_+ as in T27. Assume RH. Then for every L: N(f) <= -2 |<f_o, s>|^2 <= 0 for every f in D_L with <f, c> = 0; consequently kappa_+(N_L) <= 1, and N_{L,odd} <= -2 |<f, s>|^2.
- status: checked
- depends: T5, T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Proposition 3 (a)
- source: R2-parity; lead's notebook N24/N27 (COMPUTED: exactly one positive eigenvalue at L = 0.5, 0.75, 1)
- routes: #10, #11
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Prop. 3 (a),(b),(c): correct'
- note: 2026-11-11 -> checked: checker's verdict: correct

## T29 · Exact negative index of the Weil form: the number of negative squares on large windows equals the number of off-line zeros
- statement: Notation of T7; kappa_- as in T27. Let Z be the set of DISTINCT gamma with Im gamma > 0 (zeros with Re rho < 1/2) and nu := #Z in {0, 2, 4, ..., infinity} (nu/2 = number of off-line quartets {rho, 1-rho, conj rho, 1-conj rho}, multiplicity ignored). For the zero-side form Qz restricted to D_L and to its even and odd parts: (1) for every L: kappa_-(Qz_L) <= nu, kappa_-(Qz_{L,even}) <= nu/2, kappa_-(Qz_{L,odd}) <= nu/2; (2) L -> kappa_-(Qz_L) is non-decreasing; (3) if nu < infinity there is L_0 with kappa_-(Qz_{L,even}) = kappa_-(Qz_{L,odd}) = nu/2 and kappa_-(Qz_L) = nu for all L >= L_0; (4) if nu = infinity, kappa_-(Qz_{L,even}) and kappa_-(Qz_{L,odd}) tend to infinity with L. In particular (nu >= 2): if RH fails there are L and g in D_L with Qz(g) < 0.
- status: checked
- depends: T8
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Theorem 4 (Steps 1-5)
- source: R2-parity. Known in substance (attributed to Bombieri in an unopened 2026 preprint; Krein-Langer theory); the parity refinement and the cosine-shift proof were not found in what was read
- routes: #8, #10
- note: Uses only the zero side: T8 (i)-(iv) and the absolute convergence of the sum. Does not use the Euler product; holds for the Davenport-Heilbronn form and counts its quartets. A dictionary, not a route (the seat's own barrier check). | 2026-11-11 -> checked: checker's verdict: every step checked
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 4: correct; I checked every inequality of Steps 1-5 ... No use of RH or of anything equivalent', inequalities (3b)-(3d) also tested in 200 random cases (c4.log); R2-judge J13 (toy zero sets: counts (2,2), (1,1), (0,0) as predicted, never more than the number of quartets)

## T30 · Equivalence: one spare negative square, or one parity block, costs nothing
- statement: Notation of T7 and T29. (1) If kappa_-(Qz_L) <= k for every L, then zeta has at most 2 floor(k/2) distinct zeros with Re rho > 1/2; in particular RH <=> kappa_-(Qz_L) <= 1 for every L. (2) RH <=> Qz_{L,even} >= 0 for every L <=> Qz_{L,odd} >= 0 for every L; in arithmetic terms RH <=> [N(f) <= 2<f,c>^2 for all real even f in D_L, all L] <=> [N(f) <= -2<f,s>^2 for all real odd f in D_L, all L].
- status: checked
- depends: T29, T7, T8, T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, section 5, Corollaries C1 and C4
- source: R2-parity. Part (2) is KNOWN: Yoshida 1992, Proposition 1, as reported by Suzuki arXiv 2606.09096 p. 2 (read by R2-parity-ref, R2-judge and K-theory: 'positivity on nonzero odd test functions implies RH'; for even functions 'except for possible real zeros', which T8 (iv) excludes)
- routes: #8, #10
- note: Reformulations of RH, entered once. The seat withdrew any novelty claim (board B57). | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'C1, C4: correct. The last line of C1 and C4 (one parity block suffices) is KNOWN: Yoshida 1992 Prop. 1'

## T31 · 'N has at most one positive direction on every window' implies at most one off-line quartet
- statement: Notation of T7, T27. If kappa_+(N_L) <= 1 for every L > 0, then zeta has at most one off-line quartet {rho, 1-rho, conj rho, 1-conj rho} (of any multiplicity), i.e. at most 2 distinct zeros with Re rho > 1/2. (So: RH => [kappa_+(N_L) <= 1 for all L] => [at most one quartet]; neither arrow is known to reverse.)
- status: checked
- depends: T27, T29, T7
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, section 5, Corollary C2
- source: R2-parity; answers claim (a) of idea #10 (wall WJ13 of the round-1 judge)
- routes: #10
- note: The file's sentence 'cannot be improved by linear algebra alone' is an observation, not a theorem (checker; conceded on board B57): no configuration with one quartet and kappa_+(N) = 1 is exhibited. The exact condition for such a configuration is given by T32 (t_e < 1 and t_o < -1). | 2026-11-11 -> checked: checker's verdict: correct as an implication
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'C2: correct as an implication'

## T32 · Exact inertia relation between a Weil block and the corresponding block of N (rank-one pole)
- statement: FINITE SETTING. V a finite-dimensional real inner-product space with an orthogonal involution J (V = V_e + V_o); Q a real symmetric J-invariant form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o (so Q = 2cc^T - 2ss^T - N). Assume Q_e and Q_o invertible and put t_e := 2 c^T Q_e^{-1} c, t_o := 2 s^T Q_o^{-1} s, with t_e != 1 and t_o != -1. Then (number of positive eigenvalues of N_e) = (number of negative eigenvalues of Q_e) + [t_e > 1], and (number of positive eigenvalues of N_o) = (number of negative eigenvalues of Q_o) - [t_o < -1], where [.] is 1 if the condition holds and 0 otherwise. No sign hypothesis on Q.
- status: proved
- proof: rh/experiments/k_theory/PROGRESS.md, section 'Written out by me: exact inertia relation' (the seat's files, s1_seminar/parity/NOTES.md section H and board B56, state the result and name the method, Schur complement / Haynsworth, without the steps)
- source: S1-parity (board B56); derivation written out by K-theory
- routes: #10
- note: NOT independently checked: K-theory wrote the three-line derivation, so K-theory cannot be its checker. COMPUTED by the seat: 0 failures in 20000 random indefinite cases (inertia.py.txt); zeta windows: t_e = 0.198, 0.842, 1.345, 7.83, 1.3e6, 1.15e29 at L = 0.05, 0.10, 0.12, 0.20, 0.5, 1. Finite linear algebra: a good formalisation target. It sharpens T27 and contains T34.

## T33 · The two sum-rule margins are the pole vector seen through the inverse Weil block
- statement: FINITE SETTING. V a finite-dimensional real inner-product space with an orthogonal involution J (V = V_e + V_o); Q a real symmetric J-invariant form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o (so Q = 2cc^T - 2ss^T - N). If Q_e is invertible and t_e := 2 c^T Q_e^{-1} c != 1, then N_e is invertible and 2 c^T N_e^{-1} c - 1 = 1/(t_e - 1). If Q_o is invertible and t_o := 2 s^T Q_o^{-1} s != -1, then N_o is invertible and 1 - 2 s^T (-N_o)^{-1} s = 1/(1 + t_o). In particular, when a Weil block is positive definite the corresponding margin is strictly positive: the sum rules are never exactly saturated on such a window.
- status: checked
- proof: rh/experiments/s1_seminar/curv/S1_ADDITIONS.md, F1
- source: S1-curv
- routes: #11
- note: The seat states it under 'Q_e > 0'; only invertibility is used. COMPUTED by the seat to 10 digits (M = 20..160) and by R2-judge J10 (determinant form, 5.592234356886e-4 both ways). Replaces the seat's earlier wording 'sum rules saturated', withdrawn after its checker. | 2026-11-11 -> checked: two-line proof re-derived
- checked by: K-theory (Sherman-Morrison both ways, check C3 in rh/experiments/k_theory/PROGRESS.md)

## T34 · Sum-rule form of the two block inequalities (Theorem A, second lines, with the hypothesis the checker added)
- statement: FINITE SETTING. V a finite-dimensional real inner-product space with an orthogonal involution J (V = V_e + V_o); Q a real symmetric J-invariant form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o (so Q = 2cc^T - 2ss^T - N). (A1) If N_e is invertible and has at least one positive eigenvalue, then [N_e <= 2cc^T, i.e. Q_e >= 0] <=> [N_e has exactly one positive eigenvalue and 2 c^T N_e^{-1} c >= 1]. (A2) If N_o is invertible, then [N_o <= -2ss^T, i.e. Q_o >= 0] <=> [N_o is negative definite and 2 s^T (-N_o)^{-1} s <= 1].
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem A (second lines of A1, A2: Haynsworth inertia additivity for the bordered matrices)
- source: R2-curv
- routes: #11
- note: AS ORIGINALLY WRITTEN (without 'N_e has a positive eigenvalue') (A1) IS FALSE: for the zeta window form with L <= 0.10 the top eigenvalue of N is negative (-0.0742 at L = 0.10, 40 boxes), Q_e > 0, N_e has no positive eigenvalue and 2c^T N_e^-1 c - 1 = -6.23. The gap line in the proof file is 'neg(-N_e) >= 1 because <u,Nu> = lambda_1 > 0'. The seat conceded (board B26, B28). A reformulation (owner rule 2), as the seat says. | 2026-11-11 -> checked: checker's verdict with the added hypothesis; counterexample to the original recorded
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md: 'A: (A0), first lines of (A1), (A2): correct. Second line of (A1): GAP ... Repairable by adding lambda_1 > 0. (A2) second line is correct without it'); R2-judge J3 reproduced the failure of the unrepaired statement

## T35 · The lowest window eigenvalue is non-increasing in the window size
- statement: Notation of T10. lambda_a = inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is non-increasing in a > 0.
- status: checked
- depends: T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Lemma 1 (one line from the nestedness of the form domains, or from the infimum over C_c^inf(-a,a))
- source: R2-parity
- routes: #8
- note: KNOWLEDGE section 7 records that no monotonicity statement was found in the literature read; it is one line from min-max. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1: correct; and unconditional by Suzuki Cor. 1.2'

## T36 · No null vector under RH; in general a non-positive vector must see an off-line zero
- statement: Notation of T7, T10, Z as in T29. Let f in Dom_L, f != 0. Then fhat does not vanish at all real gamma, so Q^+(f) := sum over real gamma of m_gamma |fhat(gamma)|^2 > 0. Consequently: (i) if RH holds, Q(f) > 0 for every f != 0 in Dom_L, and lambda_L > 0 for every L; (ii) in general, Q(f) <= 0 forces sum_{z in Z} m_z Re[ fhat(z) conj(fhat(conj z)) ] < 0.
- status: checked
- depends: T8, T9, T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Lemma 2 (Jensen's formula: fhat has O(r) zeros in |z| <= r, against >> r log r distinct real ordinates)
- source: R2-parity
- routes: #8, #9
- note: The two points the checker asks for are now separate established entries: distinct zeros = T9, attainment and the zero-side formula on Dom_L = T10. The proof file's label 'PROVED' should read 'PROVED given T9 and T10' (conceded on board B57). | 2026-11-11 -> checked: checker's verdict: correct once the two cited facts are supplied; both are established entries
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'the Jensen/Selberg argument is correct, with one unstated point: Selberg's count must be of DISTINCT zeros (it is ...). Part (i) also needs attainment of the infimum and the zero-side formula on the form domain'

## T37 · Equivalence (first-failure template): RH is false iff there is a first window with a null vector
- statement: Notation of T10 (lambda_L, Dom_L). The following are equivalent: (A) RH is false; (B) lambda_L < 0 for some L; (C) there is L_0 > 0 with lambda_L > 0 for 0 < L < L_0 and lambda_{L_0} = 0, and then Q >= 0 on Dom_{L_0} and Q(psi) = 0 for some psi != 0 in Dom_{L_0}; (D) for some L there is psi != 0 in Dom_L with Q >= 0 on Dom_L and Q(psi) = 0. Moreover {L : lambda_L = 0} is a closed interval [L_0, L_1] (empty exactly when RH holds), with lambda > 0 to its left and lambda < 0 to its right.
- status: checked
- depends: T2, T10, T29, T35, T36
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Theorem 3
- source: R2-parity. KNOWN in substance: Suzuki arXiv 2606.09096 p. 5 (after Thm 1.3) and Yoshida 1992 Theorem 2 ('RH <=> non-degeneracy of Q_W^a for every a'); the seat adds the interval structure and (D) at any L
- routes: #8
- note: An EQUIVALENT form of 'RH is false' (owner rule 2: not a result). Nothing in it uses the Euler product: for the Davenport-Heilbronn form psi exists (L_0 in (1.70, 1.72]). Its use: the key lemma of idea #8, 'no psi as in (D) exists', has the equality-case shape. | 2026-11-11 -> checked: checker's verdict: correct given the cited theorems, which are established entries
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 3, section 4, Prop. 5 (a)-(d): correct given S1, S3, S4, CORE'; CORE checked against the PDF by the same checker

## T38 · The equation of a null vector of a non-negative window form (all terms)
- statement: Notation of T7, T10. Let Q >= 0 on Dom_L and Q(psi) = 0, psi in Dom_L extended by 0 outside [-L, L]. Then Q(psi, h) = 0 for every h in Dom_L, i.e. for |x| < L, in the sense of distributions: e^{x/2} int psi(y) e^{-y/2} dy + e^{-x/2} int psi(y) e^{y/2} dy - (log pi) psi(x) + int_0^inf ( psi(x) e^{-2u}/u - w(u) [psi(x-u) + psi(x+u)] ) du - sum_{2 <= n < e^{2L}} Lambda(n) n^{-1/2} [psi(x - log n) + psi(x + log n)] = 0. Equivalently the distribution x -> sum_gamma m_gamma psihat(gamma) e^{-i gamma x} vanishes on (-L, L).
- status: checked
- depends: T7, T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, section 4
- source: R2-parity
- routes: #8
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 3, section 4, Prop. 5 (a)-(d): correct given S1, S3, S4, CORE'
- note: 2026-11-11 -> checked: checker's verdict: correct

## T39 · Properties of a null vector at the first failure: reality, parity, full support, transform
- statement: Notation of T37 (C). Let psi != 0 in Dom_{L_0} with Q(psi) = 0 at the first failure L_0. (a) Re psi, Im psi and the even and odd parts of psi are each null vectors or zero; so there is a real null vector that is even or odd. (b) The convex hull of supp psi is exactly [-L_0, L_0]. (c) psihat is entire of exponential type exactly L_0 in both half-planes, bounded on R, with O(r) zeros in |z| <= r, and sum over real gamma of m_gamma |psihat(gamma)|^2 = -2 sum_{z in Z} m_z Re[psihat(z) conj(psihat(conj z))] > 0; for a real null vector of parity +-1 the right side is -+2 sum_{z in Z} m_z Re[psihat(z)^2]. (d) The null space of Q on Dom_{L_0} is finite dimensional.
- status: checked
- depends: T37, T36, T38, T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Proposition 5 (a)-(d)
- source: R2-parity
- routes: #8
- note: Conditional on RH being false (or read for the Davenport-Heilbronn form, where the null vector exists). Uses no arithmetic. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Prop. 5 (a)-(d): correct given S1, S3, S4, CORE'

## T40 · End-point regularity of a first-failure null vector
- statement: Notation of T39. A null vector psi at the first failure is continuous on [-L_0, L_0] and psi(x) = O(1/|log(L_0 - |x|)|) as |x| -> L_0.
- status: open
- depends: T38
- source: R2-parity (PROOF_first_failure.md, Proposition 5 (e): 'NOT PROVED (named wall)')
- routes: #8
- note: OPEN. The equation of T38 is an exterior problem for an operator of logarithmic order whose right side contains translates of psi itself; for the pure logarithmic Laplacian the boundary behaviour is in the literature (Chen-Weth 2019, from memory, not read). The translates psi(x -+ log n) carry any end singularity to the interior points +-(L_0 - log n).

## T41 · Simplicity and parity of the first null vector
- statement: Notation of T37 (C). At the first failure L_0 the null space of Q on Dom_{L_0} is one-dimensional, and it is spanned by an even function.
- status: open
- depends: T39
- source: R2-parity (PROOF_first_failure.md, Proposition 5 (f): 'NOT PROVED')
- routes: #8
- note: OPEN. COMPUTED only: the lowest eigenvector is even in every case computed; for the Davenport-Heilbronn form the even block fails first, L in (1.70, 1.72]. Suzuki's Thm 1.4 gives simplicity and evenness for small a only (T2). Needed, for instance, for the continuity of the ground state used heuristically on board B56.

## T42 · A Hadamard-type formula for the derivative of the lowest window eigenvalue (target of idea #8, 'smallest')
- statement: (Target; NOT yet a precise statement.) For the windowed Weil operator, d lambda_L / dL exists for almost every L and equals an explicit non-positive quadratic expression in the boundary behaviour of the ground state at x = +-L (the analogue of Hadamard's domain-variation formula for an operator of logarithmic order), with the prime powers entering only through jumps at L = (1/2) log n.
- status: open
- depends: T2, T35, T10
- source: lead (idea #8, field 'smallest'); notebook N19, N20
- routes: #8
- note: OPEN and not precise: no candidate formula is written anywhere in the project. Not found in the three papers read (KNOWLEDGE section 7); the logarithmic-Laplacian literature has not been searched. It needs T40-type boundary information to make sense.

## T43 · Under RH the von Mangoldt weights are isolated: no summable atomic perturbation keeps the form non-negative on the whole line
- statement: Notation of T7. Assume RH. Let D = sum_j d_j (delta_{u_j} + delta_{-u_j}) be a real atomic measure with distinct positions u_j > 0 (no atom at 0; the u_j need not be logarithms of integers) and sum_j |d_j| < infinity. If Qz(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) >= 0 for every f in C_c^inf(R) (g_f(u) = int f(x) conj f(x-u) dx), then D = 0.
- status: checked
- depends: T8
- proof: rh/experiments/r2_parity/PROOF_uniqueness.md, Theorem U (makes notebook N14 step 4 rigorous)
- source: lead (N14 step 4, three lines); R2-parity (full proof). Unsearched, presumed folklore; overlaps claims of the Johns preprint (T17, unverified)
- routes: #9
- note: Uses RH, the discreteness of the ordinates and N(T) = O(T log T); it does NOT use the Euler product, integrality of positions or the sign of Lambda, so it cannot distinguish zeta from any other system whose form is positive. 'Atomic', 'no atom at 0', 'summable' and 'all of R' are each essential (examples in the proof file; for one window see T44). | 2026-11-11 -> checked: checker's verdict: every step checked
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem U: correct, every step checked (Step 1 Fourier inversion, Step 2 scaling and dominated convergence, Step 3 means). Uses RH as a hypothesis, openly.'

## T44 · Under RH the feasible set of weights on a single window has non-empty interior
- statement: Notation of T10. Assume RH and fix L > 0. For every real atomic measure D = sum_j d_j (delta_{u_j} + delta_{-u_j}), u_j > 0, with 2 sum_j |d_j| <= lambda_L: Q(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) >= 0 for every f in Dom_L. (lambda_L > 0 by T36.) So on one window the conclusion of T43 fails for every L.
- status: checked
- depends: T36, T10
- proof: rh/experiments/r2_parity/refuter/PROGRESS.md, PROOF CHECK of PROOF_uniqueness.md ('One-line proof: |D(f*f~)| <= 2 sum|d_j| ||f||^2 and lambda(L) > 0 is attained')
- source: R2-parity-ref (the checker); accepted by the seat (board B57)
- routes: #9
- note: This is why idea #9 needs a RATE: the window-L feasible set shrinks with lambda_L (about 8e-30 at L = 1) but is never a point. The discretised feasible intervals computed by three implementations are outer bounds. | 2026-11-11 -> checked: one-line proof re-derived
- checked by: K-theory (one line, check C4 in rh/experiments/k_theory/PROGRESS.md); the proof is by the seat's checker, not by the seat

## T45 · First-order caps on the change of one weight (trial-vector bound)
- statement: Notation of T7. Fix L and an integer n with 2 <= n < e^{2L}; let Q^(delta) be Q with the weight Lambda(n) replaced by Lambda(n) + delta. For every real f in D_L (or in the form domain) with ||f|| = 1: Q^(delta)(f) = Q(f) - 2 delta n^{-1/2} G_f, G_f := int f(x) f(x - log n) dx. Hence if Q^(delta) >= 0 on even functions and f_e is a real even unit vector with Q(f_e) = mu_e and G_{f_e} > 0, then delta <= mu_e sqrt(n)/(2 G_{f_e}); if Q^(delta) >= 0 on odd functions and f_o is a real odd unit vector with Q(f_o) = mu_o and G_{f_o} < 0, then delta >= -mu_o sqrt(n)/(2 |G_{f_o}|). Also G_f = 0 for a function f supported in [0, L] when log n >= L: for a parity eigenfunction the prime powers n >= e^L enter only through the mirror part int phi(x) phi(log n - x) dx of its folded half phi (with sign + on even, - on odd functions).
- status: checked
- proof: rh/board/s1.md, post B58 (FACT 1, FACT 3); rh/experiments/s1_seminar/parity/NOTES.md, section J
- source: S1-parity
- routes: #9
- note: With f_e, f_o the two block ground states at L = 1 these caps reproduce the exact end points of the discretised feasible intervals to 0.1% (n <= 5), 2% (n = 6), 18% (n = 7) (COMPUTED, S1-parity against R2-parity-ref). The SIGNS G_{f_e} > 0, G_{f_o} < 0 are not proved: they follow from T46 for n >= e^L. | 2026-11-11 -> checked: one-line proof re-derived
- checked by: K-theory (one line, check C5 in rh/experiments/k_theory/PROGRESS.md)

## T46 · Positivity of the folded ground states of the two parity blocks
- statement: Notation of T10, for zeta. For every L > 0 (COMPUTED only at L = 0.75 and L = 1): a lowest eigenfunction of the even block of the window form on (-L, L), and one of the odd block, can be chosen strictly positive on (0, L].
- status: open
- source: S1-parity (board B58 'FACT 2 (COMPUTED, not proved)'; local idea S1-parity/#6)
- routes: #9
- note: OPEN. COMPUTED: integer lattice N = 40, 110 digits, no sign change on 400 points (even: min 2.1e-14, max 1.62; odd: min 1.0e-12, max 1.40 at L = 1). Perron-Frobenius does not apply: it holds for N (non-negative kernel, T4), not for Q, and the odd block of the fibre-extended matrix loses the sign at the mirror entries of the primes (S1-cubic, board B52). If true it gives the sign pattern of T45 for every prime power in [e^L, e^{2L}).

## T47 · A certified finite statement: at L = 1 positivity pins each weight at 2..7 to a tiny interval (target of idea #9, 'smallest')
- statement: Notation of T7, L = 1. For n in {2,...,7} let Q^(n,delta) be Q with the weight at n (Lambda(n), which is 0 for n = 6) replaced by Lambda(n) + delta, the other weights unchanged. TARGET: if Q^(n,delta) >= 0 on D_1 then delta lies in [-eps_n^-, eps_n^+] with (eps^-, eps^+) = (5.2e-26, 1.2e-28), (3.3e-24, 3.4e-26), (1.5e-21, 4.2e-23), (4.0e-18, 2.6e-19), (1.3e-13, 1.9e-14), (1.6e-6, 6.7e-7) for n = 2, ..., 7.
- status: open
- source: lead (idea #9, field 'smallest'; e9_bootstrap); numbers: exact end points of the discretised problem by R2-parity-ref (c2_iv_int40.log), rounded outwards by K-theory
- routes: #9
- note: OPEN as a theorem: COMPUTED only (three implementations agree: lead, R2-parity, R2-parity-ref; R2-judge J12 for n = 6), in multiprecision floating point, not interval arithmetic. The logic is sound for a certificate: infeasibility on a finite-dimensional subspace of D_1 implies infeasibility on the window, so a rigorous eigenvalue enclosure of one finite matrix pencil per n would prove the statement; no zeros are used. Not covered: the JOINT feasible set (not a box: R2-parity), and the feasibility of delta = 0, which is window positivity for zeta at L = 1 and is not proved by anything in the project.

## T48 · The prime-free dual inequality
- statement: Notation of T7. For every f in C_c^inf(R) whose autocorrelation g(u) = int f(x) conj f(x-u) dx satisfies Re g(log n) >= 0 for all integers n >= 2: P(f) + A(f) >= 0.
- status: open
- depends: T1, T7
- source: lead (notebook N14 step 5; idea #9, field 'new input')
- routes: #9
- note: OPEN. RH implies it in one line (Q = P + A - Pi >= 0 by T1 and Pi(f) >= 0 under the hypothesis). Whether it is provable outright, and whether it implies RH, is not known in the project; the Johns preprint claims an equivalence of this type by LP duality (T17, unverified). It mentions neither primes nor zeros.
















































