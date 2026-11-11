BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/README.md`, `rh/library/INDEX.md`).

# P. Kurasov, P. Sarnak, "Stable polynomials and crystalline measures", arXiv 2004.05678 v1

## 1. Reference and extent of reading
- Pavel Kurasov, Peter Sarnak. arXiv 2004.05678, **v1 only** (12 Apr 2020; "15 pages, 1 figure"). Published as
  J. Math. Phys. 61 (2020), no. 8, 083501 (reference as cited by Olevskii–Ulanovskii, arXiv 2009.12810; the journal
  text was not compared with the arXiv text).
- Source: the e-print tarball, saved under `rh/library/src/crystal_2004.05678/x/` (gitignored; never compiled or run):
  `KuSa200412.tex` and the figure `TwoTwo.pdf` (not opened).
- **Read whole: 56,409 / 56,409 characters (1,501 lines) of the TeX**, including about 80 lines of an earlier draft
  section ("Positive crystalline measures", a survey of sufficient conditions and open questions) left after
  `\end{document}`; that draft is not part of the compiled paper and is cited below as "post-document draft".
- Numbering (as LaTeX prints it): Theorem 1 (summation formula / Fourier quasicrystal), Lemma 1, Theorem 2 (the
  two-variable example), Theorem 3 (announced general structure, proof deferred to a forthcoming paper). Unnumbered:
  Meyer's theorem, Liardet's theorem.

Notation (the paper's). D = {|z| < 1}. P^ι(z) = P(1/z_1, …, 1/z_n). Reals b_1, …, b_n > 1, **ξ_j = ln b_j > 0**.
**ℓ = (ℓ_1, …, ℓ_n) ∈ ℕ^n is an INTEGER exponent vector** (not the frequencies). F(s) = P(b_1^{−s}, …, b_n^{−s}),
G(s) = Q(b_1^{−s}, …, b_n^{−s}). L_+ = {m·ξ : m ∈ (ℕ∪{0})^n} \ {0}. Fourier convention in the summation formula:
ĥ(γ) = ∫ h(t) e^{iγt} dt. Crystalline measure: μ = Σ_{λ∈Λ} a_λ δ_λ tempered with μ̂ = Σ_{s∈S} b_s δ_s, Λ and S
discrete (Meyer). Fourier quasicrystal (FQ): in addition |μ| and |μ̂| tempered (Lev–Olevskii).

## 2. What it proves
- **Definition (stable pair).** P, Q polynomials with (1) both **D-stable**: P(z) ≠ 0 whenever z_j ∈ D for all j
  (the open unit polydisc), same for Q; (2) there are ℓ ∈ ℕ^n and a constant η with Q(z) = η z_1^{ℓ_1}⋯z_n^{ℓ_n} P^ι(z);
  (3) P(0) = Q(0) = 1. "If such ℓ and η exist they are unique." (For Q to be a polynomial ℓ_j must be at least the
  degree of P in z_j; the paper does not spell this out.) Condition (1) for Q says P has no zero with all |z_j| > 1.
- Two example classes, both quoted from elsewhere:
  - *Spectral pairs* (secular polynomials of quantum graphs): P = R_S = det(I − diag(z^{a_1}, …, z^{a_k}) S), S a
    k × k unitary, monomials z^{a_j}; Q = R_{S^{−1}}, ℓ_ν = Σ_j a_{j,ν} (assumed positive), η = (det(−S))^{−1}
    ("easy to see").
  - *Lee–Yang pairs* (Ruelle, Thermodynamic formalism, Thm 5.12): A_ij = A_ji ∈ [−1, 1],
    P(z) = Σ_{S⊆{1..n}} (Π_{i∈S, j∈S'} A_ij) z^S (multi-affine); self-dual: (z_1⋯z_n) P^ι = P.
- **Zeros on a line (stated in the text, not as a theorem):** "The stability conditions on P and Q ensure that all
  zeroes of F(s) and G(s) are on the imaginary axis Re(s) = 0." Functional equation (eq. F-G):
  F(−s) = η^{−1} (b^ℓ)^s G(s).
- **Summation formula (eq. sum2),** for ĥ ∈ C_0^∞, extended to all of 𝒮(ℝ) in the proof of Theorem 1:
  Σ_{γ: F(iγ)=0} ĥ(γ) = (ξ·ℓ) h(0) − Σ_{k∈ℤ_+^n} (ξ·k) c_P(k) h(ξ·k) − Σ_{k∈ℤ_+^n} (ξ·k) c_Q(k) h(−ξ·k),
  zeros counted with multiplicity, log P(z) = Σ_k c_P(k) z^k (ℤ_+^n = nonnegative integer vectors ≠ 0).
  So μ_P = Σ_{F(iγ)=0} δ_γ has spectrum S ⊂ L_+ ∪ (−L_+) ∪ {0}, and μ̂ has the atom ξ·ℓ at 0.
- **Theorem 1.** "Given any pair P, Q of stable polynomials satisfying assumptions (1) and (2) the measure μ is a
  positive crystalline measure, in fact a Fourier quasi-crystal and is an almost periodic measure." No condition on
  the b_j beyond b_j > 1 (no rational independence). Inside the proof: (i) μ is translation bounded,
  Σ_{x−1≤λ≤x+1} m(λ) ≪ (ξ·ℓ) φ̂_0(0) uniformly in x; (ii) |c_P(k)| ≤ C (from |arg P| ≤ π deg P on D^n and
  ∫_{T^n} |ln|P(re^{iθ})|| dθ ≤ 2 ln sup_{D^n}|P|); hence (iii) |μ̂|([−A, A]) ≤ ξ·ℓ + 2 max ξ_j · C ([A/min ξ_j] + 1)^{n+1},
  polynomial growth ~A^{n+1}; almost periodicity from Favorov (JFAA 2019, Thm 11).
- Remarks: the G-version and the symmetrised formula; self-dual case P = Q; P = 1 − z_1 gives exactly the Poisson
  formula Σ_n ĥ(2πn/ξ_1) = ξ_1 Σ_n h(nξ_1).
- **Section 3 example.** P(z_1, z_2) = 1 − z_1/3 + z_2²/3 − z_1 z_2² (non-linear part of the spectrum of the lasso
  graph), ℓ = (1, 2), η = −1, Q = P; D-stable because P = 0 ⇔ (z_1 − 3)/(1 − 3z_1) = z_2² and that Möbius map sends D
  to the complement of the closed disc. On T²: L(x, y) = 3 sin(x/2 + y) + sin(x/2 − y); zeros are
  3 sin((ξ_1/2 + ξ_2)γ) + sin((ξ_1/2 − ξ_2)γ) = 0, all simple (line and curve normals both in the first quadrant, so
  no tangency). ξ_1/ξ_2 ∈ ℚ: μ is a generalized Dirac comb. **Lemma 1:** ξ_1/ξ_2 ∉ ℚ ⇒ dim_ℚ span{γ_j} = ∞ (via
  Liardet's proof of Lang's conjecture in dimension two).
- **Theorem 2.** For ξ_1/ξ_2 ∉ ℚ and this P: (i) a_λ = 1 (positive "idempotent"); (ii) dim_ℚ Λ = ∞, dim_ℚ S = 2, not
  a generalized Dirac comb; (iii) Λ meets every arithmetic progression in finitely many points (Liardet, or Lech);
  (iv) Λ is Delone, S is not Delone (else Lev–Olevskii 2015 would make μ a Dirac comb); (v) |μ̂| is not translation
  bounded (else Meyer 1970). This answers (A) Meyer's last question (a positive crystalline measure not a generalized
  Dirac comb), (B) Lev–Olevskii 2017 Q11.2 part 3, (C) Meyer 2016 p. 3158 and Lev–Olevskii Q11.2 part 2 (Delone
  support, non-Delone spectrum), (D) Lagarias 2000 Problem 4.4.
- **Theorem 3 (announced; proof in the forthcoming Kurasov–Sarnak "The additive structure of the spectrum of a
  quantum graph", via Evertse, Evertse–Schlickewei–Schmidt, Laurent, Schmidt).** For any μ from a stable pair:
  (i) Λ = L_1 ⊔ … ⊔ L_ν ⊔ N, L_i full arithmetic progressions, N empty or of infinite ℚ-dimension; (ii) a_λ in a finite
  set of positive integers; (iii) dim_ℚ S = dim_ℚ{ξ_1, …, ξ_n}; (iv) every arithmetic progression in ℝ_+ meets N in at
  most c(P) points. Remark: S ∩ (0, ∞) cannot be ℚ-linearly independent (Meyer 2016, Lemma 5).
- Unconditional throughout; nothing conjectural is assumed.

## 3. Method in ten lines
1. Zeros: for Re s > 0 the point b^{−s} lies in D^n, so F ≠ 0; for Re s < 0 the functional equation reduces to G at
   −s, again ≠ 0. Hence every zero of F has Re s = 0; write it iγ, γ real.
2. log F(s) = Σ_k c_P(k) e^{−(ξ·k)s} converges for Re s large (a Dirichlet series with frequencies in L_+).
3. Integrate F'/F against a Mellin transform Ψ̃ on Re s = R, shift to Re s = −R, pick up Σ Ψ̃(ρ) over zeros, and on
   the far line use −F'(−s)/F(−s) = ξ·ℓ + G'(s)/G(s): the constant ξ·ℓ is the h(0) term.
4. Change variables x = e^t: the zeros side becomes Σ ĥ(γ), the Dirichlet side becomes values of h at ±ξ·k.
5. FQ: positivity + an isolated 0 in the spectrum gives translation boundedness; the bound |c_P(k)| ≤ C (Fourier
   coefficients of log P on tori of radius r < 1, Jensen-type ∫ ln|P| = 0) gives polynomial growth of |μ̂|.
6. Additive structure (Section 3): the line γ ↦ (γξ_1, γξ_2) is a Kronecker line on T²; zeros are its intersections
   with the curve {P = 0} ∩ T²; finiteness of torsion-coset intersections (Lang–Liardet) forces infinite ℚ-rank.
The work is in step 1 (stability of a PAIR) and step 6 (Diophantine geometry); step 3 is the explicit-formula
mechanism for a finite Dirichlet series.

## 4. Where it stops
- **n is finite throughout.** Every constant (ξ·ℓ, sup_{D^n}|P|, deg P, the exponent n+1 in |μ̂|([−A,A])) depends on n.
  Infinitely many variables, infinite products, or polynomials in infinitely many z_j are not mentioned.
- The general additive-structure theorem (Theorem 3) is only announced here; the proof is deferred.
- The zeros lie on Re s = 0, the line where |b_j^{−s}| = 1. No archimedean factor, no Gamma factor, no shift to
  another line appears.
- No classification of positive crystalline measures is claimed; the introduction calls any classification
  "probably very difficult" (citing Dyson).
- Post-document draft lists as open (attributed to Lagarias 2000 Problem 4.1(b), Meyer 2016, Lev–Olevskii 2015
  Problem 1 and 2017 Q3): whether positivity plus a uniformly discrete support suffices for a Dirac comb. Theorem 2
  answers it in the negative (Λ Delone, μ positive, not a Dirac comb).

## 5. What it changes in our record
- **NOTEBOOK N123 (Lead).** Correct in substance on three points, imprecise on three:
  - The hypothesis is a **D-stable pair** (P nonvanishing on the open polydisc AND on the reflected exterior, via Q),
    not "Lee–Yang stable" as such; Lee–Yang multi-affine polynomials are one of the two example classes (the other is
    quantum-graph secular determinants). Real stability in the upper-half-plane sense is not used or mentioned.
  - The Fourier support is in {±Σ k_j ξ_j : k_j ≥ 0 integers} ∪ {0} (the semigroup and its negative), not the group
    Σ ℤ ξ_j; the positive vector is ξ_j = ln b_j and the paper's "ℓ" is an integer exponent vector.
  - "With l_j = log p_j this is the prime side": the hypotheses allow b_j = p_j (any reals > 1), but the authors never
    say so; with finitely many primes the zero density is the constant Σ ℓ_j log p_j / 2π (section 7 (c)).
- **board/s2.md B17 (S1-mirror's question).** "Rationally independent λ_j" is not a hypothesis of Theorem 1; it is
  needed only for the measure not to be a Dirac comb. The zeros are real (γ), i.e. F vanishes on Re s = 0. A direct
  check (this reader's, not in the paper): P(z) = Π_{j≤n}(1 − z_j) with ℓ = (1, …, 1), η = (−1)^n is a self-dual D-stable
  pair, F(s) = Π_{p≤x}(1 − p^{−s}), its zeros are the local Euler poles {2πim/log p}, μ = Σ_p Σ_m δ_{2πm/log p}, and the
  KS summation formula is the sum over p of the per-prime Poisson formulas of B18 / NOTEBOOK (S1-mirror per-prime
  Poisson identity). So the per-prime identity of the record is the trivial (product) case of Theorem 1.
- **specialists/operator/BOOTSTRAP.md (ii)** and N123's "positivity alone gives only a positive measure": the
  paper's positive FQs all have bounded density; with Olevskii–Ulanovskii's Proposition 1 (note
  `olevskii-ulanovskii-2009.12810.md`) no positive measure with |μ̂| a tempered measure can have the growing density
  of ζ's zeros. The object BOOTSTRAP describes (Fourier transform = archimedean part plus atoms on log prime powers)
  is not a crystalline measure in the sense of this paper, since the archimedean part is not atomic.
- **NOTEBOOK N88 (torus vs. line).** The paper's Section 3 is exactly "a Kronecker line on a torus meets a
  hypersurface": zeros of F are the intersections of t ↦ (tξ_j) with {P = 0} ∩ T^n. Known in substance; recorded as
  the same picture, finite-dimensional.
- KS's own remark (Introduction) is a fact for the record: Guinand's explicit-formula example "does not give a Fourier
  quasicrystal, even assuming the Riemann hypothesis".

## 6. Reliability
- Refereed (J. Math. Phys. 2020). Short paper; Theorems 1 and 2 have complete proofs here; Theorem 3 is announced
  without proof. The step "stability ⇒ all zeros on Re s = 0" is one sentence but immediate (checked by this reader).
- Typos noticed: in eq. (sum22) "2 n_2 b_2" should be 2n_2 ξ_2; "c(n_1, 2n_2) are given by (sec)" should refer to
  eq. (c_n); in the derivative computation "3cos(x/2 + 1)" should be 3cos(x/2 + y); in the spectral-pair example
  "ℓ = (ℓ_1, …, ℓ_k)" should end at ℓ_n. None affects a statement.
- Figure not opened. Journal version not compared.

## 7. Answers to the question of N123
**(a) The exact theorem.** Theorem 1 with the stable-pair definition (section 2 above): P, Q with P(0) = Q(0) = 1, both
nonvanishing on the open polydisc D^n, and Q = η z^ℓ P(1/z_1, …, 1/z_n) for an integer vector ℓ ∈ ℕ^n (ℓ_j ≥ deg_{z_j} P
implicitly). For ANY reals b_j > 1 (ξ_j = ln b_j > 0; no independence needed), all zeros of F(s) = P(b^{−s}) lie on
Re s = 0, so in the user's notation f(x) = P(e^{−iξ_1 x}, …, e^{−iξ_n x}) has only real zeros (the sign of the
exponent is immaterial up to x ↦ −x and swapping P, Q). Their counting measure (with multiplicity) is a positive
crystalline measure, a Fourier quasicrystal, almost periodic, with μ̂ = (ξ·ℓ)δ_0 − Σ_k (ξ·k)c_P(k)δ_{ξ·k}
− Σ_k (ξ·k)c_Q(k)δ_{−ξ·k}. Degree enters only through ℓ and the constants (|arg P| ≤ π deg P). Rational independence
of the ξ_j makes it non-Dirac (Theorem 2 for one example; Theorem 3, announced, in general). **Infinitely many
variables: not discussed anywhere in the paper**; all bounds are for fixed finite n.

**(b) Zeta, L-functions, log p.** Not discussed. The only sentence touching primes or RH (Introduction): "Various
examples of crystallline measures that are not Dirac combs were constructed by Guinand [Gu59]. Note however that his
example 4 page 264 coming from the explicit formula in the theory of primes does not give a Fourier quasicrystal, even
assuming the Riemann hypothesis." The words zeta, L-function, prime (other than this line) and log p_j do not occur;
F and G are called "finite Dirichlet series" with frequencies b^m, b_j arbitrary reals > 1.

**(c) Density.** The paper proves translation boundedness, not an asymptotic, but the exact mean density follows from
its summation formula: the only term at frequency 0 is (ξ·ℓ) h(0), so with ĥ(γ) = ∫h(t)e^{iγt}dt the number of zeros
γ in [−T, T] is (ξ·ℓ)T/π + o(T), i.e. **density (Σ_j ℓ_j ln b_j)/2π, a constant** (check: P = 1 − z_1 gives zeros
2πn/ξ_1, density ξ_1/2π). Inside the proof of Theorem 1: #{zeros in [x−1, x+1]} ≪ (ξ·ℓ) uniformly in x. For
ξ(1/2 + ix) the zero count is N(T) = (T/2π) log(T/2πe) + O(log T) (Riemann–von Mangoldt; standard, not from this
paper), local density log(T/2π)/2π → ∞. Hence the zero measure of ξ is not translation bounded, so it is not the μ
of any stable pair with finitely many variables, for any choice of b_j (b_j = p_j included). Stronger and with no
stability assumed: by Olevskii–Ulanovskii, Proposition 1, any positive measure whose Fourier transform is a measure
with |μ̂| tempered satisfies μ(a, b) ≤ C(1 + b − a), so (under RH, where Σ δ_γ is a measure on ℝ) the zero measure of ξ is
not any positive Fourier quasicrystal. A Kurasov–Sarnak density ξ·ℓ/2π equal to log(T/2π)/2π at every T would need
Σ ℓ_j ln b_j = ∞, i.e. infinitely many variables, which the paper does not treat.

**(d) Classification (from the other notes).** Olevskii–Ulanovskii 2020 (`olevskii-ulanovskii-2009.12810.md`), Theorem 1:
if μ = Σ_{λ∈Λ} δ_λ is a Fourier quasicrystal, then Λ is the zero set of an exponential polynomial
p(x) = Σ_{k=1}^n b_k e^{iγ_k x} (γ_k real, n finite) with real simple zeros; conversely (their arXiv 2006.12037,
Corollary 2) every exponential polynomial with real simple zeros and uniformly discrete zero set gives a crystalline
Σ δ_λ (an FQ: coefficients bounded, spectrum of polynomial growth). With integer masses (Remark 1): zero sets with
multiplicity of exponential polynomials with real zeros; converse "one may check". Kurasov–Sarnak's F(iγ) is one such
exponential polynomial (frequencies m·ξ). Lev–Olevskii 2015 (`lev-olevskii-1312.6884.md`): if support and spectrum
are BOTH uniformly discrete, μ is a finite sum of trigonometric polynomials times lattice Dirac combs (on ℝ for all
complex measures; in ℝ^n for positive ones). **Zeta zeros in these papers: none of the three discusses them.**
Lev–Olevskii cite Kahane–Mandelbrojt, "Sur l'équation fonctionnelle de Riemann et la formule sommatoire de Poisson",
only as the study of "which other discrete summation formulas may exist", and Guinand's example with nodes
±(n + 1/9)^{1/2}; Olevskii–Ulanovskii never mention zeta. The consequence, derived here and not stated by the
authors: an exponential polynomial with finitely many frequencies has zero density bounded by its frequency span, so
the zeros of ξ(1/2 + ix) are not such a zero set, and the measure Σ δ_γ over ζ's ordinates is not a unit-mass (or
integer-mass) Fourier quasicrystal; its consecutive gaps tend to 0 on average, so its support is not uniformly
discrete and Lev–Olevskii does not apply either.
