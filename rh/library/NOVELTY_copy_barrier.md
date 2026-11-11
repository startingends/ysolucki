# NOVELTY search: the copy barrier (THEORY T106-T114; rh/specialists/sieve/COPY_BARRIER.md, verdict VERDICT.md)
Reader: READER-13, 2026-11-11. Owner rule: novelty by search, not memory. This file records what was searched, what was
read, and how each source relates to T106-T114. It makes no recommendations.
Labels: READ (text opened and the relevant passage read) / ABSTRACT (abstract only) / SNIPPET (search-engine summary only,
source not opened) / NOT OBTAINED.

## 1. Queries run (exact strings, where)
arXiv API (`https://export.arxiv.org/api/query?search_query=...`, relevance or date order, up to 60 results each):
1. `all:"quasi-Riemann"` (20 results; all titles screened)
2. `abs:amplification AND abs:"zero-free"` (0)
3. `abs:amplifier AND abs:"zero-free"` (1: 2610.15291)
4. `abs:barrier AND abs:"zero-free"` (2, both irrelevant)
5. `abs:"quasi-Riemann" AND abs:barrier` (0)
6. `abs:"seven-eighths" OR abs:"7/8" AND abs:"zero-free"` (8)
7. `abs:"Mobius" AND abs:"quadratic twists"` (0); `abs:"Möbius" AND abs:"twists" AND abs:"mean square"` (0)
8. `abs:"half-plane" AND cat:math.NT`, `abs:"zero-free" AND cat:math.NT`, `abs:"sixth-power" OR abs:"sextic" AND cat:math.NT`,
   `abs:"Moebius" OR abs:"Möbius" AND abs:"zero-free"`, all date-sorted, every title from 2026-09-25 to 2026-11-11 screened
9. `ti:"quadratic twists of the Möbius"`, `ti:"twists of the Mobius" OR ti:"twists of the Möbius"`, `ti:"exponential twists"`,
   `ti:"Average Goldbach"`, `au:Gao_P AND au:Zhao_L AND abs:Möbius`
10. `abs:"large sieve" AND abs:"squarefree" AND abs:"necessary"` (0); `abs:"large sieve" AND abs:"square-full"` (1: 2610.17675);
    `abs:"large sieve" AND abs:"squarefull"` (0); `abs:"large sieve" AND abs:"lower bound" AND abs:characters` (4);
    `abs:"large sieve" AND abs:"imprimitive"` (0); `abs:"power residue" AND abs:"large sieve"` (0); `abs:"powerful" AND abs:"large sieve"` (23);
    `abs:"quadratic large sieve"` (4); `abs:"mean value" AND abs:"real character sums"` (0)
11. `abs:"amplification method" AND (abs:limitation OR abs:limitations OR abs:barrier OR abs:limits)` (7, none number theory except a
    character-sum paper with no barrier claim); `abs:amplifier AND abs:barrier` (181, physics; first 25 screened)
12. `abs:"Mobius" AND abs:"quasi" AND abs:"zero-free"` (0); `abs:OpenAI AND cat:math.NT`, `abs:amplifier AND cat:math.NT`,
    `abs:amplification AND cat:math.NT`, `abs:copies AND abs:Möbius` (date-sorted, every title since 2026-09-25 screened)

Web search (WebSearch tool, US index):
- `quasi-Riemann hypothesis barrier 3/4 amplification sixth powers copies`
- `Tao quasi-Riemann hypothesis 7/8 OpenAI blog barrier "3/4"`
- `"amplification" "zero-free region" limitation OR barrier family of characters mean square Möbius twisted sums`
- `mathoverflow quasi-Riemann hypothesis 7/8 OpenAI method limit 3/4`
- `hexagonmath.org quasi-Riemann hypothesis barrier amplifier sixth power copies`
- `large sieve inequality fails for imprimitive characters principal character repeated lower bound "large sieve" multiplicity sharpness`
- `"amplifier" "limitations" Iwaniec Sarnak amplification method cannot beat barrier family size square root number of copies`
- `number of squarefull integers up to x "zeta(3/2)/zeta(3)" x^{1/2} characters trivial kernel power residue symbol family "m-th powers"`
- `Terence Tao mathstodon OR blog quasi-Riemann hypothesis OpenAI sixth power residue amplification "3/4"`
- `Murty Sankaranarayanan "Averages of exponential twists of the Liouville function" Forum Math 2002 abstract quasi-Riemann`

