# PROOF_BE_cubic.md  (R2-cubic)  The Bakry-Emery cubic: a canonical symmetric 3-tensor attached to (H, a)

Status: sections 1-3 are PROVED (algebra, written out; every formula also checked numerically to 1e-14,
`python3 be2.py.txt i`). Section 4 is COMPUTED. Nothing here proves any new case of Weil positivity.
What is new for the project: the cubic object idea #10 asked for and the curvature of idea #11 are the same thing
for one canonical choice of the cubic, the choice is explicit, and it provably cannot work as it stands.

## 0. Setting
H real symmetric m x m, a in R^m with a_i > 0 and s := Ha > 0 entrywise. A := diag(a), S := diag(s).
(Application: H = Ntilde of PROOF_trickle.md Lemma A, a = its Perron vector.)
  K := S^{-1} H A          (K_ij = H_ij a_j / s_i;  K 1 = 1 because H a = s)
  pi_i := a_i s_i          (pi_i K_ij = a_i H_ij a_j is symmetric: K is self-adjoint in l^2(pi))
  L := K - I               (rows sum to 0; if H has non-negative off-diagonal, L is the generator of a reversible
                            jump process with rates r_ij = H_ij a_j / s_i; the diagonal of K may be negative)
  [u, v, w] := sum_i pi_i u_i v_i w_i ,   <u, v> := sum_i pi_i u_i v_i .
  Gamma(f) := (1/2)[ L(f^2) - 2 f Lf ],   Gamma(f,g) its polarisation,   Gamma_2(f) := (1/2)[ L Gamma(f) - 2 Gamma(f, Lf) ].
Coordinates: x = A f (x_i = a_i f_i). Then (Kf)_i = (Hx)_i / s_i and <f, K h> = x^T H y.

## 1. Theorem F (the Bakry-Emery cubic).  PROVED.
Define the trilinear form
  Theta(g,f,h) := (1/2) ( [g,Kf,Kh] + [f,Kg,Kh] + [h,Kg,Kf] ) - (1/4) ( [K^2 g,f,h] + [g,K^2 f,h] + [g,f,K^2 h] ) + (1/4) [g,f,h].
Then
 (F1) Theta is symmetric in its three arguments (visible), and Theta(1,f,h) = <f, K h>.
 (F2) For all g, f:   Theta(g,f,f) = < g, (Kf)^2 >  -  < g, Gamma_2(f) - Gamma(f) >.
 (F3) The tensor T_ijk := Theta(e_i/a_i, e_j/a_j, e_k/a_k) is symmetric, satisfies sum_k a_k T_ijk = H_ij, and its slices are
          T_k = l_k l_k^T / s_k  -  s_k * [ the quadratic form x -> (Gamma_2 - Gamma)(A^{-1} x)(k) ],     l_k = H e_k.
 (F4) Consequently (PROOF_trickle.md, Lemma B remark 1): every slice of T has at most one positive eigenvalue
          <=>  Gamma_2(f)(k) >= Gamma(f)(k) for all f and all sites k  (the Bakry-Emery condition CD(1, infinity)).
      Lemma B applied to this T is exactly the Bakry-Emery / Lichnerowicz theorem "CD(1,infinity) => spectral gap >= 1"
      for the chain, and "gap >= 1" is exactly "H has one positive eigenvalue".
 (F5) Entries (D := A S^{-1}):
          T_ijk = (1/2) [ H_ij H_ik / s_i + H_ij H_jk / s_j + H_ik H_jk / s_k ]            (i, j, k distinct)
          T_iik = H_ii H_ik / s_i + H_ik^2 / (2 s_k) - (H D H)_ik / (4 a_i)               (i != k)
          T_iii = (3/2) H_ii^2 / s_i - (3/4) (H D H)_ii / a_i + s_i / (4 a_i^2).
      In particular T_ijk >= 0 on all triples of distinct indices as soon as H has non-negative off-diagonal entries:
      the distinct-triple entries are sums over two-step chains j - i - k through a middle vertex, weight 1/s_i.

Proof.
(F1) g = 1: K1 = 1 gives Theta(1,f,h) = (1/2)(<Kf,Kh> + <f,Kh> + <h,Kf>) - (1/4)(<f,h> + <K^2 f,h> + <f,K^2 h>) + (1/4)<f,h>
     = (1/2)<f,K^2 h> + <f,Kh> - (1/2)<f,K^2 h> = <f,Kh>   (self-adjointness of K).
