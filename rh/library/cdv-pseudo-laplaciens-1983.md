BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# Y. Colin de Verdiere, "Pseudo-laplaciens II", Ann. Inst. Fourier 33 (1983), no. 2, 87-113

Reader: READER-5, 2026-11-11. Refereed journal paper (received 14 May 1982). In French. Companion digests:
`cdv-pseudo-laplaciens-1982.md`, `2002.07929.md`, `garrett-notes.md`.

## 1. What was read
Open copy from Numdam (`https://www.numdam.org/item/10.5802/aif.917.pdf`, no login, no bot check), saved at
`rh/library/src/cdv/II/aif917.pdf` (28 PDF pages = cover + pp. 87-113). OCR text (`pdftotext`, 52,162 characters)
read **whole**; pages 108-109 (the conjecture and its evidence) also read as images. Section 6 (wave-front
computations) was read from badly garbled OCR: its statements are reported, its formulas are not checked.

## 2. Main statements
Setting: X a surface of finite area with one hyperbolic cusp X_1 = ]b, inf[ x R/Z. For a >= 0, H_a = {f in H^1(X) :
zeroth Fourier coefficient f_0 = 0 on [a, inf)}; Delta_a = Friedrichs operator of q(f) = int |df|^2 on H_a ("introduits
et utilises par Lax et Phillips"). Delta_inf the usual Laplacian.
- **Theorem 1.** For a > b, the domain of Delta_a is {f in H_a : Delta f - C T_a in L^2 for some C}, T_a f = f_0(a).
  "Dans le cas a < b, la caracterisation precedente n'est plus valable : il peut y avoir a prendre en compte
  d'autres distributions".
- **Theorem 2.** Delta_a is self-adjoint with compact resolvent (proof "essentiellement donnee dans [Lax-Phillips],
  p. 206").
- **Theorems 3, 4.** Construction of E(z, s) for Re s > 1/2 by the resolvent of Delta_inf; meromorphic continuation
  to C via the compact resolvent of Delta_a, functional equation E(s) = phi(s)E(1-s), phi(s)phi(1-s) = 1, no poles on
  Re s = 1/2 (Maass-Selberg).
- **Theorem 5.** Spectrum of Delta_a = type (I) (the eigenvalues of Delta_inf whose eigenfunction has zero constant
  term, i.e. cusp forms) together with type (II) mu_0(a) <= mu_1(a) <= ..., each mu_j decreasing in a; for a >= b,
  simple, mu_j(a) = s_j(1-s_j) with a^{s_j} + phi(s_j) a^{1-s_j} = 0 (Im s_j >= 0, Re s_j >= 1/2, s_j != 1/2), or
  s_j = 1/2 in a degenerate case; eigenfunctions the truncated Eisenstein series; interlacing with the residual
  eigenvalues; as a -> inf, mu_j(a) -> lambda_j (j <= N) and -> 1/4 otherwise. Remark: for a < b "on n'a guere de
  renseignements".
- **Theorem 6** (Weyl law by minimax): N_a(lambda) ~ area(X) lambda/(4 pi); Corollary: limsup count of cusp
  eigenvalues <= area/(4 pi) (cf. Lax-Phillips, Donnelly). For PSL_2(Z): the r_j(a) solve
  arg xi(1 + 2ir) = -r log a + k pi; N_a(T) = (T/pi) log(T/(e pi a)) + O(T log T)-type error, O((log T)^{eps})
  under RH (OCR-garbled; read as stated).
- **Theorem 7.** For a generic conformal perturbation of the metric on a compact set, Delta_inf has no cusp-form
  eigenvalues (only finitely many eigenvalues, in [0, 1/4)).
- **Theorem 8.** A Poisson relation: singular support of the even distribution Z_a(t) = sum cos(t r_n) +
  sum cos(t r_j(a)) is contained in +-(lengths of closed geodesics u sums of lengths of geodesic arcs orthogonal at
  both ends to the horocycle H_a) u {0}, for a >= b; "diffraction" of rays hitting H_a orthogonally.
- **Section 7, CONJECTURE** (Gamma = PSL_2(Z), a = sqrt3/2 < b = 1, rho = the lowest point of the fundamental domain):
  "Les valeurs propres de type II de Delta_{sqrt3/2} sont les s_j(1 - s_j) = 1/4 + r'_j^2", s_j the zeros (Im >= 0) of
  zeta_K, K = Q(sqrt-3). "Cette conjecture est plus forte que l'hypothese de Riemann". Evidence offered:
  1) Hejhal: at s = s_j the resolvent kernel R(s; rho, .) of Delta_inf is L^2 (its constant term
  (1/(1-2s)) E(rho, s) y^{1-s} vanishes for y > sqrt3/2). With pi_c the projection on the absolutely continuous
  spectrum, f_j = pi_c(R(s_j, rho, .)) has f_j^(s) = E(rho, s)/(s_j(1-s_j) - s(1-s)), constant term zero above
  sqrt3/2, and f_j in H_{sqrt3/2} (needs int |zeta_K(1/2 + ir)|^2 log r/(1 + r^2) dr < inf: Motohashi's mean value
  and |zeta(1+it)|^{-1} << log t). "Il est ainsi naturel de conjecturer que la suite (f_j) ... est la suite des
  fonctions propres de type II". The conjecture is equivalent to the distribution T (f -> pi_c(f)(rho)) being
  orthogonal to H_{sqrt3/2}; it would suffice that f_j(rho) = 0, i.e.
  **int_0^inf |E(rho, 1/2 + ir)|^2 dr/(s_j(1-s_j) - (1/4 + r^2)) = 0 for all j**; "Malheureusement, ces integrales
  convergent tres lentement et sont donc difficiles a calculer numeriquement."
  2) Minimax: if true, r'_j >= r_j(1); table (H. Cohen computed r_j(1)): r_j(1) = 6.97, 10.47, 12.43, 15.08, 16.41,
  18.68, 20.42 against r'_j = 8.04, 11.24, 14.13, 15.70, 18.26, 20.45: "compatibles avec la conjecture".
  3) Counting: N_a(T) for a = 1 and N'(T) = (T/pi) log(T sqrt3/(2 e pi)) + O(log T) (Potter-Titchmarsh) agree to
  leading order, and under RH the secondary terms have the same shape C(a)T with C analytic in a.
  4) Summation formulas: Selberg trace formula plus Weil's explicit formula for zeta_K suggest singularities at
  n log 3 and (2n+1) log p (p = 1 mod 3); a conjectured diffraction along H_{sqrt3/2} and at rho, with lengths
  log(p^2 + pq + q^2).
  Directions listed at the end: more numerics of r_j and r_j(1); propagation of singularities for Delta_{sqrt3/2};
  interpret the f_j as quasi-modes.

