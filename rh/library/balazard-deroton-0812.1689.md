BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# M. Balazard, A. de Roton, "Sur un critère de Báez-Duarte pour l'hypothèse de Riemann", arXiv 0812.1689 (Dec 2008)

Reader: READER-8, 2026-11-11. Source: arXiv TeX `baezfinal.tex` (Latin-1; a UTF-8 copy `bdr8.tex` made for reading),
saved under `rh/library/src/mollif_0812.1689/x/`. Read because it is the published RH-conditional UPPER bound for the
discrete Nyman–Beurling distance and because its proof splits the NB integral by height (brief item (c)).

## 1. What was read
**PARTLY.** Read: abstract, §1 (statement of the problem and main theorem), §2 (relevance of the Möbius function:
Prop. 2.1 with proof, statements of Props 2.2, 2.3 and of the earlier bounds), the final section "Majoration de
I_{N,ε}" whole (two propositions with proofs), bibliography — lines 198-410 and 1064-1236 of 1,236 (about 40% of the
text). NOT read: §3 (ζ(s)/ζ(s+ε) under RH, Hadamard product), §4 (bound for J_ε), §§5-6 (RH properties of ζ:
V-typical ordinates, S(t) fluctuations, Soundararajan-type estimates for M_N(iτ) via Perron and contour deformation).

