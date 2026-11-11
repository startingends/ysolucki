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
- note: 2026-11-10 -> known: citation recorded; not reproved here | READERS: the same window criterion is Proposition C.1 of Connes-Consani arXiv 2006.13771 (proof: Yoshida's) and is restated in the introduction of Connes-Consani-Moscovici arXiv 2310.18423; per READER-1 the sentence 'RH fails iff lambda_a < 0 for some a' is Suzuki's own step, while Yoshida is credited with positive definiteness on C_c^inf(-a,a) for every a. Journal J4: nothing is PROVED for any window that contains a prime (proved range of positivity: e^{2L} <= 2).

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
- note: 2026-11-11 -> checked: two-line proof read line by line; Theorem E confirmed by the seat's checker | READERS (rh/library/R-read-1_PROGRESS.md item 8; connes-consani-weil-positivity-archimedean.md; burnol-explicit-formula-propagator.md): the positive off-diagonal kernel of every local term is implicit in Weil 1952, Haran 1990, Burnol 1998, and for the archimedean place it is remarked in the introduction of Connes-Consani arXiv 2006.13771; it is not used there as an input.

## T5 · Parity-block form of RH on a window
- statement: Notation of T7. RH holds iff for every L > 0 and every real f in D_L: N(f) <= 2 <f, c>^2 if f is even, and N(f) <= -2 <f, s>^2 if f is odd. (Equivalent to Q_L >= 0 for all L by T26; 'N has at most one positive eigenvalue on every window' alone is weaker: T31.)
- status: checked
- depends: T1, T7, T26
- source: round-1 judge (wall WJ13); proof written by R2-parity
- routes: #10, #11, #21
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Lemma 2
- note: A reformulation of RH (block form of Weil's criterion), entered once. Each block alone already suffices: T30. | 2026-11-11 -> checked: checker's verdict: correct; all dependencies established
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1, Lemma 2: correct. Trivial (two lines each)'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: parity lemma (Lemmas 1, 2) 'proved, trivial')

## T6 · Bridge: mirror positivity implies the block inequalities
- statement: (The bridge of idea #21, as a general implication; rewritten 2026-11-11 from the seed's wording, which was marked 'not yet a precise statement'.) Let F be a Dirichlet series with a functional equation s -> 1-s, an Euler product, non-negative log-derivative coefficients c(n) supported on the true integers, a mirror-positive coefficient matrix [c(ab)], a, b >= 2, and a completely monotone archimedean kernel. Then the Weil form of F is >= 0 on every window (the two block inequalities of T5 hold for F with its own pole term). The statement was required to fail for a Beurling system.
- status: refuted
- depends: T5, T70, T71
- source: lead (idea #21: 'mirror positivity implies shift positivity', Kallen-Lehmann with one time per prime)
- routes: #21
- note: REFUTED (S1-mirror, board B15; accepted by the lead, B69: idea #21 killed, barrier B11 added). Counterexample F_d(s) = zeta(s-d) zeta(s+d), 0 < d < 1/2: its whole Weil kernel is zeta's times 2cosh(du): prime weights Lambda(n) n^{-1/2} 2cosh(d log n) >= 0 on the true integers, Euler product with real positive local roots p^{+-d} (mirror positive by T70 / T77), Gamma kernel 2cosh(du) w(u) = sum of exponentials with rates 2m + 1/2 +- d > 0 (completely monotone), functional equation s -> 1-s; yet its zeros rho +- d are off the centre line unconditionally, and its form is negative on the window L = 0.75 for every d > 7.9e-6 (T79; two implementations). The hypotheses are closed under multiplying the kernel by real exponentials e^{du}, the conclusion only under e^{itu}. Adding 'exactly one wrong-sign square in the mirror form' does not save it: G_d = zeta(s) L(s-d,chi_4) L(s+d,chi_4) passes that too (board B81). What the family violates is the size normalisation of the local roots (|root| = 1). The literal reading of the seed's wording, with F = zeta only, is RH itself and is not what is refuted. Other mirror-positive systems whose window form fails: one-prime system (from L = 0.56), Liouville twist, any change of a weight beyond 1e-5..1e-13 (board B18, B19, B47). | 2026-11-11 -> refuted: counterexample zeta(s-d) zeta(s+d): all hypotheses hold, zeros off the centre line, window form negative at L = 0.75 for d > 7.9e-6

## T7 · Weil's explicit formula in the project's normalisation (and the notation used by later entries)
- statement: NOTATION. L > 0; D_L = C_c^inf((-L,L)), complex valued, D = C_c^inf(R); for f, h in D: g(u) = int f(x) conj(h(x-u)) dx; fhat(z) = int f(x) e^{izx} dx; w(u) = e^{u/2}/(2 sinh u) for u > 0. Arithmetic side: P(f,h) = int g(u) 2 cosh(u/2) du [pole]; A(f,h) = -log(pi) g(0) + int_0^inf [ g(0) e^{-2u}/u - w(u) (g(u) + g(-u)) ] du [archimedean]; Pi(f,h) = sum_{n>=2} Lambda(n) n^{-1/2} (g(log n) + g(-log n)) [primes]; N = Pi - A; Q = P - N = P + A - Pi; q(f) means q(f,f); subscript L = restriction to D_L; f_e, f_o = even and odd parts; c(x) = cosh(x/2), s(x) = sinh(x/2), <f,c> = int f c. Zero side: Qz(f,h) = sum over the zeros rho = 1/2 + i gamma of zeta in the strip 0 < Re s < 1 (gamma complex, multiplicity m_gamma) of m_gamma fhat(gamma) conj(hhat(conj gamma)). STATEMENT: Qz(f,h) = Q(f,h) for all f, h in D.
- status: known
- source: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3, section 1.1 (the five terms of W(f): int f(x)(e^{x/2}+e^{-x/2})dx - sum Lambda(n) n^{-1/2} f(log n) - sum Lambda(n) n^{-1/2} f(-log n) - (log 4pi + C_0) f(0) - int_0^inf {f(x)+f(-x)-2e^{-x/2}f(0)} e^{x/2}dx/(e^x-e^{-x}); Q_W(v1,v2) = W(v1 * v2~)) and eq. (3.1) ('the Weil explicit formula yields' Q_W(v1,v2) = sum_gamma m_gamma v1^(gamma) conj(v2^(conj gamma)), Fourier transform fhat(z) = int f(x) e^{izx} dx). Read IN FULL by READER-1 (rh/library/2606.09096.md, which records the same W and (3.1)); read by K-theory 2026-11-11 through a quoting fetch of the HTML; read in part by the lead, R2-parity-ref and R2-judge. Original: Weil 1952 (not read).
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
- statement: Notation of T7. For each a > 0 let Q_W^a be the restriction of the Weil form Q to its form domain Dom_a = {v in L^2(-a,a) : |Q(v)| < infinity} (v extended by zero). Then: (1) Q_W^a is bounded below and lower semicontinuous (closed); (2) the associated self-adjoint operator A_a is the Friedrichs extension of the symmetric operator defined on C_c^inf(-a,a); (3) the spectrum of A_a is bounded below and discrete, so lambda_a := inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is an eigenvalue (attained); (4) lambda_a equals the infimum of the same quotient over C_c^inf(-a,a), and every minimiser lies in the closure of C_c^inf(-a,a) in the form norm; (5) because Q_W^a is the restriction of one form, Dom_a is contained in Dom_b for a < b, and the translate by c of v in Dom_a lies in Dom_{a+|c|} with the same value of Q.
- status: known
- depends: T7
- source: M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3: Thm 1.1 (A_a is the Friedrichs extension), Cor 1.2 (infimum over C_c^inf); the operator, its discrete spectrum and ground state are Connes-Consani-Moscovici's (arXiv 2511.22755, Thm 3.6, Cor 3.7) and closedness and the lower bound are Connes-Consani Prop 2.1, both as quoted by Suzuki. Read IN FULL by READER-1 (rh/library/2606.09096.md: 'items (1) to (4) are as in the paper'); read in part by R2-parity-ref, R2-judge, the lead and K-theory. The Connes-Consani(-Moscovici) papers were read by the reader seats (rh/library), not by K-theory.
- routes: #2, #8, #9
- note: This replaces the assumption 'CORE' of PROOF_first_failure.md: R2-parity-ref checked it against the PDF. NOT stated by Suzuki and not used: 'Dom_a = {int log(2+|r|)|vhat|^2 < infinity}' (he proves only an inclusion, p. 13-14). | 2026-11-11 -> known: statements quoted from the paper by three readers | READER (rh/library/2106.01715.md, Connes-Consani 'Spectral triples and zeta-cycles', whole paper): with the Connes-Consani definition the form is defined on all of L^2 of the window with values in (-inf, +inf] (Prop. 2.1) and its domain is exactly {int log(2+|s|)|fhat(s)|^2 ds < infinity} (through the proofs of 2.1 and 2.2); the exponentials are a form core (Prop. 2.3); Rayleigh-Ritz values in the exponential basis converge to the bottom of the form (Cor. 2.4).

## T11 · Connes-van Suijlekom: simple isolated even ground state has a transform with only real zeros
- statement: If the quadratic form defined by a real even distribution on a window (-a, a) has a simple isolated lowest eigenvalue whose eigenfunction is even, then the Fourier transform of that eigenfunction has only real zeros.
- status: known
- source: A. Connes, W. van Suijlekom, 'Quadratic Forms, Real Zeros and Echoes of the Spectral Action', arXiv 2511.23257 v1; quoted from the text by the lead (KNOWLEDGE section 7: first 40k of 118k characters verbatim)
- routes: #2, #20
- note: Exact hypotheses, from READER-1's digest of the whole paper (rh/library/2511.23257.md, Theorem 6.1): the distribution is given on [0, 2a] and the form is built from it; the form must be lower bounded with the trigonometric polynomials of period 2a as a core; 'simple' means simple in all of L^2; 'isolated' is a hypothesis; the sign of the eigenvalue is irrelevant; no arithmetic hypothesis. For the Weil window, lower-boundedness, the core and isolation are supplied by T10; what remains to be assumed is 'simple, with even eigenfunction'.

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
- statement: (Quoted; the objects K_L^{omega,nu}[t] and J_L^{omega,nu}(t;z,w) are defined in the paper, sections 2 to 5; S_R is the paper's subclass of the Selberg class.) 'The validity of GRH(L) for L in S_R is equivalent to the condition that there exists a sequence (omega_n, nu_n) in R_{>0} x Z_{>0}, n >= 1, such that (1) omega_m < omega_n if m > n and omega_n -> 0 as n -> infinity, (2) nu_n omega_n d_L > 1, (3) det(1 +- K_L^{omega_n,nu_n}[t]) != 0 for every t >= 0, and (4) lim_{t -> infinity} J_L^{omega_n,nu_n}(t;z,z) = 0 for every z in C_+.' Condition (3) is the existence of the Hamiltonian of the canonical system on the whole half-line.
- status: known
- source: M. Suzuki, 'Hamiltonians arising from L-functions in the Selberg class', arXiv 1606.05726 v3, Theorem 2.4; read in full by READER-1 (rh/library/1606.05726.md: 109,006 of 109,006 characters)
- routes: #8
- note: Corrections to the project's earlier wording (reader): the condition is imposed along a sequence of shifts omega_n -> 0 with powers nu_n, not 'for every a > 0' and not in a window size; existence of the Hamiltonian (3) is only one of two conditions, the limit condition (4) is also required and is not shown to follow from (3); the class is S_R, not the whole Selberg class; 'J. Funct. Anal. 2021' is not supported (the JFA paper is a companion on the inverse problem). A reformulation of RH; relevant because lane A's 'kicked Krein system' (merged into idea #8) is this in substance. The companion arXiv 1204.1827 was not read. | 2026-11-11 -> known: exact statement quoted from the paper by a reader who read all of it (rh/library/1606.05726.md)

## T17 · Positive-solutions duality and the conductor threshold (Johns preprint)
- statement: (Claims of an unreviewed preprint; theorem numbers from the reader's digest, exact hypotheses there.) An 'admissible pair' is a positive measure on the zero side together with a positive measure on the prime side carried by [log 2, infinity) solving the explicit formula with zeta's Gamma factor and pole. (a) [Theorem 2.7 with Prop. 2.10] an admissible pair exists iff a prime-free, zero-free inequality kappa* >= 0 holds (conic duality over the cone of F >= 0 on R, analytic in a strip, with Fourier transform >= 0 on [xi_2, infinity)). (b) [Theorems 3.6, 3.8, 3.11, Prop. 3.5] uniqueness of the pair under restrictions on the zero-side support. (c) [Prop. 5.10 with Prop. 2.10] with a conductor q as parameter: one certified pair at q = e^{0.02}, hence q_min < 1.017182 and pairs for all q >= q_min.
- status: open
- source: N. Johns, 'Positive solutions of the explicit formula for zeta(s): near-criticality and uniqueness', v1.4, October 2026, github.com/nic410/zeta-positive-solutions (UNREVIEWED, AI-produced); read in full by the reader seats (rh/library/johns-2026-part1.md, johns-positive-solutions.md)
- routes: #9
- note: OPEN and must stay so until a human has checked the proofs: the preprint's README says nobody has; the reader seats read it, which is not checking it. Nothing in the project may rest on it. Note (reader): kappa* >= 0 gives existence of a pair; RH follows only with uniqueness (the preprint's Conjecture U / Part II claim). The project's own statements in this area are T43 (special case of the preprint's Prop. 3.2(b) for atoms at positions >= log 2, per the reader) and T44, T47 (no counterpart there).

## T18 · Hecke's dimension count: the functional equation of the theta dial has a unique solution for 0 < n < 8
- statement: (1) For real k >= 0: dim M_k(Gamma_theta, +) = floor((k+4)/4) = 1 + [k/4] and dim M_k(Gamma_theta, -) = floor((k+2)/4) (modular forms of weight k for the theta group with the theta automorphy factor, moderate growth). With k = n/2 for theta^n: the space is one-dimensional for 0 <= n < 8. (2) (Bochner's converse theorem, as stated in the paper's Remark after Proposition 4.1) a Dirichlet series with the corresponding functional equation and finitely many poles is L_f for some f in M_k(Gamma_theta, +-) plus a finite combination of derivatives of explicit kernels attached to the extra poles. Hence for 0 < n < 8 the solution of the functional equation of Z_n(s) = sum r_n(m) m^-s is unique ONCE THE POLES ARE PRESCRIBED.
- status: known
- source: Bondarenko, Radchenko, Seip, 'Fourier interpolation with zeros of zeta and L-functions', arXiv 2005.02996 v3: Proposition 3.1 (cited there to Berndt-Knopp, 'Hecke's theory of modular forms and Dirichlet series', Thm 6.3, with a short proof) and the Remark after Proposition 4.1; read in full by seat R-read-2 (rh/library/brs-fourier-interpolation.md), sections 1 to 3 by READER-2 (rh/library/2005.02996.md). First used in the project by the round-1 judge from memory
- routes: #9, #12, #13, #26
- note: Upgraded from open after checking BOTH digests: READER-2's partial digest (sections 1 to 3) has only the modular-form count; R-read-2's complete note locates the passage to Dirichlet series (the Remark after Prop. 4.1). Caveats: part (2) is a remark in the paper citing Bochner, and its growth hypotheses are recorded here only as 'finitely many poles' and bounded in vertical strips; uniqueness is 'once the poles are prescribed', which is the precise form of the statement idea #13 uses ('uniqueness of the solution of the functional equation does not force RH'). Nothing in the paper concerns zeros of the dial members. | 2026-11-11 -> known: dimension count and the Bochner remark located in a paper read in full by a reader seat

## T19 · Moment criterion for multiplicative Hankel (Helson) matrices indexed by a, b >= 1
- statement: Let alpha(n) = O(n^a) for some finite a > 0 and M(alpha) := [alpha(nm)], n, m >= 1. (i) M(alpha) >= 0 iff there is a measure mu >= 0 on R^infinity with t^kappa in L^1(mu) for all multi-indices kappa and alpha(n) = int t^kappa dmu(t) for n = p^kappa; mu is then unique. (ii) M(alpha) >= 0 and M(alpha(p .)) >= 0 for all primes p iff there is such a measure supported on [0, infinity)^infinity. Without a growth condition (i) is false already in two variables.
- status: known
- source: Perfekt and Pushnitski, 'On Helson matrices: moment problems, non-negativity, boundedness, and finite rank', Proc. London Math. Soc. 116 (2018), arXiv 1611.03772 v2, Theorem 3.3, which the paper calls 'a combination of results existing in the literature' and cites to Ju. M. Berezanskii's 1968 monograph, Berg-Christensen-Ressel 1984 and Samoilenko 1991; the paper gives only a sketch of proof. Read in full by READER-2 (rh/library/1611.03772.md); sections 1 to 3 by S1-mirror
- routes: #21
- note: Corrected 2026-11-11 after READER-2's digest of the whole paper (rh/library/1611.03772.md, checked by K-theory): credit (Berezanskii 1968, Berg-Christensen-Ressel 1984, Samoilenko 1991, not 'Berezansky-Kondratiev'), part (ii) added, and the fact that the paper only sketches the proof and calls the result essentially known. The matrix that idea #21 needs is indexed by a, b >= 2 (for Lambda the matrix on a, b >= 1 is not >= 0, T70); that variant is NOT in the paper: it is the project's own T76 (proved by one seat, not independently checked).

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
- note: That the zeros of the de Bruijn-Newman family H_t obey this ODE is NOT part of the lemma (it is COMPUTED in lane B to 7e-9 .. 2.5e-6 and recalled from the literature). Wall WJ10: every functional found is monotone in the direction that does not help. | 2026-11-11 -> checked: two-line computation re-derived | READER (rh/library/rodgers-tao-newman.md): the ODE for REAL SIMPLE zeros of H_t is Csordas-Smith-Varga 1994, Lemma 2.4, restated as Theorem 11 of Rodgers-Tao (arXiv 1801.05914) for Lambda < t <= 0 with a principal-value sum; that paper has no statement on the motion of non-real zeros and nothing on sum y_k^2, so this identity is not in it. Journal J4: the monotone quantities of the forward flow that lane B computed are in Rodgers-Tao (Lemma 12).
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
- note: NOT PROVED IN WRITING for the off-lattice case: the critic says 'derived by hand (3 lines)' but the derivation is not in the file. COMPUTED: both sides agree to 1e-30 at three (L, w, w') for zeta with the explicit H. The LATTICE case is in the literature: Connes-van Suijlekom arXiv 2511.23257, Proposition 4.1 (and 4.2 for the converse), per READER-1's digest (rh/library/2511.23257.md); the off-lattice identity is not in that paper. To become `proved` the three lines must be written, with the exact constant.

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
- note: Finite linear algebra plus one integral identity; a formalisation candidate. The zero-side form Qz is R-invariant as well, by T8 (ii). | 2026-11-11 -> checked: checker's verdict: correct | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T26_ParityDecomposition.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry): the linear algebra only (cross terms vanish, q(f) = q(f_e) + q(f_o), pole formula 2p(f)p(Rf) = 2c(f_e)^2 - 2s(f_o)^2), real case; that the concrete forms P, A, Pi, N, Q are R-invariant is a HYPOTHESIS there (integral changes of variable not formalised).
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1, Lemma 2: correct'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved, trivial')

## T27 · Negative squares of Q are bounded by positive squares of N (per parity block), with no hypothesis
- statement: Notation of T7. For a hermitian form q let kappa_-(q) (kappa_+(q)) be the supremum of the dimensions of subspaces on which q is negative (positive) definite. For every L > 0: kappa_-(Q_{L,even}) <= kappa_+(N_{L,even}); kappa_-(Q_{L,odd}) <= kappa_+(N_{L,odd}) + 1; hence kappa_-(Q_L) <= kappa_+(N_L) + 1. In particular 'kappa_+(N_L) <= 1 for all L' implies kappa_-(Q_L) <= 2 for all L.
- status: checked
- depends: T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Proposition 3 (b), (c)
- source: R2-parity; round-1 judge (WJ13: 'linear algebra PROVED')
- routes: #10
- note: The inequalities become equalities in finite dimension with invertible blocks: T32. | 2026-11-11 -> checked: checker's verdict: correct | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T27_KappaInequalities.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry): real forms (not hermitian), abstract Q, N with N = 2c^2 - Q etc.; kappa >= k witnessed by a finite-dimensional definite subspace. The Lean proof of the full inequality does not use the parity blocks, so the 'unwritten step' of the checker is not needed.
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Prop. 3 (a),(b),(c): correct', with one unwritten standard step (kappa_-(Q) <= kappa_-(Q_e) + kappa_-(Q_o): project a negative subspace on the two blocks); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved'; the one unwritten step supplied)

## T28 · RH implies that N = primes - arch has at most one positive direction on every window
- statement: Notation of T7, kappa_+ as in T27. Assume RH. Then for every L: N(f) <= -2 |<f_o, s>|^2 <= 0 for every f in D_L with <f, c> = 0; consequently kappa_+(N_L) <= 1, and N_{L,odd} <= -2 |<f, s>|^2.
- status: checked
- depends: T5, T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Proposition 3 (a)
- source: R2-parity; lead's notebook N24/N27 (COMPUTED: exactly one positive eigenvalue at L = 0.5, 0.75, 1)
- routes: #10, #11
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Prop. 3 (a),(b),(c): correct'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved' (a consequence of RH))
- note: 2026-11-11 -> checked: checker's verdict: correct

## T29 · Exact negative index of the Weil form: the number of negative squares on large windows equals the number of off-line zeros
- statement: Notation of T7; kappa_- as in T27. Let Z be the set of DISTINCT gamma with Im gamma > 0 (zeros with Re rho < 1/2) and nu := #Z in {0, 2, 4, ..., infinity} (nu/2 = number of off-line quartets {rho, 1-rho, conj rho, 1-conj rho}, multiplicity ignored). For the zero-side form Qz restricted to D_L and to its even and odd parts: (1) for every L: kappa_-(Qz_L) <= nu, kappa_-(Qz_{L,even}) <= nu/2, kappa_-(Qz_{L,odd}) <= nu/2; (2) L -> kappa_-(Qz_L) is non-decreasing; (3) if nu < infinity there is L_0 with kappa_-(Qz_{L,even}) = kappa_-(Qz_{L,odd}) = nu/2 and kappa_-(Qz_L) = nu for all L >= L_0; (4) if nu = infinity, kappa_-(Qz_{L,even}) and kappa_-(Qz_{L,odd}) tend to infinity with L. In particular (nu >= 2): if RH fails there are L and g in D_L with Qz(g) < 0.
- status: checked
- depends: T8
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, Theorem 4 (Steps 1-5)
- source: R2-parity. Known in substance (attributed to Bombieri in an unopened 2026 preprint; Krein-Langer theory); the parity refinement and the cosine-shift proof were not found in what was read
- routes: #8, #10, #22
- note: Uses only the zero side: T8 (i)-(iv) and the absolute convergence of the sum. Does not use the Euler product; holds for the Davenport-Heilbronn form and counts its quartets. A dictionary, not a route (the seat's own barrier check). | 2026-11-11 -> checked: checker's verdict: every step checked | Novelty (judge, section 6): the total count, with the word 'distinct' and the same hyperbolic-pair argument, is printed as 'Theorem 1 (global signature)' in an unrefereed account of an agent research run, which credits Bombieri 2000 with the upper-bound half; the per-block count was not found. Bombieri 2000 and Yoshida 1992 are still unread by the project. | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): Only Step 2 is in Lean: RHFormal/B32_NegativeSubspaceDim.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry) (if Q = Q+ + sum_{i<=nu} m_i (a_i^2 - b_i^2), Q+ >= 0, m_i > 0, every negative definite subspace has dimension <= nu). Steps 3-5 (the multiplier, attainment) are analysis and are not formalised.
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 4: correct; I checked every inequality of Steps 1-5 ... No use of RH or of anything equivalent', inequalities (3b)-(3d) also tested in 200 random cases (c4.log); R2-judge J13 (toy zero sets: counts (2,2), (1,1), (0,0) as predicted, never more than the number of quartets); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved': every step redone, including (3c), (3d) and all four cases of the Gram matrix; kill test J17 on zeta's own form with surgery: one quartet (1,1), two (2,2), never more; J13 toy zero sets)

## T30 · Equivalence: one spare negative square, or one parity block, costs nothing
- statement: Notation of T7 and T29. (1) If kappa_-(Qz_L) <= k for every L, then zeta has at most 2 floor(k/2) distinct zeros with Re rho > 1/2; in particular RH <=> kappa_-(Qz_L) <= 1 for every L. (2) RH <=> Qz_{L,even} >= 0 for every L <=> Qz_{L,odd} >= 0 for every L; in arithmetic terms RH <=> [N(f) <= 2<f,c>^2 for all real even f in D_L, all L] <=> [N(f) <= -2<f,s>^2 for all real odd f in D_L, all L].
- status: checked
- depends: T29, T7, T8, T26
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, section 5, Corollaries C1 and C4
- source: R2-parity. Part (2) is KNOWN: Yoshida 1992, Proposition 1, as reported by Suzuki arXiv 2606.09096 p. 2 (read by R2-parity-ref, R2-judge and K-theory: 'positivity on nonzero odd test functions implies RH'; for even functions 'except for possible real zeros', which T8 (iv) excludes)
- routes: #8, #10, #22
- note: Reformulations of RH, entered once. The seat withdrew any novelty claim (board B57). | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'C1, C4: correct. The last line of C1 and C4 (one parity block suffices) is KNOWN: Yoshida 1992 Prop. 1'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved' (C1) and 'proved, known' (C1 last line, C4: Yoshida 1992 Prop. 1 via Suzuki p. 2, read by the judge))

## T31 · 'N has at most one positive direction on every window' implies at most one off-line quartet
- statement: Notation of T7, T27. If kappa_+(N_L) <= 1 for every L > 0, then zeta has at most one off-line quartet {rho, 1-rho, conj rho, 1-conj rho} (of any multiplicity), i.e. at most 2 distinct zeros with Re rho > 1/2. (So: RH => [kappa_+(N_L) <= 1 for all L] => [at most one quartet]; neither arrow is known to reverse.)
- status: checked
- depends: T27, T29, T7
- proof: rh/experiments/r2_parity/PROOF_parity_index.md, section 5, Corollary C2
- source: R2-parity; answers claim (a) of idea #10 (wall WJ13 of the round-1 judge)
- routes: #10, #22
- note: The file's sentence 'cannot be improved by linear algebra alone' is an observation, not a theorem (checker; conceded on board B57): no configuration with one quartet and kappa_+(N) = 1 is exhibited. The exact condition for such a configuration is given by T32 (t_e < 1 and t_o < -1). | 2026-11-11 -> checked: checker's verdict: correct as an implication | JUDGE (JUDGEMENT.md 1.3, 2.14): the second half ('cannot be improved by linear algebra alone') is a GAP, label open; exact line: PROOF_parity_index.md section 5, C2, the sentence beginning 'the second cannot be improved by linear algebra alone, because'. New evidence J18: on surgery configurations of zeta with one quartet N has three positive eigenvalues, not one. The open converse is T81.
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'C2: correct as an implication'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: first half 'proved'; second half a gap, see note)

## T32 · Exact inertia relation between a Weil block and the corresponding block of N (rank-one pole)
- statement: Let V be a real vector space (any dimension), Q a symmetric bilinear form on V, c a linear functional, and w in V with Q(w, x) = c(x) for all x; t := 2 c(w). For a function q on V write kappa_-(q) >= k if there is a finite-dimensional subspace of dimension >= k on which q is negative off 0, and kappa_+(q) >= k likewise with positive. Then for every k: (even type, N := 2c^2 - Q) if t <= 1: kappa_-(Q) >= k <=> kappa_+(N) >= k; if t > 1: kappa_-(Q) >= k <=> kappa_+(N) >= k+1. (odd type, N' := -2c^2 - Q) if t > -1: kappa_-(Q) >= k <=> kappa_+(N') >= k; if t <= -1: kappa_-(Q) >= k+1 <=> kappa_+(N') >= k. In short kappa_+(N) = kappa_-(Q) + [t > 1] and kappa_+(N') = kappa_-(Q) - [t <= -1]. (Apply it to each parity block of the window form with c = cosh(x/2) resp. sinh(x/2): t_e = 2 c^T Q_e^-1 c, t_o = 2 s^T Q_o^-1 s.)
- status: formal
- proof: rh/experiments/r2_judge/JUDGEMENT.md, section 1.4 (last row) and 2.14 (c) (Haynsworth on [[Q_e, c],[c^T, 1/2]] and [[Q_o, s],[s^T, -1/2]]); rh/board/s1.md B56 and B92 (the seat: statement, and the even half by one polynomial identity plus Sylvester); steps written out in rh/experiments/k_theory/PROGRESS.md
- source: S1-parity (board B56) and, independently, R2-judge (J18)
- routes: #10, #23
- note: Three independent derivations agree: the seat (B56; even half written on B92), the judge (J18), K-theory. In the judge's words it 'contains curv's Theorem A as the case kappa_-(Q) = 0 and sharpens parity's Prop. 3(b)', i.e. T34 and T27. Consequence (judge, 2.14): a one-quartet configuration has kappa_+(N) = 1 exactly when c^T Q_e^-1 c <= 1/2 and s^T Q_o^-1 s < -1/2; in the computed surgery rows c^T Q_e^-1 c lies between 5.8e5 and 7e53 and N has THREE positive eigenvalues. The Beurling counts 3 and 5 reported by all seats are 1 + kappa_-(Q). COMPUTED also by the seat: 0 failures in 20000 random cases. Finite linear algebra; nominated for Lean by S1-parity (B92). | 2026-11-11 -> checked: the round-2 judge derived the identity independently (JUDGEMENT.md 1.4) and K-theory checked both written arguments | STATEMENT REWRITTEN 2026-11-11 to the machine-checked form, as the formal seat suggested: it is MORE general than the earlier wording (any dimension; invertibility of Q replaced by the existence of w; the cases t_e = 1 and t_o = -1 are covered). The earlier wording, with eigenvalue counts for invertible finite blocks, follows from it by Sylvester's law of inertia (textbook, not formalised). Both halves are machine-checked (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry). | 2026-11-11 -> formal: statement rewritten to the Lean statement (more general than the earlier one); file covered by the recorded full build of 00:52
- checked by: R2-judge (JUDGEMENT.md section 1.4: 'proved, elementary', derived independently of the seat, COMPUTED in 36 rows) for the seat's claim; K-theory for the judge's bordered-matrix argument (same matrices up to a factor sqrt 2, both Schur complements) and for the seat's identity on board B92
- formal: rh/formal/RHFormal/T32_InertiaRankOne.lean (theorems RHFormal.T32.even_le, even_gt, odd_gt, odd_le; #print axioms: propext, Classical.choice, Quot.sound only)

## T33 · The two sum-rule margins are the pole vector seen through the inverse Weil block
- statement: FINITE SETTING. V a finite-dimensional real inner-product space with an orthogonal involution J (V = V_e + V_o); Q a real symmetric J-invariant form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o (so Q = 2cc^T - 2ss^T - N). If Q_e is invertible and t_e := 2 c^T Q_e^{-1} c != 1, then N_e is invertible and 2 c^T N_e^{-1} c - 1 = 1/(t_e - 1). If Q_o is invertible and t_o := 2 s^T Q_o^{-1} s != -1, then N_o is invertible and 1 - 2 s^T (-N_o)^{-1} s = 1/(1 + t_o). In particular, when the odd Weil block is positive semidefinite (with s in its range) the odd margin lies in (0, 1]; the even margin is never zero, and it is positive iff t_e > 1, i.e. (by T32) iff N_e has a positive direction.
- status: checked
- proof: rh/experiments/s1_seminar/curv/S1_ADDITIONS.md, F1
- source: S1-curv
- routes: #11
- note: The seat states it under 'Q_e > 0'; only invertibility is used. COMPUTED by the seat to 10 digits (M = 20..160) and by R2-judge J10 (determinant form, 5.592234356886e-4 both ways). Replaces the seat's earlier wording 'sum rules saturated', withdrawn after its checker. | 2026-11-11 -> checked: two-line proof re-derived | CORRECTED 2026-11-11. The last sentence previously read: 'In particular, when a Weil block is positive definite the corresponding margin is strictly positive: the sum rules are never exactly saturated on such a window.' That is FALSE for the even block. Counterexample (formal seat, file T33_MarginSign.lean): V = R, Q(x,y) = xy, c(x) = x/2: t_e = 1/2, N_e = -1/2, even margin -2. For zeta itself: t_e = 0.198 and 0.842 at L = 0.05 and 0.10, where the even Weil block is positive definite and the even margin is -1.2468 and -6.2291 (the seat's own log). The seat's file contradicts itself there (consequence (a) of F1 is wrong for the even block, consequence (b) is right); K-theory copied (a) into this entry and its own line-by-line check C3 passed it. A MACHINE CHECK CAUGHT WHAT TWO HUMAN-STYLE CHECKS PASSED (the seat's and K-theory's). Nothing downstream used the sentence (T34 (A1) already carries 'N_e has a positive eigenvalue'). FORMAL COVERAGE: the two formulas are in rh/formal/RHFormal/B56_BorderedIdentity.lean (rankOne_value, rankOne_value_twin, rankOne_nondegenerate; coordinate-free: 'Q^-1 c' is a vector w with Q(w,.) = c) (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry); the sign statements are in T33_MarginSign.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only). Status kept at `checked`, not `formal`: the Lean statements are coordinate-free variants and the second file is not yet in a recorded full build.
- checked by: K-theory (Sherman-Morrison both ways, check C3 in rh/experiments/k_theory/PROGRESS.md); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.4: the determinant form 2c^T N_e^-1 c - 1 = det(Q_e)/|det N_e| 'proved, known' (matrix determinant lemma); J10: 5.592234356886e-4 against 5.592234356884e-4)

## T34 · Sum-rule form of the two block inequalities (Theorem A, second lines, with the hypothesis the checker added)
- statement: FINITE SETTING. V a finite-dimensional real inner-product space with an orthogonal involution J (V = V_e + V_o); Q a real symmetric J-invariant form on V with blocks Q_e, Q_o; c in V_e, s in V_o; N_e := 2cc^T - Q_e, N_o := -2ss^T - Q_o (so Q = 2cc^T - 2ss^T - N). (A1) If N_e is invertible and has at least one positive eigenvalue, then [N_e <= 2cc^T, i.e. Q_e >= 0] <=> [N_e has exactly one positive eigenvalue and 2 c^T N_e^{-1} c >= 1]. (A2) If N_o is invertible, then [N_o <= -2ss^T, i.e. Q_o >= 0] <=> [N_o is negative definite and 2 s^T (-N_o)^{-1} s <= 1].
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem A (second lines of A1, A2: Haynsworth inertia additivity for the bordered matrices)
- source: R2-curv
- routes: #11
- note: AS ORIGINALLY WRITTEN (without 'N_e has a positive eigenvalue') (A1) IS FALSE: for the zeta window form with L <= 0.10 the top eigenvalue of N is negative (-0.0742 at L = 0.10, 40 boxes), Q_e > 0, N_e has no positive eigenvalue and 2c^T N_e^-1 c - 1 = -6.23. The gap line in the proof file is 'neg(-N_e) >= 1 because <u,Nu> = lambda_1 > 0'. The seat conceded (board B26, B28). A reformulation (owner rule 2), as the seat says. | 2026-11-11 -> checked: checker's verdict with the added hypothesis; counterexample to the original recorded
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md: 'A: (A0), first lines of (A1), (A2): correct. Second line of (A1): GAP ... Repairable by adding lambda_1 > 0. (A2) second line is correct without it'); R2-judge J3 reproduced the failure of the unrepaired statement; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2 and 1.4: the gap line confirmed (J3: top eigenvalue of N is -0.0728 at L = 0.10; smallest counterexample N = [[-10,1],[1,-10]]); the repaired statement is the case kappa_-(Q) = 0 of the judge's signature identity)

## T35 · The lowest window eigenvalue is non-increasing in the window size
- statement: Notation of T10. lambda_a = inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is non-increasing in a > 0.
- status: checked
- depends: T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Lemma 1 (one line from the nestedness of the form domains, or from the infimum over C_c^inf(-a,a))
- source: R2-parity
- routes: #8
- note: KNOWLEDGE section 7 records that no monotonicity statement was found in the literature read; it is one line from min-max. | 2026-11-11 -> checked: checker's verdict: correct | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T35_MonotoneGroundState.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only): the one-line infimum argument, with nestedness and the lower bound as hypotheses (T10).
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Lemma 1: correct; and unconditional by Suzuki Cor. 1.2'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: monotonicity 'needs no assumption' by Suzuki's Corollary 1.2 (read))

