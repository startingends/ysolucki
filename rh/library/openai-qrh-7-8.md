# OpenAI, "The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re s > 7/8", 30 September 2026 (the main paper)

Reader: READER-4, 2026-11-11. A digest reports; it does not recommend. Every statement of the paper below is
**CLAIMED** (machine-produced, author field "OpenAI", not peer-reviewed) unless marked CHECKED. This paper was
read only IN PART (§1); statements about unread sections are taken from the paper's own overview and say so.

## 1. Reference and how much was read
- "The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane ℜs > 7/8", author line "OpenAI", dated 30 September 2026;
  PDF subject "A two-stage proof using cubic theta reflection and character moments"; built 6 Oct 2026; 199 pages;
  28 references. Source `https://www.emergentmind.com/openai-math-explorer/papers/5.pdf` (HTTP 200, 1,588,969
  bytes) → `rh/library/src/qrh-main/5.pdf`; text `5raw.txt` by `pdftotext` (16,454 lines, 605,202 characters).
- **Read: 269,743 / 605,202 characters (44.6%)**, by line ranges of `5raw.txt`: 1–3900 (abstract, introduction and
  proof overview, §2, §3, §4 whole, §5 whole, §6.1); 3950–4210 (Lemma 6.2, Prop 6.3, §7.1); 4235–5085 (§7.2 with
  Lemma 7.1, §8 whole, statement of Lemma 9.1); 5530–5660 and 5760–5960 (Prop 9.2 and its optimisation, §10
  opening, §10.1); 6236–6295 (central estimate (10.12)); 6690–7260 (§10.8 end, §11 whole, §12 whole, §13.1);
  9500–9660 (§17.1, §17.2 statements); 12556–12855 (§17.7 with Lemma 17.6, §18 opening with Lemma 18.1);
  14868–15170 and 15300–15430 (§19.1, Prop 19.2 and part of its proof, Remark 19.3, §20 opening); 15606–15665
  (Lemma 20.1 statement); 15820–16454 (§20.4–20.6, references).
- **NOT read**: proof of the sextic sieve (5085–5530); contour moves §10.2–10.8 (5960–6690 except the lines
  above); §13.2–§16 (7260–9500: prime normaliser, finite correlations, marked reflection, compensated low
  estimate, local compensation errors); the proofs in §17.3–17.6 (9660–12556) and §18.1–18.8 (12855–14868);
  the middle of the proof of Prop 19.2; §20.1–20.3 except the statement of Lemma 20.1. No page opened as image.
- Companion texts read for this digest: the 11/12 paper (whole; `openai-qrh-11-12.md`); the exposition by
  J. Gomila (9 Oct 2026, "AI written: triggered and modified by Jude Gomila"; 67,913 characters of page text, read
  whole in cleaned form); the Emergent Mind result page 003 (whole); Quanta, 19 Oct 2026 (whole); the GitHub
  explainer README of Singh-AP (30,131 bytes; only its caveats section and a keyword search); abstracts only of
  Liu (arXiv 2610.26835 v2) and Cureton–Thorner (Hexagon 2610.00200 v2).

## 2. What it claims to prove (paper's numbering)
F = Q(√−3), O = Z[ω]; q_a = norm; χ_c(a) = (a/c)_6 with value 0 on non-units for EVERY exponent (so χ^6 is an
indicator, not 1); γ_j Gauss sums as in the 11/12 paper; μ ideal Möbius function.
- **Theorem 1.1.** "Every finite-order Hecke L-function over F = Q(√−3) has no zero in ℜs > 7/8. The same holds
  for every Dirichlet L-function, including ζ(s). A pole at s = 1 for a principal character is allowed." The
  text adds: "The theorem does not establish the Riemann hypothesis ... The Riemann hypothesis remains open."
- **Corollary 1.2.** n(p) ≤ C (log p)^A for the least quadratic non-residue (A = 32 works, via Bhargava–Ivanyos–
  Mittal–Saxena); deterministic polynomial-time square roots mod p.
- **Definition (2.1).** β* = sup({1/2} ∪ {ℜρ : 1/2 ≤ ℜρ ≤ 1, L_F(ρ, η) = 0 for some primitive finite-order Hecke
  character η}).
