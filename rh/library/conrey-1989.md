BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# J. B. Conrey, "More than two fifths of the zeros of the Riemann zeta function are on the critical line", J. reine angew. Math. 399 (1989), 1-26

Reader: READER-8, 2026-11-11. Source: open scan at the Göttinger Digitalisierungszentrum (GDZ), volume
PPN243919689_0399, item LOG_0004 (reached from the EuDML/Mathdoc record of the article), saved as
`rh/library/src/mollif_conrey1989/L0004.pdf` (27 pages = 1 GDZ cover page + journal pages 1-26). The scan has no text
layer and no OCR tool is installed, so **every page was read as an image** (100 dpi renders `pg-02.png` … `pg-27.png`).
Received 18 Jan 1988 (printed at the end).

## 1. What was read
**All 26 journal pages** (sections 1-8, "Note added in proof", references [1]-[15]), as images. Displays were
readable throughout; where a symbol was uncertain it is flagged below.

## 2. What it proves
Notation: κ = liminf N_0(T)/N(T) (proportion of zeros on the line), κ* the same for simple zeros. L = log T.
Mollifier (1), (33): b(n,P) = μ(n) P(log(y/n)/log y), P a polynomial with P(0) = 0, P(1) = 1;
B(s,P) = Σ_{n ≤ y} b(n,P) n^{σ0 − ½} n^{−s}, y = T^θ, σ0 = ½ − R/L.
- **Theorem 1.** κ ≥ 0.4077 and κ* ≥ 0.401. "Note added in proof": with R = 1.28 and
  Q(x) = 0.492 + 0.602(1−2x) − 0.08(1−2x)³ − 0.06(1−2x)⁵ + 0.046(1−2x)⁷, κ ≥ 0.4088.
- **Theorem 2 (the mean value theorem).** Let B(s,P) be as above, R ≪ 1, σ0 = ½ − R/L, V(s) = Q(−(1/L) d/ds) ζ(s)
  for a polynomial Q. **If θ < 4/7**, then ∫_2^T |V B(σ0 + it)|² dt ~ c(P,Q,R) T, with
  c(P,Q,R) = |P(1)Q(0)|² + (1/θ) ∫_0^1∫_0^1 e^{2Ry} |Q(y)P′(x) + θQ′(y)P(x) + θRQ(y)P(x)|² dx dy.