## T36 · No null vector under RH; in general a non-positive vector must see an off-line zero
- statement: Notation of T7, T10, Z as in T29. Let f in Dom_L, f != 0. Then fhat does not vanish at all real gamma, so Q^+(f) := sum over real gamma of m_gamma |fhat(gamma)|^2 > 0. Consequently: (i) if RH holds, Q(f) > 0 for every f != 0 in Dom_L, and lambda_L > 0 for every L; (ii) in general, Q(f) <= 0 forces sum_{z in Z} m_z Re[ fhat(z) conj(fhat(conj z)) ] < 0.
- status: proved
- depends: T8, T9, T10, T80
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Lemma 2 (Jensen's formula: fhat has O(r) zeros in |z| <= r, against >> r log r distinct real ordinates)
- source: R2-parity
- routes: #8, #9
- note: DOWNGRADED 2026-11-11 from checked to proved. The seat's checker (R2-parity-ref) passed the Jensen/Selberg argument line by line, with two cited inputs: distinct on-line zeros (T9, established) and, for part (i) and (ii), the zero-side formula on the form domain Dom_L. READER-1's reading of the whole paper shows the paper does not state that formula on Dom_L (only without a class, used on H_0^1): it is now the open entry T80, so this entry cannot be `checked`. What is unaffected: for f in C_c^inf(-L,L) both parts hold as proved (T7). Under RH part (i) needs only an inequality that follows from Fatou's lemma (K-theory's remark in T80, not a written proof). The proof file's label 'PROVED' should read 'PROVED given T9, T10 and T80' (the seat conceded the first two on board B57). | JUDGE (JUDGEMENT.md 1.3): 'proved given the cited theorems; known in substance'; the judge also notes that (i) needs attainment of the infimum. The judge did not examine the class on which the zero-side formula is stated, so the downgrade stands.
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'the Jensen/Selberg argument is correct, with one unstated point: Selberg's count must be of DISTINCT zeros (it is ...). Part (i) also needs attainment of the infimum and the zero-side formula on the form domain'