- **Proposition 2.1 (Continuation from a common signal).** Fix σ_0 ∈ (1/2, 1), suppose Δ_0 = β* − σ_0 > 0, let
  C(s) = s + c. Suppose 0 < ω < Δ_0 and σ > 0 can be chosen independently of the target, and for every primitive
  η there are a finite set S, H_η holomorphic on ℜs > σ_0 with sup|H_η − 1| ≤ 1/2, and J_η(Z) with
  f_η(Z) := (1/2πi)∫_{ℜs=2} Z^{C(s)} e^{(s−5/6)²} H_η(s)/L^S_F(s, η) ds,
  |J_η(Z)| ≪_η Z^{C(σ_0)+ω} (2.4), |J_η(Z) − f_η(Z)| ≪_η Z^{C(β*)−σ} (2.5). "Then these assumptions contradict
  β* > σ_0." (CHECKED: the proof is a Mellin transform of f_η giving a continuation of 1/L^S to ℜs > β* − ε*,
  ε* = min(Δ_0 − ω, σ), against the definition of the supremum.)
- **Theorem 3.1 (the 11/12 half-plane)** = Part I. Part I: σ_0 = 11/12, C_I(s) = s − 2/3; Part II: σ_0 = 7/8,
  C_II(s) = s − 11/16.
- **Lemma 4.2/4.4** Gauss and reciprocity identities (γ_2(p)³ = −α(p); γ_1γ_2 = μαG, G(c) = χ_c(4)Γ(c));
  **Lemma 4.8** convexity bound |L(σ+it, ψ)| ≪ Q^{3/5}(3+|t|)² on −1/10 ≤ σ ≤ 11/10 from the Hecke functional
  equation; **Lemma 4.9** logarithmic control of L and 1/L on zero-free disks (Borel–Carathéodory, three circles).
- **Proposition 5.1 (Completed cubic reflection)**: the theta transformation of the 11/12 paper's Prop 6.2 with
  all zero-extensions kept; **Lemma 5.5** quadratic large sieve for completed indices; **Lemma 5.8**:
  Σ_{0<q_m ≤ C Z^M, q_{m_pow} ≍ Z^O} |C_V(Z^N; m, ν)|² ≪ Z^{O/2 + max{M−O, 2M−O−N} + ε}; at equal lengths (5.39):
  Σ_{0<q_m ≤ CZ} |C_V(Z; m, ν)|² ≪ Z^{1+ε}.
- **(6.1)** the base probe I_η(X, Y, Z): an average over s (scale Y) and m (scale q_{b*} q_s X) of completed
  theta rows T_{m,s,η}(t) with Gauss-sum weights. **Lemma 6.1** planar additive large sieve (Q + δ^{−2});
  **Proposition 6.3 (balanced low estimate)**: I_η(Z^{1/2}, Z^{1/2}, Z) ≪ Z^{1/4+ε}.
- **Lemma 7.1 (complete local identity)**: after Poisson summation in m the frequencies are H = u a⁶ (u
  sixth-power-free) and F_{η,u}(x, w, z) = ζ^S_F(6z) L^S(w, χ_•(u)) / L^S(x, ηχ_•(u)) · H_{η,u}(x, w, z), with
  H_{η,u} a normally convergent Euler product in two explicit regions.
- **Lemma 8.1** buffered zero-free bins (i, a) for the finite family X_u = {νχ_•(u)^{±1} : ν ∈ Θ = ⟨η, T̂⟩};
  **Lemma 8.2** |M_r|² ≪ U^{δr+ε}, |S_m|² ≪ U^{δ min(m, 1−m)+ε} (δ = 2a − 1); **Proposition 8.3 (two saturated
  witnesses)**: a zero in the bin gives an inverse polynomial M_r (coefficients μψ) and a plain polynomial S_m
  with the same character and height, |M_r|² ≫ U^{δr−ε}, |S_m|² ≫ U^{δm−ε}, m ≤ 1/2 + O(ε), r + m ≥ t.
- **Lemma 9.1 (sextic large sieve)**: Σ_{k sf, q_k ≤ K} |Σ_{n sf, q_n ≤ D} c_n χ_n(k)^{±1}|² ≪ (KD)^ε (K + D +
  (KD)^{2/3}) Σ|c_n|². **Proposition 9.2 (row envelope)**: #B ≪ U^{R(δ)+ε}(1+T_1)^A,
  R(δ) = min{1, max(1 − δ/2, 4/3 − δ)}.
