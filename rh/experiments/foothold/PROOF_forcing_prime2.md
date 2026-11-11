# PROOF: on a window that sees one prime, positivity forces that prime to be 2 (position and weight)

Seat FH, 2026-11-11. Status: **proved here, computer-assisted (exact rationals + Arb balls), not yet
independently checked.** Prior work found by search: the phenomenon is a published NUMERICAL observation
(Connes-Consani, arXiv 2106.01715, section 2.3: at mu = 3 the smallest eigenvalue is negative for p = 1.9999 and
p = 2.0005, weight tied to p, no error analysis) and an unreviewed outer bound of this project (seminar S1-parity:
(1.9996, 2.0080) at L = 1/2). No theorem of this kind was found in what was read (see section 7).

## 0. Statement

L is a rational number with 1/2 <= L and 2L <= 1.09 (used: L = 1/2 and L = 27/50; both below (1/2) log 3 = 0.5493).
For y > 0, m >= 0 and f in L^2[-L, L] with transform F(z) = int f(x) e^{izx} dx:

    Q_{y,m}(f) = (1/2pi) int_R ( a(r) - 2 m cos(r y) ) |F(r)|^2 dr + 2 Re[F(i/2) conj F(-i/2)],   a(r) = Re psi(1/4 + ir/2) - log pi.

This is the Weil form of the window with its single prime-power term replaced by one "atom" at position y
(log scale) with weight m; the true form is y = log 2 = 0.6931472, m = log 2/sqrt 2 = 0.4901291
(PROOF_window_prime2.md, section 0). The Gamma factor and the pole are untouched.
Say (y, m) is FEASIBLE on the window L if Q_{y,m}(f) >= 0 for all f in L^2[-L, L].

**Theorem B.**
(i) (the true prime is feasible) (log 2, log 2/sqrt 2) is feasible on every window L <= (1/2) log 3, with
    Q >= 9.9998e-9 ||f||^2. [This is Theorem A of PROOF_window_prime2.md.]
(ii) (nothing else is, up to 0.5%) Let L = 1/2, y > 0, m >= 0. If Q_{y,m}(v) >= 0 for every real polynomial v of
    degree < 28 (restricted to [-1/2, 1/2]) then
        70957/102400 < y < 7139/10240,   i.e.  1.999585 < e^y < 2.008058,   and   0.488558 <= m <= 0.510367.
    Let L = 27/50. If Q_{y,m}(v) >= 0 for every real polynomial v of degree < 32 then
        35487/51200 < y < 71033/102400,  i.e.  1.999917 < e^y < 2.001069,   and   0.489943 <= m <= 0.492420.
(iii) (the prime is needed) With no atom (m = 0, or y >= 2L so that the atom is outside the window) the form is
    not positive, in either parity sector: at L = 1/2 there are an even and an odd polynomial v with
    Q(v)/||v||^2 = -0.0323519... and -0.3222283...; at L = 27/50: -0.0650680... and -0.4103637....

The restriction m >= 0 is necessary: a NEGATIVE atom close to y = 0 raises the symbol at low frequencies and can
make the form positive (float observation, PROGRESS.md section 7). m >= 0 is the natural class: the weight of a
prime is log p/sqrt p > 0.

## 1. The exact form on polynomials  (PROVED)

Let v be a real function equal to a polynomial on [-L, L] and 0 outside, V its transform, and
g_v(x) = int v(s + x) v(s) ds its autocorrelation: even, continuous, supported in [-2L, 2L], Lipschitz, with
g_v(0) = ||v||^2 and, for 0 <= x <= 2L, g_v(x) = int_{x-L}^{L} v(u) v(u - x) du.
Put h(x) = e^{x/2}/sinh(x) - 1/x and E_+-(v) = int v(t) e^{+-t/2} dt.

**Lemma 5.** Q_{y,m}(v) = A(v) - 2 m g_v(y), where

    A(v) = -(log(4 pi L) + gamma_E) g_v(0) + int_0^{2L} (g_v(0) - g_v(x))/x dx - int_0^{2L} h(x) g_v(x) dx + 2 E_+(v) E_-(v).

