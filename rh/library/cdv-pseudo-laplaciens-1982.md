BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Y. Colin de Verdiere, "Pseudo-laplaciens. I", Ann. Inst. Fourier 32 (1982), no. 3, 275-286

Reader: READER-5, 2026-11-11. Refereed journal paper (received 16 Nov 1981). In French. Companion digests:
`cdv-pseudo-laplaciens-1983.md` (part II), `2002.07929.md`, `garrett-notes.md`.

## 1. What was read
Open copy from Numdam (`https://www.numdam.org/item/10.5802/aif.890.pdf`, no login, no bot check; Numdam's
terms allow non-commercial use), saved at `rh/library/src/cdv/I/aif890.pdf` (13 PDF pages = cover + pp. 275-286).
The OCR text layer (`pdftotext`, 23,663 characters) was read **whole**; it garbles formulas, so pages 276 and 284
(the introduction and the Corollary of Theorem 3) were also read as images. Other displays were read from OCR only.

## 2. Main statements
Setting: X a complete Riemannian manifold, Delta_inf the self-adjoint Laplacian, Delta_{x0} = Delta on
C_c^inf(X \ {x0}).
- **Theorem 1.** If d >= 4, Delta_inf is the only self-adjoint extension of Delta_{x0}. If d = 2 or 3, the deficiency
  index is 1 and the self-adjoint extensions are Delta_{alpha,x0}, alpha in R/pi Z, with domain {f in D(Delta*) :
  near x0, f(x) = lambda (sin alpha G_d(r) + cos alpha) + o(1)}, G_2(r) = (log r)/2 pi, G_3 = -1/(4 pi r);
  D(Delta*) = {f in L^2 : Delta f - C delta(x0) in L^2 for some C}, Delta_{alpha,x0} f = Delta f - C delta(x0).
  "cela est lie au fait que delta(x0) est dans l'espace de Sobolev H^{-2}(X)". Delta_{0,x0} = Delta_inf. Lemma 1:
  f in D(Delta*) has f = C_1 G_d(r) + C_2 + o(1).
- **Lemma 2** (X compact): R(lambda; x, x0) = G_d(r) + F(lambda; x0) + o(1) near x0; F meromorphic in lambda with
  simple poles at eigenvalues whose eigenspace has a function not vanishing at x0, residues sum |phi_n(x0)|^2,
  F' = -sum |phi_n(x0)|^2/(lambda - lambda_n)^2, F strictly decreasing between poles.
- **Theorem 2.** Spectrum of Delta_{alpha,x0}: eigenvalues of Delta_inf with an eigenfunction vanishing at x0 (with
  stated multiplicities), and the lambda not in Spectrum(Delta_inf) with F(lambda; x0) = cot alpha (simple),
  interlacing with the lambda_n in the generic case.
- **Section 3 (automorphic).** Gamma\H of finite area with one cusp. The resolvent kernel R(s, ., z0) is in L^2;
  on the critical line its spectral coefficient is E(z0, 1/2 + ir)/(s(1-s) - (1/4 + r^2)) (limit from the right), so
  "Pour que R soit dans L^2 ... il est donc necessaire et suffisant que E(z0, s) = 0". Near z0,
  R(s, z, z0) = (1/2 pi) log r + F(s, z0) + o(1), F meromorphic with poles only at eigenvalues. Elliptic points
  are allowed.
- **Theorem 3.** The eigenvalues of Delta_{alpha,z0} are given by Theorem 2 with "Spectre(Delta_inf)" replaced by
  the eigenvalues of Delta_inf, and with the condition F(s, z0) = cot alpha joined by the simultaneous condition
  E(z0, s) = 0.
