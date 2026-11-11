BACKGROUND ONLY: what this text establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Y. Kodama, "The Kuznetsov Formula for 3-Dimensional Arithmetic Manifolds" (2004), 70 pp., in Japanese

Reader: READER-7, 2026-11-11. Title and year as cited in I. Kaneko, arXiv 2502.18366 (bibitem [Kod04]: "Yukiya
Kodama, The Kuznetsov Formula for 3-Dimensional Arithmetic Manifolds, 2004, 1-70", with the link
`www1.tmtv.ne.jp/~koyama/papers/s_Japanese/kodama.pdf`, i.e. hosted among S. Koyama's students' Japanese texts).
Fetched from that link: `rh/library/src/kodama2004/kodama.pdf` (70 pp., TeX output dated 2003-02-04, PDF 2003-02-24).
Unrefereed (a student thesis, by its location; its genre is not stated in any readable text).

## 1. What was read — PARTLY
The Japanese prose is NOT recoverable: the PDF's Japanese fonts are not embedded in a usable way (`pdftotext`
reports "Missing language pack for Adobe-Japan1"), and the rendered page images show the formulas but blank spaces
in place of the Japanese text. Read: the table of contents, the mathematical layer of pp. 2-4 (Theorems 1.1-1.8 and
Definitions 1.3-1.7, also checked as an image for p. 2), the list of all numbered statements 2.1-3.71 (labels and
formula fragments), and the bibliography (p. 70). The proofs (pp. 5-69) were NOT read.

## 2. Main statements
- **Theorem 1.1** = Kuznetsov's formula for SL_2(Z) (quoted from Kuznetsov 1981, Thm 1).
- **Theorem 1.2** = the formula for SL_2(Z[i]) (quoted; reference name in Japanese, p. 268, presumably Motohashi's
  or Sarnak's; not identifiable from the formulas).
- **Theorem 1.8 (the paper's result).** For Gamma = SL_2(Z[omega]) acting on H^3, 0 != m, n in Z[omega]^* (the dual
  lattice), h(r) holomorphic in |Im r| < 1/2 + eps, even, h(r) << (1+|r|)^{-4-eps}:
  ```
  sum_j conj(rho_j(m)) rho_j(n) kappa_j h(kappa_j)/sinh(pi kappa_j)
    + 2 pi int (|n|/|m|)^{ir} sigma'_{ir}(m) sigma'_{-ir}(n) h(r) / |zeta_K(1+ir)|^2 dr
  = pi^{-2} (delta_{m,n} + delta_{m,n omega} + delta_{m,n omega bar}) int r^2 h(r) dr
    + sum_{0 != l in Z[omega]} |l|^{-2} S(m,n;l) h^(2 pi varpi),   varpi^2 = mn/l^2,
  h^(t) = i int r^2 J_{ir}(t) h(r)/sinh(pi r) dr,  J_nu(t) = 2^{-2nu} |t|^{2nu} J*_nu(t) J*_nu(t bar),
  ```
  with S(m,n;l) = sum_{v mod l, (v,l)=1} e([m, v/l]) e([n, v*/l]) the ORDINARY Kloosterman sum over Z[omega]
  (Definition 1.7), sigma'_nu(n) = (1/6) sum_{d | n} |d|^{2nu}, K = Q(sqrt(-3)). A remark after the theorem states
  (formula only) that the condition can be relaxed to h(r) << (1+|r|)^{-3-eps}, citing Kuznetsov pp. 324-329.
- The numbered statements 2.x-3.x (Poincaré series P_m(z,s), Eisenstein series E(z,s) for SL_2(Z[omega]), the
  inner product <P_m(.,s_1), P_n(.,s_2)> computed in two ways, Möbius function and Ramanujan sums over Z[omega],
  Bessel-function identities from Erdélyi, Watson, Titchmarsh's Thm 5.16-5.17) indicate the proof follows
  Kuznetsov's/Motohashi's route via the inner product of two Poincaré series (Motohashi, "Trace formula over the
  hyperbolic upper half space", 1997, is in the bibliography). Not verified.

## 3. Method
Not read (see above); inferred from statement labels only: spectral expansion of the inner product of Poincaré
series, unfolding to Kloosterman sums, Bessel inversion.

## 4. Where it stops
**No Kubota character, no cubic residue symbol, no metaplectic forms, no theta function appear anywhere in the
mathematical text** (grep of the full text layer for Kubota / cubic / metaplectic / theta / chi: no hit in the
mathematics; the formulas involve only the trivial multiplier). Spectral side: Maass cusp forms for SL_2(Z[omega])
and the Eisenstein series with |zeta_K(1+ir)|^2.

## 5. What it changes in our record
- **rh/NOTEBOOK.md N55 and rh/specialists/modular/SHORT_FAMILY.md (3c)** list "Kodama 2004" as a Kuznetsov formula
  "for the metaplectic group over Q(omega)" / "for Q(omega)". The text is a Kuznetsov formula for the
  NON-metaplectic group SL_2(Z[omega]) (ordinary Kloosterman sums). Kaneko (2502.18366, line 1019) uses it for the
  transition Z[i] -> Z[omega] and adds "This is the only occasion where the cubic structure is fundamentally
  invoked", which may be the source of the "metaplectic" reading. The metaplectic (Kubota-twisted) version is in
  Louvel 1107.0197, Theorems 4.1-4.3 (digest `louvel-1107.0197.md`).

## 6. Reliability
Unrefereed student text, in Japanese, read only through its formulas. The statement of Theorem 1.8 is transcribed
from the text layer and checked against the rendered image of p. 4; constants (pi^{-2}, 2 pi, the factor 1/6 in
sigma') are as printed and not verified.