## T37 · Equivalence (first-failure template): RH is false iff there is a first window with a null vector
- statement: Notation of T10 (lambda_L, Dom_L). The following are equivalent: (A) RH is false; (B) lambda_L < 0 for some L; (C) there is L_0 > 0 with lambda_L > 0 for 0 < L < L_0 and lambda_{L_0} = 0, and then Q >= 0 on Dom_{L_0} and Q(psi) = 0 for some psi != 0 in Dom_{L_0}; (D) for some L there is psi != 0 in Dom_L with Q >= 0 on Dom_L and Q(psi) = 0. Moreover {L : lambda_L = 0} is a closed interval [L_0, L_1] (empty exactly when RH holds), with lambda > 0 to its left and lambda < 0 to its right.
- status: proved
- depends: T2, T10, T29, T35, T36
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Theorem 3
- source: R2-parity. KNOWN in substance: Suzuki arXiv 2606.09096 p. 5 (after Thm 1.3) and Yoshida 1992 Theorem 2 ('RH <=> non-degeneracy of Q_W^a for every a'); the seat adds the interval structure and (D) at any L
- routes: #8
- note: DOWNGRADED 2026-11-11 from checked to proved: (D) => (A) uses T36 (i), which rests on the open T80. (A) => (B) (T29 with T10 (4)), (B) => (C) (T2, T35, T10) and the interval structure are unaffected and were checked by R2-parity-ref. An EQUIVALENT form of 'RH is false' (owner rule 2: not a result); KNOWN in substance (Suzuki p. 5; Yoshida 1992 Theorem 2: non-degeneracy for every a <=> RH; per READER-1 the sentence 'RH fails iff lambda_a < 0 for some a' is Suzuki's own step). Nothing in it uses the Euler product: for the Davenport-Heilbronn form psi exists (L_0 in (1.70, 1.72]). Its use: the key lemma of idea #8, 'no psi as in (D) exists', has the equality-case shape. | JUDGE: 'proved given the cited theorems; known in substance' (existence half: Suzuki p. 2 and the paragraph after Theorem 1.3).
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 3, section 4, Prop. 5 (a)-(d): correct given S1, S3, S4, CORE'; CORE checked against the PDF by the same checker

## T38 · The equation of a null vector of a non-negative window form (all terms)
- statement: Notation of T7, T10. Let Q >= 0 on Dom_L and Q(psi) = 0, psi in Dom_L extended by 0 outside [-L, L]. Then Q(psi, h) = 0 for every h in Dom_L, i.e. for |x| < L, in the sense of distributions: e^{x/2} int psi(y) e^{-y/2} dy + e^{-x/2} int psi(y) e^{y/2} dy - (log pi) psi(x) + int_0^inf ( psi(x) e^{-2u}/u - w(u) [psi(x-u) + psi(x+u)] ) du - sum_{2 <= n < e^{2L}} Lambda(n) n^{-1/2} [psi(x - log n) + psi(x + log n)] = 0. (Given T80, equivalently: the distribution x -> sum_gamma m_gamma psihat(gamma) e^{-i gamma x} vanishes on (-L, L).)
- status: checked
- depends: T7, T10
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, section 4
- source: R2-parity
- routes: #8
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem 3, section 4, Prop. 5 (a)-(d): correct given S1, S3, S4, CORE'
- note: The kernel equation (first display) uses only Cauchy-Schwarz for a non-negative form and the arithmetic side; it stays checked. The zero-side reading in the last parenthesis needs the open T80 (statement edited 2026-11-11 to say so).

## T39 · Properties of a null vector at the first failure: reality, parity, full support, transform
- statement: Notation of T37 (C). Let psi != 0 in Dom_{L_0} with Q(psi) = 0 at the first failure L_0. (a) Re psi, Im psi and the even and odd parts of psi are each null vectors or zero; so there is a real null vector that is even or odd. (b) The convex hull of supp psi is exactly [-L_0, L_0]. (c) psihat is entire of exponential type exactly L_0 in both half-planes, bounded on R, with O(r) zeros in |z| <= r, and sum over real gamma of m_gamma |psihat(gamma)|^2 = -2 sum_{z in Z} m_z Re[psihat(z) conj(psihat(conj z))] > 0; for a real null vector of parity +-1 the right side is -+2 sum_{z in Z} m_z Re[psihat(z)^2]. (d) The null space of Q on Dom_{L_0} is finite dimensional.
- status: proved
- depends: T37, T36, T38, T10, T80
- proof: rh/experiments/r2_parity/PROOF_first_failure.md, Proposition 5 (a)-(d)
- source: R2-parity
- routes: #8
- note: DOWNGRADED 2026-11-11 from checked to proved: part (c) evaluates the zero-side formula at psi (open T80) and the entry rests on T36 and T37. Parts (a), (b), (d) do not use T80 and were checked by R2-parity-ref. Conditional on RH being false (or read for the Davenport-Heilbronn form, where the null vector exists). Uses no arithmetic. | JUDGE: (a) to (d) 'proved given S1 and the domain facts'; (a), (b) by translation, (c) including conj(psihat(conj z)) = +-psihat(z) rechecked.
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
- source: lead (N14 step 4, three lines); R2-parity (full proof). Unsearched, presumed folklore; overlaps claims of the Johns preprint (T17, unverified). Overlap made exact by the reader (rh/library/johns-positive-solutions.md): for atoms at positions >= log 2 this is a special case of Proposition 3.2(b) of the unreviewed Johns preprint (which allows a diffuse positive part and needs only the negative part finite), once form positivity is translated into 'the zero side is a positive measure' (Bochner; that translation is not written anywhere); for atoms below log 2 it is not covered
- routes: #9
- note: Uses RH, the discreteness of the ordinates and N(T) = O(T log T); it does NOT use the Euler product, integrality of positions or the sign of Lambda, so it cannot distinguish zeta from any other system whose form is positive. 'Atomic', 'no atom at 0', 'summable' and 'all of R' are each essential (examples in the proof file; for one window see T44). | 2026-11-11 -> checked: checker's verdict: every step checked
- checked by: R2-parity-ref (rh/experiments/r2_parity/refuter/PROGRESS.md, section 'PROOF CHECK'): 'Theorem U: correct, every step checked (Step 1 Fourier inversion, Step 2 scaling and dominated convergence, Step 3 means). Uses RH as a hypothesis, openly.'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.3: 'proved, conditional on RH': Steps 1 to 3 redone)

## T44 · Under RH the feasible set of weights on a single window has non-empty interior
- statement: Notation of T10. Assume RH and fix L > 0. For every real atomic measure D = sum_j d_j (delta_{u_j} + delta_{-u_j}), u_j > 0, with 2 sum_j |d_j| <= lambda_L: Q(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) >= 0 for every f in Dom_L. (lambda_L > 0 by T36.) So on one window the conclusion of T43 fails for every L.
- status: proved
- depends: T36, T10
- proof: rh/experiments/r2_parity/refuter/PROGRESS.md, PROOF CHECK of PROOF_uniqueness.md ('One-line proof: |D(f*f~)| <= 2 sum|d_j| ||f||^2 and lambda(L) > 0 is attained')
- source: R2-parity-ref (the checker); accepted by the seat (board B57)
- routes: #9
- note: DOWNGRADED 2026-11-11 from checked to proved: the one-line proof (checked by K-theory, C4) uses lambda_L > 0 under RH, i.e. T36 (i), which rests on the open T80. This is why idea #9 needs a RATE: the window-L feasible set shrinks with lambda_L (about 8e-30 at L = 1) but is never a point. The discretised feasible intervals computed by three implementations are outer bounds. | JUDGE (JUDGEMENT.md 1.3, 1.4): the seat's own support for 'false on every single window' was a GAP (PROOF_uniqueness.md, 'Exact scope', second bullet: a discretised computation); the checker's one-line repair is 'proved (one line, given attainment of lambda(L))'. READER (rh/library/johns-positive-solutions.md): no counterpart in the Johns preprint, which has no window. | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T44_InteriorUnderGap.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only): the deduction only; Q f >= lam ||f||^2 and 'g_f(u) = <f, S_u f> with S_u norm non-increasing' are hypotheses.
- checked by: K-theory (one line, check C4 in rh/experiments/k_theory/PROGRESS.md); the proof is by the seat's checker, not by the seat

## T45 · First-order caps on the change of one weight (trial-vector bound)
- statement: Notation of T7. Fix L and an integer n with 2 <= n < e^{2L}; let Q^(delta) be Q with the weight Lambda(n) replaced by Lambda(n) + delta. For every real f in D_L (or in the form domain) with ||f|| = 1: Q^(delta)(f) = Q(f) - 2 delta n^{-1/2} G_f, G_f := int f(x) f(x - log n) dx. Hence if Q^(delta) >= 0 on even functions and f_e is a real even unit vector with Q(f_e) = mu_e and G_{f_e} > 0, then delta <= mu_e sqrt(n)/(2 G_{f_e}); if Q^(delta) >= 0 on odd functions and f_o is a real odd unit vector with Q(f_o) = mu_o and G_{f_o} < 0, then delta >= -mu_o sqrt(n)/(2 |G_{f_o}|). Also G_f = 0 for a function f supported in [0, L] when log n >= L: for a parity eigenfunction the prime powers n >= e^L enter only through the mirror part int phi(x) phi(log n - x) dx of its folded half phi (with sign + on even, - on odd functions).
- status: checked
- proof: rh/board/s1.md, post B58 (FACT 1, FACT 3); rh/experiments/s1_seminar/parity/NOTES.md, section J
- source: S1-parity
- routes: #9
- note: With f_e, f_o the two block ground states at L = 1 these caps reproduce the exact end points of the discretised feasible intervals to 0.1% (n <= 5), 2% (n = 6), 18% (n = 7) (COMPUTED, S1-parity against R2-parity-ref). The SIGNS G_{f_e} > 0, G_{f_o} < 0 are not proved: they follow from T46 for n >= e^L. | 2026-11-11 -> checked: one-line proof re-derived | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T45_FirstOrderCaps.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry): the DEDUCTION only (trial_bound, cap_upper, cap_lower, support_shift = Fact 1); the identity Q^(delta)(f) = Q(f) - 2 delta n^-1/2 G_f and the signs of G are hypotheses there.
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
- note: OPEN as a theorem: COMPUTED only (three implementations agree: lead, R2-parity, R2-parity-ref; R2-judge J12 for n = 6), in multiprecision floating point, not interval arithmetic. The logic is sound for a certificate: infeasibility on a finite-dimensional subspace of D_1 implies infeasibility on the window, so a rigorous eigenvalue enclosure of one finite matrix pencil per n would prove the statement; no zeros are used. Not covered: the JOINT feasible set (not a box: R2-parity), and the feasibility of delta = 0, which is window positivity for zeta at L = 1 and is not proved by anything in the project. | JUDGE (JUDGEMENT.md 1.3, 3.1, 4.3): 'all computed feasible intervals of idea #9 are outer bounds' is proved, trivial; in the lead's own basis the interval at 6 is [-1.2504e-13, +1.8239e-14] (J12). READER: no counterpart in the Johns preprint. | UPDATE: a first certified instance of a statement of this kind now exists for ONE atom at L = 1/2 and 27/50: T83 (seat FH, computer-assisted, verifier running); and the feasibility of the true weights, which this entry does not cover, is proved for L <= (1/2) log 3 by T82. Journal J4: X. Zhu, arXiv 2608.24827 (unread) claims certified bounds for the lowest window eigenvalue up to L = 0.8.