## 2. What it proves
H = L²(0,∞; t^{−2}dt), e_α(t) = {t/α}, χ = 1_{[1,∞[}, d_N = dist_H(χ, span(e_1,…,e_N)). Báez-Duarte (2003): RH ⟺ d_N → 0.
- **Théorème.** RH ⇒ d_N² ≪_δ (log log N)^{5/2+δ}(log N)^{−1/2} for N ≥ 3, every δ > 0. (Previous: Báez-Duarte 2003,
  proof due to Balazard, RH ⇒ d_N² ≪ (log log N)^{−2/3}.)
- **Quoted lower bound:** Burnol, d_N² ≥ (C + o(1))/log N, C = Σ_ρ m(ρ)²/|ρ|². BDBLS 2000 conjecture equality in
  d_N² ≥ (2 + γ − log 4π + o(1))/log N, "which therefore implies RH and the simplicity of the zeros".
  "The asymptotic behaviour of d_N is hard to determine, even conditionally on RH and other classical conjectures
  (simple zeros, Montgomery's pair correlation, …)."
- **Prop. 2.1 (unconditional).** With the approximant −Σ_{n ≤ N} μ(n) n^{−ε} e_n and
  ν_{N,ε} = ‖χ + Σ_{n ≤ N} μ(n)n^{−ε}e_n‖_H² = (1/2π)∫_{σ=½} |1 − ζ(s)M_N(s+ε)|² dτ/|s|², M_N(s) = Σ_{n≤N} μ(n)n^{−s}:
  d_N² ≤ ν_{N,ε} ≤ 2I_{N,ε} + 2J_ε, I_{N,ε} = (1/2π)∫|ζ(s)|²|M_N(s+ε) − ζ(s+ε)^{−1}|² dτ/|s|²,
  J_ε = (1/2π)∫|ζ(s)/ζ(s+ε) − 1|² dτ/|s|². (Both could be infinite if RH fails.)
- **Prop. 2.2 (RH).** J_ε ≪ ε. **Prop. 2.3 (RH).** For N ≥ N_0(δ), ε ≥ 25(log log N)^{5/2+δ}(log N)^{−½}: I_{N,ε} ≪ N^{−ε/2}.
  (Báez-Duarte 2003 had J ≪ ε^{2/3} and I ≪ N^{−2ε/3} for ε ≥ c/log log N.)
- **Last section, Prop. A (labelled RH).** ∫_{|τ| ≥ N^{3/4}} |ζ(s)|²|ζ(s+ε)^{−1} − M_N(s+ε)|² dτ/|s|² ≪ N^{−1/9}. Proof:
  for T ≥ 1, I_N(T,ε) := ∫_{T ≤ |τ| ≤ 2T} … ≪ T^{−3/2}(T + N) log N, from (i) ∫_T^{2T}|ζ(s)/ζ(s+ε)|² ≪ T^{3/2} (RH, §3)
  and (ii) ∫_T^{2T} |ζ(s)|²|M_N(s+ε)|² dτ ≤ T^{½}(T + O(N)) Σ μ²(n)n^{−1−2ε} ≤ T^{½}(T + N) log N, by the convexity
  bound |ζ(½+iτ)| ≪ τ^{¼} and the Montgomery–Vaughan mean value theorem; sum over T = 2^k N^{3/4}.
- **Last section, Prop. B (RH).** For ε ≥ 25(log log N)^{5/2+6δ}(log N)^{−½}:
  ∫_{|τ| ≤ N^{3/4}} |ζ(s)|²|ζ(s+ε)^{−1} − M_N(s+ε)|² dτ/|s|² ≪ N^{−ε/2}, from the pointwise RH bound
  ζ(s+ε)^{−1} − M_N(s+ε) ≪ N^{−ε/4}(1+|τ|)^{½−β(τ)} (§5, Soundararajan-type) and |ζ(s)|² ≪ (1+|τ|)^{β(τ)}.

## 3. Method in ten lines
1. Use Möbius coefficients damped by n^{−ε}, not the optimal ones.
2. Split 1 − ζM_N(·+ε) = (1 − ζ(s)/ζ(s+ε)) + ζ(s)(ζ(s+ε)^{−1} − M_N(s+ε)).
3. J_ε: a statement about ζ alone near the line (RH, Hadamard product): ≪ ε.
4. I_{N,ε} at large heights |τ| ≥ N^{3/4}: the NB weight |s|^{−2} plus a crude mean value bound suffice.
5. I_{N,ε} at small heights |τ| ≤ N^{3/4}: needs that the partial sums M_N(s+ε) converge to 1/ζ(s+ε) just right of
   the line, uniformly in τ ≤ N^{3/4}: Soundararajan's RH method for partial sums of μ, made explicit.
6. Optimise ε against N: ε ≈ (log log N)^{5/2}/√(log N) gives the theorem.
7. The √(log N) loss (against the conjectured 1/log N) comes from the pointwise RH control of M_N near the line.
8. No twisted second moment of ζ with a long Dirichlet polynomial is evaluated; at small heights everything is
   pointwise.
9. The proof shows WHERE the difficulty is: heights |τ| ≤ N^{3/4} (bounded and moderate t with a mollifier much longer
   than the height); above N^{3/4} a trivial bound suffices.
10. Under RH all of it is pointwise; without RH the J_ε and small-height pieces are not even finite a priori.

## 4. What is assumed
RH for the theorem and for Props 2.2, 2.3, A (through (i)), B. Piece (ii) of Prop. A is unconditional.

## 5. Where it stops
- Upper bound (log log N)^{5/2+δ}/√(log N) under RH; the conjectured 1/log N is not reached; the authors say the
  asymptotic is hard even under RH + simple zeros + pair correlation.
- No unconditional statement beyond Prop. 2.1.

## 6. What it changes in our record
- `rh/NOTEBOOK.md` N53 (a) "Conversely RH gives bounded approximants": true in print for Möbius approximants with
  weights μ(n)n^{−ε}, ε = ε(N) → 0 (Báez-Duarte 2003; this paper with a rate). For N53's general w_N it depends on the
  weights; for Levinson's weights see BCF (conditional on more than RH).
- N53 (b) "for T ≥ N^(7/4) … Conrey's theorem bounds the block … everything lies at heights T ≪ N^(7/4)". Piece (ii)
  of Prop. A shows, unconditionally and for any coefficients |a_n| ≤ 1, that the dyadic block at height T of the NB
  integral ∫|ζ M_N|²/|s|² is ≪ T^{−3/2}(T + N) log N. Summing over dyadic T ≥ X gives ≪ (X^{−½} + N X^{−3/2}) log N,
  which is o(1) once X ≥ N^{2/3+ε} (reader's arithmetic from the paper's bound; with Weyl's |ζ| ≪ τ^{1/6+ε} the same
  gives X ≥ N^{3/5+ε}; under Lindelöf X ≥ N^{½+ε}). So the unconditional "harmless" range is T ≥ N^{2/3+ε}, much
  larger than N53's T ≥ N^{7/4}, and needs no off-diagonal theorem at all: for the NB weight an UPPER bound with a
  loss of T^{½} is enough. What remains is the range T ≤ N^{2/3+ε} (where these trivial bounds fail), i.e. mollifier length
  ≥ T^{3/2−ε}: θ > 3/2, beyond every twisted-moment theorem (BCR's ceiling is θ < 1), down to bounded height.
- N53 (c) says that in the NB problem "the large-sieve bound is dominated by the D-term for EVERY sequence and
  carries no information". At height T the block's "family" is the t-interval (length T) and ζM_N has effective
  length T^{½}N, so the short-family regime is T < N². Piece (ii) is exactly a D-term-dominated large-sieve bound, and
  it is enough on N^{2/3+ε} ≤ T < N², i.e. on most of the short-family regime, because the NB weight T^{−2} absorbs the
  D-term. So the D-term does carry enough information there; the statement holds only for T ≤ N^{2/3}.
- IDEAS #34 form (4) and N57: in the NB problem there is no self-dual point at θ = ½ that matters: the region θ < 3/2
  is handled trivially for upper bounds; the open region θ ≥ 3/2 is "beyond" the Lindelöf-type ceiling θ = 1 of
  BCR's formula. (Reader's reading of the published bounds.)

## 7. Reliability
Published version not checked (per BCF it is cited as Balazard–de Roton; arXiv says "Sur un critère de Báez-Duarte").
Only part of the paper was read; the RH-dependent pointwise estimates of §§3, 5, 6 are taken on trust. The heading of
Prop. A carries "(HR)" because of piece (i); piece (ii) is unconditional as written.