- **§3 (Levinson's set-up, from Levinson 1974 and Conrey 1983).** (38)-(39): κ ≥ 1 − (1/R) log((1/T)∫_1^T |B V(σ0+it)|² dt)
  + o(1); (43) the same for κ* when Q has degree 1. §4 optimises P by Euler–Lagrange: P(x) = (e^{rx} − e^{sx})/(e^r − e^s),
  giving (49) c = ½(|w(0)|² + |w(1)|²) + Aα coth α/θ with w(y) = e^{Ry}Q(y). θ = 4/7, R = 1.2, λ = −1.02 gives
  c = 2.05… and κ* ≥ 0.4013.
- **Proposition (§5).** For a, b ≪ 1, α = a/L, β = b/L, s0 = ½ + iw with T ≤ w ≤ 2T, Δ = T^{1−δ}, y = T^θ with
  0 < θ < 4/7: the Gaussian-smoothed integral g(a,b,w,P1,P2) = (1/(iΔπ^{½}))∫_{(½)} e^{(s−s0)²Δ^{−2}} ζ(s+α)ζ(1−s+β)
  𝔅(s,P1)𝔅(1−s,P2) ds equals (1/θ)∫_0^1 e^{−(b+a)y} dy ∂_u∂_v e^{−aθu − bθv} ∫_0^1 P1(x+u)P2(x+v) dx |_{u=v=0} + P1(1)P2(1)
  + o_δ(1), uniformly. Theorem 2 follows by applying Q(−d/da)Q̄(−d/db) at a = b = −R.
- **Lemma 1** (main-term arithmetic; sketch, details in Conrey 1983 §6): Σ(α,β,P1,P2) = Σ_{h,k ≤ y} b(h,P1)b(k,P2)
  (h,k)^{1+α+β}/(h^{1+α}k^{1+β}) ~ (1/(θL)) ∫_0^1 (P1′(x) + aθP1(x))(P2′(x) + bθP2(x)) dx. Valid for any 0 < θ < 1.
- **Lemma 2.** g = [Σ(b,a,P1,P2) − e^{−a−b} Σ(−a,−b,P1,P2)]/(α+β) + o_δ(1). Lemmas 3-6: Estermann-function
  machinery (D(s,α,β,H/K) = Σ m^{−s−α} n^{−s−β} e(mnH/K), its functional equation, entire after removing
  K^{1−α−β−2s}ζ(s+α)ζ(s+β); Lemma 6 a contour lemma r(s1,a) = −πi e^{−a} + o(1)).
- **Lemma 7.** ∫_{L_λ}∫_{(c)} (1+|s|)|G(α,v,s1,Δ,s)| ds dv ≪ Δ^{−c−5/2} T^{5/2+η+ε} (as in Lemma 5 of BCH).
- **Lemma 8 (the error term).** With 𝓜(N,U,V,α,β,g,s) = Σ_{n~N} δ(n) n^{−s} Σ_{u~U} Σ_{v~V, (u,v)=1} b(ug,P1)b(vg,P2)
  u^{…}v^{…} e(n ū/v) [δ(n) = Σ_{d|n} d^{α+β}]: if **y ≤ T^{8/13}**, 1 ≤ U, V ≤ y, s = c + it with c = η if UV ≥ TN and
  c = 1 + η otherwise, then 𝓜 ≪ (1+|s|)(TN)^ε y^{2η} T^c N^{−η} (T^{−½} y^{7/8} + T^{−1} y^{7/4}).
  Combining with Lemma 7: Z ≪ Δ^{−7/2}T^{5/2+2ε} y^{3ε}(T^{½}y^{7/8} + y^{7/4}), which is o(1) "since θ < 7/4" — this
  is a **misprint for θ < 4/7** (T^{−1}·T^{7δ/2}·(T^{½}y^{7/8} + y^{7/4}) → 0 needs y^{7/8} < T^{½}, i.e. θ < 4/7).
- **Lemma 9** ("a case of Lemma 1 of Deshouillers and Iwaniec [7]"): for |c(a,n)| ≤ 1 and U ≪ AB ≪ U,
  Σ_{v~V} Σ_{b~B, (b,v)=1} |Σ_{n~N} Σ_{a~A, (a,v)=1} c(a,n) e(n ā b̄/v)| ≪ (NUV)^{½+ε}{(UVA^{−1})^{½} + (A+N)^{¼}[UVA^{−1}(N+A)(V+A²) + NU²]^{¼}}.

## 3. Method in ten lines
1. Levinson: zeros of ζ on the line ↔ zeros of Re η(½+it), η = gξ + Σ g_n ξ^{(n)}L^{−n}; argument principle reduces κ to
   counting zeros of V = Q(−d/(L ds))ζ to the right of the line; Littlewood's lemma + AM-GM bound that count by
   log of the mollified mean square ∫|VB(σ0+it)|².
2. So everything rests on an ASYMPTOTIC for ∫|VB|² with the mollifier as long as possible; κ improves with θ.
3. Smooth the integral at scale Δ = T^{1−δ}; write it as a contour integral of ζ(s+α)ζ(1−s+β)𝔅(s)𝔅(1−s).
4. Open with the functional equation and Estermann's D-function: the poles give the main term (Lemmas 2, 5, 6, §7),
   evaluated by Lemma 1's Möbius arithmetic (valid for all θ < 1).
5. The remaining terms E_i are sums 𝓜(N,U,V) of b(ug)b(vg) e(n ū/v): incomplete Kloosterman sums with the two
   mollifier variables u, v as numerator and modulus.
6. KEY STEP (§8): μ(u) inside b(ug,P1) is decomposed by VAUGHAN'S IDENTITY (79)-(84) with W = U^{¼}:
   μ = c1 + c2 + c3, c1 = Σ_{αβγ=u, α,β ≥ W} μ(γ)c4(α)c4(β) (bilinear), c2 = 2μ(u)1_{u ≤ W} (trivial),
   c3 = −Σ_{αβγ=u, α,β ≤ W} μ(α)μ(β) (a convolution with a long smooth variable γ).
7. The P(log(y/(ug))/log y) weight is separated by expanding into products (log u/log y)^{k1}(log g/log y)^{k2}.
8. Bilinear pieces S1′ (U ≪ AB ≪ U, W ≤ A ≤ B) and S3′ with A ≫ U^{¼}: bounded by Deshouillers–Iwaniec Lemma 9,
   the extra factorisation u = ab giving the extra variable DI need; bounds (89)-(96) check all exponent vectors in
   the set E of (90) under y ≪ T^{2/3}, T^{8/13}, T^{4/3}.
9. S3′ with A ≪ U^{¼}: sum over the long smooth variable b first with WEIL's bound for Kloosterman sums (98).
10. All pieces are ≪ max(TN, UV)(yN)^ε (T^{−1}y^{7/4} + T^{−½}y^{7/8}): o(T) iff θ < 4/7.

## 4. What is assumed
Nothing: Theorems 1, 2 are unconditional. Inputs quoted: Levinson 1974 and Conrey 1983 (J. Number Theory 16) for the
set-up and Lemma 1's arithmetic; BCH 1985 (Crelle 357) for the analytic reduction and Lemmas 4-5 of that paper;
Deshouillers–Iwaniec [7] (cited by Conrey as Acta Arith. 48 (1984) 305-312; BCR cite the same paper as Acta Arith. 43
(1984); volume not checked) for Lemma 9; Weil's bound; Estermann 1930.

## 5. Where it stops
- Last thing proved: the asymptotic for θ < 4/7 for coefficients μ(n)P(log(y/n)/log y). First thing not proved:
  θ = 4/7. The binding term is T^{−½}y^{7/8} from the bilinear (Type II) Deshouillers–Iwaniec bound; the Type I
  side (Weil) and the other constraints (y ≤ T^{8/13}, T^{2/3}) are slacker (8/13 ≈ 0.615 > 4/7 ≈ 0.571).
- The paper states NO barrier and no conjecture about larger θ. It does not discuss what an asymptotic for θ > 1
  would mean; the integral is always over 2 ≤ t ≤ T with the mollifier tied to T (y = T^θ).
- Where the Möbius structure is used: ONLY in §8, through Vaughan's identity (μ is a combination of bilinear forms
  with both variables ≥ U^{¼}, plus a Type I convolution), which supplies the extra factorisation that the DI
  bilinear Kloosterman bound needs. Lemma 1 (main term) uses μ too but works for every θ < 1.