(F2) From 2 Gamma(f,g) = L(fg) - f Lg - g Lf:
       2 Gamma(f) = L(f^2) - 2 f Lf,
       4 Gamma_2(f) = 2 L Gamma(f) - 4 Gamma(f, Lf) = L^2(f^2) - 2 L(f Lf) - 2 [ L(f Lf) - f L^2 f - (Lf)^2 ]
                    = L^2(f^2) - 4 L(f Lf) + 2 f L^2 f + 2 (Lf)^2 .
     Substitute L = K - 1 (L^2 = K^2 - 2K + 1) and collect:
       L^2(f^2) - 2 L(f^2)      = K^2(f^2) - 4 K(f^2) + 3 f^2
       -4 L(f Lf)               = -4 K(f Kf) + 4 K(f^2) + 4 f Kf - 4 f^2
       2 f L^2 f + 4 f Lf       = 2 f K^2 f - 2 f^2
       2 (Lf)^2                 = 2 (Kf)^2 - 4 f Kf + 2 f^2
     Sum:   4 (Gamma_2 - Gamma)(f) = K^2(f^2) - 4 K(f Kf) + 2 f K^2 f + 2 (Kf)^2 - f^2 .
     Pair with g in l^2(pi) and move K onto g:
       4 <g, Gamma_2(f) - Gamma(f)> = [K^2 g,f,f] - 4 [Kg,f,Kf] + 2 [g,f,K^2 f] + 2 [g,Kf,Kf] - [g,f,f].
     Hence <g,(Kf)^2> - <g, Gamma_2(f) - Gamma(f)> = (1/2)[g,Kf,Kf] + [Kg,f,Kf] - (1/4)[K^2 g,f,f] - (1/2)[g,f,K^2 f] + (1/4)[g,f,f],
     which is Theta(g,f,f) read off the definition.
(F3) Symmetry from (F1). sum_k a_k T_ijk = Theta(e_i/a_i, e_j/a_j, 1) = <e_i/a_i, K e_j/a_j> = pi_i K_ij/(a_i a_j) = H_ij.
     Slice: sum_ij x_i x_j T_ijk = Theta(e_k/a_k, f, f) with f = A^{-1}x; by (F2) this is (pi_k/a_k)[(Kf)_k^2 - (Gamma_2 - Gamma)(f)(k)]
     = s_k ((Hx)_k/s_k)^2 - s_k (Gamma_2 - Gamma)(f)(k).
(F4) Lemma B remark 1 (given T.a = H and s > 0, "at most one positive eigenvalue" <=> T_k <= l_k l_k^T/s_k).
(F5) (K e_j/a_j)_i = H_ij/s_i and (K^2 e_j/a_j)_i = (HDH)_ij/s_i. For distinct i,j,k the terms with two bare arguments vanish
     (pointwise product of e_i and e_j), and [e_i/a_i, K e_j/a_j, K e_k/a_k] = (pi_i/a_i)(H_ij/s_i)(H_ik/s_i) = H_ij H_ik/s_i.
     The other two cases are the same bookkeeping.  QED

In the Weil setting: for three distinct scales x, y, z the Bakry-Emery triple number is
     T(x,y,z) = (1/2) [ k(x,y) k(x,z)/s(x) + k(y,x) k(y,z)/s(y) + k(z,x) k(z,y)/s(z) ],
k = prime atoms Lambda(n)/sqrt(n) at distance log n plus the Gamma kernel w: pairs of prime powers (or Gamma jumps)
hanging from a common scale. The lead's two candidate ingredients (chains in the divisibility order; an
intermediate point for the Gamma kernel) are exactly what the canonical cubic is made of.

## 2. Why the Bakry-Emery cubic cannot be the certificate.  PROVED for the model, COMPUTED for zeta.
Model (PROVED): the resampling chain, K = Pi (projection on constants, pi uniform on m points). For <f> = 0:
Gamma(f) = (1/2)(<f^2> + f^2), Gamma_2(f) = (3/4)<f^2> + (1/4) f^2, so (Gamma_2 - Gamma)(f)(k) = (1/4)(<f^2> - f_k^2),
negative for f concentrated at k. Best constant: Gamma_2 >= rho Gamma with rho = 1/2 + 1/m (COMPUTED: 0.7, 0.6, 0.55, 0.525
for m = 5, 10, 20, 40), while the gap is exactly 1. So Bakry-Emery loses a factor 2 on a mean-field system, and
in the reading of idea #11 (HEURISTIC) RH says the prime walk is mean-field up to the 1e-23 margin. A zero-margin statement cannot be reached by it.
Zeta (COMPUTED, `be2.py.txt iii`): L = 1: rho_BE = 0.590, 0.528, 0.482 for n = 12, 24, 48 boxes; every slice of T^BE has
exactly 2 positive eigenvalues. Beurling control (2 -> 2.1, form NOT positive): rho_BE = 0.586, 0.523, 0.483: the
same. The curvature does not see the failure; the gap does (0.996, 0.954, 0.928 against 1.0003, 1.0002, 1.00005).

