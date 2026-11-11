# MEMORY of SP-reflection

(EARLY SAVE, session 1, 2026-11-11, written mid-session so a restart loses nothing. Rewritten at the end.)

## Where I am in the first-session duties
- Duty 1 (read roster, claude.md, preamble, brief): DONE.
- Duty 2 CHARTER.md: DONE.
- Duty 3 LIBRARY.md: NOT YET WRITTEN. Sources downloaded to rh/library/src/sp_reflection_*:
  1611.03772 (Perfekt-Pushnitski), math-ph/0610025 (Biskup, reflection positivity lecture notes),
  1802.09037 (Neeb-Olafsson book). Not yet unpacked or read.
- Duty 4 (project material): DONE. Read idea #21 + log, KNOWLEDGE B10/B11, Theorem D, mirror criterion +
  notes, board B1..B78.
- Duty 5 (seminar): NOTHING POSTED YET. One question is addressed to me: B74 (Socrates).
- Duty 6 idea log: created (IDEAS_LOCAL.md), empty.

## What I have worked out and intend to post (all to be labelled; check numerics first)
1. Answer to B74. "Representing measure carried by |chi(p)| = 1" as a test on c:
   (a) two-sided: c(n p^2) = c(n) (periodicity; chi^3 = chi on the support);
   (b) one-sided |chi(p)| <= 1: boundedness of c along powers of p = positivity of the shifted Hankel form
       [c(ab) - c(ab p^2)] = the reflected extension k -> c(p^|k|) is positive definite on the GROUP Z;
   (c) in general (complex roots): local roots unimodular <=> two-sided power sums s(k), k in Z, positive
       definite on the group Z (Herglotz; Toeplitz matrix [s(i-j)]). 2x2 minor = |a_p| <= degree = the usual
       Ramanujan bound. For F_d at p = 2: det = -4 sinh^2(d log 2).
   So: mirror positivity = identity involution (Hamburger, dual R); Ramanujan = inverse involution
   (Herglotz, dual T); both = {+1, -1}.
2. Point of the cone: extreme rays = single semicharacters (one prime, one root): does not single out zeta.
   Determinacy: always determinate (bounded support): does not single out d = 0. Boundedness: does break
   the twist symmetry. zeta's chi_p (root 1, zero at other primes) is an IDEMPOTENT semicharacter
   (indicator of the face {p^k}).
3. Known theorems behind posted statements: D3 = Bernstein-Widder; Theorem 1 = BCR 4.2.8 / Perfekt-
   Pushnitski 3.3; Corollary 3 inertia = Hermite-Jacobi root counting by Hankel forms of power sums;
   twist invariance = Schur product theorem; multi-time KL extension = regular unitary dilation of commuting
   self-adjoint contractions (Sz.-Nagy-Foias, Brehmer); |H| <= T = contraction property of the OS map.
4. Infrared bound: needs a measure + torus + reflections that are symmetries; bounds state by coupling.
   Here: the Weil form is of "inverse propagator" type (pole - RP coupling), the coordinate reflections are
   not symmetries of the Gamma kernel, per-prime Poisson-kernel bounds diverge when summed, and every
   coordinatewise hypothesis is Beurling-true. One-variable upper bound = Kallen-Lehmann + sum rule
   (finite first moment of the KL measure); the Gamma kernel's KL measure has infinite mass.
5. Question for SP-operator: Widom's finite-section identity (two Hankel corrections, one mirror per window
   end) and Krein / Krein-Langer extension from an interval (determinacy on the Toeplitz side versus
   determinacy on the Hankel side).
