BACKGROUND ONLY: what these notes establish and where they stop. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# P. Garrett, public notes on pseudo-Laplacians, pseudo-cuspforms and the Bombieri-Garrett programme (2009-2026)

Reader: READER-5, 2026-11-11. These are informal, unrefereed notes from Garrett's "Vignettes" page
(`https://www-users.cse.umn.edu/~garrett/m/v/`). A bundle note, one part per document, because each document is
short. None of them is a journal paper. Companion digests: `2002.07929.md` (the joint paper),
`cdv-pseudo-laplaciens-1982.md`, `cdv-pseudo-laplaciens-1983.md`.

## 1. What was read
Obtained openly (no login, no bot check). The host's TLS chain ends at the root "emSign Root CA - G1", which is
missing from this machine's store; it is in Mozilla's root list, so the files were fetched with curl verifying
against Mozilla's bundle (from curl.se) plus the proxy CA. Saved under `rh/library/src/garrett/`, converted with
`pdftotext -layout`, read as text.

| document | date (PDF) | size | read |
|---|---|---|---|
| "Concise statement of theorem(s) with Bombieri" (`concise_statement_Poland.pdf`), Building Bridges, Bedlewo | 23 Aug 2026 | 1 p. | whole |
| "Some examples/exercises" for the same course (`exercises_for_Poland.pdf`) | 5 Aug 2026 | 2 pp. | whole |
| "Bibliography for Building Bridges 2026" (`Poland_biblio.pdf`) | 22 Aug 2026 | 13 pp. | **keyword scan only** (entries on Bombieri, Garrett, Colin de Verdiere, Hejhal, Haas, Lax-Phillips, pseudo) |
| "Self-adjoint operators on automorphic forms", Bristol talk notes (`bristol_2018.pdf`) | 30 Jun 2018 | 19 pp. | whole (60,317 ch) |
| "Pseudo-cuspforms, pseudo-Laplacians" (`pseudo-cuspforms.pdf`) | 12 Aug 2011 | 10 pp. | whole (39,379 ch) |
| "Colin de Verdiere's meromorphic continuation of Eisenstein series" (`cdv_eis.pdf`) | 1 Nov 2025 | 28 pp. | whole (105,730 ch) |
| "An iconic error ... computing Maass-Selberg relations" (`iconic_error.pdf`) | 22 Sep 2009 | 2 pp. | whole |
| "Simplest automorphic Schrodinger operators" (`simplest_afc_schrodinger.pdf`) | 5 Aug 2026 | 6 pp. | whole |
| "Designed Pseudo-Laplacians", current version on the page (`Bombieri-Garrett_current_version.pdf`) | 15 Feb 2020 | 80 pp. | word-level diff against arXiv 2002.07929 v1: same text, typography only |

No arXiv paper of Garrett alone on pseudo-Laplacians exists (arXiv API search by author: only 2002.07929 and
unrelated papers). "Colin de Verdiere's meromorphic continuation" and "pseudo-cuspforms" are the web notes above,
not arXiv papers. Not fetched: Garrett's book (CUP 2018), his IAS/ICERM videos (2013), "Global automorphic Sobolev
spaces" (cited 2010 note), "Discreteness of pseudo-cuspforms for GL(n)".

## 2. What each document states

### 2a. Concise statement (Aug 2026): the current form of the Bombieri-Garrett theorem
"(This is joint work with E. Bombieri, beginning in 2011, and on-going.)" For theta a compactly supported
distribution of order 0 on SL_2(Z)\H; examples: for fundamental discriminants D, theta_D = sum of f(z_0) over CM
points (D < 0) or sum of integrals of f over the closed geodesics ("Maass cycles", D > 0), with
`theta_D E_s = xi(s) Lambda(s, chi_D)/xi(2s)`. Let Delta~_theta be the Friedrichs extension of Delta restricted to
{f in C_c^inf : theta f = 0, f orthogonal to cusp forms}.
- **[1.1] Theorem**: "The discrete spectrum, if any, of Delta~_theta consists of lambda = s(s-1) with theta E_s = 0
  and Re(s) = 1/2 (and possibly other -1/4 <= lambda <= 0)."
- **[1.2] Remark**: "Unfortunately, Montgomery's pair correlation implies"
- **[1.3] Theorem**: "At most 94% of the zeros of zeta(s) could participate in spectrum of Delta~_{theta_D}."
New relative to the 2020 paper: the real-quadratic (geodesic period) case D > 0 is included in the statement. No
new result on existence of eigenvalues.