## 6. What it changes in our record
- `rh/NOTEBOOK.md` N53 (b) uses "Conrey's theorem bounds the block by ≍ T^(−1) for T ≥ N^(7/4)". Correct as
  arithmetic (θ < 4/7 ⇔ T > N^{7/4}), but (i) Conrey's theorem is for the integral over [2, T] with σ0 = ½ − R/L and
  the Levinson-weighted operator V = Q(−d/(L ds))ζ, not literally |ζ M_N|² on dyadic blocks with the NB weights
  (the BCR/BCH-type statement at height [T, 2T] is the relevant form, and PRZZ Thm 4.1 states it for
  a_n = (μ ⋆ Λ_1^{⋆k1} ⋆ …)(n) with error T^ε(N^{7/4} + N^{7/8}T^{½})); (ii) for the NB boundedness question an
  asymptotic is not needed: an UPPER bound of the right order suffices, and for the NB weight 1/(¼+t²) trivial
  bounds already make every height T ≥ N^{2/3+ε} harmless (see `balazard-deroton-0812.1689.md`, §6). So "everything
  lies at heights T ≪ N^{7/4}" is true but not sharp; the unconditional statement is "T ≪ N^{2/3+ε}".
- N57 (crossing the self-dual point by "amplification + Kuznetsov + Kloosterman bounds"): Conrey's crossing of θ = ½
  (to 4/7) uses NO amplifier. It uses (a) Poisson / Estermann functional equation (the involution), (b) a
  COMBINATORIAL DECOMPOSITION of μ (Vaughan's identity) into Type I and Type II pieces, (c) Weil's bound for Type I and
  the Deshouillers–Iwaniec bilinear bound for incomplete Kloosterman sums for Type II. DI's Lemma 1 rests on DI 1982
  (Invent. 70, Kuznetsov formula and spectral large sieve for Kloosterman sums; this provenance is from memory, the DI
  papers were not read). So the spectral formula enters through the arithmetic of the coefficients' bilinear
  structure, not through an amplified family. The amplifier analogy of N57 is the reader's record's, not this paper's.
- IDEAS #34 / N53 (c): "only arithmetic specific to μ can help" in the short-family regime. Conrey 1989 is a proved
  instance where arithmetic specific to μ (Vaughan's identity, i.e. that 1/ζ is a ratio of zeta functions) buys more
  length than general coefficients do (4/7 against 17/33). But it is a fixed gain past ½ at height T with θ < 1;
  it says nothing about the regime N ≫ T.
- The Type II range Conrey needs is both variables ≥ U^{¼}; #34's filter prediction names "Type II information in
  the range M in [D^(1/4), D^(1/2)]" — the same range as Conrey's Vaughan split (W = U^{¼}); consistent, and already
  classical.

## 7. Reliability
Refereed (Crelle). Read from a scan as images: the formulas above were transcribed by eye, displays checked twice
where they carry exponents. One misprint found ("θ < 7/4" for θ < 4/7, p. 21). The volume of DI's Acta Arith. paper
differs between sources (48 here; 43 in BCR). Lemma 1's proof is a sketch referring to Conrey 1983.
