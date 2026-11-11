BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# H. Ki, "On the nontrivial zeros of modified Epstein zeta functions", C. R. Acad. Sci. Paris, Ser. I 342 (2006) 79-81 (doi 10.1016/j.crma.2005.11.015)

Reader: READER-6, 2026-11-11. Refereed note (presented by A. Connes), 3 pages, proofs only sketched ("follows from
the methods in [2]"). Open copy: numdam.org item PDF, `rh/library/src/ki-cras-2006/paper.pdf`.

## 1. What was read
`pdftotext -layout` of the 3-page PDF: **11,302 / 11,302 characters**, all. Formulas partly garbled by the text
layer; statements reconstructed from context (marked where uncertain).

## 2. Main statements, with their numbers
- Recalled from Ki, Proc. LMS 90 (2005) 321-344 [2] (NOT read): for every N, all but finitely many nontrivial
  zeros of the Chowla-Selberg formula truncated after the N-th Bessel term are simple and on Re s = 1/2, provided
  (garbled) "sqrt(Delta)/(2a) >= 1", i.e. Im z >= 1 for the point z of the form (reader's reading of the garbled
  condition, consistent with Corollary 1.4's "provided ... >= 1").
- Definition: for real polynomials alpha, beta with beta(s) = beta(1-s),
  `Z_{Q,alpha,beta}(s) = 2 alpha(s) zeta(2s) a^{-s} + alpha(1-s) (2^{2s} a^{s-1} sqrt(pi)/(Gamma(s) Delta^{s-1/2})) Gamma(s-1/2) zeta(2s-1)
  + beta(s) x [Bessel part of Chowla-Selberg]`; alpha = beta = 1 gives Z_Q. More generally
  `Z(s; y, alpha, beta, L_1..L_n) = alpha(s) zeta(2s) + alpha(1-s) sqrt(pi) Gamma(s-1/2)/Gamma(s) zeta(2s-1) y^{1-2s}
  + y^{-s} beta(s) sum a_k L_k(s)` under (i) y > 0, (ii) deg alpha >= deg beta + 1, (iii) a_k real, (iv) each L_k has
  the functional equation of zeta(2s)-type `pi^{-s} Gamma(s) L_k(s) = pi^{s-1} Gamma(1-s) L_k(1-s)`, (v) L_k(s) =
  O(|s|^{1-eps}) on Re s >= 1/2.
- **Theorem 1.1.** For every delta > 0, all but finitely many zeros of Z(s; y, alpha, beta, L) in
  |Re s - 1/2| < delta are simple and on Re s = 1/2.
- **Corollary 1.2.** If y >= 1: all but finitely many nontrivial zeros are simple and on the line.
- **Corollary 1.3 / 1.4.** The same for Z_{Q,alpha,beta} (in the strip; globally if the "sqrt(Delta)/(2a) >= 1"
  condition holds).
- The author's own remark: "Corollary 1.4 cannot say anything about the function Z_{u^2+v^2,1,1}(s)
  [= 4 zeta(s) L(s, chi_{-4})] because alpha(s) = 1 and beta(s) = 1 do not satisfy assumption (ii)."

## 3. The method
Not given in the note ("the proof of Theorem 1.1 follows from the methods in [2]"). Mechanism visible from the
hypotheses: the polynomial weight alpha of higher degree than beta makes the constant-term part dominate the
Bessel part for large |t|, and the constant term has all zeros on the line (Lagarias-Suzuki type, simple zeros);
a Rouché/argument-principle comparison then leaves only finitely many exceptions.

## 4. What is assumed
deg alpha >= deg beta + 1 (excludes the genuine Epstein function), real coefficients, a common functional equation.

## 5. Where its frontier is
Last thing proved: "almost RH" (finitely many exceptions) when the non-constant Fourier part is damped by a
polynomial of lower degree. First thing not reached: alpha = beta = 1, the Epstein function itself.

## 6. What it explicitly does not do
Says nothing about the genuine E(z,s) for any z; gives no bound on the number or location of exceptional zeros.

## 7. Facts in our own record that this paper corrects or shows to be already known
- **Brief question (a) "for y large all zeros up to height T lie on the line":** no such theorem for E(z,s) was
  found. What exists: Ki 2005 (truncations, y >= 1, all but finitely many zeros), this note (modified functions),
  Lagarias-Suzuki (constant term). For E itself the true statement at large y fails at the real axis (two real
  off-line zeros for y >= 7.0556, `math0412039.md` section 7). (Reader's HEURISTIC, not found in any source: for
  fixed T and y -> infinity, the zeros of E(x+iy, .) with 0 < |Im s| <= T converge to those of a_0(y, .), which are
  on the line and simple for non-real zeros by Ki (Acta Arith. 124, not read, as quoted in Lagarias-Suzuki), and
  simple non-real zeros cannot leave the line under an O(e^{-2 pi y}) real perturbation; this would give "for y
  large, all non-real zeros up to height T on the line". Unproved here; the uniformity in T is the issue.)

## 8. Open questions the paper itself states
The case alpha = beta = 1 (the Epstein function), pointed out as "a really important case".