Proof. (a) V(r) = O(1/|r|) (one integration by parts; v is bounded with jumps only at +-L), so |V|^2 is
integrable; it is the Fourier transform of g_v, and by inversion (1/2pi) int |V|^2 cos(rx) dr = g_v(x) for all x.
Hence the atom term is -2m g_v(y), (1/2pi) int |V|^2 = g_v(0), and the pole term is 2 V(i/2) V(-i/2) = 2 E_- E_+
(V(-+i/2) = E_+-, real).
(b) Gauss' formula (DLMF 5.9.12), Re z > 0: psi(z) = int_0^inf ( e^{-t}/t - e^{-zt}/(1 - e^{-t}) ) dt. With
z = 1/4 + ir/2, t = 2x:  Re psi(1/4 + ir/2) = int_0^inf ( e^{-2x}/x - k(x) cos(rx) ) dx,
k(x) = 2 e^{-x/2}/(1 - e^{-2x}) = e^{x/2}/sinh x = 1/x + h(x).
(c) For 0 < eps <= 1 split the x-integral at eps. On x >= eps Fubini applies (|V|^2 is integrable and
int_eps^inf (e^{-2x}/x + k(x)) dx < inf), giving int_eps^inf ( g_v(0) e^{-2x}/x - k(x) g_v(x) ) dx.
The rest is rho_eps(r) = int_0^eps [ (e^{-2x} - 1)/x - h(x) cos(rx) + (1 - cos(rx))/x ] dx, and
|rho_eps(r)| <= 2 eps + eps + int_0^{eps|r|} (1 - cos t)/t dt <= 4 + 2 log(1 + |r|) (Lemma 6 for |h| <= 1; (1 - cos t)/t <= min(t/2, 2/t)); rho_eps(r) -> 0
for each r as eps -> 0; (4 + 2 log(1+|r|)) |V|^2 is integrable. By dominated convergence
(1/2pi) int |V|^2 Re psi dr = lim_{eps->0} int_eps^inf ( g_v(0) e^{-2x}/x - k(x) g_v(x) ) dx.
(d) The integrand equals g_v(0)(e^{-2x} - 1)/x + (g_v(0) - g_v(x))/x - h(x) g_v(x), each term bounded near 0
(g_v Lipschitz), and g_v = 0 beyond 2L. So the limit is
g_v(0) [ int_0^{2L} (e^{-2x} - 1)/x dx + int_{2L}^inf e^{-2x}/x dx ] + int_0^{2L} (g_v(0) - g_v(x))/x dx - int_0^{2L} h g_v dx,
and the bracket is -Ein(4L) + E_1(4L) = -gamma_E - log(4L) (DLMF 6.2.3, 6.2.4). Adding -log(pi) g_v(0) gives A(v). []

**Lemma 6.** 0 <= h(x) <= 1 for 0 < x <= 1.
Proof. h >= 0 iff x e^{x/2} >= sinh x iff phi(x) := 2x - e^{x/2} + e^{-3x/2} >= 0. phi(0) = 0, phi'(0) = 0,
phi''(x) = -(1/4) e^{x/2} + (9/4) e^{-3x/2} > 0 for x < log 3. So phi >= 0 on [0, 1]. Upper bound: sinh x >= x gives
h(x) <= (e^{x/2} - 1)/x, which is increasing, so h <= e^{1/2} - 1 < 1 on (0, 1]. []

**Lemma 7 (everything is bilinear and rational).** Let psi_j(t) = P_j(t/L) (Legendre), j < NB, and
v = sum_j b_j psi_j with all j of one parity pi. Then for 0 <= x <= 2L

    g_v(x) = sum_{j,k} b_j b_k gamma_jk(x),    gamma_jk(x) = int_{x-L}^{L} psi_j(u) psi_k(u - x) du,

gamma_jk is a polynomial with rational coefficients (L rational), gamma_jk = gamma_kj when j + k is even
(substitute u -> x - u and use psi_n(-t) = (-1)^n psi_n(t)), and for monomials
int_{x-L}^{L} u^i (u - x)^l du = sum_{q=0}^{l} C(l,q) (-x)^{l-q} [ L^n - (x - L)^n ]/n, n = i + q + 1.
A(v) = sum_{j,k} b_j b_k AA_jk with, for gamma_jk(x) = sum_n c_n x^n,

    AA_jk = -(log(4 pi L) + gamma_E) c_0 - sum_{n>=1} c_n (2L)^n/n - sum_{n>=0} c_n H_n + s_pi 2 E_j E_k,
    H_n = int_0^{2L} h(x) x^n dx,   E_j = int_{-L}^{L} psi_j(t) e^{t/2} dt = sum_i (coefficient of t^i in psi_j) mu_i,
    mu_i = int_{-L}^{L} t^i e^{t/2} dt,   s_0 = +1, s_1 = -1   (E_-(v) = (-1)^pi E_+(v)).