MathOverflow (StackExchange API, `search/advanced`, site=mathoverflow): `quasi-Riemann`, `zero-free half-plane`,
`amplification zero-free` (0), `large sieve squarefree necessary`, `large sieve primitive characters only` (0).
Threads opened (question, all answers, all comments): 515985 "Why cubic Gauss sums?" (Oct 2026), 516632.

Pages fetched: Tao's blog tag page `terrytao.wordpress.com/tag/riemann-zeta-function/` (first 100k characters) and the two
October 2026 posts it lists (22 Oct, 30 Oct, with comments); Quanta, 19 Oct 2026 "AI proved the quasi-Riemann hypothesis: what
happens now"; GitHub tomoto0/quasi-riemann-hypothesis-7-8-verification (README and reports/barrier_analysis.md);
GitHub Singh-AP/ai-math-papers-explained (QRH page); Kintali, "A short proof of the quasi-Riemann hypothesis" (PDF).

Reference lists read: 7/8 paper (`src/qrh-main/5.txt`, refs [1]-[28]), 11/12 paper (`src/qrh-short/6.txt`, refs [1]-[51]),
Liu 2610.26835 (bibliography). Already-held library material re-read for this question: `src/qrh-web/{gomila,explorer,result003,
quanta}.txt`, `src/qrh-github/README.md.out`, `guth-maynard-2405.20552.md`, `dfdh-2607.07911.md`, the 7/8 paper Prop. 9.2 and
Lemma 17.6 (text layer).

