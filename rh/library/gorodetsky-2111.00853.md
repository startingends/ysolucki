BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/README.md`, `rh/library/INDEX.md`).

# O. Gorodetsky, "The variance of integers without small prime factors in short intervals", arXiv 2111.00853 v3

## 1. Reference and extent of reading
- Author: Ofir Gorodetsky (Technion). Title as above. arXiv 2111.00853: v1 1 Nov 2021, v2 15 Dec 2022,
  **v3 21 Oct 2024** ("24 pages, accepted version"); journal reference on the arXiv page: **Math. Z. 308 (2024),
  no. 4, Paper No. 59**. The acknowledgments thank the referee.
- Source read: the current e-print (v3), two files `variance_integers_without.tex` and `.bbl`, saved under
  `rh/library/src/gorodetsky-2111.00853/x/` (gitignored; never compiled or run).
- **Read whole: 76,542 / 76,542 characters (811 lines) of the TeX, and the bibliography 7,230 / 7,230.**
  No figures. Theorem numbers below are the ones LaTeX would print (theorem/lemma/proposition/corollary share
  one counter per section; conjectures and remarks have their own counters), worked out from the TeX.

Notation (the paper's): α_y(n) = 1 if every prime factor of n is > y (a "y-rough" or sifted integer), else 0;
P_y = ∏_{p≤y}(1 − 1/p) ~ e^{−γ}/log y; q_y = ∏_{p≤y} p (α_y is q_y-periodic);
V(X,H,y) = (1/X)∫_0^X (Σ_{x<n≤x+H} α_y(n) − H P_y)² dx, with y, H, X integers, H ≤ X.
Ψ(x,y) = #{n ≤ x, y-smooth}; Ψ_f(x,y) = Σ_{n≤x, y-smooth} f(n); ρ Dickman; λ(u) = e^{−γ}∫_u^∞ ρ(v)dv
(λ(u) = 1 − e^{−γ}u on [0,1]); ξ(u) solves e^ξ = 1 + uξ (ξ ~ log u).
Main term: M(H,y) = ∏_{2<p≤y}(1 − 2/p) · Σ_{n≥1} g_y(n) {H/2n}(1 − {H/2n}), g_y multiplicative, supported on
squarefree n, g_y(p) = p/(p−2) for 2 < p ≤ y, 0 otherwise (a finite sum).

## 2. What it proves (all unconditional)
- **Theorem 1.1.** Fix ε ∈ (0,1). Let y, H ≤ X → ∞ with **y ≥ (2+ε) log H**. Put a = log log H / log y ∈ (0,1). If
  **(1 + a) · log H / log log H ≤ (1 − ε) · log X / log y**, then V(X,H,y) ~ M(H,y) as H → ∞.
  Examples given: H = X^A, A ∈ (0, 1/2): holds for (2A+ε) log X ≤ y ≤ (log X)^{1/A − 1 − ε};
  H = exp((log X)^A), A ∈ (0,1): holds for (2+ε)(log X)^A ≤ y ≤ exp((log X)^{1−A}).
  (Since H > q_y can be reduced mod q_y, WLOG H ≤ q_y, i.e. log H ≲ y; the hypothesis y ≥ (2+ε) log H is slightly
  stronger.)
- **Corollary 1.2.** Under the same hypotheses, for any w(x) → ∞ and almost all x ∈ [0,X]:
  Σ_{x<n≤x+H} α_y(n) = H P_y + O_ε(M(H,y)^{1/2} w(x)).
- **Theorem 1.3 (size of M).** u = log H / log y.
  (1) y ≥ exp((log log H)^{5/3+ε}): M(H,y) ~ H P_y λ(u).
  (2) H ≥ y ≥ (log H)^{2+ε}, min{u, log y/log log H} → ∞: M(H,y) ~ (e^{−γ}/ξ(u)) P_y Ψ(H,y).
  (3) H ≥ y ≥ (2+ε) log H, H ≥ C_ε, u → ∞: M ~ (2ζ(α−1)/(α−1)) ∏_{p≤y}(1 − 2/(p(1+p^{−α}))) Ψ_{μ²}(H,y), α the
      saddle point of ζ_1(s,y) = ∏_{p≤y}(1+p^{−s}) at H/2.
  (4) Uniformly for y ≥ (log H)^{1+ε}, H ≥ C_ε: M(H,y) ≍_ε P_y Ψ_{μ²}(H,y) / log(2+u).
  Consequences stated: M ~ H P_y (the Bernoulli/Poisson prediction) iff H = y^{o(1)}; for H ≥ y^ε, M is
  asymptotically SMALLER than H P_y by the decreasing factor λ(u) (Remark 1: the analogue of the 1 − log H/log X
  factor in Goldston–Montgomery for primes). Always M ≪_ε Ψ(H,y) and M ≫_ε P_y H^{1−a+o(1)} (§5.2, from Theorem 1.3 and Ψ_{μ²}(x,y) = x^{1−log log x/log y+o(1)}).
- **Lemma 1.4** (fundamental lemma, from Friedlander–Iwaniec, Opera de Cribro Thm 6.12): for an interval I of length
  X, fixed k, shifts h_i and any u ≥ 1:
  Σ_{n∈I} ∏_{i≤k} α_y(n+h_i) = X ∏_{p≤y}(1 − ν_p(h)/p)(1 + O_k(u^{−u(1+o(1))})) + O_k(Ψ_{d_kμ²}(y^u, y)).
- **Lemma 1.5.** V(q_y, H, y) = M(H,y): M is exactly the variance over a full period (Hausman–Shapiro's formula
  for V_q(H), Montgomery–Vaughan's bounds H P_y(1 − ∏_{H<p≤y}(1−1/p) + O(1/log y)) ≤ V(q_y,H,y) ≤ H P_y).
  So Theorem 1.1 says: averaging over [0,X] with X far below q_y = e^{y(1+o(1))} already gives the full-period variance.
- **Corollary 2.1** (mean) and **Proposition 2.2** (the working estimate): for all integers 1 ≤ H ≤ X, y ≥ 2, u ≥ 1,
  **V(X,H,y) = M(H,y) + O(H² (P_y u^{−u(1+o(1))} + Ψ_{d_2μ²}(y^u, y)/X))**.
- §3–§4: Lemmas 3.1–3.3 (tails of g_y via Tenenbaum–Wu), Lemma 4.4 and Prop. 4.5 (Hall's identity
  (1/2πi)∫_{(r)} ζ(s−1)x^s ds/(s(s−1)) = ½{x}(1−{x}) for r ∈ (1/2,1), and its truncation), Cor. 4.6, Props. 4.12, 4.14
  (saddle point: I_α(x,y) = (H_y(α)ζ(α−1)/(α−1)) Ψ_{μ²}(x,y)(1 + O(u^{−1} + exp(−α(log y)^{3/2−ε})))).
- **Conjecture 1**: Σ_{X<n≤X+H} α_y(n) = H P_y + O_ε(min{H,y}^ε Ψ(H,y)^{1/2}) for ALL X in the Theorem 1.1 range.
  **Conjecture 2**: Theorem 1.1 with 1 − ε replaced by 2 − ε (claimed best possible, see §4 below).

## 3. Method in ten lines
1. Expand the square: V = (diagonal) + 2Σ_{k<H}(H−k)(1/X)Σ_{n≤X} α_y(n)α_y(n+k) − H²P_y² + (edge terms).
2. Each correlation Σ_n α_y(n)α_y(n+k) is a sifted count of n(n+k) by primes ≤ y: the fundamental lemma
   (Lemma 1.4, k = 2) gives X·∏_{p≤y}(1 − ν_p(0,k)/p) with relative error u^{−u} plus an absolute error
   Ψ_{d_2μ²}(y^u,y), the count of the sieve's moduli up to level D = y^u.
3. The singular-series sum Σ_k (H/2 − k) C_y f_y(k), f_y = Σ_{d|k} g_y(d)/d, is summed exactly ({x}(1−{x}) identity):
   the H² and H terms cancel against H²P_y² and H P_y, leaving M(H,y) (Prop. 2.2). This is Hall's squarefree
   method (Mathematika 1982); Remark 3 redoes it by contours (poles of ζ(s−1)G_y(s)/(s(s−1)) at s = 1, 2 cancel
   the diagonal, the Montgomery–Soundararajan "miracle").
4. M is then evaluated: for large y in physical space (Tenenbaum–Wu on Σ_{r>x} g_y(r)/r); for small y by
   M = 2C_y I_r(H/2, y) with the Perron integral of (H/2)^s G_y(s) ζ(s−1)/(s(s−1)), G_y = H_y·ζ_1(·,y),
   truncated with the functional equation and convexity of ζ(s−1) (Prop. 4.5: stationary phase), then the saddle
   point of the partial Euler product ζ_1(s,y) (de la Bretèche–Tenenbaum 2002, Hildebrand–Tenenbaum 1986),
   which makes M comparable to Ψ_{μ²}(H,y).
5. Theorem 1.1 = Prop. 2.2 + the lower bound M ≫ P_y H^{1−a+o(1)}: choose u = (1+a)(1+3δ) log H/log log H so that
   u^{−u} ≤ H^{−1−a−δ}, and require H² Ψ_{d_2μ²}(y^u,y)/X ≤ P_y H^{1−a−δ}; with Ψ_{d_2μ²}(y^u,y) = y^{u(1−a+o(1))}
   this is the condition (1+a) log H/log log H ≤ (1−ε) log X/log y.
Where the work is: §4 (the saddle point evaluation of M); the variance asymptotic itself is §2 and is short.
Inputs: fundamental lemma of the combinatorial sieve; Hall's identity; functional equation + convexity bound for
ζ(s−1) on 0 < Re s < 1 (ζ is only the generating function of 1; no zeros enter); smooth-number theory
(Hildebrand, Hildebrand–Tenenbaum, de la Bretèche–Tenenbaum, Tenenbaum–Wu, Ivić–Tenenbaum). NO zero-density
estimate, NO zero-free region beyond what the cited smooth-number asymptotics use, NO mean value theorem for
Dirichlet polynomials, NO large sieve, NO bilinear (Type I/II) estimate.

## 4. Where it stops
- The error in Prop. 2.2 has NO cancellation: it is H² times the fundamental lemma's error. To beat M ≈ P_y H^{1−a}
  one needs (i) relative error u^{−u} below H^{−1−a}, i.e. u ≳ log H/log log H, and (ii) sieve level y^u (its
  modulus count Ψ_{d_2μ²}(y^u,y) = y^{u(1−a)}) below X/H². Hence y^{log H/log log H} ≲ X: y = X^{o(1)} always, and
  y ≤ (log X)^{O(1)} once H is a power of X; H ≤ X^{1/2} in the power case.
- §1.6.2 ("Fluctuations and limitations"): by Friedlander–Granville–Hildebrand–Maier (Thm B1) the global mean
  (1/X')Σ_{n≤X'} α_{y'}(n) deviates from P_{y'} by P_{y'} v^{−v(1+o(1))}, v = log X/log y; by Cauchy–Schwarz this
  forces V(X',H,y') ≫ H² P_{y'}² v^{−2v}, exceeding M once (1+a) log H/log log H ≥ (2+ε) log X/log y'. So with the
  main term H P_y the constant 1 − ε cannot be replaced by 2 + ε; the author conjectures 2 − ε is the truth
  (Conjecture 2).
- Beyond that the naive main term H P_y is wrong (Maier-type oscillation); a better main term (H·mean over [1,X],
  or de Bruijn's Buchstab-function approximation) should extend the range, "but are not able to show this".
- The author states the range "gets worse as H and y increase": larger y makes α_y "closer to the indicator of
  primes" (α_y with y = √x is the primes in (√x, x]), "in the same way results in sieve theory deteriorate with y".
- Higher moments (Lemma 1.4 with k ≥ 3) left to future work. Order-of-magnitude almost-all results reach much
  further (Friedlander–Iwaniec Cor. 6.28: y ≤ X^{1/20}, H/log y → ∞ gives ≍ H P_y for almost all x; cited, not read).

## 5. What it changes in our record
- **N102 (5) and `specialists/sieve/HYBRID_FE.md` "Check of N101" (5)** (the open lead): read. The paper gives NO
  square-root variance for products of exactly k primes ≤ X in multiplicatively short intervals at X^k ≫ T, nor
  for any set whose sifting primes are a fixed power of the size of the integers. The sieve seat's heuristic ("I
  expect it not to transfer") is confirmed by the paper's own mechanism and its own §1.6.2 (details in §7).
- HYBRID_FE's paraphrase from the abstract, "an unconditional variance asymptotic for y-rough integers in intervals
  of length at least a power of y", is inexact: the asymptotic holds for every H with y ≥ (2+ε) log H inside the
  range of Theorem 1.1; "at least a power of y" is where the variance becomes asymptotically SMALLER than Poisson.
- HYBRID_FE (3), "Upper-bound sieves give the mean, never the deviation", and N101's "an upper-bound sieve gives the
  COUNTS ... but not the deviation": correct for upper-bound sieves at a level comparable to the size, but this
  paper shows that the TWO-SIDED fundamental lemma gives the variance asymptotically (including its sub-Poisson
  deviation) when y is so small that the level y^u with u ≈ log H/log log H stays below X. The deviation is
  reached only because the sifting range is X^{o(1)}.
- N101 (4)/Goldston–Montgomery analogy: the paper exhibits, unconditionally, the same phenomenon (variance below the
  random-model prediction once H is a power of the sifting parameter, factor λ(u) ↔ 1 − log H/log X) for rough
  numbers; Remark 3 records that the cancellation of the diagonal by the poles at s = 1, 2 repeats the
  Montgomery–Soundararajan observation. Already known; nothing in our record claimed otherwise.
- Nothing in ATLAS, THEORY or FOOTHOLDS is superseded.

## 6. Reliability
- Refereed (Math. Z. 2024); v3 is the accepted version. Statements depend on cited results (Friedlander–Iwaniec
  fundamental lemma; de la Bretèche–Tenenbaum saddle point for Ψ_{μ²}; Tenenbaum–Wu; Hildebrand; Ivić–Tenenbaum),
  none of which was read here.
- Small slips noticed while reading (harmless): in §5.2 the inequality "u^{u(1−δ)} ≫ P_y H^{1+a+δ}" carries a
  spurious P_y (from H²P_y u^{−u} ≪ P_y H^{1−a−δ} the P_y cancels); in §1.6.2 the Granville–Soundararajan sentence
  writes I_+ twice where the second should be I_−; Cor. 2.1 carries Ψ_{μ²} and Prop. 2.2 Ψ_{d_2μ²} (consistent
  with Lemma 1.4 for k = 1, 2). No numerical checks made.

## 7. Answers to the question of N101–N102 (5)
- **Set counted**: α_y, integers ALL of whose prime factors exceed y (no upper limit on the primes, no fixed number
  of factors), in ADDITIVE intervals (x, x+H], x averaged over [0,X], around the constant mean H P_y.
- **Range, unconditional**: y ≥ (2+ε) log H and (1 + log log H/log y) log H/log log H ≤ (1−ε) log X/log y
  (Theorem 1.1); e.g. H = X^A, A < 1/2, y ≤ (log X)^{1/A−1−ε}; H = exp((log X)^A), y ≤ exp((log X)^{1−A}).
  Always y = X^{o(1)}.
- **Size**: V ~ M(H,y) = the full-period (primorial) variance. Poisson (~ H P_y) iff H = y^{o(1)};
  for H ≥ y^ε it is smaller, ~ H P_y λ(u), and for u → ∞ of order P_y Ψ(H,y) (the y-smooth count up to H).
  So the fluctuation is at most square-root of the mean, and below it once H is a power of y.
- **Inputs**: fundamental lemma of the combinatorial sieve (two-sided, levels y^u), Hall's identity with ζ(s−1)
  (functional equation, convexity), saddle point for smooth numbers. No zero-density, no zeros, no Dirichlet
  polynomial mean values. The structural reason it works is §1.6.3's duality α_y = 1 ∗ β_y, β_y = μ·1_{y-smooth}:
  a long smooth variable (the 1) times y-smooth moduli of size ≤ y^u ≤ X.
- **Does it apply to N101's range?** No. Products n ~ N = X^k of exactly k primes ≤ X are (essentially)
  X^{1−o(1)}-rough, i.e. sifting parameter y ≈ N^{1/k}, a FIXED power of the integers' size; interval length
  H = N/T is a power of N. In the paper's terms: (a) Theorem 1.1 needs log H/log log H ≤ (1−ε)/(1+a) · log N/log y ≈ k
  (here log N/log y ≈ k), which fails for every H → ∞ beyond bounded size, let alone H = N/T; (b) in Prop. 2.2
  the fundamental-lemma parameter is then u ≤ log N/log y ≈ k, bounded, so the error term H² P_y u^{−u(1+o(1))} is a
  fixed fraction of H² P_y, larger than any variance of size ≤ H P_y; (c) §1.6.2: with H a power of X and y a power
  of X the FGHM oscillation makes the variance around H P_y provably larger than M (the main term itself fails), and
  the author cannot handle a better main term; (d) the author: as y grows α_y approaches the primes and the range
  deteriorates "in the same way results in sieve theory deteriorate with y". Moreover the set differs (no
  upper bound on prime factors, no fixed Ω), and there is no long smooth variable in a k-fold product of primes near
  X. The exact obstruction is (b): the sieve error has no cancellation and needs level y^u with u ≫ log H/log log H
  inside [1, X], impossible when y is a power of X.
