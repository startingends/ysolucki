BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# B. Louvel, "On the distribution of cubic exponential sums", arXiv 1107.0197 v2 (Forum Math. 2011, per search summaries)

Reader: READER-7, 2026-11-11. Source: arXiv TeX (single file `CubicSums.tex`, dated 1 Nov 2011), saved as
`rh/library/src/cubic_1107.0197/paper.tex`. Based on chapters 2 and 4 of the author's Göttingen/Montpellier thesis
(2008, supervisors S. J. Patterson and Ph. Michel). Refereed (Forum Math.), per search summaries, not checked.

## 1. What was read
**104,943 / 104,943 characters** (1,597 lines): abstract, sections 1-7, bibliography, every line.

Notation. k = Q(omega), R = Z[omega], e(z) = exp(2 pi i (z + z bar)). Cubic exponential sum
`S(a,c) = sum_{x mod c} e(a(x^3 - 3x)/c)` (a CUBIC POLYNOMIAL sum, not a Gauss sum). Cubic Kloosterman sum
`K_3(m,n,c) = sum_{x x' = 1 mod c} (x/c)_3 e((m x + n x')/c)` (eq. 2.1). Kubota character kappa on
Gamma_1 = {gamma = 1 mod 3}: kappa(gamma) = (c/a)_3 (c != 0), extended to Gamma_2 = SL_2(Z) Gamma_1 by kappa = 1 on
SL_2(Z). Groups used: Gamma_d = <Gamma_1, -I> intersect Gamma_0(d), d primary. Spectral parameter (s,p): Casimir
eigenvalue ((s -+ p)^2 - 1)/8; for K-trivial forms the Laplacian eigenvalue is 1 - s^2; "exceptional" means s real
in (0,1], p = 0.

## 2. Main statements, with their numbers
- **Prop 2.1** (attributed to Duke-Iwaniec, Livné, Katz; version of Patterson, Acta Arith. 79 (1997), Thm 3.1).
  For gcd(a,c) = gcd(c,3) = 1: **S(a,c) = K_3(a,a,c)**. (This is the bridge from the cubic polynomial sums to
  Kloosterman sums twisted by the cubic symbol; it is NOT an identity for cubic Gauss sums.)
- **Lemma 2.3.** With Gamma = Gamma_d and the cusps sigma^{-1} = I, tau^{-1} = ((d-1, d-2),(d, d-1)): the geometric
  Kloosterman sum K_{sigma,tau}(m,n,c) equals K_3(m,n,c) if c = +-1 mod 3 and c = 0 mod d, and 0 otherwise;
  K_{sigma,sigma} = K_{tau,tau} = 0 unless d | c.
- **Theorem 3.1** (spectrum near the bottom). For primary d there is 0 <= s(d) <= 1/6 such that every exceptional
  spectral parameter (s,0) of a kappa-metaplectic form on Gamma_d lies in ]0, s(d)] union {1/3}. Proof (as given):
  Gelbart-Jacquet's bound s <= 1/2 for non-constant GL_2 forms plus Flicker's cubic Shimura correspondence, which at
  infinity gives s~ = s/3. The value 1/3 is the theta function.
- **Eisenstein series and theta (section 3).** E_sigma(s,p,l,q;g) = sum over Gamma_sigma\Gamma of kappa-bar(gamma)
  phi_{l,q}(s,p)(sigma gamma g); its Fourier coefficients psi_{sigma,tau}(s,m,p) are **Dirichlet series of cubic
  Gauss sums** (sum over c of N(c)^{-(1+s)} (c/|c|)^{2p} times a kappa-twisted exponential sum over the double coset).
  Properties quoted: (i) continuation and functional equation s <-> -s; (ii) holomorphic if p != 0; (iii) poles at
  s = +-1/3 if p = 0. **Definition:** theta_sigma((l,q),g) = Res_{s=1/3} E_sigma(s,0,l,q;g); square-integrable,
  non-cuspidal, spectral parameter (1/3, 0), Laplace eigenvalue 1 - 1/9 = 8/9, Fourier coefficients
  rho_theta(tau,m) = Res_{s=1/3} psi_{sigma,tau}(s,m,0).
- **Theorem 3.2** (spectral decomposition). L^2(Gamma\G, kappa) = L^{2,res} (+) L^{2,cusp} (+) L^{2,cont}, the
  residual part spanned by the theta functions at the essential cusps (all K-types).