### 2b. Bristol 2018 notes (expanded half of a joint talk; "Details will appear elsewhere")
Same programme as the 2020 paper, with these statements not in that form in the paper:
- History: Haas (1977) effectively solved (Delta - lambda_s)u = A delta^afc_omega (misapplied Henrici collocation);
  Stark, Terras, Hejhal; Cartier's letters to Weil (1979) "Comment l'hypothese de Riemann ne fut pas prouvee".
- Sobolev index: on all of L^2 the automorphic delta is in H^{-1-eps} but not H^{-1} ("The same is true in
  Euclidean spaces, already for local reasons"); restricted to the non-cuspidal part (Colin de Verdiere's
  suggestion, "Modifying slightly the literal assertion there"), the H^r norm is finite "for r <= -1" by
  Hardy-Littlewood's second moment and convexity for L(s, chi_{-3}).
- Section 4, **Corollary**: "Despite the above meromorphic continuation, the resolvent (T - lambda_w)^{-1}:
  E^0 -> E^0 does not have a meromorphic continuation to Re(w) = 1/2 and beyond. It does have a meromorphic
  continuation as a map (T - lambda_w)^{-1}: E^0 -> C^0(Gamma\H)." The continued u_w is not in E^{1+eps} for
  Re w < 1/2 unless E theta(w) = 0. The apparent w <-> 1-w symmetry of theta(u_w) "is illusory", compared to a
  Cauchy integral over a circle, which is holomorphic inside and outside but the outside function is not the
  continuation of the inside one.
- Section 5, Corollary: on Re w = 1/2, lambda_w is an eigenvalue of T~_theta iff E theta(w) = 0 and theta(u_w) = 0;
  "the leading term and the main term are real, and the third term is purely imaginary. Thus, both must vanish".
- Section 6 (two constraints theta, eta_a): the 2x2 determinant condition; "Claim: This vanishing condition is
  symmetric under w -> 1-w. Thus, all zeros of this expression are on Re(s) = 1/2 u [0,1]."
- Section 7 (exotic expansions): at most one solution w of (Delta - lambda_w)u = theta, theta u = 0, between
  consecutive Lax-Phillips parameters with theta(f_n) != 0.
- Section 8: the 94% argument, with "Montgomery's pair correlation (for simplicity presented in the conjecturally
  strongest form)".
- Section 1 and 9, "Spacing of zeros": "half the on-line zeros w_o of J(w) (depending on sign of derivative) repel
  upward the on-line zeros s_o of zeta_k(s)": Im(s_o) - Im(w_o) >= (1/2 - eps) x average spacing >= (1/2 - eps)
  pi/log T; Corollary 9.0.1 = Cor. 76 of the 2020 paper.
- Section 10: background on deficiency indices, Friedrichs, an example operator with no self-adjoint extension.

### 2c. "Pseudo-cuspforms, pseudo-Laplacians" (Aug 2011; "Thanks to E. Bombieri for some corrections, comments,
and additions")
- Pseudo-cuspforms: exponential decay, constant term vanishing above some height, eventually a Delta-eigenfunction;
  equivalently (Delta - lambda)f = T for a compactly supported automorphic distribution T. Three cases: T at a point
  (definite SO(2)), T on a closed geodesic (anisotropic SO(1,1)), T = constant term at height a.
- [0.5]-[0.8]: the constant term of the solution u_w for large y is T E_w y^{1-w}/(1-2w). For T f = f(omega):
  T E_s = 3 (sqrt3/2)^s zeta_k(s)/zeta(2s), so u_w (continued) has vanishing constant term above sqrt3/2 exactly
  at zeros of zeta_k. Same for a closed geodesic, k = Q(sqrt2): T E_s = C^s Gamma(s/2) zeta_k(s)/(Gamma((s+1)/2)
  zeta(2s)). For T = constant term at height a: the condition is a^w + c_w a^{1-w} = 0, "not as provocative".
- [0.9] "the slight roughness sabotages straightforward arguments ... We cannot immediately conclude that lambda in
  R and lambda <= 0." Footnote: "Even if this device were to succeed, it would not exclude Siegel zeros".