## 3. Method in ten lines
The Lax-Phillips pseudo-Laplacian (Friedrichs extension on functions whose constant term vanishes above height a)
has compact resolvent; its eigenvalues are cusp forms plus "type II" values that, for a above the reduction height
b, are the zeros of the constant term a^s + phi(s) a^{1-s} of E_s (truncated Eisenstein series, which do not see
zeta's zeros). Below b no description is available. At a = sqrt3/2, exactly the height of the CM point rho, Hejhal's
pseudo-eigenfunctions (resolvent kernels at rho at zeros of zeta_K) have vanishing constant term above a; projected to
the continuous spectrum they lie in the form domain. If they were in the operator domain they would be
eigenfunctions, which would force their parameters onto the line. The condition for that is the vanishing of a
Stieltjes-type integral of |E(rho, 1/2+ir)|^2, which the paper cannot check.

## 4. What is assumed
Unconditional Theorems 1-8; Section 7 is a conjecture with heuristic and numerical support.

## 5. Where its frontier is
Last thing proved: the spectrum of Delta_a for a >= b (Theorem 5). First thing not done: any description of the type
II spectrum for a < b, in particular at a = sqrt3/2 where the conjecture is placed; the realness integral is not
evaluated.

## 6. What it explicitly does not do / what later happened
- The paper does not prove that any zero of zeta_K is an eigenvalue of Delta_{sqrt3/2}.
- Later record (other digests): Garrett's 2011 notes report "Bombieri notes [email of 02 August 2011] that the
  numerical conjecture made (in effect) by Colin de Verdiere does not hold" (`garrett-notes.md` 2c), without data.
  Bombieri-Garrett 2020, Remark 70: "the optimistic simple version of the conjecture at the end of [CdV-pseudo]
  cannot hold" (assuming RH and pair correlation; their operator is the "vanish at omega on the non-cuspidal part"
  version, not literally Delta_{sqrt3/2}), and their section 5.8 relates it to an a -> inf limit.
- Note on what CdV conjectured: it is the constant-term operator at height sqrt3/2 (property "B" of part I: the
  pseudo-eigenfunctions' zeroth Fourier coefficient vanishes on [sqrt3/2, inf)), with the projection to the
  continuous spectrum as a device; Bombieri-Garrett's Introduction reads "the suggestion at the end of [CdV-pseudo]"
  as converting (Delta - lambda)u = delta_omega into a homogeneous equation by restricting delta to the non-cuspidal
  space, keeping the constants.

## 7. Facts in our own record that this paper shows to be already known or corrects
- **rh/NOTEBOOK.md N43** ("Bombieri and Garrett ... built self-adjoint operators whose discrete spectrum is lambda_s
  for zeros of E(omega, s)"): the conjecture that a single natural self-adjoint operator has exactly these
  eigenvalues is Colin de Verdiere's (1983, section 7), stated as stronger than RH; it is reported false (Bombieri
  2011, numerical, unpublished) and incompatible with RH + pair correlation for the Bombieri-Garrett variant.
- **rh/specialists/operator/OBJECT_PHI.md §3**: the claim "Only horospheres at a cusp separate; so self-adjointness
  reaches only constant terms" agrees with Theorem 5 for a >= b; at a = sqrt3/2 < b, the horocycle is the one
  through the CM point (OBJECT_PHI §3, "The horocycle through omega has height sqrt3/2 < 1: form-bounded, but it does
  not separate ... (not covered by the theorem)"), exactly the case of CdV's conjecture, where Theorem 1's domain
  description is said to fail.
- **rh/HUNCHES.md F2 row W1**: "pseudo-Laplacians (Colin de Verdiere) give exactly the look-alike theorems" — for
  a >= 1, yes (Theorem 5: zeros of a^s + phi(s)a^{1-s} on the line); CdV also stated the "vanish at omega" target as
  a conjecture in 1983.

## 8. Reliability
Refereed. OCR transcription; section 6 formulas and the counting formulas of section 4 are garbled in OCR and are
reported in words only. The numerical table is H. Cohen's computation as quoted.