## T48 · The prime-free dual inequality
- statement: Notation of T7. For every f in C_c^inf(R) whose autocorrelation g(u) = int f(x) conj f(x-u) dx satisfies Re g(log n) >= 0 for all integers n >= 2: P(f) + A(f) >= 0.
- status: open
- depends: T1, T7
- source: lead (notebook N14 step 5; idea #9, field 'new input')
- routes: #9
- note: OPEN. RH implies it in one line (Q = P + A - Pi >= 0 by T1 and Pi(f) >= 0 under the hypothesis). Whether it is provable outright, and whether it implies RH, is not known in the project; the Johns preprint claims an equivalence of this type by LP duality (T17, unverified). It mentions neither primes nor zeros. | READER (rh/library/johns-positive-solutions.md): this statement as worded is NOT in the Johns preprint. Its Theorem 2.7 is the corresponding claim for a different cone (F >= 0 on R analytic in a strip, Fourier transform >= 0 on all of [xi_2, infinity)) and is equivalent to the existence of an admissible pair, not to RH. Ours tests only F = |fhat|^2 with f of compact support (smaller class) and asks g >= 0 only at the logarithms of integers (weaker hypothesis); neither statement contains the other; under RH both hold.

## T49 · The archimedean term is a constant minus the Dirichlet form of a Levy measure
- statement: Notation of T7. For real f in L^2(R) with compact support and of bounded variation: -A(f) = c_inf ||f||^2 - int_0^inf w(u) int_R |f(x+u) - f(x)|^2 dx du, with c_inf = log(pi) - psi(1/4) = gamma + pi/2 + log(8 pi) = 5.3721834... (psi the digamma function, gamma Euler's constant). Hence N = c_inf ||f||^2 + (prime shifts) - (Dirichlet form of the measure w(|u|) du).
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem E
- source: R2-curv; classical in substance (Levy-Khintchine form of Re psi(1/4 + i xi/2)); a Zenodo record found by the checker (search summary only) states it
- routes: #10, #11
- note: Uses Gauss's integral for the digamma function (textbook; not entered). COMPUTED: box diagonal from both sides agrees to 12 digits. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING' and 'FINAL VERDICTS'): 'E: correct (checked Gauss integral, t = 2u substitution, psi(1/4) value)'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: 'proved, known in substance': the split, t = 2u, Gauss's integral; own box matrix built from it reproduces every number)

## T50 · Fibre classes: both block inequalities are one signature statement about the bordered form Ntilde
- statement: Let V be a real vector space of finite dimension with inner product <.,.>, N a symmetric bilinear form on V, p, q in V, and Q(f) := 2<f,p><f,q> - N(f,f). Let Ntilde be the symmetric form on V + R F1 + R F2 with Ntilde(f,g) = N(f,g), Ntilde(f,F1) = <f,p>, Ntilde(f,F2) = <f,q>, Ntilde(F1,F1) = Ntilde(F2,F2) = 0, Ntilde(F1,F2) = 1. Then (number of positive eigenvalues of Ntilde) = 1 + (number of negative eigenvalues of Q) and (number of zero eigenvalues of Ntilde) = (number of zero eigenvalues of Q). In particular Q >= 0 on V iff Ntilde has exactly one positive eigenvalue. (Application: V a subspace of L^2[-L,L], N = primes - arch, p, q the projections of e^{x/2}, e^{-x/2}; then Q is the Weil form.)
- status: checked
- proof: rh/experiments/r2_cubic/PROOF_trickle.md, Lemma A
- source: R2-cubic; it is the Hodge index theorem on a product of two curves in linear-algebra form (Haynsworth inertia additivity)
- routes: #10, #23
- note: Finite linear algebra (Sylvester's law of inertia): first choice for formalisation. Uses nothing about zeta. Its infinite-dimensional and per-parity form combined with the exact index is T61. | 2026-11-11 -> checked: checker's verdict: every line checks | FORMAL STATUS (2026-11-11 00:33 UTC, from rh/formal/PROGRESS.md): RHFormal/LemmaA_FibreClasses.lean checks as a single file: formal for 'Q >= 0 on V <=> Ntilde has no positive definite plane' on ANY real vector space (no finite dimension needed); NOT formal: the two counting equalities (Sylvester's law of inertia), which are what T61 uses. Status stays as it is until the formal seat's MEMORY.md lists the file as formal and the full `lake -d rh/formal build` has succeeded (no build product for this file existed when K-theory looked; K-theory did not run Lean, because the formal seat allows one Lean process at a time). | UPDATE: the Lean file(s) named above are covered by the recorded full build of 00:52 UTC (16 files, no sorry). The status stays `checked` because the Lean statement differs from the written one as described. For T50 the COUNT is now also in Lean (RHFormal/T50_FibreClassesCount.lean: kappa_-(Q) >= k <=> kappa_+(Ntilde) >= k+1, any dimension), which is what T61 uses; not formal: the equality of the numbers of zero eigenvalues, and the identification of kappa with eigenvalue counts (Sylvester).
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Lemma A: correct, known. Every line checks'; COMPUTED: 2000 random (N,p,q), 0 violations; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved, known': U-perp and the form on it expanded by hand, Sylvester)

## T51 · Trickle-down with negative diagonal: Lorentzian slices imply a Lorentzian contraction (Lemma B)
- statement: SETTING B. T a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with all a_k > 0, T_k := (T_ijk)_{i,j} the k-th slice, H := sum_k a_k T_k, l_k := H e_k, s := H a with all s_k > 0, D := diag(a_k/s_k). Assume (B1) H_ij >= 0 for i != j and H is irreducible; (B3) every slice T_k has at most one positive eigenvalue. Then H has exactly one positive eigenvalue and H <= H D H (i.e. H D H - H is positive semidefinite). No sign condition on the entries of T is used, and the diagonal of H may have any sign. Moreover, given T.a = H and s > 0, (B3) is equivalent to T_k <= l_k l_k^T / s_k for all k.
- status: checked
- proof: rh/experiments/r2_cubic/PROOF_trickle.md, Lemma B (Steps 1-5) and Remark 1
- source: R2-cubic. KNOWN: Braenden-Leake, 'Lorentzian polynomials on cones', arXiv 2304.13203 v2, Lemma 2.8 with d = 3 (credited there to Cordero-Erausquin-Klartag-Merigot-Santambrogio 2019); pp. 6-9 read by R2-cubic-ref, p. 8 by R2-judge
- routes: #10, #24
- note: The only use of a sign is Perron-Frobenius in Step 5. Without irreducibility the conclusion fails. Finite linear algebra plus Perron-Frobenius: formalisable (mathlib has Perron-Frobenius only in part; medium). | 2026-11-11 -> checked: checker's verdict: correct; also in the literature that was read | FORMAL STATUS (2026-11-11 00:33 UTC, from rh/formal/PROGRESS.md): only Step 2 (reverse Cauchy-Schwarz) is in Lean (RHFormal/OnePositiveDirection.lean, with 'at most one positive eigenvalue' defined as 'no positive definite plane'; the equivalence with the eigenvalue count is not formalised). Steps 3-5 (Perron-Frobenius) are not. | UPDATE: the Lean file(s) named above are covered by the recorded full build of 00:52 UTC (16 files, no sorry). The status stays `checked` because the Lean statement differs from the written one as described. | The formal seat reports that mathlib v4.35.0 has NO Perron-Frobenius theorem; RHFormal/Perron_GroundState.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only) proves the finite ground-state version needed (off-diagonal <= 0, cut-connected: every minimiser has one strict sign and is unique up to scale); the full Step 5 is not yet typed.
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Lemma B: correct, KNOWN. Identical in hypotheses and proof to Braenden-Leake Lemma 2.8, case d = 3'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved, known': Steps 1 to 5 checked; read Braenden-Leake Lemma 2.8 and its proof and matched the hypotheses one by one)

## T52 · The cone certificate: bare existence of a cubic certificate is equivalent to the conclusion (vacuity)
- statement: Let H be a real symmetric m x m matrix with exactly one positive eigenvalue and a a vector with l := H a >= 0 entrywise and s := a^T H a > 0. Then T_ijk := [ H_ij l_k + H_ik l_j + H_jk l_i - (2/s) l_i l_j l_k ] / s is a symmetric 3-tensor with sum_k a_k T_ijk = H_ij whose slices all have at most one positive eigenvalue. COROLLARY: if H has non-negative off-diagonal entries and is irreducible and a > 0 with H a > 0, then [H has exactly one positive eigenvalue] <=> [there is a symmetric T with T.a = H whose slices all have at most one positive eigenvalue]. So for the windowed Weil form 'a cubic certificate for Ntilde exists' is equivalent to 'the Weil form is >= 0 on that subspace', for zeta and for any system with non-negative couplings.
- status: checked
- depends: T51
- proof: rh/experiments/r2_cubic/PROOF_trickle.md, Lemma C and its Corollary
- source: R2-cubic. Not in the parts of Braenden-Huh that were read (rh/library/branden-huh-lorentzian.md); listed in journal J4 as 'still only ours'
- routes: #10
- note: This is what parked idea #10: searching for a certificate could never have told anything. Not found in what the checker read; elementary. | 2026-11-11 -> checked: checker's verdict: every line checks | FORMAL STATUS (2026-11-11 00:33 UTC, from rh/formal/PROGRESS.md): RHFormal/LemmaC_ConeTensor.lean checks as a single file: symmetry, contraction T.a = H, the slice decomposition and 'each slice has no positive definite plane', under 'H has at most one positive direction' (slightly stronger than the written statement); the Lean proof of the slice statement avoids Weyl's inequality. The corollary (vacuity) also needs T51, which is not formalised. Status stays as it is until the formal seat's MEMORY.md lists the file as formal and the full `lake -d rh/formal build` has succeeded (no build product for this file existed when K-theory looked; K-theory did not run Lean, because the formal seat allows one Lean process at a time). | UPDATE: the Lean file(s) named above are covered by the recorded full build of 00:52 UTC (16 files, no sorry). The status stays `checked` because the Lean statement differs from the written one as described.
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Lemma C + vacuity corollary: correct. Every line checks (contraction, slice decomposition, Weyl). Hypothesis l >= 0 is really used'; R2-judge J8 (0 violations of 300 with l >= 0); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved': contraction, slice decomposition expanded by hand, Weyl; l >= 0 needed (J8))

## T53 · Rigidity: null directions of H are lineality directions of every certificate (Lemma D)
- statement: SETTING B. T a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with all a_k > 0, T_k := (T_ijk)_{i,j} the k-th slice, H := sum_k a_k T_k, l_k := H e_k, s := H a with all s_k > 0, D := diag(a_k/s_k). Assume every slice has at most one positive eigenvalue and put P_k := l_k l_k^T / s_k - T_k (positive semidefinite). Then (D1) sum_k a_k P_k = H D H - H; (D2) (H D H - H) a = 0 and P_k a = 0 for all k; (D3) for every v: sum_k a_k v^T P_k v = v^T (H D H - H) v, and if H v = 0 then P_k v = 0 and T_k v = 0 for every k; (D4) if H = Ntilde of T50, Q f = mu f with |f| = 1, and vt := (f, -<f,q>, -<f,p>), then H vt = (-mu f, 0, 0) and for every k: 0 <= vt^T P_k vt <= (mu + mu^2 f^T D f)/a_k and vt^T T_k vt = mu^2 f_k^2/s_k - vt^T P_k vt (f_k := 0 at the two fibre indices).
- status: checked
- depends: T51, T50
- proof: rh/experiments/r2_cubic/PROOF_trickle.md, Lemma D
- source: R2-cubic. Item (D3) is in the literature: Braenden-Huh, 'Lorentzian polynomials', Lemma 2.15 at d = 3 (its proof uses only that each slice has one positive eigenvalue and a^T T_k a > 0), per the note rh/library/branden-huh-lorentzian.md (seat R-read-1; the paper was read in part). (D1), (D2), (D4) have no literature source on record
- routes: #10, #24
- note: Checker's precision, accepted by the seat (board B38, B64): D4 bounds the QUADRATIC value; the vector T_k vt is controlled only at the sqrt(mu) scale; the 'Meaning' paragraph about the continuum ladder is an extrapolation, not part of the lemma. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Lemma D (D1-D4), Lemma E: correct'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved': D1 to D4 checked; D4 bounds the quadratic value only)

## T54 · Every coupled pair needs a third scale at a critical window (Lemma E)
- statement: SETTING B. T a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with all a_k > 0, T_k := (T_ijk)_{i,j} the k-th slice, H := sum_k a_k T_k, l_k := H e_k, s := H a with all s_k > 0, D := diag(a_k/s_k). Assume every slice has at most one positive eigenvalue. For every pair (i, j) the vector t_ij := (T_ijk)_k satisfies t_ij . a = H_ij and t_ij . v = 0 for every v in ker H. Consequently, if H = Ntilde of T50 has a null vector vt = (f, -<f,q>, -<f,p>) with <f,p> = <f,q> != 0 and a has equal fibre weights, then no pair (i, j) of non-fibre indices with N_ij != 0 can have T_ijk = 0 for all non-fibre k.
- status: checked
- depends: T53
- proof: rh/experiments/r2_cubic/PROOF_trickle.md, Lemma E
- source: R2-cubic
- routes: #10
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Lemma D (D1-D4), Lemma E: correct'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved' together with Lemma D)
- note: 2026-11-11 -> checked: checker's verdict: correct

## T55 · The Bakry-Emery cubic: the one certificate candidate with a formula, and it is the curvature condition (Theorem F)
- statement: Let H be real symmetric m x m, a in R^m with a_i > 0 and s := H a > 0 entrywise; A = diag(a), S = diag(s), K := S^{-1} H A (K 1 = 1), pi_i := a_i s_i, [u,v,w] := sum_i pi_i u_i v_i w_i, <u,v> := sum_i pi_i u_i v_i, L := K - I, Gamma(f) = (1/2)[L(f^2) - 2 f Lf], Gamma_2(f) = (1/2)[L Gamma(f) - 2 Gamma(f, Lf)]. Define Theta(g,f,h) := (1/2)([g,Kf,Kh] + [f,Kg,Kh] + [h,Kg,Kf]) - (1/4)([K^2 g,f,h] + [g,K^2 f,h] + [g,f,K^2 h]) + (1/4)[g,f,h]. Then (F1) Theta is symmetric and Theta(1,f,h) = <f, K h>; (F2) Theta(g,f,f) = <g, (Kf)^2> - <g, Gamma_2(f) - Gamma(f)>; (F3) T_ijk := Theta(e_i/a_i, e_j/a_j, e_k/a_k) is symmetric, sum_k a_k T_ijk = H_ij, and its k-th slice is l_k l_k^T/s_k - s_k x [the quadratic form x -> (Gamma_2 - Gamma)(A^{-1}x)(k)]; (F4) every slice of T has at most one positive eigenvalue iff Gamma_2(f)(k) >= Gamma(f)(k) for all f and all k (Bakry-Emery CD(1, infinity)); (F5) for distinct i, j, k: T_ijk = (1/2)[H_ij H_ik/s_i + H_ij H_jk/s_j + H_ik H_jk/s_k] (formulas for T_iik, T_iii in the proof file).
- status: checked
- depends: T51
- proof: rh/experiments/r2_cubic/PROOF_BE_cubic.md, section 1 (Theorem F)
- source: R2-cubic
- routes: #10, #11, #24
- note: No sign condition on H is used. Idea #10's certificate and idea #11's curvature are one object for this canonical cubic; by T65 it cannot certify a zero-margin statement. Not found in two searches by the checker. | 2026-11-11 -> checked: checker's verdict: recomputed by hand
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Theorem F (F1-F5): correct. Recomputed F1, F2 (all four collected lines), F3, F5 (all three entry types) by hand'; COMPUTED: three constructions agree to 6e-15 (checker), 2e-14 (R2-judge J7); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved': F1, the four collected lines, the pairing, F3 and the distinct-triple case of F5 by hand; own code J7)

## T56 · At mean field the certificate is unique, and a one-parameter family of local cubics is exact there
- statement: Notation of T55, with pi normalised to total mass 1 and <g> := sum_i pi_i g_i. (U) If H has rank one (K = projection on constants), the only symmetric T with T.a = H whose slices all have at most one positive eigenvalue is given by Theta(g,f,h) = <g><f><h>. (V) With sigma_1 := sym[Kg,f,h], sigma_2 := sym[K^2 g,f,h], sigma_11 := sym[Kg,Kf,h] (three terms each) and sigma_111 := [Kg,Kf,Kh], for every real t the form Theta_t := t(sigma_1 - sigma_2) + (1/2 - t) sigma_11 + (3t - 1/2) sigma_111 is symmetric, satisfies Theta_t(1,f,h) = <f,Kh> for every chain, and equals <g><f><h> when K is the projection on constants.
- status: checked
- depends: T53, T55
- proof: rh/experiments/r2_cubic/PROOF_BE_cubic.md, section 3 (U), (V)
- source: R2-cubic
- routes: #10, #25
- note: COMPUTED (seat; checker on a 0.001 grid; R2-judge J4): no t makes the slices Lorentzian for zeta (best worst-case -0.0184 at t = 0.014, L = 1, 12 boxes) nor for the Beurling control (-0.0239). The seat's 'best t = 0.05' was a grid artefact (conceded, board B64). | 2026-11-11 -> checked: checker's verdict: correct with the normalisation stated
- checked by: R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): 'Sec. 3 (U), (V): correct. Normalisation: formulas with <g> = mean need total mass of pi equal to 1'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1: 'proved': (U) from D3; (V) the four contractions by hand; needs total mass 1)

## T57 · Pair obstruction: a coupled pair whose third indices are restricted forces a rank-two lower bound on HDH - H
- statement: SETTING B. T a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with all a_k > 0, T_k := (T_ijk)_{i,j} the k-th slice, H := sum_k a_k T_k, l_k := H e_k, s := H a with all s_k > 0, D := diag(a_k/s_k). Assume every slice has at most one positive eigenvalue. Let i != j with H_ij != 0, let B be a set of indices containing i and j with T_ijk = 0 for all k in B, and w := sum_{k not in B} T_ijk e_k. Then a . w = H_ij and H D H - H >= (a_i/s_i) v_i v_i^T + (a_j/s_j) v_j v_j^T, where v_i := l_i - (s_i/H_ij) w and v_j := l_j - (s_j/H_ij) w.
- status: checked
- depends: T53
- proof: rh/experiments/s1_seminar/cubic/TURN1.md, section 3 (b), statement (E')
- source: S1-cubic
- routes: #10
- note: With B = all non-fibre indices this is a one-parameter convex test with no SDP solver. COMPUTED by the seat: it fails for every pair of boxes in every case tried (zeta and the Beurling control alike). At a critical window it reduces to T54. The seat withdrew 'certificates are maximally non-local' (board B51, B64). | 2026-11-11 -> checked: six-line proof re-derived
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C6)

