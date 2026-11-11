# Rodgers, Tao, "The de Bruijn-Newman constant is non-negative"

Note by seat R-read-2, 2026-11-11. This note reports what is in the source. It recommends nothing.

## 1. Reference and how much was read

- B. Rodgers, T. Tao, *The de Bruijn–Newman constant is non-negative*, arXiv 1801.05914, latest arXiv
  source (journal-style file dated July 2021, Forum of Mathematics, Pi template, with notes "added in
  press" and "added in proof"). Published in Forum Math. Pi (2020) (not checked independently).
- **Read in full from the TeX source** (`rh/library/src/1801.05914/fmp-template.tex`, 1695 lines): §1
  introduction and notation, §2 asymptotics of H_t, §3 Riemann–von Mangoldt type formulae, §4 dynamics of
  zeroes, §5 weak bound on gaps, §6 weak bound on integrated energy, §7 strong control on integrated
  energy, §8 energy at time 0, §9 contradicting pair correlation, bibliography. The saddle-point
  computations of §2 and the cut-off bookkeeping of §7 were read, not re-derived.

## 2. What it proves

Numbering: the arXiv source uses one running counter for theorems, lemmas, propositions and remarks
(Theorem 1, …, Proposition 28); those numbers are used here.

Normalisation: H_0(z) = (1/8)ξ(1/2 + iz/2), H_t(z) = ∫_0^∞ e^{tu²}Φ(u)cos(zu)du (backwards heat equation
∂_tH_t = −∂_{zz}H_t). The real zeros of H_0 are x_j(0) = 2γ_j (twice the zeta ordinates). Λ = the constant
with: H_t has only real zeros iff t ≥ Λ (Newman 1976). RH ⇔ Λ ≤ 0.

- **Theorem 1 (main, unconditional).** "One has Λ ≥ 0." (Newman's conjecture.)

Everything else in the paper is proved **under the standing assumption Λ < 0** (made "for sake of
contradiction" in §1.2; it implies RH), for Λ < t ≤ 0, and is used only to reach the contradiction:

- **Lemma 4.** For z = x − iκ log_+ x, 0 ≤ κ ≤ C: H_t(z) ≪ exp(−πx/8 + O_C(log_+² x)); for κ ≥ C' this is
  an equality of orders of magnitude, and H_t'/H_t(z) = (i/4)log(iz/4π) + O_C(log_+ x / x). (Remark 5 says
  this lemma, unlike the rest, would be non-vacuous for Λ ≥ 0 "with a little more effort".)
- **Theorem 9 (Riemann–von Mangoldt type).** N_t([0,T]) = Ψ(T) + O(log_+² T), Ψ(T) = (T/4π)log(T/4π) − T/4π;
  N_t([T, T+α log_+ T]) = α log_+² T/4π + o(log_+² T). (At t = 0 the classical O(log T) and Littlewood's
  o(log T) on RH.) **Corollary 10:** x_j(t) = ξ_j + O(log_+ ξ_j) with ξ_j the "classical location",
  Ψ(ξ_j) = j; arithmetic-progression spacing 4π/log ξ_j at scales between o(log ξ_j) and o(ξ_j).
- **Theorem 11 (dynamics; from Csordas–Smith–Varga 1994, Lemma 2.4).** For Λ < t ≤ 0 the zeros are real,
  simple, C¹ in t, and ∂_t x_k(t) = 2 Σ'_{j≠k} 1/(x_k(t) − x_j(t)) (principal value sum).
- **Lemma 12 (identities for a finite set K of indices).** (i) gap dynamics
  ∂_t(x_k − x_j) = 4/(x_k − x_j) − 2(x_k − x_j)Σ_{i≠k,j} 1/((x_i − x_k)(x_i − x_j)); (ii) cross-energy
  inequality; (iii) energy identity: ∂_t Σ_{k≠k'∈K} 1/(x_k − x_{k'})² = (cross terms with j ∉ K) −
  2Σ(…)², a negative square; (iv) virial identity ∂_t Σ(x_k − x_{k'})² = 4|K|²(|K|−1) − cross terms;
  (v) Hamiltonian identity ∂_t Σ_{k≠k'∈K} log(1/|x_k − x_{k'}|) = −4Σ 1/(x_k − x_{k'})² + cross terms.
  "if one ignores the 'cross terms' … the right-hand side has a definite sign".
- **Proposition 13 (gaps).** For Λ/2 ≤ t ≤ 0: log(1/|x_{j+1} − x_j|) ≪ log_+² j · log_+ log_+ j.
- **Proposition 15.** ∫_{Λ/2}^0 Σ_{J≤j<k≤2J} 1/|x_j − x_k|² dt ≪ J² log_+^{O(1)} J.
- **Theorem 17.** ∫_{Λ/4}^0 Ẽ^{[0.5T log T, 3T log T]}(t)dt = o(T log_+³ T), where Ẽ is the energy
  renormalised to vanish on the classical locations. Via **Proposition 22**:
  ∂_t ℋ̃_T(t) = −4Ẽ_T(t) + o(T log³T + Ẽ_T(t)) for a.e. t (truncated renormalised Hamiltonian).
- **Proposition 26.** Ẽ^{[T log T, 2T log T]}(0) = o(T log³ T).
- **§9.** Hence x_{j+1}(0) − x_j(0) = (4π + o(1))/log T for a proportion 1 − o(1) of j in [T log T, 2T log T],
  which contradicts Conrey–Ghosh–Goldston–Gonek–Heath-Brown (1985): for any λ > 0.77 a positive proportion
  of consecutive gaps is ≤ λ·(mean gap). (That result is itself on RH, which the assumption Λ < 0 supplies.)

Quoted, not proved here: zeros simple for t > Λ ([CSV, Cor. 1]); [KKL, Thm 1.14]: "regardless of the value
of Λ, the zeroes of H_t will be spaced like an arithmetic progression on average for any positive t";
Λ < 1/2 (Ki–Kim–Lee); footnote "added in press": Λ ≤ 0.22 (Polymath 2019).

## 3. Method in ten lines

1. Assume Λ < 0. Then for Λ < t ≤ 0 all zeros of H_t are real and simple and move by the gradient-flow ODE
   ∂_t x_k = 2Σ' 1/(x_k − x_j): pairwise repulsion, with an arithmetic progression as equilibrium.
2. Formally the flow is the gradient flow of the convex "Hamiltonian" ℋ = Σ_{j≠k} log(1/|x_j − x_k|), with
   ∂_tℋ = −4E, E = Σ_{j≠k}|x_j − x_k|^{-2}, and ∂_tE = −2Σ(…)² ≤ 0. Both series diverge; all the work is in
   making truncated, renormalised versions rigorous.
3. Input from complex analysis: size of H_t at height ≈ log x below the real axis (saddle point on the
   theta-type series for Φ), giving zero counts with error O(log²T), i.e. control down to scale log T.
4. A heuristic count shows a fluctuation at scale α relaxes in time α/log T; with time |Λ| ≍ 1 available,
   scale o(log T) is exactly what step 3 delivers ("we heuristically expect to (barely) be able to
   establish local equilibrium").
5. Crude lower bound on gaps by propagating a small gap outward (virial identity + cross-energy inequality).
6. Crude integrated energy bound by pigeonholing on nested intervals (Hamiltonian identity).
7. Renormalise: subtract the values on the classical locations ξ_j; then ∂_tℋ̃_T = −4Ẽ_T + negligible, and
   large ℋ̃ forces much larger Ẽ, so ℋ̃ drops to o(T log³T) within time |Λ|/4; integrate: ∫Ẽ = o(T log³T).
8. Pass from time-averaged to time-0 energy by local near-conservation of energy on slowly shrinking
   index intervals (Bourgain's pigeonhole argument).
9. Small renormalised energy at t = 0 means almost all consecutive gaps are (1 + o(1)) × mean.
10. Contradiction with known small-gap results (pair correlation). The arithmetic of ζ enters only at
    t = 0: Riemann–von Mangoldt/Littlewood counts and the Conrey et al. gap theorem.

## 4. Where it stops

- The argument is by contradiction from Λ < 0 and yields nothing in the direction Λ ≤ 0 (RH). The paper
  proves no statement about H_t for t > 0 and no statement about non-real zeros.
- All the dynamical statements are valid only where the zeros are real and simple (t > Λ); the paper uses
  them only for Λ < t ≤ 0, which is an empty range in reality (since Λ ≥ 0).
- "In the t < 0 case there does not appear to be any usable series expansions for 1/H_t(z) or H_t'/H_t(z)"
  (Remark 5, after Lemma 4): this is why the zero counts for t < 0 lose a logarithm.
- The Lehmer-pair route: "without the GUE hypothesis, the known upper bounds on narrow gaps between zeroes
  … do not appear to be sufficient to make this strategy work, even if one assumes the Riemann Hypothesis".
- The gap bound of Proposition 13 "is probably not optimal". The bounds of §3 "(barely) suffice".
- The generalised Newman conjecture (other L-functions) is not pursued; notes added in proof/press: it "has
  now been established, with a significantly simpler proof" by Dobner, whose approach "avoids the heat
  equation" and "relies on a Riemann–Siegel type approximation for H_t in order to demonstrate the existence
  of zeros off the critical line".
- Numerical remark (Dwars, blog comments): for t < 0 "many of the zeroes of H_t … away from the critical
  line organize around deterministic curves" (reported, not proved).

## 5. What it changes in our record

- **Barrier B3 ("No slack").** B3's source statement is Theorem 1 here, now read in full: unconditional.
  The precise content: for every t < 0, H_t has a non-real zero. The slack that does not exist is slack in
  the heat-flow parameter; the paper says nothing about other deformations of ξ. B3's sentence "under the
  heat flow zeros leave the line immediately for t < 0" is exactly Λ ≥ 0.
- **Knowledge E6.** "Λ ≤ 0.2 (Polymath15 2019; Platt–Trudgian 2021)" is imprecise as to who proved what:
  this paper's footnote gives the Polymath bound as Λ ≤ 0.22. The value 0.2 is not in this paper (not
  checked here).
- **Idea #4 (zeros as particles), novelty field "exact overlap unknown".** Now known exactly:
  (a) the ODE is [CSV 1994, Lemma 2.4], restated as Theorem 11, in the normalisation x = 2γ:
  ∂_t x_k = 2Σ' 1/(x_k − x_j);
  (b) the functionals lane B found to be monotone are the ones this paper is built on. Our "window
  log-energy … down" is the Hamiltonian identity Lemma 12(v) (formally ∂_tℋ = −4E ≤ 0); our "sum of
  1/gap² … down" is the energy identity Lemma 12(iii) (formally ∂_tE = −2Σ(…)² ≤ 0, so ℋ is convex in t);
  both hold exactly only for the full (divergent) sums, and for a finite window only up to cross terms
  with the zeros outside it. Our "minimum gap … up" is the repulsion term 4/(x_k − x_j) of Lemma 12(i),
  which is not monotone in general (the second term has the opposite sign for neighbours);
  (c) the direction: forward in t the gas relaxes toward an arithmetic progression. Our log's reading
  "monotone, and in the direction that does not help" is the paper's own picture; the paper exploits
  precisely that direction (from t = Λ/2 forward to t = 0) to prove Λ ≥ 0, and has nothing going backward.
  So lane B's first test reproduced, at low height and numerically, the formal monotonicity formulae of
  Rodgers–Tao 2018 (and Csordas–Smith–Varga 1994 for (i), (ii)); they were known.
- **Wall WJ10** (a functional F with F(t) ≤ F(0), F(0) bounded by arithmetic, excluding a double real zero
  for t > 0): not in the paper. The paper's quantities satisfy the opposite inequality (they decrease
  forward in t), and its only arithmetic inputs sit at t = 0 (zero counting, small gaps). What the paper
  quotes that bears on WJ10's wording: for t > Λ the zeros are real **and simple** ([CSV, Cor. 1]).
- **Knowledge §6 table, row "Λ ≥ 0".** "importing ideas from random-matrix dynamics" is accurate: footnote
  in §4, "loosely inspired by the work of Erdős, Schlein, and Yau exploiting the Hamiltonian structure of
  Dyson Brownian motion". To add: the closing contradiction is not dynamical; it is the Conrey–Ghosh–
  Goldston–Gonek–Heath-Brown small-gap theorem (pair-correlation type input).
- **Idea #12 log (judge's two-parameter picture, "Λ(1) = 0 iff RH (given Rodgers–Tao)")**: consistent with
  Theorem 1. The generalised statement for other members would need the "generalized Newman conjecture"
  (Stopple; Dobner), which this paper only mentions.
- **Theory T22 / atlas F14** (read at the end of the session). T22's note says that the zeros of H_t obey
  the ODE "is NOT part of the lemma (it is COMPUTED … and recalled from the literature)". The citation is
  now exact for real simple zeros: Csordas–Smith–Varga 1994, Lemma 2.4, restated here as Theorem 11 for
  Λ < t ≤ 0 with a principal-value sum. This paper contains no statement on the motion of non-real zeros
  and nothing on Y = Σ y_k² (T22's identity is not in it). F14's "supplies" value dz_1/dt = −0.5796306 was
  not compared with the paper's normalisation x = 2γ.
- Ideas #9, #10, #21, theory T1–T6, atlas F1–F3: no change. (Atlas F1 lists "heat-flowed H_t" among
  approximants with real zeros by construction: in this paper's terms, H_t has only real zeros for t ≥ Λ,
  and passing to t = 0 is the statement Λ ≤ 0.)

## 6. Reliability

- Human-written; published in a refereed journal; thanks "anonymous referees". Two acknowledged repairs
  inside the text: the proof of Lemma 7 (the I_t(b,4b) asymptotic) was replaced by one "suggested" by
  A. Dobner after "issues in the original proof"; §8 thanks O. Zeitouni "for pointing out an error in a
  previous version of this argument". An independent second proof of the theorem exists (Dobner, cited).
- Small misprints noticed in the source (e.g. "|t| ≤ Λ" for |t| ≤ |Λ| in the proof of Lemma 6); none
  affects statements.