Proof: linearity of each term of A in g_v, and int_0^{2L} (c_0 - gamma(x))/x dx = -sum_{n>=1} c_n (2L)^n/n. []
Since g_v(2L) = 0, g_v(x) = (2L - x) q_v(x) with q_v a rational polynomial.

## 2. The refutation rule  (PROVED)

**Lemma 8.** Let 0 <= y_c - w < y_c + w <= 2L (rationals), and v_1, ..., v_r polynomials as above. Let [A_i] be balls
containing A(v_i) and [q_i] balls containing q_{v_i}(y) for all y in [y_c - w, y_c + w]. Define
  ub = min over { i : [q_i] > 0 } of [A_i]/(2 [q_i]),     lb = max( 0, max over { i : [q_i] < 0 } of [A_i]/(2 [q_i]) ).
If at least one [q_i] > 0, and either (a) lb > ub, or (b) for some i: [A_i] + 2 max(|lb|, |ub|) |[q_i]| < 0,
then for every y in [y_c - w, y_c + w] with y < 2L and every m >= 0 there is an i with Q_{y,m}(v_i) < 0.
(All comparisons of balls are certain comparisons.)
Proof. Suppose Q_{y,m}(v_i) >= 0 for all i. Put m' = m (2L - y) >= 0. By Lemma 5, 0 <= A(v_i) - 2 m' q_{v_i}(y), i.e.
2 m' q_i <= A_i. If q_i > 0 this says m' <= A_i/(2 q_i); if q_i < 0 it says m' >= A_i/(2 q_i). So lb <= m' <= ub, which
contradicts (a). Under (b): Q_{y,m}(v_i) = A_i - 2 m' q_i <= A_i + 2 |m'| |q_i| <= A_i + 2 max(|lb|, |ub|) |q_i| < 0. []
When the rule does not refute the interval, the same argument shows that every feasible m lies in
[lb/(2L - y), ub/(2L - y)]: this gives the weight bounds of Theorem B (ii).

Enclosure of q_v on an interval: q_v(y_c + t) = sum_k c_k t^k (exact Taylor shift with rational arithmetic), so
|q_v(y) - c_0| <= sum_{k>=1} |c_k| w^k for |y - y_c| <= w (an exact rational number).

For y >= 2L the atom term vanishes (g_v(y) = 0) and Q_{y,m}(v) = A(v): one vector with A(v) < 0 refutes all of these
and also m = 0.

## 3. The computation  (COMPUTED; script `forcing.py.txt`)

    python3 tools/memcap.py 1 python3 rh/experiments/foothold/forcing.py.txt 28 600 1/2     -> forcing_half.log   (7 s)
    python3 tools/memcap.py 1 python3 rh/experiments/foothold/forcing.py.txt 32 800 27/50   -> forcing_0p54.log  (12 s)
(arguments: NB, working precision in bits, L). What the script does:
1. psi_j with rational coefficients (three-term recurrence), gamma_jk by the monomial formula of Lemma 7 (`fmpq_poly`,
   exact).
2. H_n, n <= 2NB, and mu_i, i < NB, as Arb balls: `acb.integral` on [delta, 2L], delta = 2^-120, of the meromorphic
   function (e^{x/2}/sinh x - 1/x) x^n, plus the ball [0, delta^{n+1}] for int_0^delta (Lemma 6). mu_i: entire integrand.
3. The ball matrix AA (Lemma 7); largest radius 4.1e-37.
4. Float copies of AA and of Gam(y) are used ONLY to propose test vectors: for a centre y_c the float optimum m* >= 0
   of min(lowest even eigenvalue, lowest odd eigenvalue), the lowest eigenvectors of both parity blocks at
   m*, m* -+ 0.02, plus three fixed vectors (lowest eigenvectors of the no-atom form in each parity, and the
   constant function). Each vector is rounded to rationals with denominator 10^12. Nothing about how the vectors
   were found enters the proof.
5. For each rational vector b: the ball A(v) = b^T AA b, the exact polynomial g_v = b^T Gam b, the exact division
   g_v = (2L - x) q_v (the script asserts remainder 0), and the Taylor enclosure of q_v (class `Vec`).
