BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# E. Bombieri, "Remarks on Weil's quadratic functional in the theory of prime numbers, I", Rend. Mat. Acc. Lincei (9) 11 (2000), no. 3, 183-233

Reader: READER-3, 2026-11-11. Status of the source: a "Memoria" in the Rendiconti Lincei (received 15 June
2000, final form 7 September 2000; MR1841692, Zbl 1008.11034). Cited in the literature both as "Bombieri 2000"
and "Bombieri 2001" (Suzuki): the same paper. No "part II" under this title was looked for or found; Bombieri's
2003 paper in Comm. Pure Appl. Math. ("A variational approach to the explicit formula") is a different text and
was NOT read.

## 1. What was read
- Obtained openly, with no login and no bot check, from the Biblioteca Digitale Italiana di Matematica (bdim.eu,
  a SIMAI/UMI project; its cover page allows free use for research and study):
  `http://www.bdim.eu/item?fmt=pdf&id=RLIN_2000_9_11_3_183_0`, 710 kB, 53 PDF pages (cover + pp. 183-233; the
  PDF is re-typeset by the library, with a text layer). Saved at `rh/library/src/bombieri-2000/bombieri2000.pdf`.
- Read: the `pdftotext -layout` output `b.txt`, 2,985 lines, **167,356 / 167,356 characters** (abstract, Italian
  summary, sections 1 to 13, acknowledgements, references). The layout garbles displayed formulas, so the pages
  carrying the statements quoted below (journal pp. 185, 199, 213, 216, 217, 221, 224, 226, 228) were rendered
  as images and read again; the remaining displays were read from the text layer only.
- Theorems are numbered 1 to 12 and lemmas 1 to 14 through the whole paper; equations by section.

Conventions of the paper. Multiplicative variable `x in (0, inf)`; `f*(x) = (1/x) f(1/x)`; "even" means
`f = f*`, "odd" `f = -f*`; Mellin transform `f~(s) = int f(x) x^{s-1} dx`. The functional (Theorem 2):
`T[f] = int f + int f* - sum Lambda(n){f(n) + f*(n)} - (log 4 pi + gamma) f(1)
 - int_1^inf {f(x) + f*(x) - (2/x) f(1)} x dx/(x^2 - 1)`; the quadratic functional is `T[f * conj(f)*]`
(multiplicative convolution with the transpose conjugate). Windows: `[1/M, M]`, `M = e^t`; so `t` is the
project's half-width `L`, and `M^2 = e^{2L}` is the Connes-Consani `lambda^2`. In sections 8 to 13 the
additive variable is used: `F(u) = e^{u/2} f(e^u)`, zeros written `rho = 1/2 + i gamma`, `Gamma` the multiset
of the `gamma` (so RH is "every gamma is real"), `F^(v) = int F(u) e^{ivu}`-type Fourier transform. In section
12 the window is an interval `I`, and `|I| = 2L`.

## 2. Main statements, with their numbers
### Unconditional, about zeta
- **Explicit Formula (section 2)**, for `f in C_0^inf((0, inf))`: `sum_rho f~(rho) = T[f]` in the form above; the
  last two terms equal `-(log pi) f(1) + (1/2 pi i) int_{(1/2)} Re[(Gamma'/Gamma)(w/2)] f~(w) dw`. Full proof given.
- **Theorem 1** ("strengthening of Weil's criterion"). "The Riemann Hypothesis holds if and only if
  sum_rho g~(rho) conj(g~(1 - conj rho)) > 0 for every complex-valued g(x) in C_0^inf((0, inf)), not identically
  0." Forward direction: under RH the sum is `sum |g~(rho)|^2`, and it cannot vanish because `g~` would have
  `(1/pi + o(1)) R log R` zeros in `|s| <= R` against `O(R)` for an entire function of exponential type.
  Converse: through Li's criterion and truncations `g_{n,eps}` of the inverse Mellin transforms of
  `1 - (1 - 1/s)^n`.
- **Theorem 2.** `T[f] = T[f*] = sum_rho f~(rho)` on `C_0^inf((0, inf))`; "the Riemann Hypothesis is equivalent to
  the statement that T[f * conj(f)*] >= 0 on C_0^inf((0, inf)), with equality only if f is identically 0."
  Added remark: positivity is equivalent to `T[g_{n,eps} * ...] > 0` for all `n >= 1`, `eps > 0`.