- **Proposition 11.2**: |J_{I,η}(Z) − f_{I,η}(Z)| ≪ Z^{C_I(β*) − 1/4800}. **Proposition 11.3** quadratic transfer
  to Dirichlet L-functions (uses L(1, χ_{−3}) = π/(3√3) > 0).
- Part II. **(12.1)** Δ = β* − 7/8 ∈ (0, 1/24], κ = 2β* − 1 = 3/4 + 2Δ ≤ 5/6. **(12.4)** geometry b = 1/8,
  h = 13/16, ℓ = 1/6, l_x = 17/48, l_y = 23/48. **(12.5)** the modified ("compensated") probe: for K prime slots,
  the marked term η(p) I_{η;p}(X, Y, Zq_p) minus the rescaled term q_p^{−3/2} I_η(X/q_p, Y/q_p, Z).
- **Proposition 15.3** compensated low estimate (|J_{II,η}| ≪ Z^{3/16+ω}); **Proposition 16.1** dynamic local
  errors (unread).
- **Lemma 17.1 (marked inverse moment)**: if r + 2z ≤ m − c_1 and 2r + 8z ≤ 3m − c_2, then
  Σ_{0<q_u ≪ Z^m} |M_u(Z^r; W) Q_u|² ≪ Z^{m+ε} (Q_u a product of prime sums of total log-length z).
  **Lemma 17.2** canonical marked estimate for Gauss coefficients (the recursion). **(17.87)**:
  Σ_{0<q_u ≤ H} |D^{−1/2} Σ_n μ(n)ν(n)χ_n(u)^{±1} W(q_n/D)|² ≪ H(HD)^ε for H ≥ D^{1+c} (this is Proposition 3.1 of
  the 11/12 paper). **Lemma 17.6 (sixth-power amplification)**: over sixth-power-free u with q_u ≍ U,
  Σ_u |M_u(D; W)|² ≪ max{U, U^{1/6} D^{5(1+c)/6}}(UD)^ε; exponent e(r) = max{1, (1+5r)/6} for D = U^r.
- **Lemma 18.1 (fourth moment with short prime factors)**: "Let 3/4 ≤ κ ≤ 1." Σ_{k ∈ R_z} |S_{ψ_k}(n_1)
  S_{ψ_k}(n_2) Q|² ≪ Z^{M+ε} if (1) z = 0, or (2) z > 0 and n_1 + n_2 + 6κz ≤ M, where "If κ < 1, assume in
  addition that β* ≤ (1 + κ)/2." Applied with κ = 2β* − 1, "so its zero-free hypothesis ... holds by equality".
- **Proposition 19.2 (row counts)**: #B ≪ U^{max{R_short(t), L(t)} + Δ/4 + ε}, L(t) = 1 − δ + (α − δ)(t − 1),
  α = 5/6, R_short(t) = 1 − δ + (δP_x/D_x)(3/2 − t). **Lemma 20.2 (endpoint certificate)**: −E* ≥ 49/440640.
  **Proposition 20.3 (order of choices)**: the two estimates of Prop 2.1 hold at σ_0 = 7/8 with ω = Δ/2.

## 3. Method: skeleton with the inputs of each step
Tags as in `openai-qrh-11-12.md`: [EP], [FE], [POLE], [POS], [FAM], [LS], [K].
1. **Extremal set-up.** β* over the whole family; contradiction by continuing 1/L^S(s, η) a fixed distance left
   of β* for every η at once (Prop 2.1). Inputs: [EP] only through "deleting finitely many Euler factors
   neither creates nor removes a zero" and convergence of 1/L^S on ℜs ≥ 2; [FAM] (the supremum is over the
   family; "The entire family is needed even for the consequence about ζ, because the Poisson rows introduce
   finite-order Hecke twists of the target").
2. **The probe** I_η(X, Y, Z) (6.1): smoothed cubic-theta coefficients on completed indices cn³, twisted by
   η, by sextic symbols χ_{cn³}(m), and by Gauss sums in an auxiliary variable s; fixed corrections
   (ξ, b*, G, R) make the Poisson frequencies prime to S and the coefficients factor prime by prime.
   Inputs: [K], [EP] (complete multiplicativity of η on cn³).
3. **Low estimate (first representation).** Reflection (Prop 5.1) + quadratic large sieve gives the row energy
   Z^{1+ε} (Lemma 5.8); the additive factor is bounded by the planar additive large sieve on reduced fractions
   d/s (Lemmas 6.1, 6.2); Cauchy–Schwarz gives Z^{1/4+ε} (Prop 6.3). Inputs: [FE] of the theta function, [LS]
   twice, [POS] (mean squares, non-negative majorant), [K].
