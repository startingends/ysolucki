BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project (owner rule 10).

# H. Yoshida, "On Hermitian forms attached to zeta functions", in *Zeta Functions in Geometry* (Tokyo, 1990), Adv. Stud. Pure Math. 21, Kinokuniya / Math. Soc. Japan, 1992, pp. 281-325

Reader: READER-1, 2026-11-11.

**THIS PAPER WAS NOT READ. Characters read / total: 0 / unknown (45 printed pages).** Everything below is
SECONDARY: what five other texts say about it. Nothing here is a quotation from Yoshida.

## 1. What was read, and whether the full text is obtainable
- The paper exists online at Project Euclid, DOI `10.2969/aspm/02110281`
  (`https://projecteuclid.org/ebooks/advanced-studies-in-pure-mathematics/Zeta-Functions-in-Geometry/chapter/On-Hermitian-Forms-attached-to-Zeta-Functions/10.2969/aspm/02110281`).
  Crossref confirms title, pages 281-325 and publisher (Mathematical Society of Japan); it carries no abstract.
- Automated download failed: Project Euclid answered `curl` with a bot-check page (Incapsula), for the chapter
  page, the download link and the DOI redirect. A retry dressed up as a browser was refused by this session's
  permission system as bot-check circumvention, correctly, and was not pursued. One web search found no other
  copy (no arXiv version; library catalogue records only). So: a person with a browser can very probably get
  the PDF from Project Euclid; this seat could not. If the PDF is placed at
  `rh/data/papers/yoshida1992/yoshida1992.pdf`, a reader seat can do the full read.
- Secondary sources used (all held locally; passages located by search for "Yoshida", not whole-paper reads
  unless stated):
  - [S1] Suzuki, arXiv 2606.09096 (read whole by this seat; digest `2606.09096.md`), introduction.
  - [S2] Suzuki, "Aspects of the screw function corresponding to the Riemann zeta function", arXiv 2206.03682
    (J. London Math. Soc. 2023); only the passages on Yoshida were read (sections 3.2, 4.2, 5.4; about 4,000 of
    80,954 characters of `rh/data/papers/yoshida1992/su23/su23.txt`).
  - [S3] Connes-Consani, arXiv 2006.13771 (introduction and Appendix C, passages on Yoshida only, from
    `rh/library/src/2006.13771/weil-compo.tex`; whole-paper digest by R-read-1:
    `connes-consani-weil-positivity-archimedean.md`).
  - [S4] Connes-Consani, arXiv 2106.01715 (read whole by this seat; digest `2106.01715.md`), introduction.
  - [S5] X. Zhu, arXiv 2608.24827 (abstract and introduction lines only; unrefereed) and N. Johns's preprint
    (introduction line only; unreviewed).

## 2. Main theorems, as reported by the secondary sources (numbers are Yoshida's, as cited by them)
Setting per [S2]: the hermitian form `<phi, psi>_W := W(phi * psi~)` on `C_c^inf(R)`, `W` the Weil distribution;
`C(a)` = smooth functions supported in `[-a, a]`; `K(a)` = restrictions to `[-a, a]` of smooth functions of
period `2a`; `K_N(a)` = those elements of `K(a)` orthogonal to `exp(pi i n x/a)` for `|n| <= N`.
- **Compact support suffices** ([S2] section 3.2, [S3] introduction and Appendix C). Weil's criterion can be
  tested on compactly supported functions; [S2]: "in Yoshida [33], the criterion has been formulated in the
  form above, although it is not sure whether it is the first literature". [S3] uses "the proof of Proposition
  1 of [Yoshida]" and a "Lemma 1" (existence of a compactly supported `g_0` whose Mellin transform is 1 at one
  zero and small at the others) to prove: RH iff the sum of local terms is `<= 0` on `g * conj(g)^sharp` for
  all `g in C_c^inf(R_+^*)` whose Mellin transform vanishes on a finite set containing `{0, 1}`.
- **Proposition 1** ([S1]): "the condition Q_W(v) >= 0 for all non-zero odd functions v in C_c^inf(R) implies RH,
  while a similar condition for all non-zero even functions implies RH except for possible real zeros."
- **Lemma 2** ([S1], [S2]): "the hermitian form is positive definite on K(a) if a > 0 is sufficiently small",
  "without any assumption"; in [S1]: the infimum of the Rayleigh quotient `Q_W(v)/||v||^2` on `K(a)` is positive
  for sufficiently small `a`.
- **Lemma 3** ([S2] section 4.2): "for given a_0 > 0 and mu > 0, there exists N >= 0 such that
  <phi, phi>_W >= mu ||phi||_{L^2} for every phi in K_N(a) and 0 < a <= a_0"; ([S2] section 5.4): for every `a`
  there is `N_0(a)` such that the form is positive definite on `K_N(a)` for `N >= N_0`.
- **Propositions 2 and 7** ([S2] section 5.4): the form "is non-degenerate on C(a) and K(a) for every a > 0"
  (reported as unconditional).
