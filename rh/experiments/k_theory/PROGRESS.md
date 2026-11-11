# K-theory PROGRESS (seat: keeper of rh/THEORY.md; verification track)

Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE. Times are from `date`.

## Session 1 (2026-11-10 23:57 UTC to ...)

### Read (in full unless said)
claude.md "Standing structures"; SUBAGENT_PREAMBLE; PROJECT_BRIEF; THEORY.md (6 seeds); all six PROOF_*.md of round 2
(r2_parity x3, r2_cubic x2, r2_curv x1); NOTEBOOK.md; r1_*/critic/PROGRESS.md (A-D); r1_judge/JUDGEMENT.md;
r2_*/refuter/PROGRESS.md (parity, cubic, curv); r2_judge/PROGRESS.md (predictions only when read; no JUDGEMENT.md);
board s1.md (B1-B53 at first read); s1_seminar notes (parity NOTES, curv S1_ADDITIONS, cubic TURN1, mirror NOTES);
IDEAS #8, #9, #21 in full; KNOWLEDGE.md; DECISIONS D8; proved parts of r1_A/B/C/D PROGRESS.

### Finding 1 (mine, as independent checker of NOTEBOOK N2 = seed entry T3). REFUTED as stated.
T3 statement: "A(s) = sum_{n<=N} c_n n^-s, c_n real, no zeros in Re s > 1/2, w >= (1/2) log N  =>  f(t) = 2 Re[e^{iwt} A(1/2+it)]
has only real zeros."  Counterexample: A(s) = 2^-s + 4^-s = 2^-s (1 + 2^-s) (zeros only on Re s = 0), N = 4, w = log 2 = (1/2) log 4.
Then e^{iwt} A(1/2+it) = 2^{-1/2} + (1/2) e^{-it log 2}, so f(t) = sqrt 2 + cos(t log 2) >= sqrt 2 - 1 > 0 on R; as an entire function
f(z) = sqrt 2 + cos(z log 2) has infinitely many zeros, z log 2 = pi + 2 pi k +- i arccosh(sqrt 2), NONE real.
COMPUTED (python, double precision, this session): min of f on [-1000, 1000] step 0.01 = 0.41421356; |f - (sqrt2 + cos)| <= 4.4e-16;
|f(z0)| = 3.4e-16 at z0 = 4.532360 + 1.271553 i; min |A| on a grid in Re s > 1/2 is 0.146.
Where the proof in N2 breaks: "|R| is bounded as Im z -> infinity when w >= (1/2) log N" needs c_1 != 0 (the denominator
E*(z) = e^{-iwz} A(1/2 - iz) behaves like c_m m^{-1/2-y} e^{wy}, m = least index with c_m != 0; boundedness needs w >= (1/2) log(N m)).
Second point, for the repaired statement (c_1 != 0): "By Phragmen-Lindelof |R| < 1" needs an a priori growth bound for R = E/E* in the
whole open upper half-plane, not only as Im z -> infinity; none is given (1/E* is not obviously bounded in a strip 0 < y < delta).
Standard repair (from memory, not written out): R is of bounded type (Krein), meromorphic across R with |R| = 1 there, no poles in the
upper half-plane, mean type <= 0; Nevanlinna factorisation gives |R| <= 1. So the repaired lemma is entered as OPEN (sketch only).

### Finding 2 (mine). The project's normalisation of the explicit formula agrees with a text that was read.
Fetched arXiv 2606.09096 v3 (HTML) through WebFetch (a quoting model; quotes limited to 125 characters each, so this is "read in
pieces", not the PDF itself). Section 1.1, the five terms of W(f), as quoted:
  W(f) := int f(x)(e^{x/2}+e^{-x/2})dx - sum_n Lambda(n) n^{-1/2} f(log n) - sum_n Lambda(n) n^{-1/2} f(-log n)
          - (log 4pi + C_0) f(0) - int_0^inf {f(x)+f(-x)-2e^{-x/2} f(0)} e^{x/2} dx/(e^x - e^{-x}),   C_0 = Euler's constant;
  Q_W(v1,v2) := W(v1 * v2~);  (3.1): "the Weil explicit formula yields" Q_W(v1,v2) = sum_{gamma in Gamma} m_gamma v1^(gamma) conj(v2^(conj gamma)),
  Gamma = zeros of z -> xi(1/2 - iz); Weil's criterion: RH <=> Q_W(v) >= 0 for all v in C_c^inf(R).
Comparison with the project's P + A - Pi (PROOF_parity_index section 0), by hand (PROVED, mine): pole and prime terms identical;
the kernel e^{x/2}/(e^x - e^{-x}) is the project's w; the constants agree iff
  -(log 4pi + C_0) + int_0^inf (2 e^{-u/2} w(u) - e^{-2u}/u) du = -log pi.   With 2e^{-u/2}w(u) = 1/sinh u and t = 2u the integral is
  int_0^inf (e^{-t/2}/(1-e^{-t}) - e^{-t}/t) dt = -psi(1/2) = C_0 + 2 log 2 (Gauss's integral), and -(log 4pi + C_0) + C_0 + log 4 = -log pi. OK.
So the explicit formula in the project's normalisation is KNOWN from a read text (plus three numerical validations on record).
Same fetch: Thm 1.1 (Friedrichs extension), Cor 1.2 (lambda_a = infimum over C_c^inf(-a,a)), Thm 1.3 (continuity), Thm 1.4 (small a:
positive, simple, even eigenfunction), "[4, Theorem 3.6]: spectrum of A_a bounded below and discrete", "[3, Proposition 2.1]: lower bounded
and lower semicontinuous", Yoshida [17]: RH <=> positive definiteness for every a; Prop. 1: positivity on ODD test functions implies RH,
on EVEN functions implies RH "except for possible real zeros"; Lemma 2: positive for small a; Theorem 2: non-degeneracy for every a <=> RH.

### Finding 3 (mine). Classical zero facts, text read (tertiary source).
Wikipedia "Riemann zeta function", "Riemann hypothesis", "Riemann-von Mangoldt formula" (fetched 2026-11-11, quotes): non-trivial zeros lie in
the open strip 0 < Re s < 1; symmetric about the real axis and the line 1/2; Hadamard and de la Vallee-Poussin 1896: no zeros on Re s = 1;
N(T) = (T/2pi) log(T/2pi) - T/2pi + O(log T) (von Mangoldt 1905); zero with smallest non-negative imaginary part is 1/2 + 14.1347...i;
Selberg 1942: a positive proportion of zeros on the line. DISTINCT-zero form: Milinovich-Ng arXiv 1306.0854 (PDF downloaded, pdftotext,
p.2 read): "Selberg's method [49] shows that a positive proportion of the non-trivial zeros of the Riemann zeta-function are on the critical
line. This is accomplished by counting sign changes of Hardy's function Z(t) and every zero detected by this method has odd multiplicity."
Burnol arXiv math/0103058 and Baez-Duarte arXiv math/0202141: abstracts read (the exact lower bound is NOT in Burnol's abstract).