4. **High expansion (second representation).** Poisson in m; rows u a⁶; Lemma 7.1 factors each row into
   ζ^S_F(6z)·L^S(w, χ_•(u))/L^S(x, ηχ_•(u)) × Euler product. Inputs: [EP] in full (a prime-by-prime local
   identity; η completely multiplicative; Gauss-sum identities γ_1γ_2 = −αχ(4)γ_3 at each prime), additive
   structure (Poisson over O), [K].
5. **Principal row u = 1.** Residues at w = 1 (pole of ζ^S_F(w)) and z = 1/6 (pole of ζ^S_F(6z)) give
   c_S·f_η(Z) with c_S > 0. Inputs: [POLE] (two poles of ζ_F, i.e. the density of ideals and of sixth powers),
   [POS] (W_0, W_1 ≥ 0 give M(1/6) > 0 and Ŵ_1(1) > 0, so the signal has a non-zero coefficient), [EP]
   (H_η = 1 + O(P_0^{−4/5}) after excluding small primes).
6. **Zero detector for the other rows.** Bins from zero-free buffered rectangles (Lemma 8.1); bounds for L and
   1/L there (Lemma 4.9) and on the reflected line by the functional equation; truncated-inverse detector
   (Prop 8.3) producing the two witnesses. Inputs: [FE] of the Hecke L-functions (Lemma 4.8; reflected line
   in Lemmas 8.1, 8.2), [EP] (Σ_{l|n} μ(l) = 0 with ψ completely multiplicative), the bound a ≤ β* from the
   definition of the supremum, [FAM].
7. **Row count, Part I.** Sextic large sieve on the squarefree part of the row, powerful part counted
   (Prop 9.2); only the inverse witness is used. Inputs: [LS] (with the (KD)^{2/3} term), [POS].
8. **Conclusion of Part I.** Central exponent E_I(d) and margins (smallest 1/1200); Lemma 11.1 chooses the
   height T_1 = Z^τ after the target. Gives β* ≤ 11/12.
