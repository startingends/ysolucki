# OpenAI, "The Quasi-Riemann Hypothesis" (the short route, Re s > 11/12), 5 October 2026

Reader: READER-4, 2026-11-11. A digest reports; it does not recommend. Every statement of the paper below is
**CLAIMED** (unrefereed, machine-produced, author field "OpenAI") unless marked CHECKED (re-derived by the reader)
or COMPUTED (reader's own numerics, command given).

## 1. Reference and how much was read
- "The Quasi-Riemann Hypothesis", author line "OpenAI", dated October 5, 2026; PDF metadata: subject "A cubic theta
  argument with a fixed ray class character", built 6 Oct 2026 04:39 UTC, 49 pages.
  Source: `https://www.emergentmind.com/openai-math-explorer/papers/6.pdf` (HTTP 200, 784,503 bytes), saved as
  `rh/library/src/qrh-short/6.pdf`; text by `pdftotext -layout` → `6.txt`.
- **Read whole: 190,998 / 190,998 characters (3,074 / 3,074 lines) of `6.txt`**: sections 1–7, appendices A and B, the
  51 references. Displays are garbled in places by the text layer; no page was opened as an image.
- It cites the 7/8 paper as its reference [36] ("OpenAI Math Release preprint
  OAI:The-Quasi-Riemann-Hypothesis-September-30-2026") and calls itself "a natural intermediate step" toward it,
  "isolated for simplicity".

## 2. What it claims to prove (exact statements, paper's numbering)
Notation: K = Q(√−3), O = Z[ω], ω = e^(2πi/3), λ = 1 + 2ω; "primary" = ≡ 1 mod 3; N = norm; μ = ideal Möbius function;
χ_n(u) = (u/n)_6 the sextic residue symbol (zero if (u, n) ≠ 1), for n primary, prime to 6; e(z) = exp(4πi Im z/√3);
γ_j(n) = N(n)^(−1/2) Σ_{x mod n} χ_n(x)^j e(x/n) (normalised Gauss sums of the j-th power of the sextic symbol);
α(n) = n/|n|; ν a fixed finite-order Hecke character of K; S a finite set of primes containing those above 2, 3 and
the conductor of ν; A ≼ B means A ≪_ε D^ε B.

- **Theorem 1.1.** "Every finite-order Hecke L-function over K has no zeros in the half-plane Re s > 11/12. Thus
  every Dirichlet L-function, including ζ(s), has no zeros for Re s > 11/12." (Unconditional as claimed; uniform in
  conductor and height. In particular: no Landau–Siegel zeros.)
- **Corollary 1.2.** sup over 1 ≤ q ≤ x, (a, q) = 1 of |π(x; q, a) − (1/φ(q)) ∫_2^x dt/log t| ≪ x^(11/12) log x,
  absolute effective constant. Further consequences listed without proof detail: least quadratic non-residue
  ≪ (log p)^C (Vinogradov's conjecture), deterministic polynomial-time square roots mod p and Miller's test,
  h(D) ≫ √|D| / log log |D| effectively, completeness of Euler's list of 65 idoneal numbers.
- **Proposition 3.1 (the key estimate).** With A_u(D) = Σ_{(n,S)=1} μ(n) ν(n) χ_n(u) W(N(n)/D): for every fixed
  0 < ϑ ≤ 1/10 and ε > 0 there is k = k(ϑ, ε) with, for all smooth W supported in a compact I ⊂ (0, ∞), D ≥ 2,
  Σ_{0 < N(u) ≤ D^(1+ϑ)} |A_u(D)|² ≪_{ν,S,I,ϑ,ε} max_{j ≤ k} ‖W^(j)‖²_∞ · D^(2+ϑ+ε).   (3.1)
- **Lemma 4.1 (arithmetic identities).** On a fixed ray class group there are a unit-modulus function G and a
  symmetric ±1 bicharacter R with: χ_b(a) = R(a,b) χ_a(b); G(ab) = G(a)G(b)R(a,b); γ_2(n)³ = μ(n) α(n);
  γ_1(n) γ_2(n) = μ(n) α(n) G(n); G(n) = χ_n(4) γ_3(n); γ_1(n) γ_(−1)(n) = χ_n(−1); hence
  α(n) γ_2(n) γ_1(n) = μ(n) G(n) (4.4), μ(n) γ_(−1)(n) = χ_n(−1) G(n)^(−1) α(n) γ_2(n) (4.5), and for
  a_ξ(n) := α(n) γ_2(n) ξ(n): a_ξ(ab) = a_ξ(a) a_ξ(b) χ_b(a)⁴ (4.6) (a, b coprime squarefree).
- **Lemma 4.2.** Poisson summation over the lattice O for Σ_k χ(k) 1_{(k,r)=1} Φ(N(k)/H), χ primitive mod m.
- **Definition 4.3 (dual mean square).** E(𝓗, X, F; ξ, W) = (1/XF) Σ*_{F ≤ N(f) < 2F} Σ_{0 < N(k) ≤ 𝓗}
  |Σ*_n a_ξ(n) χ_n(k) χ_n(f)⁴ W(N(n)/X)|² (stars: squarefree, primary, prime to S). **Lemma 4.4**: removal of an
  extra coprimality condition at the cost of (X, F) → (X/N(d), F N(d)).
- **Proposition 4.5.** If E(𝓗, X, F; ξ, W) ≪ ‖W‖²_{C^J} D^ε XF in the ranges X = D/(BF), 0 < 𝓗 ≤ C D²/(H B²),
  XF = D/B (H = D^(1+ϑ)), then Proposition 3.1 holds.
- **Proposition 5.1.** For fixed κ > 0, C_0 ≥ 1: if 𝓗, X, F ≥ 1, Σ := XF ≤ D^(C_0), 𝓗 ≤ Σ D^(−κ), then
  E(𝓗, X, F; ξ, W) ≪ ‖W‖²_{C^J(I)} D^ε Σ.
- **Proposition 5.2 (completed mean square).** For T(X; k, f) = Σ*_n Σ_b α(n)γ_2(n)Ψ_k(n) α(b)³Ψ_k(b)³
  N(n)^(−1/2) N(b)^(−1) V_*(N(n)N(b)³/X), Ψ_k(n) = ξ(n)χ_n(k)χ_n(f)⁴, V_*(y) = √y W(y):
  Σ_{0 < N(k) ≪ 𝓗} |T(X; k, f)|² ≪ D^ε ‖W‖²_{C^J} (𝓗 + 𝓗² N(f)/X), for 1 ≤ 𝓗, X, N(f) ≤ D^(C_0).
- **Lemma 5.3 (cube inversion).** With H_c³ = min(X, X²/𝓗²), L_b = X/N(b)³, and 𝓗 ≤ Σ:
  E(𝓗, X, F) ≪ D^ε (Σ ‖W‖² + sup over b with N(b) > H_c, L_b > 1 of E(𝓗, L_b, F)).
- **Proposition 5.4 (transfer).** For A(W) ≥ E(𝓗, L, F; ξ, W) (the same with a smooth majorant Φ in the row), if
  max{𝓗, LF} ≤ Σ: A(W) ≪ D^ε Σ ‖W‖² (1 + sup E(𝓗′, X′, F′; ξ′, U)/Σ′) over parameters with
  𝓗′ ≤ 𝓗L/(ΣF), 𝓗′/Σ′ ≤ 𝓗/Σ, Σ′ = X′F′ ≤ L.
- **Proposition 6.2 (theta transformation with twists)**, **Lemma 6.3** (uniformity in the ray class of the row),
  **Lemma 6.4** (cusp-coefficient bound |d(uλ^m n b³)| ≤ 27·3^(m/6)|b| and decay of the transformed weight),
  **Lemma 6.5** (quadratic large sieve over K, quoted from Goldmakher–Louvel 2013 Thm 1.1:
  Σ*_{N(k) ≤ H} |Σ_{N(n) ≍ U, n squarefree} β(n) χ_k(n)³|² ≪ (HU)^ε (H + U) Σ|β|²), **Lemma 6.6** (squarefree rows).
  In 6.2 the local factor attached to a prime p of the row with exponent j is B_{p,j}(x) = χ_p(x)^(−j−2) for
  j ≠ 0, 4; "the key case is the quadratic character B_{p,1}(x) = χ_p(x)³".
- **Lemmas 7.1–7.3** (the two Poisson summations of the transfer), **B.1–B.3** (separation of smooth weights).

## 3. The method: skeleton as a chain, with the inputs each step uses
Inputs are tagged: [EP] Euler product / multiplicativity (form stated); [FE] functional equation or Gamma factor;
[POLE] pole at s = 1; [POS] positivity; [FAM] averaging over a family; [LS] large sieve / density;
[K] special to Q(√−3).

1. **Möbius sums ⇒ no zeros (§3).** For Re s > 1, ∫_0^∞ A_1(D) D^(−s) dD/D = Ŵ(s) Σ μ(n)ν(n)N(n)^(−s) = Ŵ(s)/L^S_K(s, ν).
   If A_1(D) ≪ D^(11/12+ε) the left side is holomorphic in Re s > 11/12; with W(y) = y^(−ρ)φ(y), φ ≥ 0, a zero ρ
   would give 0 = Ŵ(ρ) = ∫φ dy/y > 0.
   Inputs: [EP] in the form 1/L(s, ν) = Σ μ(n)ν(n)N(n)^(−s), i.e. COMPLETE MULTIPLICATIVITY of ν (degree-one
   Euler product over K); Hecke's meromorphic continuation only to apply the identity theorem; no [FE], no [POLE],
   no zero-density input. CHECKED by the reader (Mellin identity and the contradiction).
2. **Passage to Dirichlet L-functions (§3 end).** L_K(s, χ∘N) = L(s, χ) L(s, χχ_(−3)) up to harmless Euler
   factors; at s = 1 uses L(1, χ_(−3)) > 0. Inputs: [EP] (base change factorisation), [POLE] only to exclude a
   pole–zero cancellation at s = 1. Standard; CHECKED as a statement.
3. **Embedding in a family (§2.2, §3).** A_u(D) = Σ μ(n)ν(n)(u/n)_6 W(N(n)/D), rows u ∈ O. For a primary prime p,
   (p⁶/n)_6 = 1_{p∤n}, so A_{p⁶}(D) = A_1(D) + O(D/Y) when N(p) ≍ Y. Inputs: [FAM] (sextic twists), [K] (sextic
   residue symbols need the sixth roots of unity in the field; class number one; primary generators).
4. **From the mean square to A_1 (§3, eq. (3.2)).** There are ≍ Y/log Y primes p with N(p) ≍ Y := H^(1/6), their
   sixth powers are distinct rows of norm ≤ H = D^(1+ϑ). Dropping all other rows,
   |A_1(D)|² ≤ (2/J) Σ_p |A_{p⁶}(D)|² + O(D²/Y²) ≪ D^(2+ϑ+ε)/Y + D²/Y² = D^(11/6+5ϑ/6+ε) + D^(5/3−ϑ/3).
   Inputs: [POS] (a sum of squares bounds any sub-sum), Landau's prime ideal theorem (only to count primes; any
   count of sixth powers ≍ H^(1/6) would do). CHECKED (exponents re-derived).
5. **First Poisson summation, in the row u (§4, Prop 4.5).** Expand the square, extract g = (n_1, n_2), apply
   Poisson over the lattice O to Σ_u χ_{z1}(u) χ̄_{z2}(u) Φ(N(u)/H). The zero frequency (only z_1 = z_2 = 1) gives the
   diagonal ≪ H‖W‖². The non-zero frequencies carry the sextic Gauss sum γ(χ_{z1} χ̄_{z2}), and Lemma 4.1 turns
   μ(z)·(sextic Gauss sum) into the cubic Gauss coefficient: μ(z_1)μ(z_2)ν(z_1)ν̄(z_2)γ(χ_{z1}χ̄_{z2}) =
   Σ_ξ c_ξ a_ξ(z_1) ā_ξ(z_2). The dual row range is 𝓗 ≍ D²/(H B²) ≤ D^(1−ϑ). Result: Prop 3.1 ⇐ E(𝓗, X, F) ≼ XF.
   Inputs: [EP] in the form "μ(n) on squarefree n is a product of local Gauss-sum factors": γ_2(p)³ = −α(p)
   (the −1 at each prime IS μ), plus twisted multiplicativity of Gauss sums and sextic reciprocity; the additive
   structure of O (Poisson); [K]; [POS] (non-negative Schwartz majorant Φ ≥ 1 on [0,1] with compactly supported
   transform). ν enters only as a ray class character absorbed into finitely many ξ. No [FE] of L(s, ν).
6. **Cubic Gauss sums are theta coefficients (§2.4, §6.1).** Patterson's formula: the Fourier coefficient of
   Kubota's cubic theta function θ at λ^(−3) n b³ is 3^(5/2) |b| χ_n(λ)² γ_2(n) (n squarefree). The column sum is
   embedded in a "completed" sum T(X; k, f) over indices n b³. Inputs: [K] (Kubota's theta function on the cubic
   cover of GL_2 over Q(ω), a residue of a metaplectic Eisenstein series); quoted from Patterson 1977 and
   Dunn–Radziwiłł 2024.
7. **Theta transformation (Prop 6.2, App. A.2).** The twist of the coefficients by a character of the row k is
   expanded in additive characters; each translate θ(z + a/c) is moved to a cusp by automorphy, with Kubota's
   cubic multiplier κ(g) = (c/a)_3. At a prime p | k with twist exponent 1 the Fourier factor and the multiplier
   combine as χ_p^(−1) χ_p^(−2) = χ_p^(−3) = χ_p³, a QUADRATIC character. Output: T is a short sum of dual sums over
   ℓ ∈ λ^(−4)O of cusp coefficients d(ℓ) α(ℓ) N(ℓ)^(−1/2) × quadratic character of the row × transformed weight
   V_*^♯(N(ℓ)X/N(c)²), effective dual length N(k)²·(…)/X. The Dirichlet series T(s, Ψ) is entire (the ∂_z̄
   derivative that produces the angular factor α kills the constant term of θ).
   Inputs: [FE] of the THETA FUNCTION (automorphy; Gamma quotient Γ(7/6+t)Γ(5/6+t)/(Γ(7/6−t)Γ(5/6−t))), not of
   L(s, ν); absence of a pole of T(s, Ψ); [K].
8. **Quadratic large sieve (Lemma 6.5, 6.6; Prop 5.2).** Mean square over squarefree rows of the dual sums by
   the Heath-Brown / Goldmakher–Louvel quadratic large sieve with factor (H_0 + U): gives
   Σ_k |T(X; k, f)|² ≼ 𝓗 + 𝓗² N(f)/X. Inputs: [LS], [FAM], [POS] (a mean square; Cauchy–Schwarz in the cube
   variable). The paper stresses that the quadratic sieve has no (ML)^(2/3) term, unlike the general n-th order
   sieve of Blomer–Goldmakher–Louvel.
9. **Removing the cubes (Lemma 5.3).** Möbius inversion in the cube variable: X^(−1/2)·(column sum) =
   Σ_h μ(h) α(h)³Ψ_k(h)³ N(h)^(−1) T(X/N(h)³; k, f). Part N(h) ≤ H_c: step 8 gives ≼ 𝓗 + 𝓗² F H_c³/X ≤ 2Σ.
   Part N(h) > H_c: regrouped as the same dual mean square at column scale L_b = X/N(b)³ with the SAME row range.
   Inputs: complete multiplicativity of the cube weights (Möbius inversion); [POS] (Cauchy–Schwarz). CHECKED
   (the inversion and the exponent bookkeeping H_c³ = min(X, X²/𝓗²)).
10. **Transfer (Prop 5.4, §7).** For E(𝓗, L_b, F) with 𝓗 large against L_b: Poisson in the row (Gauss
    coefficients → Möbius coefficients, by (4.4), (4.7)), ENLARGE the new row range by positivity to
    Y = c ΣLF N(d)/(𝓗 N(C)²), Poisson again (Möbius → Gauss, by (4.5)), landing in the same family with
    𝓗′ ≤ 𝓗L/(ΣF), 𝓗′/Σ′ ≤ 𝓗/Σ, Σ′ ≤ L. Inputs: [EP] (same Gauss-sum identities, both directions), additive
    structure (Poisson twice), [POS] (enlargement of a non-negative sum), [K].
11. **Finite induction (Prop 5.1, §5.5).** Steps 9–10 give E(𝓗, X, F)/Σ ≼ 1 + sup E(𝓗′, X′, F′)/Σ′ with
    𝓗′ < 𝓗 (𝓗/Σ)² ≤ D^(−2κ)𝓗; after ⌈C_0/κ⌉ steps 𝓗 ≤ 1, where trivial counting suffices. Each step loses D^ε and
    derivatives of W (4m + 12). CHECKED (the contraction 𝓗′ ≤ 𝓗/(N(b)³F²) < 𝓗(𝓗/Σ)²).
12. **Close (§5.6).** In the ranges of Prop 4.5, 𝓗/Σ ≪ D^(−ϑ); Prop 5.1 with κ = ϑ/2, C_0 = 2 gives Prop 3.1.

Not used anywhere, as far as the text shows: the functional equation of L(s, ν); the von Mangoldt function; the
explicit formula (only in Corollary 1.2, as a standard deduction); zero-density estimates; any bound on
individual L-values; any computer verification.

## 4. What is assumed / imported
Imported theorems (not re-proved): Patterson 1977 (Thm 8.1, cusp coefficients of the cubic theta function);
Dunn–Radziwiłł 2024 §5 and Appendix A (theta transformation; the paper says it "extends" it to rows with
(h_0, L) ≠ 1 and fixed ray-class twists); Goldmakher–Louvel 2013 Thm 1.1 (quadratic large sieve over number
fields); sextic/cubic reciprocity with supplementary laws; Hecke's continuation; Landau's prime ideal theorem.
No unproved hypothesis is stated.

## 5. Where the exponent 11/12 comes from; the frontier
- The mean-square bound (3.1) has the size of its diagonal: (number of rows) × (length) = H·D. The zero-free
  exponent comes only from step 4: the twist is trivial on the rows u = p⁶, and there are H^(1/6) of those among
  H rows; so |A_1|² H^(1/6) ≼ D H, and with H as small as allowed (H = D^(1+ϑ), ϑ → 0), A_1 ≼ D^(1/2 + 5/12) = D^(11/12).
  The tight inequalities: (i) the mean square cannot be below its diagonal H·D; (ii) rows on which a symbol of
  order 6 is identically 1 are sixth powers; (iii) the row range must exceed D^(1+ϑ) so that the dual row range
  D²/H is below the column scale by a power (needed for the contraction in step 11).
  Reader's remark (not in the paper): for symbols of order m the same count gives 1 − 1/(2m); the order 6 is
  forced by step 5, where it is the SEXTIC Gauss sum that combines with μ into a cubic Gauss sum.
- Last thing proved: Theorem 1.1 with 11/12. First thing it does not do: any exponent below 11/12 (it refers to
  [36] for 7/8). **The paper contains no discussion of what blocks 1/2 or any smaller exponent**, no remark on
  the limits of the method, and no open questions.

## 6. What it explicitly does not do
- No statement on the critical line, on zero density, or on L-functions of degree > 1 other than through
  factorisation (Hecke characters of finite order over K only; Dirichlet L-functions by base change).
- No Hecke characters of infinite order; no other fields.
- No explicit constants (ε-losses and an unspecified number of derivatives of W at every step).

## 7. Controls (the reader's analysis of the text; none of this is in the paper)
- **Davenport–Heilbronn function** (no Euler product). Fails at step 1 and step 5 together: the Dirichlet inverse
  of a linear combination c_1 L(s, χ) + c_2 L(s, χ̄) is not Σ μ(n)·(ray class function)(n) n^(−s); the proof bounds
  only sums with coefficients exactly μ(n)ν(n), and step 5 needs μ(n) pointwise (γ_2(p)³ = −α(p) at every prime)
  to turn sextic Gauss sums into theta coefficients. Nothing in steps 5–11 refers to an L-function at all; they
  are statements about the sequences μ(n)ν(n) and α(n)γ_2(n)ξ(n). The functional equation that the impostor
  shares with L-functions is never used.
- **ζ(s − d)ζ(s + d).** Each factor separately: Σ μ(n) n^(d) W(n/D) = D^d Σ μ(n) W_d(n/D), so the argument gives
  no zeros of ζ(s − d) for Re s > 11/12 + d, which is true. The size of the local roots enters through the
  normalisation |μ(n)ν(n)| ≤ 1 against which the mean square D·H is measured (unitarity of ν).
- **Beurling systems** (no additive structure). Steps 3, 5, 6, 7, 10 have no meaning: residue symbols modulo n,
  reciprocity, Poisson summation over the lattice O and the automorphy of θ all need the ring O.
- **Coefficient 1 in place of μ.** The bound (3.1) would be false (the rows u = p⁶ alone would contribute
  H^(1/6) D² > D·H); in the proof, 1·γ_(−1)(n) stays a sextic Gauss sum and step 5's identity is unavailable.

## 8. Quadratic forms, positivity, "relative" inequalities in the proof
- The central statement is an UPPER bound for a manifestly non-negative quantity (a mean square of twisted
  Möbius sums over rows) by D^ε times its diagonal term. It is of large-sieve type: a bound for the norm of the
  bilinear form Σ_u Σ_n (·) χ_n(u) restricted to the special vector μ·ν·W, not a bound for all vectors (for all
  vectors the sextic sieve has an extra (HD)^(2/3) term, which the paper cites).
- Positivity is used four ways: (a) dropping rows from a sum of squares (step 4); (b) enlarging a row range of a
  non-negative sum (step 10); (c) non-negative smooth majorants; (d) Cauchy–Schwarz. The quadratic large sieve
  (step 8) is the only quoted inequality "form ≤ constant × ℓ² norm" valid for arbitrary coefficients.
- There is NO lower bound of the form "quantity ≥ constant × something manifestly positive", no positive-definite
  kernel, no Weil-type form, no explicit formula.

## 9. Reader's checks
- CHECKED by re-derivation: step 1, step 2 (as statements), the exponent arithmetic of (3.2), the Möbius
  inversion (5.8) and the bookkeeping of Lemma 5.3, the induction of §5.5.
- COMPUTED (`python3 -I gauss_check.py.txt`, scratch script; 74 split primary primes π ≡ 1 mod 3 of norm ≤ 400,
  double precision): γ_2(π)³ = −α(π) to 4e-14; γ_1γ_(−1) = χ(−1) to 2e-14; γ_2γ_4 = 1 to 2e-14.
  **The identity γ_1(π)γ_2(π) = μ α G with G(π) = χ_π(4)γ_3(π), as printed in Lemma 4.1 and Appendix A.1, FAILS
  numerically (error 1.73) whenever χ_π(4) is not real; with the complex conjugate of χ_π(4) it holds to 2e-14.**
  The same follows by rearranging the paper's own Gauss–Jacobi line (γ_1γ_3/γ_4 = χ(4)γ_1²/γ_2 gives
  γ_1γ_2 = χ̄(4)γ_3γ_2³). The slip looks harmless for the argument: G is used only as a unit-modulus function on a
  fixed ray class group with G(ab) = G(a)G(b)R(a,b), and χ̄_c(4) is a character modulo 2 just as χ_c(4) is. Inert
  primes were not tested.