## 3. Uniqueness at mean field, and the local cubics that are exact there.  PROVED.
(U) If K = Pi (H = rank one), the only certificate is Theta(g,f,h) = <g><f><h> (i.e. T = l(x)l(x)l / s^2).
    Proof: every mean-zero f has Kf = 0, i.e. is a null vector of H in x-coordinates; by PROOF_trickle.md (D3) T(v,.,.) = 0
    for all of them, so T is a multiple of the cube of the one remaining linear form, fixed by T.a = H.
(V) Put sigma_1 := sym[Kg,f,h], sigma_2 := sym[K^2 g,f,h], sigma_11 := sym[Kg,Kf,h] (three terms each), sigma_111 := [Kg,Kf,Kh].
    For every real t the form
        Theta_t := t (sigma_1 - sigma_2) + (1/2 - t) sigma_11 + (3t - 1/2) sigma_111
    is symmetric, satisfies Theta_t(1,f,h) = <f,Kh> for EVERY chain, and equals <g><f><h> when K = Pi.
    Proof: contractions with g = 1: sigma_1 -> 1 + 2K, sigma_2 -> 1 + 2K^2, sigma_11 -> 2K + K^2, sigma_111 -> K^2 (as operators
    in <f, . h>). So Theta_t -> t(2K - 2K^2) + (1/2 - t)(2K + K^2) + (3t - 1/2)K^2 = K. At K = Pi: sigma_1 = sigma_2,
    sigma_11 = 3<g><f><h>, sigma_111 = <g><f><h>, total 3(1/2 - t) + 3t - 1/2 = 1.  QED
    These are local objects (pointwise products of K-smoothed functions, no global averages), unlike the cone
    certificate of Lemma C, which in this language is <g><f,Kh> + <f><g,Kh> + <h><g,Kf> - 2<g><f><h>.
    On distinct triples: T_t = (1/2 - t) * (two-step chains, as in F5, times 2) + (3t - 1/2) * (stars
    sum_l (a_l/s_l^2) H_li H_lj H_lk: three scales coupled to a common fourth).

## 4. What the computations say about these families.  COMPUTED (double precision; logs in PROGRESS.md section 3).
- Theta_t, zeta, L = 1: no t in [-1, 2] gives Lorentzian slices; best t = 0.05 with worst lambda_min(P_k) = -0.047 (n = 12),
  -0.052 (n = 24); L = 0.5: -0.032. Bakry-Emery in the same units: -4.1, -6.1, -2.2. Beurling control (L = 1): -0.048.
- All symmetrised products [K^a g, K^b f, K^c h] with exponents <= d, free coefficients, T.a = H imposed:
  d = 1 (4 tensors): no certificate for zeta (tau* = 0.014 at L = 1 n = 12; 0.036 at L = 0.5; 0.073 at L = 1 n = 20).
  d = 2 (10 tensors): a certificate EXISTS for zeta at L = 0.5, n = 12 and L = 1, n = 20 (independent check of the
  returned tensor: all slices one positive eigenvalue, lambda_min(P_k) = 1e-12 and -3e-15, |T.a - H| <= 2e-12), and at
  L = 1, n = 12 with the second solver only (accuracy 5e-6). Also for the Beurling control on a window where its box
  form is still positive (L = 0.5, n = 8). None for Beurling at L = 1 (tau* = 5e-3), as Lemma B forces.
- The same holds for random Lorentzian matrices with non-negative off-diagonal (12 of 12 at d = 2; 11 of 12 at d = 1,
  the exception being the one with the smallest margin). So "a certificate of chain-degree 2 exists" is a fact of
  linear algebra with margin, not of arithmetic. CONJECTURE (not attempted): the least chain-degree d* of a
  certificate is finite whenever the second eigenvalue of H is < 0 and grows without bound as it tends to 0.
- At an exactly critical window (Hv = 0) only products in which every factor carries at least one K can appear on
  the null directions (PROOF_trickle.md D3: T(v,.,.) = 0 and Kv = 0), i.e. T is a cubic form in Hx: T(x,y,z) = C(Hx,Hy,Hz).