6. `bounds(y_c, w, vecs)` is Lemma 8 verbatim. `sweep` covers [0, y_l] from the left and [y_r, 2L] from the right
   by adjacent intervals (halving the step when the rule does not refute, stopping at step 5e-6); every printed
   line "certified infeasible" is one application of Lemma 8.
7. On the residual interval (y_l, y_r), cut into 256 pieces, the hull of the weight bounds of Lemma 8.
Results (logs):

| L | intervals | refuted for all m >= 0 | residual y | residual weight | no atom: A(v)/‖v‖² even, odd |
|---|---|---|---|---|---|
| 1/2 | 47 + 19 | (0, 70957/102400] and [7139/10240, 1] | (0.6929395, 0.6971680) | [0.4885585, 0.5103666] | -0.03235195, -0.32222834 |
| 27/50 | 45 + 25 | (0, 35487/51200] and [71033/102400, 27/25] | (0.6931055, 0.6936816) | [0.4899431, 0.4924198] | -0.06506809, -0.41036373 |

Together with section 2 (y >= 2L) this proves (ii) and (iii). (i) is Theorem A. []

## 4. Independent checks (COMPUTED, not part of the proof)

- `validate_x.py.txt` (mpmath, 25 digits): for v = (1/4 - t^2)^4 and t (1/4 - t^2)^4 at the true atom, Lemma 5 evaluated by
  mpmath quadrature gives 1.1753288841703535145e-8 and 5.344742566406390918e-9; the Arb/rational code gives the same
  20 digits; the frequency-side definition evaluated by quadrature gives 1.17532888468e-8 and 5.3447425664043e-9
  (agreement limited by that quadrature).
- Rayleigh-Ritz bottoms of the exact form on polynomials (float). CORRECTED 2026-11-11 after the verifier's finding
  (verifier/PROGRESS.md section 7): my script evaluates them at y = 693147/10^6, which is 1.8e-7 below log 2, and gets
  9.0567e-7 (L = 1/2) and 6.447e-8 (L = 27/50); at y = log 2 the verifier gets 9.4166e-7 and 1.07699e-7. So my numbers
  are NOT bottoms at the true atom (the bottom moves by about 0.2 per unit of y: the position is felt at the 1e-7
  level, which is the content of the theorem). With the corrected values: L = 1/2: capped lower value 9.097e-7
  (R = 320, float) <= 9.3357e-7 (Fourier basis N = 320) <= 9.3661e-7 (polynomials, degree < 44).
- The residual interval at L = 1/2 agrees with the unreviewed outer bound (1.9996, 2.0080) of seminar S1-parity.

## 5. What is and is not shown

- (ii) is an OUTER bound. The true feasible set at each L is a closed convex-in-m set containing (log 2, log 2/sqrt 2);
  how much smaller than the residual box it is, is not determined here (an inner bound for a neighbourhood needs
  the certificate of PROOF_window_prime2.md run on a family of atoms; not done).
- The hypothesis uses only polynomials of bounded degree: the statement is about a finite-dimensional cone.
- One free atom only. Two free atoms on a window that contains 2 and 3 were not treated.

## 6. Barrier check

- B1: this is the statement that the "Euler factor at 2" cannot be altered on this window: position within 0.42%
  (L = 1/2) or 0.06% (L = 27/50), weight within 4.5% or 0.5%.
- B2/B10: the theorem is exactly a control: every Beurling-type displacement of the first prime beyond the
  residual interval is refuted by an explicit test vector.
- B11 (weights/centre): the weight is pinned to an interval of relative width 0.5% at L = 27/50. The theorem does
  use the size of the local root: an atom at log 2 with weight (log 2/sqrt 2)(1 + delta), |delta| > 0.5%, is refuted.
- B6: this is a converse-type (rigidity) statement. It does not by itself give positivity on any larger window.

## 7. Novelty search (owner rule 5)

Queries: the two in PROGRESS.md section 2, and (q3) below in PROGRESS.md section 8. Read: Connes-Consani 2106.01715
section 2.3 (lines 567-590 of the TeX) and the digest rh/library/connes-consani-zeta-cycles.md (first 60 lines);
Zhu 2608.24827 section 1. Found: numerical statements only. Not read: Johns' "Positive solutions of Weil's explicit
formula" beyond the project's digest entry (it treats admissible pairs with prime-side support beyond log 2, an
overlapping question in a different framework; unreviewed). Honest status: not found as a theorem in what was read.