## T58 · Block trickle-down: Lemma B with slices replaced by block contractions
- statement: SETTING B. T a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with all a_k > 0, T_k := (T_ijk)_{i,j} the k-th slice, H := sum_k a_k T_k, l_k := H e_k, s := H a with all s_k > 0, D := diag(a_k/s_k). Let S_1, ..., S_r be a partition of the indices, b_i := the restriction of a to S_i, H_i := sum_{k in S_i} a_k T_k, sigma_i := b_i . s. Assume each H_i has at most one positive eigenvalue, H has non-negative off-diagonal entries, and the r x r matrix Hhat := (b_i^T H b_j) is irreducible and non-degenerate. Then H has exactly one positive eigenvalue. (r = m is T51; r = 1 is the conclusion itself.)
- status: checked
- depends: T51
- proof: rh/experiments/s1_seminar/cubic/TURN1.md, section 6 ('Tensor version')
- source: S1-cubic
- routes: #10
- note: As an existence statement every intermediate block condition is again equivalent to the conclusion, because the cone tensor of T52 satisfies all of them (seat, board B62). | 2026-11-11 -> checked: proof re-derived line by line
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C7)

## T59 · One fibre field: pole minus the slowest Gamma exponential is the kernel e^{|x-y|/2}, and a doubled matrix with non-negative off-diagonal carries the signature
- statement: Notation of T7. (1) Kernel identity: e^{x/2} e^{-y/2} + e^{-x/2} e^{y/2} - e^{-|x-y|/2} = e^{|x-y|/2} =: E(x,y). (2) On any finite-dimensional subspace V of L^2[-L,L] the compression of E has at most one positive eigenvalue, and exactly one if <v, E v> > 0 for some v in V (e.g. any non-negative v != 0, since E > 0 pointwise). (3) Let W0 be the form of the kernel e^{-|x-y|/2} (the m = 0 term of w) and N' := N - W0 on V. If the compression of E to V is non-degenerate with exactly one positive eigenvalue, then (number of positive eigenvalues of the block matrix [[N', E],[E, E]]) = 1 + (number of negative eigenvalues of Q on V).
- status: checked
- proof: rh/experiments/s1_seminar/cubic/TURN1.md, section 7
- source: S1-cubic (answer to board B49)
- routes: #10
- note: Hypothesis made explicit by K-theory: non-degeneracy of the compression of E to V. It is proved for the integral operator on L^2 ((-d^2/dx^2 + 1/4) E = -delta) and COMPUTED on boxes (eigenvalues 2.894, -5.9e-4, ...), not proved for an arbitrary subspace. In the box basis all off-diagonal entries of the doubled matrix are >= 0 (COMPUTED). | 2026-11-11 -> checked: three-line proof re-derived; one hypothesis added
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C8)

## T60 · Per-prime Poisson decomposition of the Weil form
- statement: Notation of T7 and T49. For real f in L^2 supported in [-L, L] (of bounded variation), with C(u) := int f(x+u) f(x) dx, theta(X) := sum_{p <= X} log p, E_w(f) := int_0^inf w(u) int |f(x+u) - f(x)|^2 dx du, and for each prime p: q_p(f) := sum_{k in Z} p^{-|k|/2} C(k log p). Then Q(f) = 2<f,e^{x/2}><f,e^{-x/2}> + E_w(f) + (theta(e^{2L}) - c_inf) ||f||^2 - sum_{p <= e^{2L}} (log p) q_p(f), and with r = p^{-1/2}: (1-r)/(1+r) ||f||^2 <= q_p(f) <= (1+r)/(1-r) ||f||^2.
- status: checked
- depends: T49
- proof: rh/experiments/s1_seminar/cubic/TURN1.md, section 2
- source: S1-cubic
- routes: #10, #21
- note: Window positivity is thus an UPPER bound for sum_p (log p) q_p; each q_p is a positive form entering with a minus sign. COMPUTED: on the lowest eigenvector (24 boxes, L = 1) q_p = 1.964, 1.317, 1.030, 1.000 for p = 2, 3, 5, 7. | 2026-11-11 -> checked: bookkeeping proof re-derived
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C9)

## T61 · The signature of the fibre-extended form counts the off-line zeros exactly, per parity block
- statement: Notation of T7, T29. For each L let Ntilde_L be the form of T50 on V = D_L with N = Pi - A, p = e^{x/2}, q = e^{-x/2} (pairing <f,p> = int f p). Then kappa_+(Ntilde_L) = 1 + kappa_-(Q_L) for every L, and sup_L kappa_+(Ntilde_L) = 1 + nu. The reflection x -> -x swaps F1 and F2; on the even block D_{L,even} + R(F1+F2): kappa_+ = 1 + kappa_-(Q_{L,even}); on the odd block D_{L,odd} + R(F1-F2): kappa_+ = kappa_-(Q_{L,odd}). Hence RH <=> the odd block of Ntilde_L is <= 0 for every L <=> the even block of Ntilde_L has exactly one positive square for every L; each off-line quartet adds exactly one positive square to each block for L large.
- status: checked
- depends: T50, T29, T30, T7
- proof: rh/experiments/s1_seminar/parity/NOTES.md, section E (board B32)
- source: S1-parity, combining R2-cubic's Lemma A with R2-parity's Theorem 4
- routes: #10, #23
- note: Closes the bookkeeping wall WP1: the signature of N undercounts (one quartet can be invisible to it, T31), the signature of Ntilde is exact. Still a dictionary: holds for any system with the same kind of explicit formula. | 2026-11-11 -> checked: proof re-derived; the algebraic part of Lemma A holds for kappa counts in infinite dimension
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C10)

## T62 · A structured cubic certificate given by a rule (the wall of idea #10)
- statement: (Target; NOT yet a precise statement.) There is a rule L -> c_abc(L), not using the spectrum of the window form, such that on every window the cubic sum_{a,b,c <= d} c_abc sym[K^a g, K^b f, K^c h] (K as in T55 for H = Ntilde and a = its Perron vector) contracts to Ntilde and has slices with at most one positive eigenvalue; and no such rule exists for a Beurling system on windows where its form is negative.
- status: open
- depends: T4, T50, T51, T52, T55
- source: S1-cubic (board B38, 'WALL, exact statement'); lead (idea #10, notebook N25, N28)
- routes: #10, #25
- note: OPEN and not precise. What is established around it: existence without structure is vacuous (T52); the canonical degree-1 cubic fails by a factor 2 (T55, T65); COMPUTED: certificates of chain-degree 2 exist for zeta with margins 1.2e-3 .. 2.6e-4 and equally for random Lorentzian matrices, with no formula for the coefficients; nothing in the cubic seat's lemmas uses the integers or the Euler product (board B51). Idea #10 is parked on this. | Idea #25 (round-2 audit) records the seat's CONJECTURE that the least chain-degree d* of a polynomial certificate is finite when the margin is positive and diverges as the margin closes; it is a conjecture about this entry's object, not a separate proved statement.

## T63 · Ground-state transform: the form of N is lambda_1 minus a Dirichlet form, and 'one positive direction' is a spectral gap
- statement: CHAIN SETTING. W a finite set, N a real symmetric matrix on W with N_xy >= 0 for x != y, irreducible; lambda_1 its top eigenvalue, u > 0 the normalised eigenvector (Perron-Frobenius), pi = u^2; q_xy = N_xy u_y/u_x (x != y), L f(x) = sum_y q_xy (f_y - f_x), E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2, Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2, Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, Lf). Then for every vector h: <uh, N uh> = lambda_1 ||h||_pi^2 - E(h) (uh the pointwise product). Consequently N has at most one positive eigenvalue iff E(h) >= lambda_1 ||h||_pi^2 for all h with pi-mean zero, i.e. iff the reversible jump process with rates q_xy has spectral gap >= lambda_1.
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem A (A0); the corollary is rh/NOTEBOOK.md entry N29 step 3 ('PROVED (algebra)')
- source: lead (N29); R2-curv (Theorem A)
- routes: #11
- note: A reformulation (owner rule 2). The process picture is also in an unrefereed 2026 preprint (notebook N32). | 2026-11-11 -> checked: checker's verdict: (A0) correct; corollary is one line | JUDGE (section 4, item 4): the lead's wording in N29 step 3 with 'exactly one positive eigenvalue' needs lambda_1 > 0 (for L <= 0.10 the top eigenvalue of N is negative and N has no positive direction); the statement here says 'at most one' and is correct without it. | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T63_GroundStateTransform.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only): the identity for any symmetric N and any eigenpair (no signs needed), and the equivalence with the Poincare inequality under u > 0, lam > 0; 'at most one positive eigenvalue' is 'no positive definite plane'; the spectral-gap clause is not formalised.
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING' and 'FINAL VERDICTS'): 'A: (A0), first lines of (A1), (A2): correct'; the one-line corollary (Courant-Fischer: f orthogonal to u iff h = f/u has pi-mean zero) checked by K-theory; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: A0 and the first lines of A1, A2 'are right')

## T64 · Bochner formula for the transformed prime jump process (Theorem B)
- statement: CHAIN SETTING. W a finite set, N a real symmetric matrix on W with N_xy >= 0 for x != y, irreducible; lambda_1 its top eigenvalue, u > 0 the normalised eigenvector (Perron-Frobenius), pi = u^2; q_xy = N_xy u_y/u_x (x != y), L f(x) = sum_y q_xy (f_y - f_x), E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2, Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2, Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, Lf). (B1) If N has constant diagonal N_xx = d, then sum_y q_xy = lambda_1 - d for every x. (B2) For any chain with constant total rate: Gamma_2(f)(x) = (1/2)(Lf(x))^2 + (1/2) sum_{y,z} q_xy q_yz [ (f_z - f_y)^2 - (1/2)(f_z - f_x)^2 ]. (B3) If W is a subset of a lattice or of R and N_xy = k(y-x) for x != y with k even >= 0, with u := 0 outside W, rho_ab(x) := u(x+a+b)/u(x), H_ab(x) := [u(x+a)u(x+b) - u(x)u(x+a+b)]/u(x)^2, then Gamma_2(f)(x) = S + Hs + O where S = (1/4) sum_{a,b: x+a, x+b, x+a+b in W} k(a)k(b) rho_ab(x) (f(x+a+b) - f(x+a) - f(x+b) + f(x))^2, Hs = (1/2) sum_{a,b: x+a, x+b in W} k(a)k(b) H_ab(x) (f(x+a) - f(x))(f(x+b) - f(x)), O = (1/2) sum_{a,b: x+a, x+a+b in W, x+b not in W} k(a)k(b) rho_ab(x) [ (f(x+a+b) - f(x+a))^2 - (1/2)(f(x+a+b) - f(x))^2 ].
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem B (B1)-(B3)
- source: R2-curv
- routes: #11
- note: The seat's INTERPRETATION 'the curvature deficit sits in the edge terms' was refuted by its checker (removing the open-path term lowers the Gamma-normalised constant) and conceded (board B28). The identity stands. | 2026-11-11 -> checked: checker's verdict: re-derived by hand | JUDGE (2.3): wall W-curv-5 as worded is not a fact. | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/B2_BochnerPathForm.lean (B2: 'DIFFERENCES: none') and B3_ThreeWaySplit.lean (B3, in more generality: any finite subset of an abelian group, u != 0, evenness of k not used) (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry). (B1) is not formalised. The formal seat confirms the third (open-path) sum.
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING' and 'FINAL VERDICTS'): 'B: (B1) correct. (B2) re-derived by hand: correct. (B3) re-derived: correct'; COMPUTED: S + Hs + O = Gamma_2 to 3e-14 (seat, checker, R2-judge J5); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: 'proved': B1, B2 rederived by hand, B3 bracket by hand, own code J5 to 2e-14)

## T65 · The resampling chain: Bakry-Emery loses exactly a factor two at mean field (Theorem C)
- statement: Let pi be a probability vector on a finite set with all pi_x > 0, lam > 0, and the chain q_xy = lam pi_y (self-jumps allowed), L f = lam (pi f - f), whose spectral gap is lam; Var = variance under pi. (C1) Gamma_2(f)(x) = lam^2 [ (1/4)(f(x) - pi f)^2 + (3/4) Var f ] and Gamma(f)(x) = (lam/2)[ Var f + (f(x) - pi f)^2 ]. (C2) The largest rho with Gamma_2 >= rho Gamma pointwise for all f is exactly (lam/2)(1 + 2 min_x pi_x) (uniform pi on m points, lam = 1: 1/2 + 1/m). (C3) Gamma_2(f) - lam Gamma(f) = (lam/4) L[(f - pi f)^2] pointwise. (C4) For ANY reversible chain: if for some rho and some map f -> F_f one has Gamma_2(f) >= rho Gamma(f) + L F_f pointwise for all f, then the spectral gap is >= rho.
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem C; the uniform case also in rh/experiments/r2_cubic/PROOF_BE_cubic.md, section 2
- source: R2-curv, R2-cubic. (C1), (C2) KNOWN: Schmuckenschlaeger 1998 (MSRI Publ. 34, pp. 189-197; p. 189 and the start of section 2 read by R2-curv-ref); (C4) is the standard integrated Bakry-Emery criterion
- routes: #10, #11, #24
- note: This is why idea #11 was killed: pointwise curvature is capped near half the gap, and RH (in the reading of T63) has zero margin. COMPUTED: zeta at L = 1 gives 0.59, 0.53, 0.48 (12, 24, 48 boxes) and the Beurling control the same to 2%. A Lean file C1_ResamplingGamma2.lean is in progress in rh/formal (not imported, not yet formal). | 2026-11-11 -> checked: both checkers re-derived it | FORMAL STATUS (2026-11-11 00:33 UTC, from rh/formal/PROGRESS.md): RHFormal/C1_ResamplingGamma2.lean checks as a single file: (C1) and (C3) with no difference (they hold for any real pi with sum 1); (C2) as two halves at a fixed site (the bound with constant (lam/2)(1 + 2 pi_x), and equality for f = delta_x), not as one statement about an infimum; 'the gap is lam' and (C4) are NOT formalised. So at best this entry becomes formal in part. Status stays as it is until the formal seat's MEMORY.md lists the file as formal and the full `lake -d rh/formal build` has succeeded (no build product for this file existed when K-theory looked; K-theory did not run Lean, because the formal seat allows one Lean process at a time). | JUDGE (2.5 and section 4, item 7): 'the factor 2 is structural' is PROVED for the resampling model only; for the prime chain the constant is COMPUTED and is not 1/2 (centre 0.5061, 0.4965, 0.4908 at M = 80, 160, 320; minimum over sites 0.4302 at M = 320, still falling; the total jump rate grows with refinement). The report sentence 'CD(rho, n) gives at most (n-4)/(2(n-1))' is wrong as written: exact constant on m points 1/2 - 2/n + (1 + 2/n)/m. | UPDATE: the Lean file(s) named above are covered by the recorded full build of 00:52 UTC (16 files, no sorry). The status stays `checked` because the Lean statement differs from the written one as described.
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING' and 'FINAL VERDICTS'): 'C: (C1)-(C4) re-derived: correct'; R2-cubic-ref (rh/experiments/r2_cubic/refuter/PROGRESS.md, section 3 'Proof verdicts'): resampling constant 1/2 + 1/m 'PROVED in two lines'; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.1 and 1.2: 'proved, known': C1 to C4 rederived; the constant (m+2)/(2m) rederived)

## T66 · An exact calibration exists if and only if the gap is at least rho (converse of C4)
- statement: For a reversible irreducible chain on a finite set with generator L and stationary law pi, and rho real: [spectral gap >= rho] <=> [there is a family C_x of quadratic forms (one per site) such that Gamma_2(f)(x) - rho Gamma(f)(x) - sum_y L_xy C_y(f) >= 0 for all f and all x].
- status: checked
- depends: T65
- proof: rh/experiments/r2_curv/refuter/PROGRESS.md, 'FINAL VERDICTS' (converse, two lines); '=>' of the right side is (C4) of T65
- source: R2-curv (claim W-curv-2, without proof); R2-curv-ref (proof of the converse)
- routes: #11
- note: So a calibrated curvature condition is, as an existence statement, again equivalent to the conclusion (same vacuity as T52). | 2026-11-11 -> checked: two-line proof re-derived
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C11); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: 'proved by the checker': a Poisson equation with pi-mean-zero right side)

## T67 · Block-averaged Bakry-Emery: the 'factor two' is the small-block end of an exact curve
- statement: For a reversible chain on a finite set with stationary law pi and a partition of the sites into blocks S, let rho_S := sup{rho : sum_{k in S} pi_k (Gamma_2 - rho Gamma)(f)(k) >= 0 for all f} and rho* := min_S rho_S. Then (1) spectral gap >= rho*; with one block rho* equals the gap. (2) For the resampling chain of T65 with lam = 1, a block S with at least two sites and pi(S) = theta has rho_S = (1 + 3 theta)/(2 + 2 theta) exactly (1/2 as theta -> 0, 5/6 at theta = 1/2, 1 at theta = 1).
- status: checked
- depends: T65
- proof: rh/experiments/s1_seminar/cubic/TURN1.md, section 6
- source: S1-cubic (answer to board B42)
- routes: #10, #11
- note: COMPUTED by the seat: the Weil chain follows the mean-field curve within 0.01 to 0.04 (sites 0.48, two mirror halves 0.84, one block 1.0000 at 48 boxes); the Beurling control is separated only by the single block (0.93). | 2026-11-11 -> checked: proof re-derived
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C12)