- NOT checked: Proposition 6.2 and Lemmas 6.3, 6.4 (the theta transformation with twists, the heart of the
  proof), the applicability of the quadratic large sieve as used in Lemma 6.6, Propositions 4.5 and 5.4 (the
  Poisson bookkeeping), Lemma B.2. The imported theorems were not read.

## 10. Facts in our record that this paper bears on (facts only)
- `docs/KNOWLEDGE.md` §2 lists as the best zero-free region σ > 1 − c (log t)^(−2/3)(log log t)^(−1/3)
  (Vinogradov–Korobov). The paper CLAIMS Re s > 11/12 for ζ and all Dirichlet L-functions. If it stands, that
  line and the zero-density line of §2 for σ > 11/12 are superseded.
- `rh/NOTEBOOK.md` N35 (iii): sup_L ε*(L) = Θ − ½; (ii) ε*(L) ≤ ½ unconditionally. The claimed theorem says
  Θ ≤ 11/12, i.e. sup_L ε*(L) ≤ 5/12. The paper's proof does not pass through the window form, the explicit
  formula, or any damping; it bounds Θ through smoothed Möbius sums (the mechanism of KNOWLEDGE E2).
- `rh/BRIDGE.md`, "Bridge 1: where it ends", last paragraph: "the next hunch must use the functional equation AND
  one of these [0 ≤ Λ ≤ log; support on prime powers; complete multiplicativity of the summation weights]
  together, in the bulk". The paper's proof uses complete multiplicativity (through 1/L = Σ μν N^(−s) and the
  local identity γ_2(p)³ = −α(p)) and does NOT use the functional equation of the L-function, nor Λ, nor any
  positivity of prime weights. The functional equation it uses is the automorphy of Kubota's cubic theta
  function, applied to the Gauss-sum sequence into which μ is converted.