- **Lemma 1** (variational equations). For Problem 2 (minimise `T[f * conj(f)*]` on the unit sphere of
  `L^2(E)`, `E` a finite union of intervals): "lambda f(a) - L[f](a) = 0 for a in E" (4.2), with
  `lambda = T[f * conj(f)*]/||f||^2` and the "Euler-Lagrange linear operator"
  `L[f](a) = int f(ay) dy + int (1/y) f(a/y) dy - sum_n Lambda(n){f(an) + (1/n) f(a/n)} - (log 4 pi + gamma) f(a)
  - int_1^inf {f(ax) + (1/x) f(a/x) - (2/x) f(a)} x dx/(x^2 - 1)`.
  For Problem 1 (minimise on the unit sphere of `W_0 = W_0^{1,2}([1/M, M])`, norm `||Df||`, `D = x d/dx`):
  `lambda Delta f - L[f] = 0` on `(1/M, M)`, `Delta = -D - D^2` (4.1).
- **Lemma 2.** `|(f * conj(g)*)(x)| <= ||f|| ||g|| / sqrt x` for `f, g in L^2`; Hoelder-1/2 bound in `W_0`.
- **Lemma 3.** "For f in L^2 with compact support in [1/M, M] we have
  T[f * conj(f)*] = (1/2 pi) int Re[(Gamma'/Gamma)(1/4 + iv/2)] |f~(1/2 + iv)|^2 dv + O(M) ||f||^2. The constant
  involved in the O( ) symbol is absolute." (So the form is bounded below by `-C_1 M ||f||^2`.)
- **Theorem 3.** "Let E be a finite union of closed finite intervals in (0, inf). Then the infimum of
  T[f * conj(f)*] in the unit sphere of the space L^2(E) of L^2-functions with compact support in E is
  attained." (Proof: on a minimising sequence `int (1 + log^+|v|) |f~_nu(1/2 + iv)|^2 dv = O(1)` (4.4), which
  gives strong `L^2` convergence of a subsequence; then lower semicontinuity of the archimedean term. The
  introduction: "the proof ... hinges on the special structure of the term for the 'prime at infinity'".)
- **Theorem 4.** For Problem 1: "If lambda < 0, then this infimum is attained." ("We can prove the corresponding
  result for Problem 1 only in the hypothetical case in which T[f * conj(f)*] is negative for some f in W_0.")
- **Theorem 5.** "Let mu^+(M) and mu^-(M) be the infimum of T[f * f*] in the class of even and odd functions in
  L^2([1/M, M]) of norm 1. Then mu^+(M) and mu^-(M) are continuous decreasing functions of M." The written proof:
  "It is clear that the functions mu^±(M) are decreasing functions of M, so we need to prove continuity"; then,
  for a minimiser `f` on `[1/M, M]`, the variation `f_eps(x) = (1+eps)^{1/2} x^{eps/2} f(x^{1+eps})`, supported in
  the smaller window `[M^{-1/(1+eps)}, M^{1/(1+eps)}]`, gives
  `liminf_{eps->0} mu^±(M^{1/(1+eps)}) <= lim T[f_eps * f_eps*] = mu^±(M)`, the last limit "can be verified
  directly without much trouble". (This reader: with monotonicity that is continuity as the window grows up to
  `M` from inside; the limit from larger windows down to `M` is not argued in the text.)
- **Lemmas 5 to 7** (Problem 1, assuming a solution exists): `D^2 f` is a bounded function plus two Dirac masses
  at `M^{±1}`; `f~(s) = O((|s|+1)^-2)` in vertical strips; `L[f](x) = sum_rho f~(rho) x^{-rho}` (absolutely
  convergent); for `lambda != 0`, `lambda f(x) = sum_rho f~(rho) x^{-rho}/(rho(1-rho)) - A - B/x` on `(1/M, M)`
  and `f in C^{2,alpha}` inside.
- **Theorems 6, 7** (the "resolvent"; "results in this section are not used anywhere else"). The Fredholm-type
  determinant `D(Lambda; t) = det(I - Lambda H(Gamma; t))`, with `H(x, y; t)` an explicit kernel built from
  `sin(t(x-y))/(t(x-y))` (7.1)-(7.3) and indexed by ALL the ordinates of zeta, is well defined, entire in
  `Lambda` of order at most 1, the limit of its truncations; a zero `Lambda_0` gives a solution `f in W_0` of
  `Delta f = Lambda_0 L[f]` with Dirichlet conditions.
- **Theorem 12** (new proof of Yoshida's small-support positivity). "If F(x) has compact support in an interval
  I of length |I| < log 2 we have
  T[F(x) * conj F(-x)] = sum_gamma F^(gamma) conj(F^(conj gamma)) >= (log(1/|I|) - log^+ log(1/|I|) - O(1)) ||F||^2."
  The `O(1)` is not computed; so this proves positivity for `|I|` below an "explicitly computable" but
  uncomputed constant, not for all `|I| < log 2` (the hypothesis `|I| < log 2` only removes the prime terms).
  The paper reports of Yoshida 1992: he "verifies this positivity for t = (log 2)/2".

### Unconditional, about FINITE sets of points (no zeta, no arithmetic)
`Z` a finite multiset with `rho in Z => conj rho, 1 - rho in Z` (same multiplicity); `Gamma` its ordinates;
"complex pair" = a pair `(gamma, conj gamma)` with `gamma` not real.
- **Lemma 8, Lemma 9, Corollary.** The form `(L[F], F)`, `L[F](x) = sum_gamma int F(x+u) e^{i gamma u} du`, is
  real; the eigenvalues of Problem 1 for a finite set are real.
- **Lemma 10.** "The matrix H(Gamma; t) admits the eigenvalue 0 if and only if there is gamma in Gamma with
  multiplicity greater than 1, in which case the multiplicity of 0 as an eigenvalue is exactly
  sum'[m(gamma) - 1] ... Moreover if every gamma is real all eigenvalues of H(Gamma; t) are non-negative."
  Through the identity (8.14): `lambda sum_gamma w_gamma conj(w_{conj gamma}) = (1/4) int_{-t}^{t} |F|^2
  + int_{-t}^{t} |F'|^2`, `F(u) = Z(u) - A e^{u/2} - B e^{-u/2}` vanishing at `±t`, `Z(u) = sum z_gamma e^{-i gamma u}`,
  and the inequality (8.13) with its equality case `e^{u/2} ± e^{-u/2}`.
- **Theorem 8.** "The number of negative eigenvalues of the matrix H(Gamma; t) equals the number of distinct
  complex conjugate pairs (gamma, conj gamma) in Gamma." ("The main result of this section is quite general and
  does not depend on properties of zeta functions or arithmetic"; acknowledgements: "Theorem 8 was first
  discovered experimentally".) Proof: since 0 is never an eigenvalue while the points stay distinct, the
  signature is constant under deformation; then induction, adding one quartet (or one purely imaginary pair)
  far away, where it contributes eigenvalues asymptotic to `±B`, `B = sinh(2tb)/(2tb|gamma_0|^2)`.
- **Lemma 11, Lemma 12.** For Problem 2 the matrix is `K_E(Gamma) = (int_E e^{i(gamma - gamma')u} du)` (9.1). If
  `E = -E` it splits into `K_E^±(Gamma)`, `K_E^±(x, y) = int_E e^{i(x-y)u} du ± int_E e^{i(x+y)u} du`, indexed by
  `Gamma_0` (one representative of each `±gamma`); 0 is an eigenvalue iff there is a multiple `gamma`; "if every
  gamma is real all eigenvalues of K_E^±(Gamma) are non-negative"; identity
  `lambda sum z_gamma conj(z_{conj gamma}) = int_E |F|^2`.
- **Theorem 9.** "Let E be a finite union of bounded closed intervals. Then the number of negative eigenvalues
  of K_E(Gamma) equals the number of distinct complex conjugate pairs {gamma, conj gamma} in Gamma. Suppose also
  that E is symmetric. Then the number of negative eigenvalues of K_E^+(Gamma) equals the number of distinct
  complex conjugate pairs (gamma, conj gamma) with Re(gamma) > 0, and the number of negative eigenvalues of
  K_E^-(Gamma) equals the number of distinct complex conjugate pairs (gamma, conj gamma) with Re(gamma) >= 0."
  For every `E`, of any size. An off-line quartet `{±gamma_0, ±conj gamma_0}` is two pairs in `Gamma` and one in
  each of the even and odd blocks; a purely imaginary pair (a real zero off 1/2) is counted in the odd block
  only. Multiplicities do not count ("distinct").

### Conditional on "zeta has finitely many, and at least one, zeros off the line"
- **Lemma 13** (truncation to `|gamma| <= N`, `N` large, negative eigenvalue `lambda_N` of largest absolute
  value, eigenvector normalised in `l^2`): `1/2 <= sum_{gamma not real} |w_{gamma,N}|^2 <= 1`.
- **Theorem 10** (Problem 1). For `t > 0` there are `w_gamma`, `lambda <= 0` with `sum |w_gamma|^2 = 1`,
  `sum_{gamma not real} |w_gamma|^2 >= -sum_{gamma not real} w_gamma conj(w_{conj gamma}) >= 1/2`,
  `lambda w_gamma = sum_{gamma'} H(gamma, gamma'; t) w_{gamma'}`, such that with
  `Z(u) = sum w_gamma e^{-i gamma u}/(1/4 + gamma^2)`, `F = Z - (A e^{u/2} + B e^{-u/2})` vanishing at `±t` and
  `f(x) = phi(x) x^{-1/2} F(log x)`: "either T[f * conj(f)*] = lambda ||Df||^2 < 0 or f(x) is identically 0. In
  addition, if 0 < t < t_0 where t_0 is a suitable explicitly computable constant, the function f(x) must be
  identically 0."
- **Lemma 14, Theorem 11** (Problem 2). Same hypothesis; for any finite union of intervals `E` there are
  `z_gamma`, `lambda = lambda(E) <= 0`, `sum |z_gamma|^2 = 1`, at least half of the `l^2` mass on non-real
  `gamma`, `F(u) = sum z_gamma e^{-i gamma u}` locally in `L^2`, `lambda z_gamma = int_E e^{i gamma u} F(u) du` for
  every `gamma`, and "either T[f * conj(f)*] = lambda ||f||^2 < 0 or lambda = 0 and f(x) is identically 0";
  `F = 0` on `E` iff `liminf lambda_N = 0`.
- **Corollary to Theorem 11.** "Let E in (0, inf) be a finite union of bounded closed intervals and suppose that
  T[f * conj(f)*] >= 0 for every smooth function f with compact support in E. Then either the Riemann
  Hypothesis is true, or zeta(s) has infinitely many zeros off the critical line, or the functions x^{-rho} are
  linearly dependent over E, for a suitable sequence of coefficients {c_rho} in l^2 such that at least half of
  its l^2-mass is supported on the set of zeros rho with Re(rho) != 1/2."
  Introduction's version (from Theorem 10): RH, or infinitely many off-line zeros, or a combination
  `sum_rho c_rho x^{-rho}/(rho(1-rho)) + A + B/x`, `sum |c_rho|^2 = 1`, vanishing identically for
  `1 <= x <= M_0`, `M_0 > 1` "explicitly computable".
- **"An Example"** (after the Corollary): two Dirichlet L-functions `L(s, chi)`, `L(s, chi')`, same modulus, same
  parity, distinct primitive characters, `p_0` the first prime where they differ: for `f` supported in
  `(1/p_0, p_0)` the two explicit formulas coincide, so `sum_rho f~(rho) - sum_rho' f~(rho') = 0`, a linear
  relation among `a^{-rho}`, `a^{-rho'}` on an interval. "As pointed out by J. Bourgain, the existence of linear
  relations over intervals of arbitrary length also follows from the fact that the gap between consecutive
  gamma's tends to 0".

### Numerical observations (section 13; no tables, nine figures)
First `N <= 160` zeros of zeta plus a "fictitious zero" `rho_0 = 0.52 + 3.14 i` with its images; Problem 2 on
`E = [-t, t]`. "The numerical evidence gathered here indicates in each case the existence of a critical value
t_c^± > 0 such that the unique negative eigenvalue lambda_N^±(t) tends to 0 if t < t_c^±, as N -> inf. The rate of
convergence is quite fast, suggesting an exponential rate. For t > t_c^± this eigenvalue converges, albeit less
rapidly so, to a strictly negative value." No value of `t_c^±` is printed (the figures use `t = 0.48` as
"`t < t_c^+`" and `t = 2.3` as "`t > t_c^+`"). For `t < t_c^±` the normalised eigenfunctions "converge weakly to
0" and "the L^2-mass of the function gets more and more concentrated at the boundary of the interval (-t, t)".
Footnote 11: experiments with a fake zero added to the first `k` zeros, "k up to 320".

## 3. The method in ten lines
1. Write Weil's functional on functions supported in a window and minimise its Rayleigh quotient, in two
   norms: `L^2(E)` (Problem 2) and the `H^1`-type norm `||Df||` with Dirichlet conditions (Problem 1).
2. The archimedean term is `(1/2 pi) int Re(Gamma'/Gamma)(1/4 + iv/2) |f~|^2`, of size `log|v|`; everything
   else is `O(M)||f||^2`. That logarithm gives compactness of minimising sequences: the infimum is attained.
3. The Euler-Lagrange equation says `lambda f = L[f]` on the window, and on the zero side
   `L[f](x) = sum_rho f~(rho) x^{-rho}`: an extremal is, inside the window, a combination of the `x^{-rho}`.
4. Insert that ansatz: the unknowns become coefficients indexed by the zeros, the operator becomes an infinite
   matrix (`H(Gamma; t)` or `K_E(Gamma)`) whose entries are integrals of `e^{i(gamma - gamma')u}` over the
   window.
5. For a FINITE symmetric set of points this matrix has real eigenvalues, and a quadratic identity
   (`lambda sum z_gamma conj z_{conj gamma} = int_E |F|^2`) shows that 0 is an eigenvalue only when two points
   coincide (finitely many exponentials are independent on an interval).
6. Hence the signature cannot change while the points move without colliding; count it by sending one
   off-line quartet to infinity: each complex pair gives exactly one negative eigenvalue (Theorems 8, 9).
7. Truncate zeta's zeros at height `N`; if finitely many are off the line, a negative eigenvalue `lambda_N`
   exists for large `N`, with at least half of its eigenvector's mass on the off-line zeros.
8. Let `N -> inf`. Either `lambda_N` stays away from 0, and the limit is a function on the window with
   negative Weil energy; or `lambda_N -> 0`, and the limit is a non-trivial `l^2` linear relation among the
   `x^{-rho}` on the window.
9. For very small windows the form is positive by a direct estimate (Theorem 12: the `log` of the archimedean
   symbol beats everything once `|I|` is small), so there only the second alternative remains.
10. The work is in steps 5 and 6 (pure linear algebra, found experimentally) and in the compactness of step 2;
    the limit of step 8 is where the argument stops being a count.

## 4. What is assumed
- Sections 2 to 7, 12: nothing. Sections 8, 9: nothing (finite sets of points; no arithmetic).
- Sections 10, 11 (Lemma 13, Theorems 10, 11, the Corollary's middle alternative): that zeta has only finitely
  many zeros off the line. ("It should also be possible to replace the assumption ... by a suitable density
  hypothesis": not done.)
- Theorem 1's forward direction uses that the zeros of zeta give `>> R log R` zeros of `g~`; the paper does not
  discuss multiplicity there (the count needed is of distinct points).
- Section 13: numerics, no error analysis, no tables.

## 5. Where its frontier is
**Last things proved.** (a) For zeta: the bottom of the form on any finite union of windows is attained
(Theorem 3), the parity bottoms are decreasing (and, as claimed, continuous) in the window (Theorem 5), and the
form is positive on sufficiently small windows with a bottom `>= log(1/|I|) - log^+ log(1/|I|) - O(1)`
(Theorem 12). (b) For finite point sets: the exact number of negative eigenvalues, per parity block, on every
window (Theorems 8, 9). (c) For zeta with finitely many off-line zeros: on each window, negativity of the form
or an `l^2` linear relation among the `x^{-rho}` with at least half its mass off the line (Theorems 10, 11).

**First things it cannot do.** Decide between the two alternatives of (c) on a given window: "the main
question here is to decide whether or not this negative eigenvalue stays bounded away from zero, as we
approximate the infinite dimensional matrix by its finite dimensional truncations". "The question of linear
independence which arises in (iii) is of some interest and, although probably quite difficult, deserves study."
The count of Theorems 8, 9 is therefore not carried to the infinite set of zeros: for zeta itself the paper
proves no statement of the form "the form on the window `E` has exactly (or at least) so many negative
squares", only the dichotomy, and the numerics of section 13 say that below a critical window the negative
eigenvalue of the truncations disappears in the limit.
Also not reached: attainment for Problem 1 when the infimum is `>= 0` (Theorem 4 needs `lambda < 0`); any
regularity of the `L^2(E)` minimiser (the paper suggests "viscosity solutions", minimisers of
`T[f * conj(f)*] + eps ||Df||^2`, and does not study them); the constants `O(1)`, `t_0`, `M_0` ("explicitly
computable", not computed).

## 6. What it explicitly does not do (checked over the whole text)
- No positivity for any window containing a prime; no value or bound for the bottom of zeta's own form beyond
  Theorem 12; nothing about its size for larger windows, no prolate functions, no decay law.
- No operator-theoretic statement (no self-adjoint operator, no discreteness of the spectrum, no form domain
  named); the zero-side formula is stated on `C_0^inf` (Theorem 2) and for `W_0` solutions (Lemma 6), not on
  the `L^2(E)` form domain.
- No statement about zeros of the transform of a minimiser. No simplicity of the bottom eigenvalue, no
  statement that the minimiser is even.
- No use of the Euler product beyond the explicit formula itself: sections 8 to 11 use only the symmetries and
  the density of the ordinates. No variation of the prime-side data.
- No count of negative squares for the actual window form of zeta or of any function with infinitely many
  zeros; no statement "at most one negative square implies RH"; no monotonicity of a negative index in the
  window.
- No derivative of `mu^±(M)` in `M`; no statement naming a first window where positivity fails (the critical
  `t_c^±` appears only in the numerical section, for truncations with a fake zero).
- The Neumann variant of Problem 1 for odd functions ("The analysis of this problem will not be done in this
  paper").
- Loose ends noticed by this reader (none affects a statement above): the proof of Theorem 7 cites "Theorem 5"
  where Theorem 6 is meant and "(7.6)" where the linear system is (7.4); section 12 says its positivity
  statement is "needed for the proof of the Corollary to Theorem 8" (it is used for Theorem 10); "the analogue
  of Theorem 8" before Theorem 11 means Theorem 10; the captions of Figures 2 and 3 read "0 < t < 0.55" where
  the axes run to 5.5.

## 7. Facts in our own record that this paper corrects or shows to be already known
Nothing here was recomputed. "This reader" marks a comparison made in this note.

### docs/IDEAS.md #22, rh/THEORY.md T29, T30, docs/JOURNAL.md J4 ("the per-block count of Theorem 4, both waiting on Yoshida 1992 and Bombieri 2000")
The record's kill line for novelty reads: "Bombieri 2000 or Yoshida 1992 turn out to contain the per-block
count with attainment; then this entry is only a citation." What Bombieri 2000 contains, exactly:
- **For finite symmetric sets of points, the per-block count with attainment is Theorem 9**, on every window
  (any finite union of intervals; blocks for symmetric `E`), with the same exclusion of multiplicity ("distinct")
  and the refinement that a real off-line pair is seen by the odd block only. Theorem 8 is the same count in the
  `H^1` normalisation. (Bombieri's matrices are indexed by the zeros, not by test functions; the paper passes
  between an eigenvector `{z_gamma}` and the function `F = sum z_gamma e^{-i gamma u}` on `E` in (9.3) and (11.1) to
  (11.3). That the negative eigenvalues of `K_E(Gamma)` are the negative squares of the finite-set form on
  `L^2(E)` is this reader's reading of those lines, not a sentence of the paper.) The proof is a deformation
  argument, not the record's multiplier `cos(tz)[sinc^K + sinc^K]`.
- **For zeta (infinitely many ordinates) the count is NOT in the paper.** T29 (1) (at most `nu` negative
  squares on every window, at most `nu/2` per block), T29 (2) (monotone in `L`), T29 (3) (equality for
  `L >= L_0`) and T29 (4) are not stated. In their place: for truncations at height `N`, the number of negative
  eigenvalues is exactly the number of off-line pairs once `N` is large (abstract: "precisely one-half of the
  number of zeros failing to satisfy the Riemann Hypothesis, provided the truncation is big enough"), and in
  the limit the dichotomy of Theorems 10, 11 under the hypothesis of finitely many off-line zeros.
- So the secondary attribution in the record ("credits Bombieri 2000 with the upper-bound half for large
  truncations") is imprecise: Bombieri has the EXACT count for finite sets (hence for all large truncations),
  including per parity block; he has no bound for the untruncated form.
- T30 (1) / Corollary C1 ("at most one negative square on every window <=> RH"): not in the paper.
- T30 (2) (one parity block suffices): the paper reports Yoshida's result as "the positivity of the functional
  in the class of smooth even functions with compact support is equivalent to the validity of the Riemann
  hypothesis excluding real zeros", consistent with what the record took from Suzuki; Theorem 9's even block
  not counting purely imaginary pairs is the finite-set form of the same fact.
- **docs/IDEAS.md #20, by-product** ("one even + one odd negative square per off-line quartet (heuristic; seen
  for the impostor as 1+1 then 2+2)"; novelty "UNSEARCHED"): for finite point sets this is Theorem 9, in print
  since 2000.
- **docs/IDEAS.md #17 (zero-surgery controls) and the judge's test J17**: the experiment "zeta's zeros plus one
  planted off-line quartet, watch the window form" is section 13 of this paper (a fake zero ADDED at
  `0.52 + 3.14 i`, up to 160 or 320 zeros, even and odd blocks separately), with the observation of a critical
  window `t_c^±` per parity block. No numbers are printed there, so nothing can be compared digit by digit.
  The record's caution "on small windows the negative eigenvalues are below 1e-8 of the top eigenvalue"
  corresponds to the paper's "tends to 0 ... suggesting an exponential rate" for `t < t_c^±`.

### rh/THEORY.md T35, T2, T37 and docs/IDEAS.md #8
- **T35** (the lowest window eigenvalue is non-increasing in the window): in print here, for each parity
  block, as part of Theorem 5 ("It is clear that the functions mu^±(M) are decreasing functions of M"), 2000;
  again in Connes-Consani-Moscovici 2511.22755, (3.27). The note in T35 ("no monotonicity statement was found
  in the literature read") is superseded.
- **T2** (continuity, credited to Suzuki 2026 Thm 1.3) and the record's remark on #8 ("Thm 1.3 gives continuity
  of the minimum of the two parity bottoms, not of each"): Theorem 5 of this paper CLAIMS continuity of each
  parity bottom. Its written proof is the one-sided dilation argument described in part 2; Suzuki's comments
  ("the details of the proof are not fully provided there", "calls for a more careful analysis", as quoted in
  `rh/library/2606.09096.md`) refer to this theorem.
- **#8, new-input field** ("An equation instead of an inequality: the extremal vector's Euler-Lagrange equation
  ... Weil's criterion contains no such object") and **T38** (the equation of a null vector, all terms): the
  Euler-Lagrange equation with all its terms is Lemma 1, (4.2), of this paper; T38's displayed equation is (4.2)
  with `lambda = 0` in the additive variable (this reader's term-by-term reading; Suzuki calls it "Bombieri's
  Lagrangian").
- **#8, first-failure window / T37**: the paper does not state the first-failure equivalence. What it has that
  bears on it: Theorem 5; the Corollary to Theorem 11 (on any window where the form is `>= 0`, RH, or
  infinitely many off-line zeros, or an `l^2` linear relation among the `x^{-rho}` on that window with half its
  mass off the line); and the numerical critical values `t_c^±` of section 13. The record's T38 parenthesis
  (for a null vector, `sum_gamma m_gamma psihat(gamma) e^{-i gamma x}` vanishes on the window) and T39 (c) are
  statements of the same kind as alternative (iii), reached differently (from a null vector at the first
  failure, with no hypothesis on the number of off-line zeros; Bombieri from limits of eigenvectors of
  truncations, on any window where the form is non-negative, assuming finitely many off-line zeros).
- **T40** (end-point regularity of a first-failure null vector; open): no theorem here. Related text: for
  Problem 1, Lemma 5 (two Dirac masses of `D^2 f` at the ends, `C^{1,1}` inside); for Problem 2 only the
  suggestion of viscosity solutions; numerically, below `t_c^±` "the L^2-mass ... gets more and more
  concentrated at the boundary", and "one should study the asymptotic behaviour of eigenfunctions at the
  boundary, after the appropriate rescaling. This should be of particular interest at the critical value
  t = t_c^±".
- **T41** (simplicity and parity of the first null vector), **T42** (derivative formula): nothing in the paper.

### rh/THEORY.md T10, T36, T80
- **T10 (1), (3)**: that the form on a window is bounded below and that its infimum is ATTAINED is Theorem 3 of
  this paper (with Lemma 3), for any finite union of intervals, 25 years before the Connes-Consani-Moscovici
  operator statement (Thm 3.6, Cor. 3.7 of 2511.22755) to which T10 credits the ground state. The paper has no
  operator, no discreteness and no domain statement; its proof does exhibit the quantity
  `int (1 + log^+|v|)|f~(1/2 + iv)|^2 dv` (4.4) that the later papers use as the form norm.
- **T36 (i)** (under RH the form is strictly positive; proof by "Jensen's formula: fhat has O(r) zeros in
  |z| <= r, against >> r log r distinct real ordinates"): for `g in C_0^inf` this is the forward half of Theorem 1
  here, with the same argument. The paper does not treat the form domain, and does not mention distinctness.
- **T80** (zero-side formula on the whole form domain; open): not supplied by this paper (Theorem 2 is on
  `C_0^inf`; Lemma 6 is for `W_0` solutions with `f~(rho) = O(|rho|^-2)`).
- **T36 (ii), T39 (c)** (a non-positive vector must carry weight on off-line zeros; energy identity): the
  paper's counterpart in zero-indexed coordinates is Lemma 13 and the identities (10.2), (11.3): for a negative
  eigenvalue, `-sum_{gamma not real} z_gamma conj(z_{conj gamma}) >= sum_{gamma real} |z_gamma|^2`, hence at least
  half of the `l^2` mass on the off-line ordinates.

### docs/IDEAS.md #2, #9; rh/THEORY.md T11, T43, T44; rh/NOTEBOOK.md N34 to N39
- **#2** (law for the lowest eigenvalue): nothing on the size of zeta's lowest window eigenvalue beyond
  Theorem 12's lower bound `log(1/|I|) - log^+ log(1/|I|) - O(1)` for small windows (compare Suzuki's Thm 1.4
  `lambda_a = log(1/a) + const + O(a)` in T2). No prolate functions.
- **#9**: the weights are never varied. The Example (two Dirichlet L-functions with the same Gamma factor and
  the same Euler factors below `p_0` have the same form on windows inside `(1/p_0, p_0)`) is the paper's only
  statement about what a window cannot distinguish.
- **T11** (real zeros of the minimiser's transform), **T43, T44**: nothing.
- **N34 to N39**: no counterpart (no Perron structure, no damping off the line, no multiplier cone, no cubic,
  no function-field twin, no one-signed solution). The method of images or sign of the Gamma kernel is not
  discussed; in Theorem 12 the pole term is simply bounded by `4a cosh(a/2)||F||^2`.

### docs/JOURNAL.md J4 and the other library notes
- **J4**, "Wrong in our record: 'window positivity published up to log 100' (... proved range is lambda^2 <= 2)":
  consistent. This paper's own positivity theorem covers only `|I|` below an uncomputed constant; it reports
  Yoshida's verified case as `t = (log 2)/2` (window `[2^{-1/2}, 2^{1/2}]`).
- **rh/library/yoshida-1992.md** (secondary reports only): this paper adds two secondary sentences on Yoshida
  (introduction): positivity on smooth even compactly supported functions "is equivalent to the validity of the
  Riemann hypothesis excluding real zeros"; and "he shows how the positivity of this functional for functions
  supported in a fixed interval [-t, t] can be reduced to a finite calculation (depending on t), and verifies
  this positivity for t = (log 2)/2".
- **rh/library/2608.24827.md (Zhu)**, part 7, "classical 2L <= log 2 which it attributes to Yoshida and
  Connes-Consani": consistent with the above. Zhu's Proposition 2.3 (under RH, a uniform `c_L > 0` on each
  window) is not in this paper; Theorem 1 here gives, under RH, strict positivity for each non-zero
  `g in C_0^inf`, with no uniform constant.
- **rh/library/connes-consani-zeta-cycles.md**, "In [Yoshida 1992], the positivity was shown to hold for
  lambda = sqrt 2": the same case as Bombieri's `t = (log 2)/2`.
- **rh/library/2606.09096.md (Suzuki)**: its citations of this paper (Lemma 3 for the form of the functional;
  Theorem 5 for continuity of `lambda_a^±`; "Bombieri's Problem 1") are accurate.
- **rh/library/README.md**, reading list row "Bombieri ... lowest eigenvalue, continuity claim | unread": now
  read whole; the continuity claim is Theorem 5.

## 8. Open questions the paper itself states
- Whether, for zeta, the negative eigenvalue of the truncations stays bounded away from 0 on a given window
  ("the main question here").
- "The question of linear independence which arises in (iii) is of some interest and, although probably quite
  difficult, deserves study"; "a deeper study of the eigenvectors associated to finite approximations may shed
  some light on this question of linear independence".
- "We suggest that splitting the eigenvalue problem into its even and odd components and complexifying it with
  the help of Cramer's function V(z) = sum_{Re gamma > 0} e^{i gamma z} may bring the problem to a form amenable
  to the ... Riemann-Hilbert techniques".
- To replace "finitely many zeros off the line" by "a suitable density hypothesis"; to extend to Dedekind zeta
  functions ("All results of this paper extend, mutatis mutandis").
- The Neumann variant of Problem 1 for odd functions; viscosity solutions for the regularity of Problem 2.
- The behaviour of eigenfunctions at the boundary of the window, "of particular interest at the critical value
  t = t_c^±, which represent[s] the transition from weak convergence to 0 to strong convergence in L^2".