## T68 · The integrated open-path term of the Bochner formula is a Hankel-type form in the two jumps
- statement: Notation of T64 (B3). Put g_y(a) := k(a) u(y+a) (f(y+a) - f(y)) for y, y+a in W, a != 0. Then (i) ||Lf||_pi^2 = sum_x pi_x Gamma_2(f)(x) = sum_y sum_{a,b} g_y(a) g_y(b); (ii) sum_x pi_x O_x(f) = (1/2) sum_y sum_{a,b : y+a+b not in W} g_y(a) g_y(b); (iii) sum_x pi_x (S_x + Hs_x)(f) = sum_y sum_{a,b : y+a+b in W} g_y(a) g_y(b) + (1/2) sum_y sum_{a,b : y+a+b not in W} g_y(a) g_y(b).
- status: proved
- depends: T64
- proof: rh/experiments/s1_seminar/curv/S1_ADDITIONS.md, F2
- source: S1-curv (answer to board B8)
- routes: #11, #21
- note: NOT independently checked (no verifier file covers the seminar's additions; K-theory did not check this one). COMPUTED by the seat: (ii) to 3.9e-16, (iii) to 2.1e-15 for zeta and the Beurling control.

## T69 · Parity differences of the integrated Bochner quantities contain the mirror form
- statement: CHAIN SETTING. W a finite set, N a real symmetric matrix on W with N_xy >= 0 for x != y, irreducible; lambda_1 its top eigenvalue, u > 0 the normalised eigenvector (Perron-Frobenius), pi = u^2; q_xy = N_xy u_y/u_x (x != y), L f(x) = sum_y q_xy (f_y - f_x), E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2, Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2, Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, Lf). Assume W is symmetric under x -> -x with N invariant, so u is even. For eta on the positive half of W let h_+, h_- be its even and odd extensions and phi := u eta; T := the compression of N to the positive half, Hk := the Hankel operator (Hk phi)(x) = sum_{y>0} N-kernel(x+y) phi(y), so that N f_+- = (T +- Hk) phi on the positive half for f_+- = u h_+-. Then (i) E(h_-) - E(h_+) = 4 <phi, Hk phi>; (ii) ||L h_-||_pi^2 - ||L h_+||_pi^2 = 4 <phi, ((lambda_1 - T) Hk + Hk (lambda_1 - T)) phi>.
- status: checked
- depends: T63
- proof: rh/experiments/s1_seminar/curv/S1_ADDITIONS.md, F3
- source: S1-curv
- routes: #11, #21
- note: COMPUTED by the seat: (i) to 2e-16, (ii) to 1.8e-15. | 2026-11-11 -> checked: proof re-derived
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C13)

## T70 · Mirror Gram identity: the von Mangoldt function on products of integers >= 2 is a sum of squares, one per prime (D1)
- statement: For every finitely supported real function phi on the integers a >= 2: sum_{a,b >= 2} phi(a) phi(b) Lambda(ab)/sqrt(ab) = sum over primes p of (log p) ( sum_{k >= 1} phi(p^k) p^{-k/2} )^2 >= 0.
- status: formal
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem D (D1)
- source: R2-curv; restated by the lead as the basis of idea #21. Not found in the searches of R2-curv, R2-curv-ref and S1-mirror (Helson-matrix literature read in part); two lines, probably folklore
- routes: #21
- note: Uses the Euler product only through 'Lambda(ab) != 0 with a, b >= 2 forces a = p^i, b = p^j'. With a = 1 allowed the matrix is NOT positive semidefinite (D2: the minor on {1, 2} has determinant -(log 2)^2/2; COMPUTED -2.60 on 1..60). Corollaries NOT in the Lean file (trimmed from the statement on 2026-11-11 so that it matches what is machine-checked): the matrix is the direct sum over p of (log p) v_p v_p^T, v_p(p^k) = p^{-k/2}, and its section a, b <= A has rank pi(A). FORMAL: the formal seat reports 'DIFFERENCES: none in content' and no gap in the written two-line proof (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry). The formal seat's MEMORY.md had not yet been rewritten to list it; the build products exist (D1_MirrorGram.olean). | 2026-11-11 -> formal: Lean statement matches the written one (formal seat: no difference in content); file imported from RHFormal.lean and covered by the recorded full build of 00:52
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING': 'D: (D1)-(D5) correct'); COMPUTED: rank 17 on 2..60, smallest eigenvalue -7e-17 (seat), reproduced by the checker; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: 'proved, trivial' (D1; holds for any Beurling system))
- formal: rh/formal/RHFormal/D1_MirrorGram.lean (theorems RHFormal.D1.mirror_form_eq_sum_squares, mirror_form_eq_sum_primes, mirror_form_nonneg; mathlib's ArithmeticFunction.vonMangoldt)

## T71 · The Gamma kernel is completely monotone, hence mirror (Hankel) positive on the half line (D3)
- statement: For u > 0: w(u) := e^{u/2}/(2 sinh u) = sum_{m >= 0} e^{-(2m+1/2)u}. Consequently for every real phi in L^2 with compact support in (0, infinity): int int phi(x) phi(y) w(x+y) dx dy = sum_{m >= 0} ( int phi(x) e^{-(2m+1/2)x} dx )^2 >= 0.
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem D (D3); the formula is rh/NOTEBOOK.md N29 step 6
- source: lead (N29); R2-curv. The matrix version [w(log ab)] lies in a known class: Helson matrices alpha(n) = int n^-s dnu(s), Perfekt-Pushnitski arXiv 1611.03772, section 5.1 and Theorem 5.1 (whole paper read by READER-2 and R-read-2; rh/library/perfekt-pushnitski-helson.md); also arXiv 2407.04124 (abstract only)
- routes: #11, #21
- note: The rates 2m + 1/2 are the trivial zeros (s = -2m) seen from the centre line. | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING': 'D: (D1)-(D5) correct'); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: 'proved, trivial' (D3 termwise))

## T72 · The prime atoms are not mirror positive on L^2 functions (D4)
- statement: Let mu = sum_{n >= 2} Lambda(n) n^{-1/2} delta_{log n} and H_mu(phi) := int int phi(x) phi(y) dmu(x+y) for phi on (0, infinity). For a prime p, 0 < x_0 < log p with 2 x_0 != log p and x_0 generic, and b an even L^2-normalised bump of width eps: phi := (b(. - x_0) - b(. - (log p - x_0)))/sqrt 2 has H_mu(phi) = -(log p)/sqrt p + O(eps). So H_mu is indefinite on L^2(0, L] as soon as e^L > 2.
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem D (D4)
- source: R2-curv
- routes: #21
- note: 'x_0 generic' is the proof file's wording (it excludes finitely many coincidences x + y = log n). Together with T70: one reflection, two test spaces (atoms at log-integers against L^2 of the window), which meet only in 0 (S1-curv, board B29, replacing the withdrawn wording 'primes reflect coordinatewise'). | 2026-11-11 -> checked: checker's verdict: correct
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING': 'D: (D1)-(D5) correct'); COMPUTED: 9 of 20 box eigenvalues negative at L = 1 (seat, checker, R2-judge J14); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: D4 'correct'; hand example at 3/2, 4/3)

## T73 · On the integers >= 2 the whole kernel (Gamma part plus primes) is mirror positive definite
- statement: For every A >= 2 the real symmetric matrix [ w(log ab) + Lambda(ab)/sqrt(ab) ]_{2 <= a, b <= A}, w(u) = sum_{m>=0} e^{-(2m+1/2)u}, is positive definite.
- status: checked
- depends: T70, T71
- proof: rh/board/s1.md, post B24 (one line) on top of T70 and T71
- source: R2-curv-ref (prediction R9, computed); S1-parity (B24: definiteness and the reason)
- routes: #21
- note: COMPUTED: smallest eigenvalue +8.3652e-251 on 2..60 at 400 digits (S1-parity); -2.1e-16 in double precision (checker). At rational points it fails: the 2 x 2 matrix at 3/2, 4/3 has eigenvalue -0.475. The same two lines hold for a Beurling system on its own lattice (S1-curv, B29): the statement does not see the integers. | 2026-11-11 -> checked: one-line proof re-derived (generalised Vandermonde)
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C14); R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.4: 'proved, trivial' for the semidefinite statement (D1; w(log ab) = sum_m (ab)^-(2m+1/2)))

## T74 · The even and odd blocks differ by four times the mirror form: one positive square (the pole) minus the trivial zeros and the prime powers
- statement: Notation of T7. Let phi be real in L^2(0, L], f_e(x) := phi(|x|), f_o(x) := sgn(x) phi(|x|). For an even kernel k put T_k(phi) := int int_{x,y>0} phi(x) phi(y) k(x-y) and H_k(phi) := int int_{x,y>0} phi(x) phi(y) k(x+y); then q(f_e) = 2[T_k + H_k](phi) and q(f_o) = 2[T_k - H_k](phi) for the form q of k. In particular N(f_e) - N(f_o) = 4 H_K(phi), K = w + prime atoms (D5), and with E_+ := int phi(x) e^{x/2} dx, E_m := int phi(x) e^{-(2m+1/2)x} dx: Q(f_e) - Q(f_o) = 4 [ E_+^2 - sum_{m >= 1} E_m^2 - sum_{n <= e^{2L}} Lambda(n) n^{-1/2} int phi(x) phi(log n - x) dx ]. (The m = 0 square of the Gamma kernel cancels the e^{-x/2} half of the pole.)
- status: checked
- proof: rh/experiments/r2_curv/PROOF_bochner_parity.md, Theorem D (D5); rh/experiments/s1_seminar/parity/NOTES.md, section D (board B25)
- source: R2-curv (D5); S1-parity (B25); the same algebra independently by S1-mirror (B13, B17) and S1-curv (F4)
- routes: #21
- note: COMPUTED: right side against direct quadrature of the definition to 5e-31, 6e-31, 1e-30 (L = 0.3, 0.38, 1; S1-parity); S1-mirror's doubling computation agrees to 3e-7 (board B94). On the zero side the bracket is sum_gamma phihat(gamma)^2 (board B60, by T7). Fibre form of the same identity: S1-cubic TURN1.md (M1). | 2026-11-11 -> checked: checker's verdict for D5; B25 re-derived | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): Finite (matrix) folding identity only: RHFormal/B25_Folding.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry) (symmetry of K not needed). The continuum statement (integrals, E_+, E_m, the m = 0 cancellation, the prime atoms) is not formalised.
- checked by: R2-curv-ref (rh/experiments/r2_curv/refuter/PROGRESS.md, '23:45 PROOF READING': 'D: (D1)-(D5) correct') for D5; K-theory (rh/experiments/k_theory/PROGRESS.md, check C15) for the identity of B25; R2-judge (rh/experiments/r2_judge/JUDGEMENT.md section 1.2: D5 'correct')

## T75 · Equivalence: the two block inequalities are a two-sided bound of the mirror form by the half-window shift form
- statement: Notation of T7, T74. For real phi in L^2(0, L] let T(phi) := T_K(phi) (the half-window shift form of N, diagonal terms included: N(f_e) + N(f_o) = 4 T(phi)), H(phi) := H_K(phi), c := int phi cosh(x/2), s := int phi sinh(x/2). Then [N(f) <= 2<f,c>^2 for all even f in L^2(-L,L)] <=> [H(phi) <= 4c^2 - T(phi) for all phi], and [N(f) <= -2<f,s>^2 for all odd f] <=> [H(phi) >= 4s^2 + T(phi) for all phi]. Hence window positivity <=> T(phi) + 4s^2 <= H(phi) <= 4c^2 - T(phi) for all phi on (0, L].
- status: checked
- depends: T74, T5
- proof: rh/experiments/s1_seminar/curv/S1_ADDITIONS.md, F4
- source: S1-curv (F4); S1-mirror (board B17, B60: on the zero side, positivity on [-L,L] <=> |sum_gamma phihat(gamma)^2| <= sum_gamma phihat(gamma) phihat(-gamma))
- routes: #21
- note: A reformulation (owner rule 2). What it shows: a SIGN for the mirror form gives neither side; mirror positivity (T70, T71) only orders the blocks, N(f_o) <= N(f_e), on its own test class. The prime powers in [e^L, e^{2L}) enter the window form only through H (board B58 FACT 1, B60). | 2026-11-11 -> checked: one-line proof re-derived | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): RHFormal/T75_TwoSidedMirrorBound.lean (rh/formal/PROGRESS.md; written AFTER the recorded full build of 00:52, checked as a single file only): finite (matrix) form only, vector by vector.
- checked by: K-theory (rh/experiments/k_theory/PROGRESS.md, check C16)