Failed / not done: Semantic Scholar API (HTTP 429, rate-limited, no results); Google Scholar not used (owner rule);
hexagonmath.org not indexed by the search tool and not crawled; Montgomery, "Topics in multiplicative number theory" (LNM 227)
chapter on the large sieve, Iwaniec-Kowalski ch. 7, Iwaniec-Sarnak (1995), Duke-Friedlander-Iwaniec, Conrey-Iwaniec, Huxley,
Jutila, Bourgain large values: NOT OBTAINED (books / paywalled; not searchable as full text here); Newton (Zenodo, 16 Oct 2026):
NOT OBTAINED (known only from Liu's citation); Radziwill's NYU talk and the Numberphile video: not watched.

Downloaded sources (each in its own new directory under `rh/library/src/`, TeX/PDF only, nothing executed):
`novcb-1105.1176`, `novcb-1112.1642`, `novcb-1112.1650`, `novcb-2205.12108`, `novcb-2212.09241`, `novcb-2405.18778`,
`novcb-2610.17675`, `novcb-2610.26835`, `novcb-2611.00924`, `novcb-hb1995` (Acta Arith. 72 PDF + text), `novcb-kintali`,
`novcb-tomoto0-barrier`.

## 2. Candidates and their exact relation to T106-T114

**C1. D. R. Heath-Brown, "A mean value estimate for real character sums", Acta Arith. 72 (1995) 235-275. READ pp. 235-239
(introduction, Theorem 1, Corollaries 1-4), from the journal PDF.** Passage, p. 236-237: with Elliott's bound for
sum_{m<=M} |sum_{n<=N} a_n (n/m)|^2, "If we choose a_n = 1 for n a square ... the left hand side will be of order MN", and,
answering Montgomery's wish (Topics, ch. 9) for a bound good up to N ~ M: "one cannot hope for such an improvement of (6), since
when a_n = 1 for all n, the contribution from square values of m will be of order M^{1/2} N^2. With this in mind we restrict m also
to run over square-free values only." Relation: this IS T106 for the quadratic family over Q, in the copy direction, with the copy
count: the square rows m (exactly the copies, about M^{1/2} of them) each give a row of size about N^2 on the all-ones vector, so no
general-coefficient bound of the form (M + N) sum |a_n|^2 can hold over all m. It is also the reason the classical quadratic large
sieve is stated over squarefree indices. Same argument as T106 (test vector a = 1), special family. It does not state the general
multiset form, the eta-copy constants, or any consequence for amplification.

**C2. L. Goldmakher, B. Louvel, "A quadratic large sieve inequality over number fields", arXiv 1112.1642 (Math. Proc. Camb.
Phil. Soc. 154 (2013)). READ: definition of n-th order Hecke family (lines 94-125 of the TeX) and Remark after (4.x)
(line 472).** The remark: without the squarefree condition the bound fails, "considering the sequence lambda_b = 1 if b is a square
ideal ... the quantity sum_{a ~ M} |sum_b lambda_b chi_b(a)|^2 is of order MN", "as already noticed in [HB, p. 236]". Relation:
the dual (column) form of T106 for the quadratic family over a number field; the row/copy form is C1. Their "n-th order Hecke
family" (primitive characters, order dividing n, reciprocity law, chi_a chi_b-bar primitive mod ab) is indexed by SQUAREFREE ideals
only, so copies are excluded by definition; no copy count, no kernel lemma. Related to T107 (number-field setting) and to the
"homomorphic family" of T111, but not the same notion (T111 indexes by all ideals and asks which members are trivial).

**C3. J. B. Conrey, H. Iwaniec, K. Soundararajan, "Asymptotic large sieve", arXiv 1105.1176. READ lines 150-160 of the TeX.**
"The superscript * indicates that the summation runs over primitive characters. Without this restriction, the inequality (1.4)
would be obviously false." Relation: the folklore half of T106 (general large sieves must exclude repeated/principal members),
stated without proof or quantification. Weaker than T106.

**C4. V. Blomer, L. Goldmakher, B. Louvel, "L-functions with n-th-order twists", arXiv 1112.1650 (IMRN 2014). READ by keyword
in the TeX: section 2 (line 396), proofs of the corollaries (lines 1038-1048, 1153, 1180-1236).** Line 396: "If A = A_1 A_2^n with
A_1 n-th power free, then the conductor of chi_A is an ideal lying between A_0 and c A_0, where A_0 is the squarefree kernel of
A_1." In the proofs every ideal is decomposed A = A_0 A_1 A_2^n (A_0 squarefree, A_1 squarefull and n-th power free), the
squarefree part is sent to the large sieve (Theorem 1.3) and the squarefull and n-th-power parts are summed trivially
(convergent sums of N^{-1/2-eps}). The 7/8 paper (ref. [4] there, used in its Prop. 9.2) cites this "separation of squarefree and
powerful row factors". Relation: for the power-residue family this gives the kernel statement of T111 example (a) (chi_A is
unramified away from c exactly when A_1 is a unit ideal, i.e. A is an n-th power up to c-part), and it uses the squarefull/powerful
decomposition and the O(V^{1/2}) count of T109 as a technical device. It does not state the general kernel lemma for an arbitrary
"multiplicative and local" family, does not count copies as such, and draws no barrier.

**C5. OpenAI, "The quasi-Riemann hypothesis: a zero-free half-plane Re s > 7/8" (30 Sep 2026; `src/qrh-main`). READ Prop. 9.2
(text pp. 66-68) and Lemma 17.6 (p. 151).** Prop. 9.2 factors every sixth-power-free row (u) = s w k with w powerful and proves
"The number of powerful ideals of norm at most V is O(V^{1/2})" via v^2 y^3; this bounds the number of witness rows, not copies.
Lemma 17.6 (sixth-power amplification) uses the injectivity of (u, a) -> u a^6 and the P ~ (H/U)^{1/6} sixth-power copies, giving
H/P. Relation: the source of the copy amplifier that T108/T113 analyse, and an instance of the T109 count in the same paper; no
statement that the copy density of any family is at most 1/2, and no barrier. The 11/12 paper (`src/qrh-short`) also states no
barrier (digest `openai-qrh-11-12.md`, section 12, confirmed: no "barrier", "3/4", "squarefull" or "powerful" in its text layer).