- **Theorem 4.1 = the Bruggeman-Kuznetsov "spectral sum formula" on the cubic cover** (stated for any discrete
  Gamma in SL_2(R) carrying kappa, two essential cusps sigma, tau). For h in H_alpha, alpha in ]1/3, 1[ (h(s,p) =
  h(-s,-p), holomorphic in |Re s| <= alpha, h << (1+|s|)^{-a}(1+|p|)^{-b}; absolute convergence for a > 2, b > 3):
  ```
  sum_{c != 0} K_{sigma,tau}(m,n,c)/N(c) * Bh(4 pi sqrt(mn)/c)
    + delta_{sigma,tau} delta_{m,n} (1/(2 pi^3 i)) sum_p int_(0) h(s,p)(p^2 - s^2) ds
  = sum_V conj(rho_V(m)) rho_V(n) h(s_V, p_V)                       [discrete: theta AND cusp forms]
    + (1/(2 pi i)) sum_{cusps sigma_i} |Lambda_{sigma_i}|^{-1} sum_p int_(0)
          conj(psi_{sigma,sigma_i}(s,m,p)) psi_{sigma_i,tau}(s,n,p) h(s,p) ds        [continuous]
  ```
  with Bh(z) = (1/(2 pi i)) sum_p int_(0) K_{s,p}(z) h(s,p)(p^2 - s^2) ds, K_{s,p} = (J_{-s,-p} - J_{s,p})/sin(pi s),
  J_{s,p}(z) = J_{s-p}(z) J_{s+p}(z bar). The requirement alpha > 1/3 is there so that h is defined at the theta
  point s = 1/3. **Theorem 4.2** rewrites it with A^disc(d,s,p) = sum over an orthonormal basis of the (s,p)
  eigenspace of conj(rho_f(sigma,m)) rho_f(tau,n) and A^cont = the Eisenstein products.
- **Theorem 4.3 (Kloosterman sum formula, the inverse direction).** For f in C_c^infty(C^x) with Kf in H_alpha,
  alpha > 1:
  `sum_c K_{sigma,tau}(m,n,c)/N(c) f(4 pi sqrt(mn)/c) = sum_{(s,p)} A^disc_{m,n}(d,s,p) Kf(s,p) + (1/2 pi i) sum_p int_(0) A^cont Kf ds`,
  Kf(s,p) = int_{C^x} K_{s,p}(u) f(u) |u|^{-2} du; proof "2 pi B K f = f, all details in [Lokvenec-Guleska]".
- **Prop 4.4.** (i) sum over tempered (s in iR) discrete and continuous spectrum of A_{n,n}(d,s,p) (1+|s|)^{-a}
  (1+|p|)^{-b} << 1 (n fixed). (ii) For any set S of exceptional parameters and x >= 1/2:
  sum_{s_j in S} A_{n,n}(d,s_j) N(d)^{4 x s_j} << N(d)^{2x-1} tau(d) log^2 N(d) (a density estimate for the
  exceptional spectrum in the level aspect, from Theorem 4.2 with h = (sinh(L s)/(L s))^4 and Weil's bound).
- **Lemma 5.1.** For f(z) = g(N(mn)^{1/2}/(N(z) X)) N(z)^{-1/2} N(mn)^{1/2} (g smooth on [1,2]):
  (i) Kf(s,p) << X^{1/2} (1+|p|)^{-a}(1+|s|)^{-b} on s in iR; (ii) for 0 < s <= 1/2,
  `Kf(s,0) = c_s X^{1/2+s} g^(1/2 - s) + O(X^{1/2-s})` (g^ = Mellin transform; the last line of the proof prints
  g^(1/2+s), the statement and Thm 1.3's g^(1/6) use 1/2 - s), c_s = pi 4^s Gamma(1-s)^{-2} (sin pi s)^{-1}
  (N(m)N(n))^{(1-2s)/4}.
- **Theorem 1.3 (main analytic result).** g smooth, support in [1,2]; d coprime to 3; s(d) as in Thm 3.1:
  (i) `sum_{c = 1 (3), c = 0 (d)} S(1,c) N(c)^{-1/2} g(N(c)/X) = c_theta(d) g^(1/6) X^{5/6}
       + O( X^{1/2} + X^{1/2+s(d)} log^2 X tau(d) N(d)^{-2 s(d)} )`;
  (ii) the same sum is `O( X^{1/2} + X^{5/6} log^2 X tau(d) N(d)^{-5/6} )` with constant depending only on g
  (as printed; the proof, eq. (5.8), gives N(d)^{-2/3} in place of N(d)^{-5/6}: a discrepancy between statement and
  proof, noted here, not resolved). c_theta(d) = A_{1,1,sigma,tau}(d, 1/3, 0) c_{1/3}: the theta coefficient product.
- **Cor 1.4.** d = 1: `sum_{c = 1(3)} S(1,c) N(c)^{-1/2} g(N(c)/X) = c_theta X^{5/6} + O(X^{1/2+eps})`, because
  s(1) = 0 (no exceptional eigenvalue other than 8/9 for SL_2(Z[omega]); Stramm 1994: lambda_1 > 32 pi^2/27).
- **Cor 1.5.** Sigma(D) := sum_{N(d) <= D} sum_{c = 0 (d)} ... << D sqrt X + X^{5/6} D^{1/3} log^3 X (sum of (5.8)
  over d by the triangle inequality; uses 1/3 < 1/2, so no improvement on Selberg's bound is needed).
- **Theorem 1.1** (application). There is an explicit 0 < u < 60 such that among X <= N(c) < 2X with all prime
  factors of norm >= X^{1/u}, both S(1,c) > 0 and S(1,c) < 0 occur >> X/log X times. Ingredients: Cor 1.5 in a
  Fouvry-Michel "crible étrange" (section 6, level D = X^{1/4} log^{-40} X) and the vertical Sato-Tate law
  (Katz; Thm 1.2) plus a multiplicative large sieve over number fields (Huxley) (section 7).

## 3. The method in ten lines
Prop 2.1 turns the cubic polynomial sums into cubic Kloosterman sums, Lemma 2.3 makes them the geometric Kloosterman
sums of the kappa-twisted group Gamma_d between two cusps. The Kloosterman sum formula (Thm 4.3), with a test
function f concentrated at |c|^2 ~ X, expresses the smoothed sum over ALL moduli c = 0 mod d as a sum over the
spectrum of L^2(Gamma_d\G, kappa): theta (s = 1/3), possible exceptional cusp forms (s <= s(d) <= 1/6), tempered
cusp forms and the continuous spectrum. Lemma 5.1(ii): a spectral point s contributes X^{1/2+s}; theta gives
X^{1/2+1/3} = X^{5/6}, everything tempered gives X^{1/2} (Lemma 5.1(i) + Prop 4.4(i) + Cauchy-Schwarz over the
spectrum). The level dependence comes from Prop 4.4(ii), a Kuznetsov-based density bound for exceptional
eigenvalues. The work is in the Bessel transforms (Lemma 5.1, Prop 4.4) and in the bookkeeping of K-types (taken
from Bruggeman-Motohashi and Lokvenec-Guleska).

## 4. Where it stops
- Only the FIRST moment of S(1,c) over moduli (with a congruence c = 0 mod d) is treated; m = n = 1 fixed. No
  average over the frequencies m, n; no second moment; no large sieve over the spectrum.
- Remark 1.6(3): the method is tied to moduli in Z[omega]; "it is not clear what would be the analogue of Theorem 1.3
  over Z".
- Remark 1.6(4): the sieve of section 6 does not see the exceptional spectrum (Cor 1.5 discards theta); "It would be
  very interesting to develop a sieve method that takes into account the exceptional spectrum, and reveals its
  contribution ... under the form of a bias."
- Constant c_theta(d) only for squarefree d (Livné-Patterson); general d "partially done" in the thesis.
- The last thing proved: X^{1/2+eps} error for d = 1, uniformity in d up to N(d)^2 <= X. The first thing not proved:
  any statement about sums over primes c (sign changes only for almost-primes, u < 60).

## 5. What it changes in our record
- **rh/NOTEBOOK.md N55 and rh/specialists/modular/SHORT_FAMILY.md (3c).** The "Kuznetsov(-Bruggeman) formula on the
  cubic metaplectic cover" exists in print in exactly the shape SHORT_FAMILY guessed: Theorems 4.1-4.3 here.
  Arithmetic side: sums over MODULI c of cubic Kloosterman sums K_3(m,n,c) (Kloosterman sums twisted by the cubic
  residue symbol), for two FIXED frequencies m, n. Spectral side: theta (residual, s = 1/3, eigenvalue 8/9),
  metaplectic cusp forms of all K-types (s, p), continuous spectrum whose coefficients are Dirichlet series of
  cubic Gauss sums. Transforms: the SL_2(C) Bessel kernel K_{s,p} (B and K above).
- **Whether "the family size enters only through a test function" (lead's question (b)).** In this formula the
  length X of the sum over moduli enters only through the test function f (Thm 4.3 is exact for every X). The level
  d enters through the group Gamma_d (the spectrum depends on d). The frequencies m, n are single points: an average
  over a family of frequencies (which is what the twist variable u of S(H,D) would have to become) is not in this
  paper; it would need a spectral large sieve for kappa-metaplectic forms, which is not stated or used here.
- **SHORT_FAMILY (3c), "Gauss sums written as Kloosterman sums".** The identity found here (Prop 2.1) is
  S(a,c) = K_3(a,a,c) for the cubic POLYNOMIAL sums sum e(a(x^3 - 3x)/c); cubic Gauss sums do not appear on the
  arithmetic side of this formula at all. They appear on the SPECTRAL side, as Fourier coefficients of the
  Eisenstein series (psi_{sigma,tau}(s,m,p)) and, at the residue s = 1/3, of theta.
- **"The bias X^(5/6)" (lead's question (d)).** In this formula's language: the theta function is the residual
  spectrum at s = 1/3, and the transform of the X-localized test function at a spectral point s is
  ~ c_s X^{1/2+s} (Lemma 5.1(ii)), so theta contributes X^{1/2+1/3} = X^{5/6}, the main term c_theta(d) g^(1/6)
  X^{5/6} of Thm 1.3(i). Everything tempered contributes X^{1/2}. (This is the bias of the cubic polynomial sums
  S(1,c) over all moduli; the Gauss-sum bias over primes is Dunn-Radziwill, digest `dunn-radziwill-2109.07463.md`.)
- **"Kodama 2004" in N55.** Not what this paper uses. Louvel cites Bruggeman-Motohashi (Gaussian field) and
  Lokvenec-Guleska's thesis (Utrecht 2004) for the sum formula; Kodama's 2004 thesis is the NON-metaplectic formula
  for SL_2(Z[omega]) (digest `kodama-2004.md`).

## 6. Reliability
- Refereed (Forum Math., per search summaries). Clear and complete in the Kuznetsov part as a statement; the PROOF of
  Theorems 4.1/4.3 for the Kubota multiplier is delegated: "This work was done by [Bruggeman-Motohashi] for the case
  SL_2(Z[i]) and was extended by [Lokvenec-Guleska] for any quadratic number field", "All details are given in
  [Lokvenec-Guleska]". READER-7 fetched Lokvenec-Guleska's thesis (Utrecht repository, handle 1874/1154, 181 pp.,
  `src/lokvenec-guleska-2004/full.pdf`) and read its introduction (pp. vii-viii) only: its stated scope is
  Gamma_0(I) over an imaginary quadratic field with characters chi of (O/I)^* (trivial on Gamma_1(I)), i.e.
  Nebentypus characters, **not** the Kubota character. So the cited sources do not state Thm 4.1 for the cubic
  Kubota multiplier, whose residual spectrum (theta) is the new feature; the extension is asserted by Louvel, not
  written out. (Unverified by this reader either way.)
- Theorem 1.3(ii): exponent N(d)^{-5/6} in the statement vs N(d)^{-2/3} in the proof (5.8); Cor 1.5 is consistent
  with the proof's version (X^{5/6} D^{1/3}).
- Theorem 3.1's s(d) <= 1/6 rests on Gelbart-Jacquet + Flicker as quoted (s <= 1/2 for GL_2 forms over Q(omega)).
- Livné-Patterson (Invent. Math. 148 (2002)) is reported here secondhand: their Thm 1.2 gives the first moment with
  error X^{3/4+eps} (eq. (1.3) "true for any eps >= 1/4") and c_theta(d) for squarefree d, and "they could avoid
  the utilization of a complete Bruggeman-Kuznetsov formula, instead they used the simpler version by Goldfeld and
  Sarnak". Livné-Patterson itself was NOT obtained (Springer paywall).