## T76 · Mirror criterion on a, b >= 2: non-negative multiplicative Hankel matrices are mixtures of real completely multiplicative functions plus a free term at products of two primes
- statement: Let c be a real function on the integers with |c(n)| <= C n^{2a} for composite n (some C, a >= 0). Let X := prod_p [-p^{2a}, p^{2a}], a point chi of X being the completely multiplicative function with those values at the primes. Equivalent: (a) every finite section of [c(ab)], a, b >= 2, is positive semidefinite; (b) there are a positive Borel measure sigma on X minus {0} with int chi(n)^2 dsigma < infinity for every n >= 2, and a positive semidefinite matrix [w(p,q)] indexed by primes, such that c(n) = int chi(n) dsigma for composite n with at least three prime factors (with multiplicity), and c(pq) = int chi(pq) dsigma + w(p,q) for primes p, q (p = q allowed). The pair (sigma, w) is unique; sigma may have infinite mass.
- status: proved
- proof: rh/experiments/s1_seminar/mirror/PROOF_mirror_criterion.md, Theorem 2
- source: S1-mirror (project's own). The a, b >= 1 version is in the literature (T19); the a, b >= 2 variant is NOT in Perfekt-Pushnitski (READER-2, whole paper) and was not found elsewhere by the seat; probably folklore
- routes: #21
- note: NOT independently checked (longer than a page: Hilbert space, commuting self-adjoint operators T_m, joint spectral theorem, division by chi(p)^2, the point 0). Points a checker should look at: the bound ||T_m v|| <= m^{2a} ||v|| (the seat's text has an exponent slip it flags itself, corrected here in the definition of X), the cited step Berg-Christensen-Ressel 4.1.12 ('from memory'), and sigma-finiteness in Step 4. Consequence: the mirror matrix never sees c(1) or c(p).

## T77 · Mirror positivity of an Euler product is exactly: all local roots real with positive multiplicity
- statement: Suppose c vanishes off prime powers and for each prime p: c(p^k) = (log p) sum_{j=1..r_p} m_j alpha_j^k for k >= 2, with distinct non-zero complex alpha_j and non-zero complex m_j (local factor prod_j (1 - alpha_j p^{-s})^{-m_j}), c real. Then [c(ab)], a, b >= 2, is the direct sum over p of the Hankel matrices [c(p^{i+j})], i, j >= 1, and it is positive semidefinite iff for every p all alpha_j are real and all m_j > 0. The number of negative eigenvalues of the p-block (size >= r_p) is (number of real roots with m_j < 0) + (number of conjugate pairs of non-real roots).
- status: proved
- proof: rh/experiments/s1_seminar/mirror/PROOF_mirror_criterion.md, Corollary 3
- source: S1-mirror; the lead's idea #21, field 'new input' (2). Not in Perfekt-Pushnitski (rh/library/perfekt-pushnitski-helson.md, whole paper)
- routes: #21
- note: NOT independently checked as a proof (direct, by Lagrange interpolation; does not use T76). Its consequences were confirmed by a second route (S1-parity, board B22, B23, exact rationals and 60 digits): zeta, L(chi_4), zeta(2s) pass; L(chi)L(chi-bar) mod 5 fails (c(4) = -2 log 2, min eig -3.89) although GRH is expected; zeta(s)zeta(s-1) and zeta(s-d)zeta(s+d) pass with zeros off the centre line; theta dial n = 4 = 8(1 - 4^{1-s}) zeta(s) zeta(s-1) (Jacobi, from memory; coefficients checked to 1e-59) has exactly one negative square, from the factor at 2 (proved independently by S1-mirror B16 and S1-parity). So the mirror test detects real local roots; it is neither necessary nor sufficient for zeros on the centre line. | LEAN (not `formal`: the Lean statement differs from, or covers only part of, the written one): Real-root case in Lean: RHFormal/HankelPowerSums.lean (rh/formal/PROGRESS.md; covered by the recorded full build of 00:52 UTC 2026-11-11, 'Build completed successfully (3157 jobs)', 16 files, no sorry): x^T H x = sum_j m_j P_x(alpha_j)^2 for any exponents, and H >= 0 iff every m_j > 0 (distinct non-zero real roots, n >= r). NOT formal: the inertia count, the complex-root clause, the direct sum over primes (that part is D1, T70).

## T78 · Conditional gap lemma of lane A (not a reduction)
- statement: (Sketch.) Let mu_1(L) < mu_2(L) be the two lowest eigenvalues of the window form on [-L, L] and theta_L explicit even trial vectors with theta_L^ -> Xi locally uniformly in |Im z| < 1/2 + delta, R the Rayleigh quotient. If along a sequence L -> infinity (R(theta_L) - mu_1(L))/(mu_2(L) - mu_1(L)) = o(e^{-(1+2 delta)L}/L), then RH.
- status: open
- depends: T11
- source: R1-A (rh/experiments/r1_A/PROGRESS.md, 'Conditional lemma (sketch, to be written out; HEURISTIC until then)')
- routes: #20
- note: OPEN: sketch only (Davis-Kahan, then T11 and Hurwitz). Round-1 critic and judge: NOT a reduction: the hypothesis forces mu_2 >= R(theta_L) >= 0 on a sequence, i.e. at most one negative square, which already implies RH by T30 (1). Idea #20 is killed; kept so that nobody re-proposes it.

## T79 · Tilt identity: the Weil form of zeta(s-d) zeta(s+d) is zeta's bilinear form at e^{dx} f and e^{-dx} f
- statement: Notation of T7. For 0 < d < 1/2 let F_d(s) := zeta(s-d) zeta(s+d); its zeros in the strip are rho +- d, i.e. 1/2 + i(gamma -+ i d), and its zero-side form is Qz_d(f) := sum_gamma m_gamma [ fhat(gamma - id) conj(fhat(conj(gamma - id))) + fhat(gamma + id) conj(fhat(conj(gamma + id))) ]. Then for every f in D: Qz_d(f) = Qz(e^{dx} f, e^{-dx} f) + Qz(e^{-dx} f, e^{dx} f); for real f this is 2 Q(e^{dx} f, e^{-dx} f) = 2 Q(cosh(dx) f) - 2 Q(sinh(dx) f), and it is the form whose kernel is zeta's Weil kernel multiplied by 2 cosh(du) (pole 2cosh(u/2) 2cosh(du), prime weights Lambda(n) n^{-1/2} 2cosh(d log n), Gamma kernel w(u) 2cosh(du), the g(0) terms doubled). Hence on a window where Q_L >= 0: Qz_d >= 0 on D_L <=> Q(tanh(dx) g) <= Q(g) for all real g in D_L.
- status: checked
- depends: T7
- proof: rh/board/s1.md, posts B90 (S1-mirror), B103 (S1-cubic); rh/experiments/s1_seminar/curv/S1_ADDITIONS.md G1 (S1-curv)
- source: S1-mirror, S1-cubic, S1-curv (three seats, same two lines); SP-operator (rh/specialists/operator/PROOFS.md P2: Q_d = e^{dX} Q e^{-dX} + e^{-dX} Q e^{dX} = 2 cosh(d ad_X) Q, found independently)
- routes: #21
- note: COMPUTED by two independent implementations validated against the zero side to 1e-15 (S1-mirror B90, S1-parity B91; they agree to 6 digits): at L = 0.75 the lowest eigenvalues are 9.1965e-15 - 1.46289e-4 d^2 (even) and 7.4532e-12 - 2.45385e-3 d^2 (odd); negative for d > 7.9e-6 (even), 5.5e-5 (odd); at d = 0.1: -3.7e-3 / -2.3e-3; for an imaginary tilt (zeros moved along the line) positive at every value tried. This is the counterexample that refutes T6. | 2026-11-11 -> checked: two-line identity re-derived | CURVATURE (SP-operator, PROOFS.md P2, PROVED, not independently checked): if Q psi = lambda_0 psi, ||psi|| = 1, then <psi,[X,[X,Q]] psi> = -2 <X psi, (Q - lambda_0) X psi>, so lambda_min(Q_d) <= 2 lambda_0 - 2 d^2 <X psi, (Q - lambda_0) X psi> + O(d^4); X psi has the opposite parity. The contraction form (Q_d >= 0 <=> multiplication by tanh(dx) is a contraction for zeta's form) is in the statement (board B99 G1, B103).
- checked by: K-theory (two lines: the correlation of (e^{dx} f, e^{-dx} f) is e^{du} g_f(u); on the zero side (e^{dx} f)^(gamma) = fhat(gamma - i d)); three seats derived it independently

## T80 · The zero-side formula on the whole form domain of the window form
- statement: Notation of T7, T10. For every v1, v2 in Dom_a (the form domain of Q_W^a, equal to the closure of C_c^inf(-a,a) in the form norm because A_a is the Friedrichs extension): the sum over the zeros sum_gamma m_gamma v1^(gamma) conj(v2^(conj gamma)) converges (zeros grouped symmetrically) and equals Q(v1, v2).
- status: open
- depends: T7, T10
- source: needed by rh/experiments/r2_parity/PROOF_first_failure.md (assumption 'CORE'); raised by READER-1's full reading of M. Suzuki, 'Weil's quadratic form via the screw function', arXiv 2606.09096 v3 (rh/library/2606.09096.md, part 6 last item and part 7)
- routes: #8, #9
- note: OPEN (gap in a cited input, found 2026-11-11). On C_c^inf it is T7. The paper writes (3.1) 'without a stated class of functions; it is used for v in H_0^1(-a,a) against the exponentials e_n, where both transforms are O(1/|z|)' (READER-1, whole text); R2-parity-ref's reading of 15% of the PDF had taken (3.1) to hold on the form domain. Not written anywhere in the project: a proof by closure (the paper proves Dom_a is contained in H^log = {int (1 + log^+|z|)|vhat|^2 < infinity}; one needs a sampling bound sum_gamma |vhat(gamma)|^2 <= C ||v||^2_{H^log} for functions supported in (-a,a)). Remark by K-theory, not a written proof: under RH the inequality Q(f) >= sum over real gamma of m_gamma |fhat(gamma)|^2 on Dom_a follows from Fatou's lemma along a form-norm approximating sequence in C_c^inf, and that inequality is all that T36 (i) uses. | READER (rh/library/2106.01715.md): in Connes-Consani's paper the form domain IS the logarithmic Sobolev space and the exponentials are a form core (Prop. 2.1 to 2.3). So what remains to be written is exactly: continuity of v -> sum_gamma m_gamma |vhat(gamma)|^2 (and of the off-line pairing) in that norm, for v supported in the window.

## T81 · Open converse (wall WP1): does 'N has at most one positive direction on every window' imply RH?
- statement: Notation of T7, T27. If kappa_+(N_L) <= 1 for every L > 0, then RH. (By T31 the hypothesis leaves at most one off-line quartet; by T32, in finite sections with invertible blocks a one-quartet configuration has kappa_+(N) = 1 exactly when c^T Q_e^-1 c <= 1/2 and s^T Q_o^-1 s < -1/2. So the statement is: this combination cannot occur on all large windows for zeta with one off-line quartet.)
- status: open
- depends: T31, T32
- source: round-1 judge (wall WJ13), R2-parity (wall WP1), R2-judge (JUDGEMENT.md 1.3 'Label for the second half: open'; 2.14)
- routes: #10, #23
- note: OPEN. Evidence only (R2-judge J18, one implementation, finite subspaces): in every surgery configuration of zeta with one quartet (b = 0.3; L = 0.5 to 1.25) N has three positive eigenvalues, and c^T Q_e^-1 c lies between 5.8e5 and 7e53. A surgery configuration is not a system with a non-negative prime side. If true it would make idea #10's signature claim equivalent to RH; idea #10 is parked.

## T82 · Window positivity with one prime: the Weil form is strictly positive on every window L <= (1/2) log 3
- statement: Let L_0 = (1/2) log 3, a(r) := Re psi(1/4 + i r/2) - log pi (psi the digamma function), m := (log 2)/sqrt 2, and for f in L^2[-L_0, L_0] with F(z) = int f(x) e^{izx} dx: Q(f) := (1/2pi) int_R (a(r) - 2 m cos(r log 2)) |F(r)|^2 dr + 2 Re[F(i/2) conj(F(-i/2))] (value in (-inf, +inf]). Then Q(f) >= 9.9998e-9 ||f||^2 for even f, Q(f) >= 3.9999e-6 ||f||^2 for odd f, and Q(f) = Q(f_even) + Q(f_odd) >= 9.9998e-9 ||f||^2 in general. Consequently the Weil form of zeta (notation of T7; only the prime 2 enters) is >= 9.9998e-9 ||f||^2 on L^2[-L, L] for every L <= (1/2) log 3.
- status: proved
- depends: T7
- proof: rh/experiments/foothold/PROOF_window_prime2.md (Theorem A; certificate logs cert_log3_R40_n56.log)
- source: seat FH (foothold). Not new as a claim: X. Zhu, arXiv 2608.24827 v2 (unrefereed preprint) states certified positivity for half-width L <= 0.8 by the same kind of reduction; FH read only its section 1
- routes: #8, #9
- note: Computer-assisted (exact rationals and Arb balls). NOT independently checked yet: verifier V-FH is running; its verdict will be at rh/experiments/foothold/verifier/VERDICT.md (absent when this entry was made). Unconditional and zero-free. That (0.1) of the proof file is the project's Q uses the Fourier-multiplier form of the archimedean term (classical; validated numerically to 1e-13 in lane A). First window positivity with a prime proved inside the project; journal J4 records that nothing in the literature read is proved for a window containing a prime (Zhu's preprint is unread). Consequences if the verdict is positive: lambda_L > 0 for L <= (1/2) log 3 without RH, so a first failure (T37) can only occur beyond (1/2) log 3, and the feasibility half of T47's kind is certified on these windows.

## T83 · Forcing of the first prime: on a window that sees one atom, positivity confines its position and weight to a certified box around (log 2, log 2/sqrt 2)
- statement: Notation of T82. For y > 0, m >= 0 let Q_{y,m} be the form of T82 with the atom term 2 m cos(r log 2) replaced by 2 m cos(r y) (one atom at position y, weight m; the true form is y = log 2, m = log 2/sqrt 2 = 0.4901291). (ii) L = 1/2: if Q_{y,m}(v) >= 0 for every real polynomial v of degree < 28 on [-1/2, 1/2], then 70957/102400 < y < 7139/10240 (1.999585 < e^y < 2.008058) and 0.488558 <= m <= 0.510367. L = 27/50: if Q_{y,m}(v) >= 0 for every real polynomial v of degree < 32, then 35487/51200 < y < 71033/102400 (1.999917 < e^y < 2.001069) and 0.489943 <= m <= 0.492420. (iii) With no atom (m = 0 or y >= 2L) the form is not >= 0 in either parity sector: explicit polynomials with Q(v)/||v||^2 = -0.0323519 (even), -0.3222283 (odd) at L = 1/2 and -0.0650680, -0.4103637 at L = 27/50. (The true point is feasible by T82. The restriction m >= 0 is necessary.)
- status: proved
- depends: T82
- proof: rh/experiments/foothold/PROOF_forcing_prime2.md (Theorem B)
- source: seat FH. Prior work: a published NUMERICAL observation (Connes-Consani arXiv 2106.01715, section 2.3, no error analysis) and the project's own unreviewed outer bound (1.9996, 2.0080) at L = 1/2 (T47's kind; S1-parity, R2-parity-ref, R2-judge)
- routes: #9
- note: Computer-assisted (exact rationals and Arb balls). NOT independently checked yet: verifier V-FH is running; its verdict will be at rh/experiments/foothold/verifier/VERDICT.md (absent when this entry was made). FIRST CERTIFIED INSTANCE OF T47's KIND: the same logic (infeasible on a finite-dimensional subspace implies infeasible on the window), with exact arithmetic, for the one-atom ansatz at L = 1/2 and 27/50; T47 itself (six weights at L = 1) is still open. The box is an outer bound: the feasible set is a thin sliver inside it (the verifier predicts that the box point (log 2, 0.50) is infeasible).

## T84 · Odd fold of the background: pole + arch on odd functions is a jump Dirichlet form with non-negative kernel plus a potential, minus a positive rank one; taking absolute values lowers it
- statement: Notation of T7, T49 (c_inf = 5.3721834..., w decreasing). Let A := P + (archimedean form) with no primes, on functions vanishing outside [-L, L], any L > 0. For odd f(x) = sign(x) phi(|x|), phi real on (0, L], with s(x) = sinh(x/2) and kappa_L(x) := int_{|y|>L} w(|x-y|) dy: A(f) = -8 <phi, s>^2 + 2 int_0^L (kappa_L(x) - c_inf) phi(x)^2 dx + int int_{(0,L]^2} [ w(|x-y|) (phi(x) - phi(y))^2 + w(x+y) (phi(x) + phi(y))^2 ] dx dy. Consequently A(f_|phi|) <= A(f_phi), where f_|phi| is the odd function with folded |phi|; more precisely the difference is 2 int int (w(|x-y|) - w(x+y)) (|phi(x)||phi(y)| - phi(x)phi(y)) + 8(<|phi|,s>^2 - <phi,s>^2) >= 0.
- status: checked
- depends: T49
- proof: rh/experiments/s1_seminar/mirror/PROOF_first_prime.md, Lemma 1; the same algebra in rh/experiments/s1_seminar/parity/NOTES.md section Q (board B169) and rh/specialists/operator/PROOFS.md P7
- source: S1-mirror, S1-parity, SP-operator (three seats, independently); grows from the lead's board post B140 and S1-cubic's B52
- routes: #9
- note: Holds for EVERY L and for any system that keeps zeta's pole and Gamma factor: no arithmetic content by itself. It is false once a positive atom lies in the window: the mirror term +2 m n^-1/2 int phi(x) phi(log n - x) dx has the wrong sign (S1-parity B169 (d)). The even block is the mirror case: the pole +8<phi,cosh>^2 has the wrong sign. Finite analogue in Lean: RHFormal/Perron_GroundState.lean, form_abs_le (after the recorded full build). | 2026-11-11 -> checked: short algebra re-derived; three independent derivations
- checked by: K-theory (line by line: pole on odd functions, the split of the Levy form into the four quadrants, I(a,b) - I(|a|,|b|) = 2 (w(|x-y|) - w(x+y)) (|a||b| - ab)); three seats derived it independently

## T85 · On a window with no atom the odd block has a simple lowest eigenvalue with a strictly one-signed eigenfunction
- statement: Notation of T10 and T84. Let the form be pole + arch - (atoms with weights m_n >= 0) on [-L, L] and assume no atom lies at a position log n < 2L (pole + Gamma alone: every L; zeta: L <= (1/2) log 2). Then the lowest eigenvalue of the odd block is simple and its eigenfunction, folded to (0, L], has one strict sign almost everywhere. (For the background alone, with eps(L) := minus that eigenvalue: eps(L) is non-decreasing in L.)
- status: proved
- depends: T84, T10
- proof: rh/experiments/s1_seminar/parity/NOTES.md section Q (board B169: direct argument); rh/experiments/s1_seminar/mirror/PROOF_first_prime.md Lemma 2 and rh/specialists/operator/PROOFS.md P7 (semigroup argument)
- source: S1-parity (B169), S1-mirror, SP-operator: the same theorem by two routes; first stated by the lead (B140)
- routes: #9
- note: PROVED, NOT independently checked line by line. WHAT IT RESTS ON. Route A (S1-mirror Lemma 2, SP-operator P7) uses three results CITED FROM MEMORY: closedness with compact resolvent (this one is T10, established), the first Beurling-Deny criterion (Reed-Simon IV, Thm XIII.50) and Perron-Frobenius for positivity-preserving semigroups (Reed-Simon IV, Thms XIII.43-44); SP-operator notes that Suzuki arXiv 2606.09096 section 5.2 (read) uses the same pair, and marks one step of P7 as not checked (that odd smooth functions vanishing near 0 are a form core). Route B (S1-parity) cites only the existence of a minimiser (T10) and argues directly from the strict inequality of T84. COMPUTED: no sign change on 600 points for L = 0.30 to 1.00 (background); the EVEN ground state of the background has a sign change from L = 0.38 on. Whether nodelessness survives once the atom at 2 is in the window ((1/2) log 2 < L) is NOT proved: that is the open T46.

## T86 · The first-prime inequality: if the odd block is non-negative on a window where the background alone is not, the atoms in the window carry at least a definite positive mirror weight
- statement: Notation of T85. Let L be such that the odd block of the background A = pole + arch has lowest eigenvalue -eps(L) < 0, with normalised ground state f_psi (folded psi > 0). For a finite family of atoms at positions u_i in (0, 2L) (x_i = e^{u_i}) with real weights m_i put h_i := int_{max(0,u_i-L)}^{min(L,u_i)} psi(t) psi(u_i - t) dt > 0 and tau_i := 2 int_0^{L-u_i} psi(t) psi(t+u_i) dt >= 0 (tau_i = 0 if u_i >= L). If the odd block of A - atoms is >= 0 on [-L, L], then sum_i m_i x_i^{-1/2} 2 (h_i - tau_i) >= eps(L). In particular: (a) a single atom at u in [L, 2L) has weight m >= eps(L) sqrt(x)/(2 h_u) > 0; (b) if every atom in the window lies in [L, 2L) and has weight <= 0, the lowest odd eigenvalue is <= -eps(L); (c) if eps(L_1) > 0, every system whose odd block is >= 0 on all windows has an atom at a position u < 2 L_1.
- status: proved
- depends: T85
- proof: rh/experiments/s1_seminar/mirror/PROOF_first_prime.md, Lemma 3
- source: S1-mirror (seminar S1, turn 3)
- routes: #9
- note: PROVED; the inequality itself is one trial-vector line, re-derived by K-theory (g_u(f_psi) = tau - h); it stays `proved` because positivity of h_i rests on T85, which is not independently checked. A NECESSARY condition only: it proves positivity on no window and excludes systems without selecting zeta (the seat's own barrier check). COMPUTED: eps(L) > 0 from L in (0.370, 0.375); with ball arithmetic the Rayleigh quotient is -0.00127871769950 +- 1.3e-15 at L = 0.375 (the truncation of the m-sum in the builder is not enclosed), so by (c) every admissible system has an atom below e^0.75 = 2.117; the Beurling atom at 2.1 with weight log 2.1 is excluded at L = 0.38, 0.40, 0.42. Novelty: not found in the digests read; no web search run.

## T87 · Unconditional uniqueness of the weights: every summable atomic perturbation of the prime side makes the form negative on some window
- statement: Notation of T7. Let D = sum_j d_j (delta_{u_j} + delta_{-u_j}) with distinct u_j > 0, real d_j and 0 < sum_j |d_j| < infinity. Then, with NO hypothesis, there is f in C_c^inf(R) with Q(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) < 0. Corollary: among all weight systems m (at any positions) with sum |m_n - Lambda(n)| n^{-1/2} < infinity, at most one makes the form with zeta's pole and Gamma factor >= 0 on every window, namely Lambda, and it does iff RH. (Covers: one prime removed, a weight changed, finitely many primes moved.)
- status: checked
- depends: T43, T29, T7
- proof: rh/experiments/s1_seminar/parity/NOTES.md section R (Theorem U'); rh/board/s1.md post B170
- source: S1-parity (seminar S1, turn 2). Overlapping claim: Proposition 3.2(b) of the unreviewed Johns preprint (see T43's source); unsearched otherwise
- routes: #9
- note: The written proof is four lines in the seat's notes and on the board; the lead asked for a proof file. It gives no window. It does not use the Euler product (it holds around any system for which the conclusions of T43 and T29 hold). With T43 it says that idea #9's feasible set, in the limit of all windows and inside the l^1 class, is {Lambda} or empty: existence is RH. | 2026-11-11 -> checked: four-line proof re-derived from two checked entries
- checked by: K-theory (two cases: under RH it is T43; if RH fails, the vectors g = M f of T29 Step 4 with k = 1 have Q(g) <= 4Q+(f) + B + d_1 -> -infinity while |g|_2 <= 2|f|_2 gives |D(g * g~)| <= 8 sum|d_j| |f|^2)

## T88 · Rank-one algebra of the pole strength: the even block t c c^T - N_e is non-negative iff t >= t_0 = 1/(c^T N_e^-1 c), and its ground state is (N_e + mu(t))^-1 c
- statement: Finite dimension. Let N_e be real symmetric, invertible, with exactly one positive eigenvalue, c a vector with c^T N_e^{-1} c > 0, and B := -N_e. For t > 0 the lowest eigenvalue mu(t) of B + t c c^T is the root of t c^T (N_e + mu)^{-1} c = 1 between the two lowest eigenvalues of B, it is increasing in t, and the corresponding eigenvector is (N_e + mu(t))^{-1} c. mu(t_0) = 0 at t_0 := 1/(c^T N_e^{-1} c); hence t c c^T - N_e >= 0 iff t >= t_0, and its null vector at t = t_0 is f := N_e^{-1} c.
- status: proved
- depends: T32
- proof: rh/experiments/s1_seminar/cubic/TURN3.md, section 3 (board B180): 'PROVED (rank-one perturbation, textbook algebra)'
- source: S1-cubic (seminar S1, turn 3)
- routes: #10
- note: PROVED per the seat; the file states the result and names the method (secular equation of a rank-one perturbation) without writing the steps; not independently checked. It is consistent with T32 and T33 (t_e = t/t_0 in their notation). COMPUTED (48 boxes): zeta's true strength t = 1 lies between t_0 and t* (the strength at which the ground state first changes sign) in a window that shrinks under refinement (width 5.3e-3, 1.6e-3, 5.0e-4 at 24, 48, 96 boxes).

## T89 · Candidate (F): the even solution of N f = cosh(x/2) on the window has one sign
- statement: Notation of T7. On the window [-L, L], let N = Pi - A be compressed to even functions and f the even solution of N f = cosh(x/2) (f = N_e^{-1} c, the null vector of the even Weil block at its critical pole strength, T88). Then f has one sign on (-L, L), for zeta and every L for which N_e is invertible with one positive direction.
- status: open
- depends: T88
- source: S1-cubic (board B181, TURN3.md section 5), who does NOT put it forward as the one statement; the lead (B186)
- routes: #10
- note: OPEN. COMPUTED true for zeta at L = 0.3, 0.5, 0.75, 1 (24 to 96 boxes); violated by the controls 'weight at 4 doubled' (L = 0.75), no primes (0.45), Beurling 2 -> 2.1 (0.45, 0.5). Two warnings from the seat: f tends to 0 at the window edge, so its sign there is decided at second order; and on all 11 computed rows with one positive direction (F) holds exactly when the even block is >= 0, so it may be the even inequality in another form (owner rule 2): a single system with (F) true and the even block negative, or the reverse, would separate them. Not found in the digests (grep only).

## T90 · Pointwise bracket for the critical pole strength, given candidate (F) (Barta / Collatz-Wielandt type)
- statement: Setting of T88 on the even functions of a window, N symmetric, N f = c with c = cosh(x/2) > 0, t_0 = 1/<c, f>. HYPOTHESIS (F): f >= 0, f != 0. Then for every even phi with <phi, c> > 0, with R_phi(x) := (N phi)(x)/(c(x) <phi, c>): inf_x R_phi <= t_0 <= sup_x R_phi. Consequently, under (F) and one positive direction of N_e, 'the even block t c c^T - N_e is >= 0' is equivalent to 'there is one even phi with <phi, c> > 0 and t <phi,c> c(x) - (N phi)(x) >= 0 for every |x| <= L'.
- status: proved
- depends: T88
- proof: rh/board/s1.md, post B186 (three lines)
- source: lead (seminar S1, turn 3)
- routes: #10
- note: 'PROVED given (F)' (T89, open). The three lines (<N phi, f> = <phi, c>; if N phi <= a c <phi,c> pointwise and f >= 0 then 1 <= a <c,f>) were re-derived by K-theory without finding a gap; per the coordinator the entry stays `proved` (unchecked) until a seminar seat has answered on the board. As rigid as the form itself (the certificates form a needle of relative width about mu_1/mu_2): it changes the kind of statement, not its sharpness. Not searched.

## T91 · Modulus-one local roots as positivity for the other involution (local Toeplitz / Ramanujan test), and the tests on c alone
- statement: At a prime p let the local roots alpha_j have multiplicities m_j > 0 and s(k) := sum_j m_j alpha_j^k (s(0) = sum m_j). (1) The reflected sequence k -> s(|k|) is positive definite on Z, i.e. [s(|i-j|)]_{i,j=0..n} >= 0 for all n, iff all |alpha_j| <= 1 (the 2 x 2 minor is |s(1)| <= s(0)); if the root set is closed under alpha -> 1/conj(alpha), [s(i-j)] >= 0 iff all |alpha_j| = 1. (2) For a mirror-positive c with compactly supported representing measure sigma (T76): [c(ab) - c(ab p^2)]_{a,b>=2} >= 0 iff (1 - chi(p)^2) sigma >= 0; hence, for real roots: [s(i+j) - s(i+j+2)]_{i,j>=1} >= 0 iff all roots lie in [-1, 1]; the reversed matrix is >= 0 iff no root lies in (-1,1) other than 0; both iff c(p^{k+2}) = c(p^k) for k >= 1 iff all roots are in {+1, -1}.
- status: proved
- depends: T76, T77
- proof: rh/board/s1.md, posts B117, B120 (1); rh/specialists/reflection/NOTES_session1.md, sections N1, N2
- source: SP-reflection (specialist seat). (1) is classical (Herglotz, Caratheodory-Toeplitz); 'proved here in 3 lines'
- routes: #21
- note: PROVED per the specialist; not independently checked. This is the exact form of barrier B11 (what zeta(s-d)zeta(s+d) violates): mirror positivity = identity involution (dual R), Ramanujan = inverse involution (dual the circle); both at once force roots in {+1, -1}. Every statement is local (prime by prime). COMPUTED: for F_d at p = 2 the 2 x 2 Toeplitz minor is -4 sinh^2(d log 2); G_d needs the 3 x 3 matrix at p = 3 and is invisible at p = 2.

## T92 · Fractional powers: real local roots with positive multiplicities give Helson-positive coefficients of F^t for small t, on all indices including 1
- statement: Let F(s) = prod_p prod_j (1 - alpha_j(p) p^-s)^{-m_j(p)} with finitely many distinct non-zero roots per prime and all m_j > 0, D := sup_p sum_j m_j < infinity, and a_t the Dirichlet coefficients of F^t. (a) If all roots are real, then for 0 < t <= 1/D the matrix [a_t(nm)]_{n,m>=1} is positive semidefinite (each local sequence a_t(p^k) is the moment sequence of a positive measure on the convex hull of {0, alpha_j}). (b) Conversely, if [a_t(nm)]_{n,m>=1} >= 0 for all sufficiently small t > 0 (and all m_j > 0), then all roots are real. Without m_j > 0 the converse fails (local factor (1 - z)/(1 - 2z)^2). For zeta: zeta^t is Helson positive exactly for 0 < t <= 1.
- status: proved
- depends: T77
- proof: rh/specialists/reflection/NOTES_session1.md, section N4 (Lemmas 1-4); board B120 (3)
- source: SP-reflection
- routes: #21
- note: PROVED per the specialist; not independently checked. Lemma 2 uses the Nevanlinna representation of a Stieltjes transform (Akhiezer, cited from memory). 'Fails for every t > 1/D' is NOT proved in general (proved for one root, COMPUTED for two). It explains why the index 1 must be dropped in T70: [a_t(nm)] = e_1 e_1^T + t [Lambda_F/log (nm)] + O(t^2).

## T93 · Schur ray in the damping parameter, and multiplier duality
- statement: Notation of T7. For real eps let W_eps be the Weil kernel multiplied by e^{-eps|u|} (atoms Lambda(n) n^{-1/2-eps}; the form attached to the line Re s = 1/2 + eps). (1) If the form of W_eps is >= 0 on D_L and delta > 0, the form of W_{eps+delta} is >= 0 on D_L; so {eps : W_eps >= 0 on D_L} is a ray [eps*(L), infinity) or empty, and eps*(L) is non-decreasing in L. (2) More generally multiplying a kernel k(u) by a positive definite function preserves positivity of the shift form [k(x-y)]; multiplying by cosh(du) preserves positivity of every mirror form [k(x+y)] and may destroy that of the shift form; multiplying by cos(tu) does the opposite.
- status: checked
- proof: rh/NOTEBOOK.md, entry N35 (i) (two lines); rh/specialists/operator/PROOFS.md P3 (two lines)
- source: lead (N35); SP-operator (P3). Partly in print: Suzuki arXiv 1606.05726 attaches canonical systems to the shifted functions xi(s - omega)^nu / xi(s + omega)^nu (T16); the Schur-monotone ray and the scalar eps*(L) for the window form were not found there (READER-1, SP-operator). Not searched otherwise
- routes: #8, #21
- note: A reformulation (owner rule 2) until it brings an input: RH <=> eps*(L) <= 0 for all L. Stated in N35 without proof and NOT part of this entry: (ii) eps*(L) <= 1/2 for every L unconditionally (this is the unconditional half of T95, SP-operator P4), (iii) sup_L eps*(L) = Theta - 1/2. The tilted control F_d is 'damped + anti-damped' (T79). | 2026-11-11 -> checked: two-line proofs re-derived
- checked by: K-theory (Schur product for forms: e^{-delta|u|} = int e^{itu} dmu(t) with mu >= 0, so the form of K p at f is int Q_K(e^{itx} f) dmu(t) >= 0; nestedness of the windows; the rank-2 kernel identities for cosh and cos)

## T94 · The window space is a de Branges space whenever the window form is strictly positive
- statement: Notation of T10. Let a > 0 with lambda_a > 0 (all small a unconditionally by T2; all a under RH). Let H_a := {vhat : v in Dom_a} with norm ||vhat||^2 := Q(v). Then H_a is a de Branges space: there is an entire function E_a with |E_a(conj z)| < |E_a(z)| for Im z > 0 and H_a = H(E_a) isometrically. In particular, for a non-real w and v in Dom_a with vhat(w) = 0, the function vhat(z)(z - conj w)/(z - w) is the transform of some g in Dom_a with Q(g) = Q(v), for the indefinite zero-side form as well.
- status: proved
- depends: T7, T10, T2
- proof: rh/specialists/operator/PROOFS.md, P1
- source: SP-operator (specialist seat). Suzuki arXiv 2606.09096 section 7.9 states it under RH
- routes: #8
- note: PROVED given de Branges' axiomatic characterisation (de Branges 1968, Thm 23: CITED FROM MEMORY by the specialist, who says it is restated in Suzuki section 7.9, a paper read in full by READER-1). Not independently checked. The isometry step uses the zero-side formula on C_c^inf only (T7) and extends by density and closedness, so it does not need the open T80. Consequences named by the specialist: the reproducing kernel K_a(z,z) = sup |vhat(z)|^2/Q(v) is non-decreasing in a; t_e, t_o of T32/T33 are combinations of K_a at z = +-i/2.

## T95 · Poisson splitting: the log-derivative of the completed zeta function is a generalised Nevanlinna function with exactly one negative square iff RH
- statement: With s = 1/2 - iz, Lambda(s) = pi^{-s/2} Gamma(s/2) zeta(s), q(z) := i (Lambda'/Lambda)(1/2 - iz) and m(z) := i (xi'/xi)(1/2 - iz): (1) Im m(z) = Re (xi'/xi)(1/2 + y - ix) for z = x + iy; m(. + id) is a Nevanlinna function for every d >= 1/2 unconditionally, and for all d > 0 iff RH; {d : m(. + id) is Nevanlinna} = [d_0, infinity) with d_0 = sup Re rho - 1/2. (2) q = m + 2z/(z^2 + 1/4), and the rational term is of class N_1. (3) The number of negative squares of q is 1 + #{distinct gamma with Im gamma > 0} when that number is finite (q is in no class N_kappa otherwise); so RH <=> q in N_1.
- status: proved
- depends: T8
- proof: rh/specialists/operator/PROOFS.md, P4
- source: SP-operator. (1) is known (Re xi'/xi > 0 on Re s > 1/2 iff RH: Hinkkanen 1997, Lagarias 1999, from memory); 'a function of N_kappa has at most kappa poles in the upper half-plane': Luger-Ou arXiv 2202.13246 section 3.2 (read by the specialist)
- routes: #8, #1
- note: PROVED 'modulo the convergence bookkeeping for infinitely many real zeros', which the specialist says was NOT checked line by line; not independently checked. A reformulation of RH (owner rule 2); the function-theoretic counterpart of the exact index T29 and of the judge's 'three counts of the same integer' (T15).

## T96 · Suzuki's dial: reflection symmetry in the shift, and where the dial of the tilted control ends
- statement: Let E_d(z) := xi(1/2 + d - iz) and E#(z) := conj(E(conj z)). Then E_d# = E_{-d}, so Theta_d := E_d#/E_d satisfies Theta_d Theta_{-d} = 1. E_w is a Hermite-Biehler function iff w > d_0 := sup Re rho - 1/2. For F_d = zeta(s-d) zeta(s+d) the completed function on the shifted line is E_{w-d} E_{w+d}, which fails to be Hermite-Biehler as soon as w - d < d_0: the dial of F_d ends at w = d + d_0.
- status: proved
- depends: T8
- proof: rh/specialists/operator/PROOFS.md, P5
- source: SP-operator; 'E_w is Hermite-Biehler iff w > d_0' is Suzuki arXiv 1606.05726 Prop. 4.3 (paper read in full by READER-1)
- routes: #8, #21
- note: PROVED per the specialist; short; not independently checked.

## T97 · Derivative in the window of the ratio of the two parity determinants (bounded continuous kernels only)
- statement: Let K_L be the integral operator on L^2(-L, L) with kernel k(x - y), k even and continuous, I + K_L invertible, and Gamma_L the kernel of I - (I + K_L)^{-1}. Then (d/dL) log det(I + K_L) = Gamma_L(L, L) + Gamma_L(-L, -L), and (d/dL) log [det(even block)/det(odd block)] = 2 Gamma_L(L, -L).
- status: proved
- proof: rh/specialists/operator/PROOFS.md, P6
- source: SP-operator; the first formula is the standard Bellman-Krein / Fredholm endpoint formula (notebook N19, from memory)
- routes: #8
- note: PROVED for this class only (per the specialist; not independently checked). For the Weil form (unbounded, logarithmic order, atoms) the statement needs a regularised determinant and is NOT proved; it is the nearest proved relative of the open T42.

## T98 · Explicit dial coefficients: the first log-coefficients of theta^n as polynomials in n, and which small n have all coefficients non-negative
- statement: Let theta(q) = sum_{k in Z} q^{k^2}, r_n(m) := coefficient of q^m in theta^n (real n), a_n(m) := r_n(m)/(2n), and c_n(m) := coefficient of m^-s in log sum_m a_n(m) m^-s. Then r_n(2) = 2n(n-1), r_n(3) = (4/3) n(n-1)(n-2), r_n(7) = 64 C(n,4) + 128 C(n,7); c_n(2) = n - 1, c_n(3) = (2/3)(n-1)(n-2), c_n(4) = 1 + (1/3)(n-1)(n-2)(n-3) - (n-1)^2/2. Consequently {n in [0,3) : r_n(m) >= 0 for all m} = {0, 1, 2} and {n in (0,2] : c_n(m) >= 0 for all m} = {1, 2}.
- status: proved
- proof: rh/experiments/r2_free/PROGRESS.md ('Hand results before computing'; machine recheck in wallach.py.txt)
- source: seat R2-free (creation seat, withdrawn when round 2 was split)
- routes: #26, #12
- note: PROVED by hand and rechecked by one implementation in exact rationals; no checker and not seen by the round-2 judge (idea #26's own evidence field). The larger claims of idea #26 (the sets on (0, 14], n = 8) are COMPUTED on a grid only and are not entered.


































































