**C6. P. Gao, L. Zhao, "Mean squares of quadratic twists of the Möbius function", arXiv 2212.09241 (J. Number Theory 247 (2023)),
cited by the 11/12 paper as [12]. READ Theorem 1.1 and the reduction (lines 160-191, 310-320 of the TeX).** Under GRH,
sum*_{d} (sum_n mu(n) (8d/n) Phi(n/Y))^2 W(d/X) = (4/pi^2) XY h(1,1) Z_2(1) + O(X^{1/2+eps} Y^{3/2+eps} + X Y^{1/2+eps}), an
asymptotic for Y << X^{1-eps}, d over odd SQUAREFREE integers. **C7. Y. Toma, arXiv 2405.18778. READ Theorem 1 (lines 108-160).**
The same asymptotic unconditionally for Y << X^{1/3-eps}. Relation: these are mu-specific diagonal mean squares (the hypothesis
(H2) of T113) for a quadratic family, i.e. the situation that T113's note says "would sit exactly on the barrier (3/4)". But the
family is restricted to squarefree d, so it contains no copies other than d = 1, and neither paper draws any zero-free or barrier
consequence. Only related.

**C8. Y. Xu, H. Sang, "A matching lower bound for the sextic large sieve and structured prime moments", arXiv 2610.17675 v2.
READ section 1 (lines 95-240 of the TeX).** Lower bound Xi_6(A,B) >> (AB)^{-eps}(A + B + A^{5/6}B^{1/3} + A^{1/3}B^{5/6}) for
squarefree rows and columns; "Theorem [optimal] shows that the general norm is sharp, while the prime estimate gives a stronger
bound for these particular coefficients." Relation: a sharpness statement for a general-coefficient sieve in the sextic family,
in the spirit of T108 (general sieves are too weak; one needs coefficient-specific bounds), but the lower bound comes from the
theta-function term with squarefree indices, not from copies. Only related. The same holds for de Faveri-Dunn-Hoffstein
arXiv 2607.07911 (cubic and quartic large sieves optimal for squarefree indices; library digest `dfdh-2607.07911.md`).

**C9. Barrier statements inside the October 2026 follow-up literature.**
- B. Liu, arXiv 2610.12234 (library `src/qrh-liu`, abstract) and arXiv 2610.26835 v2 (READ lines 215-340 of the TeX): optimality
  of B_new = 0.874957... and B_flat = 0.874886... "within the explicitly specified exponent comparison system"; "scalar optimality
  statements". Cites T. Newton (Zenodo, 16 Oct 2026, NOT OBTAINED), "Prime errors and the quasi-Riemann frontier: a certified
  conditional boundary and its parameter-optimization barrier", for a barrier B_lim = 0.874886649... within a stated admissibility
  system. Relation: parameter-optimisation barriers near 0.8749 for the 7/8 paper's chain; different mechanism (bootstrap and
  exponent bookkeeping), no copy count. Only related.
- Y. Xu, H. Sang, arXiv 2610.15291 (verifier read it in part): "No claim is made that the resulting exponent is optimal".
- X. Chang, H. Wang, arXiv 2611.00924 (READ by keyword): endpoint 0.874462...; mentions "fixed amplifier errors" and
  "exact sixth-power punctures"; no barrier claim. Only related.
- GitHub tomoto0/quasi-riemann-hypothesis-7-8-verification, `reports/barrier_analysis.md` (READ, Japanese, whole file, 8.8 kB):
  under the paper's normalisation M + l = 1 the boundary is sigma_0 = 1 - h/6 + b/12, "1/6 comes from the pole of zeta_F(6z) produced
  by the sextic frequency structure u a^6"; barriers sigma_0 >= 2/3 (low-side geometry), > 13/15 (rows with zeros near 1/2 counted
  trivially, even with density-hypothesis counts), fixed point 0.8745 (bootstrap); "a frequency structure different from u a^6"
  named as needed. Labelled by its author as model computations outside stated ranges. Relation: the closest written barrier
  analysis found. Its 1/6 is the copy density delta = 1/6 of T113's formula 1 - delta/2 seen from the Mellin side, but it is a
  computation for the one sextic family. It does not bound copy density in other families, does not prove delta <= 1/2, and does
  not reach 3/4. Only related; weaker in scope and different in mechanism.