- **Corollary** (Gamma = PSL_2(Z), z0 = j = -1/2 + i sqrt3/2, using E(j, s) = C (sqrt3/2)^s zeta_K(s)/zeta(2s),
  K = Q(sqrt-3)): the eigenvalues of Delta_{alpha,j} are the s(1-s) such that either s(1-s) is an eigenvalue of
  Delta_inf with an eigenfunction vanishing at j, or zeta_K(s) = 0 and F(s, j) = cot alpha. "Donc si zeta_K(s0) = 0 et
  Re(s0) = 1/2, comme F(s0, j) est reel, s0(1-s0) est valeur propre de Delta_{alpha0,j} avec cot alpha0 = F(s0, j) :
  et comme F n'est pas constante (car elle a des poles [4]), il est probable que alpha0 depend du zero s0 de zeta_K
  choisi : chacune des pseudo-fonctions propres de Hejhal associee a un zero de zeta_K sur la droite critique, est
  donc fonction propre d'un des operateurs autoadjoints Delta_{alpha,j}." Introduction: "la premiere tentative se solde
  par un resultat peu encourageant".
- **Theorem 4.** For almost every (z0, alpha), Delta_{alpha,z0} has no eigenvalues other than the multiple eigenvalues
  of Delta_inf. Consequence: for a generic metric (no multiple eigenvalues) Delta_{alpha,z0} has no eigenvalue at all
  for almost every (alpha, z0); remark on Roelcke's conjecture ("cette propriete semble tres instable, et en tout cas
  dependre de la nature arithmetique du probleme").

## 3. Method in ten lines
Point interaction (von Neumann deficiency theory) in dimension 2: delta(x0) is in H^{-2} but not H^{-1}, so
Delta on C_c^inf(X \ {x0}) has a one-parameter family of self-adjoint extensions, parametrised by the ratio of the
logarithmic coefficient to the constant term at x0. The resolvent kernel at x0, minus its logarithm, is a
meromorphic Krein-type function F; eigenvalues of an extension are where F = cot alpha. On the modular surface the
resolvent kernel at j is L^2 on the critical line exactly when E(j, s) = 0, which is zeta_{Q(sqrt-3)}(s) = 0; such a
zero is then an eigenvalue of the extension whose parameter equals F(s, j).

## 4. What is assumed
Standard spectral theory of Gamma\H (Kubota, Lang, Lax-Phillips, Venkov), Hejhal's identification of Haas's
spurious eigenvalues. Unconditional.

## 5. Where its frontier is
Last thing proved: every zero of zeta_K on the line is an eigenvalue of SOME self-adjoint extension Delta_{alpha,j},
alpha = arccot F(s, j). First thing not done: a single extension carrying all zeros; the paper expects alpha to vary
with the zero, and Theorem 4 says a generic extension has no eigenvalues at all. Off-line zeros are not
discussed.

## 6. What it explicitly does not do
It does not claim any consequence for RH; it calls the outcome "peu encourageant" and moves to part II (constant
terms) for the second attempt.

## 7. Facts in our own record that this paper shows to be already known
- **rh/specialists/operator/OBJECT_PHI.md §1 and §1(c)**: the point interaction at omega, deficiency index 1, the
  family Delta_alpha, the Krein function Q (here F), and "every zero on the line IS an eigenvalue of a self-adjoint
  operator: but each zero of its own operator" = Theorem 1, Lemma 2, Theorem 3 and its Corollary here (1982),
  including the remark that alpha probably depends on the zero. OBJECT_PHI cites "Colin de Verdiere Pseudo-laplaciens
  I" for the setting; the eigenvalue statement for zeros is also his. OBJECT_PHI §1(d) (off-line zeros are not
  eigenvalues of any self-adjoint extension) is immediate from self-adjointness; the paper does not state it.
- **rh/NOTEBOOK.md N43**: the Krein function of the point interaction at omega is CdV's F(s, j) (1982). N43's
  two-sheet identity is not in this paper (see `2002.07929.md`, Cor. 46).
- **docs/KNOWLEDGE.md B7**: an example where each zero is an eigenvalue of an operator chosen after the zero.

## 8. Reliability
Refereed (Ann. Inst. Fourier). OCR transcription; formulas checked on images only for pp. 276, 284.