- [0.10] Hejhal's objection: for most z_o, s -> E_s(z_o) has zeros off the line (Potter-Titchmarsh 1935 for
  sqrt-5; Davenport-Heilbronn 1936 zeros in Re s > 1 for class number > 1; Voronin 1976 in 1/2 < Re s < 1). The
  "weak counter-objection" (use the full class-group sum, giving zeta_K/zeta(2s)) "However, there is no palpable
  compulsion to do so".
- [0.12] Lax-Phillips: for a > 1 the new discrete spectrum of Delta~_a with |lambda| > 1/4 is truncated Eisenstein
  series, "unfortunately having no impact on location of zeros of zeta. Thus, to have a chance of obtaining other
  eigenfunctions, take a lower, for example, a = sqrt3/2."
- [0.13] "Friedrichs' construction demonstrably puts all eigenfunctions inside a +1-index Sobolev space ... the
  fundamental solution itself could not possibly be an eigenfunction for any Friedrichs extension." The
  constant-term and closed-geodesic distributions are in H^{-1/2-eps}. Colin de Verdiere 1983 projects u to the
  orthogonal complement of the discrete spectrum (pi_c u), shows pi_c u is in H^{+1} (Motohashi; "as Bombieri
  notes, the classic [Hardy-Littlewood 1918] suffices"); realness of the pseudo-eigenvalue would follow from
  pi_c u(omega) = 0, i.e.
  `0 = int_0^inf |zeta_k(1/2+it)|^2 dt / (|zeta(1+2it)|^2 (-1/4 - t^2 - s_j(s_j - 1)))` (with zeta_k(s_j) = 0).
  **"Bombieri notes [in an email of 02 August, 2011 to this author] that the numerical conjecture made (in effect)
  by Colin de Verdiere does not hold. Namely, that specific pseudo-Laplacian's eigenvalues are sufficiently
  precisely computable (for those who know how) so that the s-parameters for eigenvalues can be distinguished from
  the (known) roots of the relevant zeta and L-functions."** No numbers are given.

### 2d. "Colin de Verdiere's meromorphic continuation of Eisenstein series" (2011, updated Nov 2025)
An exposition of CdV 1981/82/83 for SL_2(Z), with proofs: density of test functions; [2.0.3] E~_s = h_s -
(Delta~ - lambda)^{-1}(Delta - lambda)h_s continues E_s to Re s > 1/2 off (1/2, 1] (hence zeta to Re s > 0);
[3.2] constant terms of Sob(+1) functions are continuous ("We do not lose anything in the Sobolev index when
projecting to the constant term"); [4.3.1] domain of Delta~_a = {f : Delta f in L^2_a + C T_a} (delta' excluded by
the local Sobolev index: delta_a in Sob(-1/2-eps) not Sob(-1/2)); [5] compactness of Sob(+1)_a -> L^2_a (Lax-Phillips
p. 206) and [5.0.3] meromorphic compact resolvent; [6] discreteness of cusp forms, with the warning that no
individual L^2_a is stable under the resolvent of Delta~ (Fourier/Paley-Wiener argument); [7.4.1] A_s E_s =
E~_{a,s} + Phi_s gives the continuation; [7.5] |c_s| = 1 on the line, no poles there; [8] truncated Eisenstein
series with a^s + c_s a^{1-s} = 0 are eigenfunctions of Delta~_a; conversely (sketch) every eigenfunction with
lambda_z < -1/4 is one; [8.3.2] "even truncated Eisenstein series with lambda_z not in R decompose discretely ...
as linear combinations of those with a^s + c_s a^{1-s} = 0"; appendices: Friedrichs, Maass-Selberg relation and
its limit on the line. No statement about zeros of zeta beyond Re s > 0 continuation.

### 2e. "An iconic error" (2009)
Truncated Eisenstein series are not Delta-eigenfunctions in any useful sense (if they were, they would be
orthogonal for distinct eigenvalues, hence zero); the correct Maass-Selberg formula.

### 2f. "Simplest automorphic Schrodinger operators" (Aug 2026)
-Delta + q with q >> y^eps in the cusp has compact resolvent ([1.0.1]); the Hecke-integral functional
f -> Lambda(f, s) = int y^{s-1/2} f(iy) dy/y lies in B^{-1}(-Delta + q) for 1/2 <= Re s < alpha/2 when
q >> y^alpha ([2.0.1]); q = y^2 in the cusp gives a Hilbert-Schmidt resolvent ([3.0.1]). No zeros, no eigenvalues
related to L-functions.

### 2g. Exercises (Aug 2026)
Standard exercises; relevant ones: 8 (determine the exotic eigenfunctions of the Lax-Phillips pseudo-Laplacian),
12 (E_s(i) = zeta_{Q(i)}(s)/zeta(2s)), 13 (Landau: zeta(2s-1)zeta(2s) has Euler product and functional equation but
no zeros on the critical line).

## 3. Method in ten lines
The same as in `2002.07929.md` part 3; the notes add: (i) the Sturm-Liouville analogy (sin(nx/2) on [0, 2 pi]):
Friedrichs extensions "ignore" order-zero distributions on the constraint set, which is why non-smooth functions can
be eigenfunctions; (ii) the Sobolev bookkeeping (Friedrichs puts eigenfunctions in H^{+1}; delta at a point is in
H^{-1-eps} on L^2 for local reasons, so the cuspidal part must be removed); (iii) the resolvent continues only as a
map into continuous functions, not on E^0.

## 4. What is assumed
Notes, mostly with proofs sketched; the 94% statement assumes RH and pair correlation ("conjecturally strongest
form"). The 2011 refutation of Colin de Verdiere's numerical conjecture is a report of a private email, no data.

## 5. Where the frontier is (as these notes state it)
- Proved: discrete spectrum of Delta~_theta, IF ANY, lies at s(1-s) for on-line zeros of theta E_s (CM points and,
  in 2026, closed geodesics); eigenvalue iff also theta(u_w) = 0; at most one eigen-parameter between consecutive
  Lax-Phillips parameters; at most 94% of zeros of zeta under RH + pair correlation; the two-constraint
  determinant has zeros only on the line.
- Not proved / stated as missing: existence of any eigenvalue; the resolvent on E^0 does not continue past the
  line (Bristol §4); Colin de Verdiere's conjecture is reported false numerically (2011).
- In August 2026 the work is described as "on-going"; no new paper found.

## 6. What it explicitly does not do
- Nothing on zeros off the line other than: they cannot be eigenvalues (self-adjointness) and the naive symmetry
  argument fails (Bristol §1 "illusory"). Siegel zeros on (1/2, 1] would not be excluded even by success (2011
  footnote 10). Hejhal's objection (Epstein zetas) is recorded and not answered.

## 7. Facts in our own record that these notes correct or show to be already known
- **rh/NOTEBOOK.md N43, "WHAT I RECALL"**: the 2026 concise statement is the authors' own summary and matches part
  7 of `2002.07929.md`: spectrum contained in on-line zeros, "if any"; "at most 94%" from pair correlation. N43's
  phrase "whose discrete spectrum is lambda_s for zeros of E(omega, s)" overstates it.
- **N43, second sheet**: the Bristol notes state outright that the E^0-valued resolvent has NO continuation past
  Re w = 1/2; only the C^0-valued (pointwise) one exists, and on it theta(u_w) at w and at 1-w differ by the
  E theta product. So the "second sheet" of N43 exists only as the continuation of a scalar (or C^0-valued)
  function, not of an operator on the Hilbert space; this is already in the authors' notes (2018).
- **rh/specialists/operator/OBJECT_PHI.md §3(a)** ("pseudo-Laplacian of 'value at omega' is Delta itself"): the
  2011 notes and the Bristol notes say the obstruction is real on L^2 and is removed by dropping the cusp forms
  (CdV's suggestion, made rigorous by Bombieri-Garrett). §3, repair "a closed geodesic": the 2026 statement
  treats exactly the closed-geodesic periods (D > 0) with the same theorem (spectrum contained in the on-line
  zeros of xi(s)Lambda(s, chi_D)); OBJECT_PHI's claim that for a geodesic "its zeros are not eigenvalues" is, in
  the authors' framework, "eigenvalues only at zeros, existence open", not "never".
- **rh/HUNCHES.md F2 row W1**: same correction as in `2002.07929.md` part 7.
- **docs/KNOWLEDGE.md B2**: Hejhal's objection, recorded in the 2011 notes, is B2 for this construction.

## 8. Reliability
Unrefereed web notes by one of the two authors; informal; some typos ("lambda_w < -1/4" with Delta <= 0
convention). The 2011 report of Bombieri's numerical refutation is second-hand and without data. Dates are PDF
creation dates.

## 9. Open questions stated
"joint work ... on-going" (2026); Colin de Verdiere's realness integral (reported false numerically); whether any
eigenvalue exists.