9. **Part II, modified probe.** Prime compensation (12.5) and asymmetric scales; low estimate Z^{3/16+ω}
   (Prop 15.3; proof unread; overview: "again follows directly from reflected energy and an additive
   mean-square estimate").
10. **Two moment estimates.** Lemma 17.1 for inverse polynomials times prime sums (recursion: "two finite
    Poisson transformations to shorten the row range, with reflected energy providing the terminal bound";
    this is the mechanism of the 11/12 paper's Propositions 5.1–5.4); Lemma 17.6 amplification on sixth-power-
    free rows; Lemma 18.1 for products of two plain polynomials ("Ordinary Hecke reflection reduces the length
    ranges at each stage; the recursive step uses two finite Poisson transformations"; a centred difference of
    two products with equal product of scales so that "the common main terms cancel"). Inputs: [EP] (μ, Gauss
    identities), [FE] of theta and of Hecke L-functions, [LS], [POS], [FAM], and in 18.1 the hypothesis
    β* ≤ (1 + κ)/2, i.e. a zero-free region fed back into a moment bound.
11. **Row counts and the endpoint.** Prime amplitudes binned (§19.1), prime slots selected, counts from both
    witnesses balanced at a length t (Prop 19.2), explicit certificate (Lemma 20.2), order of choices
    (Prop 20.3). Gives β* ≤ 7/8.
12. **Transfer** to Dirichlet L-functions (Prop 11.3): [EP] (base change), [POLE] at s = 1 only.

## 4. What is assumed / imported
Dunn–Radziwiłł 2024 §5 and Appendix A (cusp expansions of the cubic theta function; "their GRH-conditional prime
asymptotic is not an input"); Patterson 1977; Goldmakher–Louvel 2013; Blomer–Goldmakher–Louvel 2014 (recursion
for the sextic sieve, re-proved as Lemma 9.1); Heath-Brown 1995, 2000; Gao–Zhao (functional equation
normalisation); Thorner–Zaman 2019 (prime counting in a ray class; Chebotarev); Huxley 1968 / Baier–Bansal 2018
(additive large sieve, re-proved). An independent OpenAI manuscript on a first moment of cubic Gauss sums [23]
"is also not used here". No unproved hypothesis is stated.

## 5. Where the exponents come from; the frontier
- 11/12 in Part I: the signal is Z^{C_I(s)} with C_I(s) = s − 2/3, where 2/3 = 5/6 − (1/2)(1/3) comes from the
  factor X^{1/2−z} Z^{s+z−1} at the pole z = 1/6 of ζ_F(6z) with X = Z^{1/2}; the direct bound is Z^{1/4};
  11/12 = 2/3 + 1/4. INFERENCE (reader): the 1/6 is again the density of sixth powers among the Poisson
  frequencies, as in the 11/12 paper's count of rows p⁶.
- 7/8 in Part II: C_II(s) = s − 11/16 and the low bound Z^{3/16}; 7/8 = 11/16 + 3/16. The final margins are
  m_lo = Δ and m_hi = (51/64)Δ with Δ = β* − 7/8: both vanish as β* → 7/8. The text says of (20.10): "The
  subtraction of Δ = C(β*) − C(7/8) is essential: the certificate is not a claim that E_actual(h) < 0 for every Δ."
- Last thing proved: β* ≤ 7/8 (open half-plane; "no claim on its boundary"). First thing not done: any
  exponent below 7/8. **The paper states no barrier, no obstruction and no open question.** Facts of the text
  that bear on it: Lemma 18.1 is stated only for 3/4 ≤ κ ≤ 1 with the hypothesis β* ≤ (1 + κ)/2 (κ = 3/4
  corresponds to β* = 7/8); the amplification slope α = 5/6 is fixed; the row bins satisfy δ ≤ κ ≤ α.

## 6. What it explicitly does not do
RH or GRH ("remains open"); the boundary line ℜs = 7/8; zero-density statements; Hecke characters of infinite
order; other fields; explicit constants.

## 7. Controls (the reader's analysis; not in the paper)
- **Davenport–Heilbronn.** Fails at step 4 (Lemma 7.1 is a prime-by-prime identity for a completely
  multiplicative η; a linear combination has no such factorisation and its row quotient is not 1/L of anything),
  and at step 6 (the truncated inverse Σ μ(l)ψ(l) l^{−s} approximates 1/L only for an Euler product). The
  functional equation, which the impostor has, is used (steps 6, 10) but only together with those.
- **ζ(s−d)ζ(s+d).** Each factor is a shift of ζ; the family and β* are defined for unitary characters; applied to
  a shifted factor the statement shifts with it. The centre enters through |η| = 1 in every mean square.
- **Beurling systems.** No lattice O, no residue symbols, no Poisson summation, no theta function: steps 2–4
  have no meaning.

## 8. Quadratic forms, positivity, "relative" inequalities
- Mean squares bounded above by large sieves (quadratic, sextic, planar additive); Cauchy–Schwarz between two
  mean squares (step 3); an "additive Gram bound" (Prop 15.2, unread).
- Positivity that carries the signal: W_0, W_1 ≥ 0 ⇒ M(1/6) > 0, c_S > 0 (the principal term cannot vanish).
- Lemma 20.2 is an explicit positivity certificate for an EXPONENT: an identity (20.9) writing
  10368·v·J·(−E*) as a sum of manifestly non-negative terms (a completed square plus 49, etc.), giving
  −E* ≥ 49/440640. CHECKED only as a statement (the polynomial identity was not re-expanded).
- Row counts are of the form "number of rows with a large polynomial ≤ moment / (lower bound)^2", i.e.
  Chebyshev from an upper bound on a mean square against a pointwise LOWER bound supplied by a hypothetical
  zero. No positive-definite kernel, no Weil form, no explicit formula.

## 9. Design choices of the proof (from the published text only; requested by the owner)
For each: (1) needed; (2) chosen; (3) what the text says it buys; (4) alternatives the text mentions; (5) the
classical idea named, with citation. "Text silent" = no reason or alternative given. The papers never say how a
choice was found. INFERENCE marks the reader's own remarks.
1. **An extremal argument on the supremum of real parts, over the whole family.** (1) Uniform exclusion of zeros.
   (2) β* of (2.1) and Proposition 2.1: "If β* exceeds a proposed boundary σ_0, the task is to continue every
   target reciprocal across a common positive distance to the left of β*." (3) "The high estimate in
   Proposition 2.1 is measured relative to C(β*), not to C(σ_0). This distinction matters when a row
   contribution reaches the low scale but still has a power saving relative to the hypothetical rightmost
   zero." It also gives every twisted L-function zero-free bounds to the right of β* for free (Lemma 4.9: "for
   every fixed b ≥ β* ... these bounds hold on ℜs ≥ b + v"). (4) None. (5) Text silent on a source.
   (The 11/12 companion does not use this device; it bounds a Möbius sum directly.)
2. **One sum, two exact representations.** (1) A quantity J_η that is both small and close to the signal.
   (2) "each [stage] comparing two representations of a completed cubic-theta sum": reflection of the theta
   coefficients, and Poisson summation in the averaging variable. (3) Reflection gives the direct (low) bound;
   Poisson gives 1/L(s, η) in the row u = 1. "The contribution developed here is the construction of these
   compatible reflected and Poisson comparisons, including the principal residues, with positive exponent
   margins chosen independently of the target character." (4) None. (5) Text silent.
3. **Field Q(√−3), sextic symbols, cubic theta.** (2) "Kubota's metaplectic theory and Patterson's cubic theta
   series provide the automorphic setting [20, 24]"; cusp expansions from Dunn–Radziwiłł [8, §5, App. A].
   (3) Sextic symbols exist because "F contains all sixth roots of unity" (Lemma 4.1). (4) The text notes it
   does NOT use [8, Lemma 5.2, Cor 5.1] "whose unit-Fourier-support hypothesis need not hold for these masks".
   (5) Kummer theory / Artin reciprocity [22]; David–de Faveri–Dunn–Stucky [6] for a related combination
   ("Patterson's coefficients, the cubic large sieve, and mollified moments").
4. **Completion with cubes kept, zero-extensions kept.** (2) "completion means retaining the full cubic factor
   n³, rather than restricting the index to its squarefree part"; every character power is zero on non-units.
   (3) The reflection formula applies and the Poisson side factors prime by prime. (4)/(5) Text silent.
5. **Low side by Cauchy–Schwarz of two large sieves, balanced scales.** (2) X = Y = Z^{1/2}; quadratic large
   sieve for the reflected rows ("The reason for the quadratic sieve is already visible for squarefree rows":
   the reflected column factor is χ_R(nb)³), planar additive large sieve for the Gauss-sum factor. (3) Row
   energy Z^{1+ε}; I_η ≪ Z^{1/4+ε}. "This direct estimate does not use the later inverse-moment recursion."
   (5) Goldmakher–Louvel [13]; "The planar additive large sieve ... is classical; compare Huxley [19] and the
   Poisson proof in [1, §3, Thm 3]".
6. **High side organised by sixth-power-free rows and Hecke L-quotients.** (2) Frequencies ua⁶; Lemma 7.1.
   (3) "For u = 1, this quotient contains the reciprocal of the target function"; the other rows are twists of
   the target, which is why the family is needed. (4)/(5) Text silent.
7. **A zero detector with one buffered rectangle per row and two "saturated witnesses".** (1) To bound rows
   whose L-quotient may be large. (2) Bins (i, a); a zero in the bin gives an inverse polynomial (Möbius
   coefficients) and a plain polynomial with common character and height. (3) Rows are counted by moments of
   the witnesses; "Part I uses only the inverse polynomial in its row count". (4) None. (5) "the classical
   truncated-inverse mechanism; compare [21, Appendix C]" (Maynard–Pratt) "and [14, Section 13.1]"
   (Guth–Maynard); "for a higher-order-character density application [4, Corollary 1.6 and Section 5]".
8. **Part I row count by the sextic large sieve, squarefree part only.** (2) Lemma 9.1 with the term (KD)^{2/3};
   powerful part of the row fixed and counted. (3) R(δ) = min{1, max(1 − δ/2, 4/3 − δ)}; with step 5,
   β* ≤ 11/12 with saving 1/4800. (5) "the norm-recursion method of Blomer, Goldmakher, and Louvel [4, §3]";
   "Heath-Brown's cubic estimate [17, Thm 2]"; "An Eisenstein-integer form is also recorded by Gao and Zhao
   [12, Lemma 2.9]"; the squarefree/powerful split "is also used in the proof of Corollary 1.4 of [4]".
9. **Two stages: bootstrap from 11/12.** (2) "Part II starts from that conclusion and introduces prime
   compensation, asymmetric scales, and two additional moment estimates"; κ = 2β* − 1 is kept as a variable:
   "We retain this dynamic value rather than replace it by the value 5/6 supplied by the 11/12 bound, since the
   refined row count uses the resulting affine capacity." (3) δ ≤ κ ≤ 5/6 for every bin; the hypothesis of
   Lemma 18.1 "holds by equality". (4)/(5) Text silent.
10. **Prime compensation and asymmetric scales.** (2) The two-term modification (12.5) at primes in K slots of
    total length ℓ = 1/6; X = Z^{17/48}, Y = Z^{23/48}. (3) "The subtraction is designed to cancel the scalar
    prime contribution on the high side, leaving the sextic-character prime factor used by the moment
    estimates"; signal exponent C_II(s) = s − 11/16, low bound Z^{3/16}. (4)/(5) Text silent.
11. **Second moment of inverse polynomials with prime factors, by a two-Poisson recursion.** (2) Lemmas 17.1,
    17.2. (3) Σ_u |M_u Q_u|² ≪ Z^{m+ε} under r + 2z ≤ m − c_1, 2r + 8z ≤ 3m − c_2. (5) "For the recursive
    Poisson large-sieve framework, compare [16, Section 2], [17, Section 4], and [13, Sections 4–7]"
    (Heath-Brown; Goldmakher–Louvel).
12. **Sixth-power amplification.** (2) Lemma 17.6: M_u(D) = Σ_{d | rad a} μ(d)ψ_u(d)q_d^{−1/2} M_{ua⁶}(D/q_d), with
    (u, a) ↦ ua⁶ injective, averaged over ≫ P ideals a, P = (H/U)^{1/6}. (3) Σ_u |M_u(D)|² ≪ H/P = U^{1/6}H^{5/6};
    exponent (1 + 5r)/6; "α is the fixed slope from sixth-power amplification". (4) None. (5) The paper's own
    word is "amplification"; no citation.
13. **Fourth moment of plain polynomials with a centred difference.** (2) Lemma 18.1. (3) "For a difference of
    two products with the same two profiles and equal products of scales, the common main terms cancel"; the
    threshold A ≤ 5M/6 "comes from the transformed rows whose inducing characters lie in Θ". (4) "Direct
    volume bounds handle uncentered products." (5) "related to the framework of Heath-Brown's quadratic method
    [16, Section 2]".
14. **Explicit certificate and a late choice of height.** (2) Lemma 20.2 (identity (20.9)); Lemma 11.1 and
    Proposition 20.3: all real margins fixed before the target η; the analysis height T_1 = Z^{τ_η} and the tail
    order chosen after it. (3) "Only the positive power margins must be uniform in the target."

**What the text says about the limit of the method.**
- In the two papers: nothing. Neither states a barrier (3/4 or other), an obstruction to 1/2, or an open
  problem. The 7/8 paper's only sentences on scope are "The theorem does not establish the Riemann hypothesis
  or its generalized versions ... The Riemann hypothesis remains open [5]" and "no claim on its boundary".
- In commentary only: (i) a post of 6 Oct 2026 by the account "@AcerFur" ("Cambridge mathematics student,
  formerly OpenAI"), reproduced on the Emergent Mind result page: "(FWIW the method has a barrier at 3/4, so it
  needs a nice new idea)"; no argument is given there. (ii) Quanta, 19 Oct 2026: W. Sawin: "It seems most likely
  to me that once mathematicians have fully internalized the new methods ... we will still feel as far off from
  the full Riemann hypothesis as we were before ... But I am not certain of this"; T. Bloom: the full RH "still
  seems out of reach". (iii) B. Liu's arXiv abstract (2610.26835 v2, 29 Oct 2026; abstract only read): varying
  "the length and moment parameters in the cubic-theta argument" gives ℜs > 0.874957019…, claimed optimal "in
  the specified exponent comparison system"; with an averaged numerator estimate of Xu–Sang, 0.874886647…,
  "the exact infimum of the refined comparison system"; extended to all number fields by descent from K(ζ_12).
  (iv) Cureton–Thorner (Hexagon 2610.00200 v2; abstract only): ζ_K(s) ≠ 0 for ℜs > 31/32 for every number field
  K, "proved and formalized in Lean using AxiomProver", following an OpenAI primitive-root preprint.
- The exposition (Gomila) gives no limit of the method; it names step 4 of the 11/12 paper "the sixth-power
  amplifier" (the 11/12 paper itself does not use the word).

## 10. Facts in our record that this paper bears on (facts only)
- `docs/KNOWLEDGE.md` §2: the listed zero-free region (Vinogradov–Korobov) and "RH is N(σ,T) = 0 for σ > 1/2":
  the paper CLAIMS N(σ, T) = 0 for σ > 7/8 for ζ and every Dirichlet L-function.
- `rh/NOTEBOOK.md` N35 (iii) sup_L ε*(L) = Θ − ½: the claim is Θ ≤ 7/8, i.e. sup_L ε*(L) ≤ 3/8 (N35 (ii) had ½).
  The proof does not use the window form or the explicit formula.
- `rh/BRIDGE.md`, last paragraph of "Bridge 1: where it ends" ("the next hunch must use the functional equation
  AND one of [0 ≤ Λ ≤ log; support on prime powers; complete multiplicativity]"): this paper uses the Hecke
  functional equation (Lemmas 4.8, 8.1, 8.2, 18.1) together with complete multiplicativity (Lemma 7.1; the
  truncated inverse), and in addition a second functional equation (theta automorphy) and a family of twists.
  It does not use Λ or its positivity except to bound prime sums through L′/L (Lemma 19.1). The 11/12
  companion does not use the functional equation of the L-function at all.
- B1/B2: Euler product located in steps 4 and 6 (§7 above). B4 (Voronin; "the argument must be global or
  arithmetic"): the argument is a family average with arithmetic input. B10: additive structure = Poisson over
  O and two automorphic reflections; multiplicative = μ, Euler factors. B11: unitarity |η| = 1.
- B6 / KNOWLEDGE E2 (Mertens-type equivalence): the 11/12 companion is a bound for smoothed Möbius sums; this
  paper instead continues 1/L past a hypothetical extremal zero.
- `docs/IDEAS.md` #27, N41: no statement of the paper has the shape "Weil form ≥ constant × positive form";
  its only "≥ constant" statement is Lemma 20.2, about an exponent.

## 11. Open questions stated by the paper
None.

## 12. Verification status according to named sources (second-hand)
- OpenAI's Lean scope note (as reproduced on the Emergent Mind page, "from lean/docs/003.md"): "The
  formalization gives θ = 7/8 for the Riemann zeta function and every Dirichlet L-function ... It also
  establishes the same bound for finite-order Hecke L-functions over Q(√−3)"; "The paper's later applications
  are not included"; comparator statements QuasiRiemannHypothesis.lean, DirichletSevenEighths.lean,
  HeckeSevenEighths.lean. This reader did not obtain or run the Lean files. The GitHub explainer says the same
  and "did not independently re-run the Lean build".
- Quanta Magazine, K. Kakaes, 19 Oct 2026: the 7/8 paper "was formally verified using the Lean programming
  language"; the 11/12 paper "is not yet formally verified" and "is the only one of the 722 OpenAI papers ... to
  have been edited by a person". M. Radziwiłł: both papers "are horribly written"; "The reason why people look
  mostly at the 11/12 result is that it's shorter"; he "can now sketch the proof's arguments in half a page";
  write-ups of 7 to 13 pages "have not yet been published, but are circulating privately". "These experts
  largely agree that the result is correct". P. Sarnak "won't be satisfied that it's 'a Theorem' until humans
  check and understand all the details". A. Dunn: "a surprising synthesis of well-known ideas"; a formula of
  Dunn–Radziwiłł (2021) "became a crucial ingredient". J. D. Lichtman: "the most significant AI-for-math
  achievement so far". Nothing in the article says any human has checked the 199-page 7/8 paper line by line.
- This reader: see §1 for what was read; only Proposition 2.1 was re-derived. The reader's numerical check of
  the Gauss identity (see `openai-qrh-11-12.md` §9) applies here too: Lemma 4.2 prints γ_1γ_2 = H(4)γ_3γ_2³,
  which the reader finds false by a complex conjugation of H(4) (the exposition prints the conjugated form
  G(n) = conj(χ_n(4))γ_3(n)). In this paper G enters an exact coefficientwise cancellation (§7.2: "G(c)R(c,n)G(n³)
  = G(cn³), which is cancelled by the inserted" conjugate factor), so the conjugation would have to be carried
  consistently through the definition of G and of the probe; the reader did not trace this.

## 13. Reliability
Machine-produced, unrefereed; a Lean formalization is asserted by the publisher and reported by the press, not
checked here. Less than half was read. The proofs of the two moment lemmas (about 110 pages) were not read.