- **Theorem 2** ([S1], [S2]): with `K^(a)` the space obtained by completing `K_N(a)` for the form and adding back
  the finite-dimensional complement, "the RH is true if and only if [the form] is non-degenerate on K^(a) for
  every a > 0".
- **The window of length log 2.** Three descriptions, which do not say the same thing:
  - [S3]: "For any smooth, positive definite function f with support in the interval (1/2, 2) and whose Fourier
    transform vanishes at ± i/2 one has W_inf(f) >= 0 ... This result was proved in [Yoshida] by reducing it to
    an explicit computation." (Archimedean term only; the vanishing condition removes the pole term; test
    functions `g` supported in `[2^{-1/2}, 2^{1/2}]`.) Johns [S5] repeats this form.
  - [S4]: "In [Yoshida], the positivity was shown to hold for lambda = sqrt 2 using numerical analysis."
  - Zhu [S5]: "Yoshida proved positivity for 2L <= log 2" (support of `f` in `[-(log 2)/2, (log 2)/2]`).

## 3. Method in ten lines
Not known to this seat. The only indications: [S3] "by reducing it to an explicit computation"; [S4] "using
numerical analysis"; [S1] says lower-boundedness and lower semicontinuity of the window form are "implicitly
contained in [Yoshida, Section 2]" and rest on the formula
`Q_W^a(v) = (1/2 pi) int (log|z| - log 2 pi)|vhat(z)|^2 dz + O(a)||v||^2`.

## 4. What is assumed
Per [S1], [S2]: Lemma 2, Lemma 3, Propositions 2 and 7 are unconditional; Proposition 1 and Theorem 2 are
equivalences or implications with RH.

## 5. Where its frontier is (as far as the secondary sources show)
- Last thing proved: positivity on `K(a)` for small `a` (how small is described three ways, see part 2; the
  largest window any source attributes to Yoshida is support length `log 2`, where no prime enters), positivity
  in finite codimension for every `a` (Lemma 3), and the reduction of RH to non-degeneracy on the completed
  space (Theorem 2).
- First thing it cannot do, per [S1]: continuity in `a` of the lower bound was not in Yoshida (Suzuki presents
  his Theorem 1.3 as giving "another proof of Yoshida's result" through continuity, and attributes the first
  continuity claim to Bombieri 2001, with reservations). Positivity on any window containing a prime is
  attributed to Yoshida by none of the five sources.

## 6. What it explicitly does not do
Cannot be stated without the text.

## 7. Facts in our own record that these secondary reports bear on
(All subject to the caveat that Yoshida's text was not read.)
- **docs/KNOWLEDGE.md section 2** ("Weil positivity for test functions of small support (Yoshida 1992)"): the
  sources agree on the existence of such a result and disagree on its exact form: sufficiently small `a`
  ([S1], [S2]); support length `log 2`, archimedean term, under vanishing of the transform at `± i/2` ([S3]);
  `lambda = sqrt 2` "using numerical analysis" ([S4]). The entry cannot be made exact from secondary sources.
- **docs/IDEAS.md #2 novelty** ("Yoshida 1992 (positivity for small windows; RH fails iff the lowest eigenvalue
  is negative for some window)"): the second half is not attributed to Yoshida by [S1], [S2]; what they
  attribute to him is Theorem 2 (RH iff non-degeneracy on the completed space for every `a`). The lowest
  eigenvalue as a function of `a` is Suzuki's formulation ([S1], after his Theorem 1.3).
- **docs/IDEAS.md #8 (first-failure null vector)** and **rh/experiments/r2_parity/PROOF_first_failure.md**: per
  [S2], Yoshida's Propositions 2 and 7 give non-degeneracy of the form on `C(a)` and on `K(a)` for every `a`,
  unconditionally. If that report is accurate, a vector on which the form degenerates at some window is not a
  smooth function supported in the window nor the restriction of a smooth periodic function; it lies only in
  the completion. This is a second-hand statement; the exact meaning of "non-degenerate" there was not checked.
- **docs/IDEAS.md #20 / rh/experiments/r2_parity ("one parity block suffices"; negative squares counted in
  finite number)**: Proposition 1 as reported in [S1] is already recorded by the r2_parity refuter. Lemma 3 as
  reported in [S2] (for every `a_0` and `mu` the form is `>= mu` on a subspace of finite codimension, uniformly
  for `a <= a_0`) is the statement that, on each window, at most finitely many directions can carry
  non-positive values; it is not in the record under Yoshida's name.
- **rh/library/README.md reading-list row** ("Yoshida, 'On calculations of zeros of various L-functions' / the
  1992 paper ... not found yet"): the 1992 paper is the one in the title of this note; found, not downloadable
  by this seat.
- **rh/experiments/foothold/MEMORY.md** ("Classical record before it: 2L <= log 2 (Yoshida 1992; Connes-Consani
  2006.13771)"): matches Zhu's wording [S5] and [S3]'s description (with the vanishing condition at `± i/2`
  that [S3] states and the foothold entry does not).

## 8. Open questions the paper itself states
Unknown (text not read).