- Kintali, "A short proof of the quasi-Riemann hypothesis" (7 Oct 2026, PDF READ by keyword): 47/48; uses "every powerful
  ideal is uniquely x^2 y^3" as a counting step; no barrier. Only related.

**C10. Public assertions of a 3/4 barrier (no argument).** Emergent Mind result 003 page (library `src/qrh-web/result003.txt`,
explorer.txt): forum post "(FWIW the method has a barrier at 3/4, so it needs a nice new idea)" (user @AcerFur, 6 Oct 2026, per
READER-4). MathWorld "Quasi-Riemann Hypothesis" (read by the verifier V-COPY): reports that Tao "noted that the method could not
move the zero-free boundary to the left of Re[s] = 3/4 without another extremely clever idea" (Numberphile, 15 Oct 2026, not
watched). Tao's blog (two October 2026 posts and comments, READ): no discussion of the method's limits. Quanta 19 Oct 2026 (READ
via fetch): no 3/4, copies or amplification; only general scepticism (Sawin, Bloom, Radziwill). MathOverflow 515985 (READ):
answers by Sawin and Stopple and all comments explain the Gauss-sum/Möbius identity; no barrier. Relation: the CONCLUSION of T113
(3/4) is asserted orally for "the method"; no written argument, no mechanism, and no statement that the obstruction is the density
of copies.

**C11. Classical "3/4" in zero-density theory.** Guth-Maynard arXiv 2405.20552 (library digest, section on "the barrier beaten"):
sigma = 3/4 is where Ingham's mean value theorem and the Montgomery-Halász-Huxley large-values estimate coincide; the large value
method "gives no information if sigma <= 3/4" (Montgomery, Topics, p. 141, as quoted there). Relation: a different 3/4 (large
values of Dirichlet polynomials, zero density near the critical line), unrelated to copies in a character family. Only related.

**C12. Squarefull counting.** arXiv 2205.12108 (READ introduction): Q(x) = sum_{a^2 b^3 <= x} mu^2(b), and Bateman-Grosswald,
Illinois J. Math. 2 (1958) 88-98, "On a theorem of Erdős and Szekeres": Q(x) = (zeta(3/2)/zeta(3)) x^{1/2} + (zeta(2/3)/zeta(2))
x^{1/3} + O(x^{1/6} e^{-c(log x)^{4/7}(log log x)^{-3/7}}). Erdős-Szekeres (1935) not read (cited there).

**C13. Other screened, only related.** Bhowmik-Ruzsa arXiv 1711.06442 (ABSTRACT: average Goldbach implies a quasi-RH); Murty-
Sankaranarayanan, Forum Math. 14 (2002) (SNIPPET; cited by the 11/12 paper only for the phrase "quasi-Riemann Hypothesis"); Ren-
Zhang arXiv 2203.12168 (ABSTRACT); Banks-Shparlinski arXiv 1801.10276 (SNIPPET: Möbius twisted by characters to powerful moduli;
powerful MODULI, not copies); Baier-Young / Baier-Bansal large sieves for square and power moduli (titles only: power moduli, not
indices). Yangbo Ye arXiv 2610.15989, Frei-Sofos-Widmer 2610.18491, Broucke-Révész 2611.03356, Lamzouri 2610.26841 (ABSTRACTS):
uses or neighbours of quasi-RH; no barrier.

