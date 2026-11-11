# PROOF_uniqueness: notebook N14 step 4 made rigorous (isolation of the von Mangoldt weights), and its exact scope

Agent R2-parity, 2026-11-10. JOB 1 (d).

## Statement (Theorem U). PROVED, conditional on RH
Assume RH. Let D = sum_j d_j ( delta_{u_j} + delta_{-u_j} ) be a real atomic measure on R with distinct positions
u_j > 0 (no atom at 0) and sum_j |d_j| < infinity. (In N14: u_j = log n, d_j = -(m_n - Lambda(n)) n^{-1/2}, so the
hypothesis is sum_n |m_n - Lambda(n)| n^{-1/2} < infinity; the positions need not be logarithms of integers.)
Let W be the Weil distribution of zeta, W(g) = sum_gamma h(gamma), g = f * f~, h = |fhat|^2 (f in C_c^infinity(R)).
If W + D is positive definite on ALL of R, i.e.
      W(f * f~) + D(f * f~) >= 0   for every f in C_c^infinity(R),
then D = 0. In words: under RH, among all weight systems that differ from von Mangoldt's by an l^1 (after the n^{-1/2}
normalisation) atomic perturbation at any positions, only von Mangoldt's makes the full Weil form non-negative.

## Proof
Notation: g(u) = int f(x) conj f(x-u) dx = (1/2pi) int h(r) e^{-iru} dr, h = |fhat|^2 >= 0.
Step 1 (the perturbation on the zero side). D(g) = sum_j d_j (g(u_j) + g(-u_j)) = int h(r) E(r) dr, where
      E(r) = (1/pi) sum_j d_j cos(r u_j).
The series converges absolutely and uniformly (sum |d_j| < infinity), so E is a bounded continuous real function and the
interchange of sum and integral is justified (h is integrable).
Step 2 (localisation: E >= 0 off the zeros). Fix r_0 real, not an ordinate of a zero (RH: all ordinates gamma are real;
they form a discrete set). Let eta = dist(r_0, {gamma}) > 0. Take phi in C_c^infinity(R), phi != 0, and for T >= 1
f_T(x) = phi(x/T) e^{-i r_0 x}. Then fhat_T(r) = T phihat(T(r - r_0)), h_T(r) = T^2 |phihat(T(r - r_0))|^2.
 * Zero side: phihat is a Schwartz function, |phihat(s)| <= C_4 (1+|s|)^{-4}. So
   sum_gamma h_T(gamma) <= C_4^2 T^2 sum_gamma (T |gamma - r_0|)^{-8} = C_4^2 T^{-6} sum_gamma |gamma - r_0|^{-8},
   and the last sum is finite (all terms have |gamma - r_0| >= eta, and N(T) = O(T log T)). Hence W(f_T * f_T~) = O(T^{-6}).
 * Perturbation: D(f_T * f_T~) = int T^2 |phihat(T(r - r_0))|^2 E(r) dr = T int |phihat(s)|^2 E(r_0 + s/T) ds.
 Positivity gives 0 <= T^{-1} [W + D](f_T * f_T~) = O(T^{-7}) + int |phihat(s)|^2 E(r_0 + s/T) ds, and by dominated
 convergence (E bounded, continuous) the integral tends to E(r_0) ||phihat||_2^2. Hence E(r_0) >= 0.
 By continuity of E and discreteness of {gamma}:  E(r) >= 0 for ALL real r.
Step 3 (a non-negative trigonometric series without constant term vanishes). For a bounded continuous F write
M(F) = lim_{T->inf} (1/2T) int_{-T}^{T} F when the limit exists. For u != 0, M(cos(r u)) = lim sin(Tu)/(Tu) = 0, and by
uniform convergence M may be taken term by term. Fix k. The functions 1 +- cos(r u_k) are >= 0, so
      0 <= M( E (1 +- cos(r u_k)) ) = M(E) +- M(E cos(r u_k)).
M(E) = (1/pi) sum_j d_j M(cos(r u_j)) = 0 (all u_j != 0).
M(E cos(r u_k)) = (1/pi) sum_j d_j M( cos(r u_j) cos(r u_k) ) = (1/2pi) sum_j d_j [ M(cos(r(u_j - u_k))) + M(cos(r(u_j + u_k))) ]
               = d_k / (2 pi),
because u_j + u_k > 0 always and u_j - u_k = 0 only for j = k (distinct positive positions).
So 0 <= +- d_k/(2pi): d_k = 0. This holds for every k. QED

## Where N14's three lines were incomplete, and what the gaps were
N14 step 4: "the difference of the two zero-side measures is an almost-periodic function with mean zero that is >= 0 off
a discrete set, hence identically 0, hence m = Lambda". Verdict: CORRECT in substance; three points needed filling.
 1. "The two zero-side measures": the second one exists by the Bochner-Schwartz theorem (a positive-definite
    distribution is the Fourier transform of a positive tempered measure; CITED, Schwartz 1951 / Gel'fand-Vilenkin
    vol. 4). The proof above avoids it by the localisation in Step 2.
 2. "Hence identically 0": needs the fact that a non-negative almost periodic function with mean 0 vanishes; Step 3
    proves the needed case directly with the two multipliers 1 +- cos(r u_k) and gets d_k = 0 without passing through
    E = 0.
 3. The sign: the density that must be >= 0 off the zeros is that of (zero-side measure of the perturbed system) minus
    (sum of deltas at the zeros); in the notation above it is +E.

## Exact scope (each item PROVED by the argument or by the example given)
 * Uses RH (the base system must already be positive with a purely atomic, discrete zero-side measure). It does NOT use
   the Euler product, integrality of positions, or the sign of Lambda. It is a general fact: if a positive-definite
   distribution has discrete spectral measure, no l^1 atomic perturbation without an atom at 0 keeps it positive
   definite. So it cannot distinguish zeta from any other system for which positivity holds (B2: it does not prove too
   much, because positivity of the base is an assumption, not a conclusion).
 * "Atomic" is essential: W + D with D(u) = e^{-u^2} du is positive definite (sum of two positive-definite
   distributions) and D != 0. So is "no atom at 0": D = delta_0 works. So is "all of R": on a single window [-L, L]
   the statement is FALSE for every L, the feasible set has interior in the discretised problem (COMPUTED, section
   "joint" of PROGRESS.md: at L = 1 the weight at 6 can move by about 1e-13). The theorem gives no rate at which the
   window-L feasible set shrinks; that rate is the content of idea #9 and is not provable by this argument.
 * "l^1" is essential for the method (E must be a function). Example outside the hypothesis and outside the conclusion's
   reach: for conductor 5 the two honest L-functions share one archimedean term and differ by weights
   Lambda(n)(chi(n) - conj chi(n)) n^{-1/2}, which are not summable; both are (conjecturally) positive.
 * Control (judge J2, "FE-rigid dial"): the argument never uses uniqueness of the solution of the functional equation,
   so the dial does not test it; on the dial at n = 1.4 the base form is not positive and the theorem is silent.
 * Novelty: N14 itself marks this "surely folklore", and KNOWLEDGE section 7 records uniqueness theorems claimed in the
   Johns preprint (unverified, not re-read by me). No search run by this seat for Theorem U. Status: UNSEARCHED,
   presumed known.