- B1/B2 (KNOWLEDGE §3): the proof's use of the Euler product is located in steps 1 and 5 above; on a linear
  combination of L-functions it has no starting point (§7 above).
- B10 ("both structures at once"): the additive structure enters as Poisson summation over O in the twist
  variable and as theta automorphy; the multiplicative structure as μ and Gauss-sum multiplicativity. B11 (the
  centre): the proof is normalised by |coefficients| ≤ 1; see the ζ(s ± d) entry in §7.
- B8 ("elementary/sieve routes", Mertens): the route here is a bound for a smoothed Möbius sum, obtained from a
  family average and automorphic input, not from a sieve.
- `rh/NOTEBOOK.md` N41 and bridge plank 7 use Möbius inversion to remove Λ from the window form; the paper uses
  Möbius inversion twice in other roles (1/L, and removal of the cube indices of the theta expansion). No overlap
  of statements.
- `docs/IDEAS.md` #27 (relative positivity against the band-limiting defect): no statement of this paper is of
  that shape (§8 above).

## 11. Open questions stated by the paper
None.

## 12. Reliability
Unrefereed; machine-produced (author "OpenAI", no named human author in the PDF). One identity as printed is
false by a complex conjugation (§9). The reader verified only the outer logic and the elementary identities; the
theta transformation and the two-Poisson transfer were read, not verified. For what named experts say has been
checked, see the press entry in `openai-qrh-7-8.md` §(status).