## 3. Verdicts by entry
| Entry | Verdict | Basis |
|---|---|---|
| T106 (Theorem 1 over Q) | **KNOWN** in substance | Quadratic family with copy count: Heath-Brown 1995, pp. 236-237 (C1); dual form Goldmakher-Louvel Remark (C2); folklore form "obviously false" without primitivity, Conrey-Iwaniec-Soundararajan (C3). The general multiset statement with eta-copy constants was not found printed; it is the same one-vector argument. |
| T107 (number field, kappa_K) | **PARTLY KNOWN** | Quadratic number-field case in the column direction: C2. The general statement, the corrected constant kappa_K(D) and the Q(sqrt -163) counterexample to the uncorrected form: NOT FOUND. |
| T108 (copy amplifier fed by a general sieve is trivial) | **PARTLY KNOWN** | Not found stated as a statement about amplifiers. Its content for the quadratic family is immediate from C1 (Heath-Brown's square rows), and C8 states in the sextic case that the general norm is sharp while coefficient-specific bounds do better. |
| T109 (squarefull count <= 3 sqrt X, <= zeta(3/2) sqrt X) | **KNOWN** | a^2 b^3 decomposition and asymptotic (zeta(3/2)/zeta(3)) x^{1/2}: Erdős-Szekeres 1935, Bateman-Grosswald 1958 (C12). O(V^{1/2}) for powerful ideals used in the 7/8 paper Prop. 9.2 (C5) and BGL (C4). The explicit uniform constants were not found printed; they follow from the same decomposition. |
| T110 (kernel lemma and copy count over N) | **PARTLY KNOWN** | The group-theory step (g^v = 1 => ord g divides v) is elementary. The count is T109. The power-residue case of the conclusion (trivial members are n-th powers times a bounded part) is in C4. The abstract form "m(p) != 1 for all p outside P_0 => copies are P_0-part times squarefull, <= C sqrt X" was not found stated. |
| T111 (Theorem 2, homomorphic families) | **PARTLY KNOWN** | Special cases known: power-residue symbols (Kummer theory; conductor via the n-th-power-free part, C4 line 396) and the Dirichlet family (principal characters, C = Q). The general kernel lemma for multiplicative, local families of Hecke characters, the bound #copies <= C(K,S,P_0) H^{1/2}, and the [1,D]-repair: NOT FOUND. Goldmakher-Louvel's "n-th order Hecke family" (C2) is a different, squarefree-indexed notion. |
| T112 (amplifier arithmetic) | not a novelty question | Elementary inequalities. The special case delta = 1/6 -> 11/12 is in the October papers (C5) and in the tomoto0 analysis (C9). |
| T113 (Theorem 3, the barrier) | **NOT FOUND** as a written result. Its conclusion (3/4) is **asserted without argument** in public (C10) | No source found that bounds the copy density of a general family by 1/2, or derives a 3/4 limit for amplification by copies. The closest written analyses (C9: tomoto0; Liu; Newton, not obtained) are parameter-system barriers for the one sextic chain (2/3, 13/15, about 0.8745-0.8749) and do not involve a copy count. The classical 3/4 of zero-density theory (C11) is a different phenomenon. |
| T114 (orthogonality mean value) | **KNOWN** | Classical orthogonality of Dirichlet characters (textbook; not re-read). |

## 4. Overall verdict
**PARTLY KNOWN.** Known: T106 in the quadratic case including the copy count M^{1/2} (Heath-Brown 1995, p. 237), its folklore
general form (CIS 2011), T109, T114, and the power-residue and Dirichlet special cases of T111. New relative to what this search
found: the general kernel lemma and the bound #copies <= C H^{1/2} for multiplicative, local families (T110 in its general form,
T111), the corrected number-field constant (T107), and the barrier T113 as a proved statement about the copy-amplifier chain.
Its conclusion "3/4" has been asserted orally and in a forum post, with no written mechanism.

**Scope of the search (honest).** About 30 arXiv API queries (titles screened, about 20 abstracts read), 10 web searches, 5
MathOverflow searches and 2 threads read whole, about 12 sources read in the relevant section (none cover to cover). Not covered:
the classical amplifier and large-values monographs and papers listed in section 1 as NOT OBTAINED (Montgomery LNM 227,
Iwaniec-Kowalski, Iwaniec-Sarnak, Duke-Friedlander-Iwaniec, Conrey-Iwaniec, Huxley, Jutila, Bourgain), Newton's Zenodo preprint,
the hexagonmath.org server, talks and videos (Radziwill at NYU, Numberphile), and anything not indexed by arXiv or the US web
index. "Not found" here is not "new": a barrier for amplification by trivial members could be stated in one of the unread
classical sources or in an unindexed October-November 2026 preprint.
