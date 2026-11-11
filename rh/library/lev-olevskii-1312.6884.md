BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/README.md`, `rh/library/INDEX.md`).

# N. Lev, A. Olevskii, "Quasicrystals and Poisson's summation formula", arXiv 1312.6884 v2

## 1. Reference and extent of reading
- Nir Lev (Bar-Ilan), Alexander Olevskii (Tel Aviv). arXiv 1312.6884, v1 24 Dec 2013, **v2 31 Dec 2014** ("To appear in
  Inventiones mathematicae"); published Invent. Math. 200 (2015), no. 2, 585–606 (reference as cited by
  Kurasov–Sarnak; journal text not compared). Results announced in C. R. Math. 351 (2013) 613–617 (not read).
- Source: gzipped `measures_long_v13.tex`, saved as `rh/library/src/crystal_1312.6884/x/main.tex` (gitignored).
  **Read whole: 54,177 / 54,177 characters (1,410 lines).**

Setting: μ = Σ_{λ∈Λ} μ(λ)δ_λ on ℝ^n, μ(λ) ≠ 0, Λ uniformly discrete (u.d., d(Λ) > 0) (1.1); μ tempered and
μ̂ = Σ_{s∈S} μ̂(s)δ_s a measure with S u.d. (1.2). Fourier transform with e^{−2πi⟨t,x⟩}.

## 2. What it proves (unconditional)
- **Theorem 1.** μ on ℝ (complex) with (1.1) and (1.2): Λ is contained in a finite union of translates of a lattice;
  the same for S with the dual lattice.
- **Theorem 2.** The same conclusion for **positive** μ on ℝ^n, n > 1.
- **Theorem 3.** If (1.1), (1.2) hold and Λ ⊂ finite union of translates of a lattice L, then
  μ = Σ_{j=1}^N P_j Σ_{λ∈L+θ_j} δ_λ with P_j trigonometric polynomials. Conversely every such μ satisfies (1.1), (1.2).
  So "the measure has a periodic structure": Poisson's formula plus shifts, multiplication by exponentials, linear
  combinations. This proves Lagarias's Problem 4.1(a) (Lagarias 2000, p. 79).
- Auxiliary, each with proof: Lemma 2 (bounded atoms under (1.1)–(1.2)); Lemma 3 (positive μ ≠ 0 ⇒ 0 ∈ spec μ);
  Proposition 4 (on ℝ: u.d. support of a measure with spectral gap (0, a) has D_#(Λ) ≥ c(a, δ); Mitkovski–Poltoratski
  give c = a); Lemma 6 (isolated spectral atom at 0 ⇒ sampling set ⇒ D^−(Λ) ≥ c(a, n), via Landau); Lemma 7 (Ingham
  type); Lemma 8 (Delone with D^+(Λ − Λ) < ∞ ⇒ Meyer set; strengthening Lagarias); Lemma 13 (D_#(Λ_h) > c for all h ⇒
  D^+(Λ − Λ) < ∞); Lemma 15 (Meyer set with D^+(Λ_h) > c for all h ⇒ subset of finitely many lattice translates).

## 3. Method in ten lines
1. For each difference h ∈ Λ − Λ form μ_h = Σ_{λ∈Λ_h} μ(λ) conj(μ(λ + h)) δ_λ on Λ_h = Λ ∩ (Λ − h).
2. Its spectrum lies in closure(S − S), so it avoids B_a \ {0}, a = d(S) (Lemma 12; Fourier side of the
   autocorrelation).
3. Hence each Λ_h has density ≥ c (n = 1 by the spectral-gap Proposition 4; n > 1 by positivity: isolated atom at 0,
   Landau sampling density).
4. Disjointness of Λ_h for nearby h gives D^+(Λ − Λ) < ∞ (Lemma 13); Λ is relatively dense (Lemma 7 applied to μ̂); so Λ is Meyer.
5. Meyer's theorem puts Λ in a model set plus a finite set; if the internal space had dimension m ≥ 1, some Λ_h would
   sit in a thin window and have small density (parallelogram-law Lemma 14), contradicting step 3. So m = 0: lattice.
6. Theorem 3: a Vandermonde inversion over translates separates the cosets; periodic measures with discrete spectrum
   are trigonometric polynomials times a comb. The work is steps 2–3 (density from spectral gaps).

## 4. Where it stops (the authors' Remarks)
- Lagarias's Problem 4.1(b), removing the uniformity requirement on Λ and S, "remains open"; "For signed (not positive)
  measures, one may expect a counter-example due to the results in [Guinand]."
- Whether Theorem 2 holds for non-positive measures in ℝ^n is left open (proved in the C. R. note under S − S u.d.).
- If S is only countable (not discrete) the result fails (model sets).
- Extension to locally compact abelian groups "likely", not attempted.

## 5. What it changes in our record
- **NOTEBOOK N123 / BOOTSTRAP (ii).** The rigidity theorem of this field needs BOTH support and spectrum uniformly
  discrete. ζ's ordinates have mean gap 2π/log(T/2π) → 0, so they are not u.d.; the Fourier side under RH contains log
  prime powers k log p, whose gaps also shrink (log(p+1) − log p → 0), and a non-atomic archimedean part. Neither
  hypothesis holds for ζ; the theorem says nothing about it. Kurasov–Sarnak's examples (`kurasov-sarnak-2004.05678.md`)
  sit exactly in the gap the authors leave open: positive, Λ u.d., S not u.d.
- Zeta in the text: only the bibliography title Kahane–Mandelbrojt, "Sur l'équation fonctionnelle de Riemann et la
  formule sommatoire de Poisson" (Ann. ENS 1958), cited for "the problem of which other discrete summation formulas may
  exist", and Guinand's example with nodes ±(n + 1/9)^{1/2} (not u.d.). Zeros of ζ are not discussed.

## 6. Reliability
- Refereed (Inventiones). Proofs complete; Lemma 1 (temperedness ⇔ polynomially bounded atoms on u.d. support) "can be
  proved using standard arguments". The theorem numbers above are the printed ones (lemmas, propositions and
  corollaries share one counter in this TeX: Lemma 1, Lemma 2, Lemma 3, Proposition 4, …).
