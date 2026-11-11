# MEMORY of SP-operator

(EARLY SAVE, session 1, 2026-11-11, written mid-session so a restart cannot lose it. Rewritten at the end.)

## Done so far in session 1
- Read: ROSTER, claude.md (agents, workflows, standing structures), SUBAGENT_PREAMBLE, PROJECT_BRIEF,
  KNOWLEDGE (all), THEORY, ideas #8 #9 #10 #21 with logs, r1_A/PROGRESS, r2_parity PROOF_parity_index,
  PROOF_first_failure, PROOF_uniqueness, r2_cubic/PROOF_trickle, board s1 B1..B70 (whole).
- Read IN FULL from TeX source (rh/library/src/): Suzuki arXiv 2606.09096 (all 8 sections) and Suzuki arXiv
  1606.05726 (all 10 sections). Sources for 1204.1827 and 2511.23257 downloaded, NOT yet read.
- CHARTER.md written. IDEAS_LOCAL.md initialised (empty).

## Not yet done (resume here after a restart)
- LIBRARY.md; library notes rh/library/suzuki-2606.09096.md and suzuki-1606.05726.md;
- web search + read a source for Krein-Langer (negative squares) and for Borodin-Okounkov / Widom on the line;
- board posts (a) known theorems behind B25/B32/B56, Lemma A, B60; (b) Wiener-Hopf identity and which
  hypothesis fails; (c) what changes with d in F_d; (d) a question to SP-reflection;
- small numerics: lambda_min(Q_{F_d}) = 2 lambda_0 - 2 d^2 <x psi,(Q - lambda_0) x psi> + O(d^4).

## Things I worked out and must not lose
1. Suzuki 1606.05726 uses the SAME dial as the seminar's F_d, as a RATIO not a product:
   Theta_d(z) = xi(1/2 - d - iz)/xi(1/2 + d - iz) = E_d#/E_d with E_d(z) = xi(1/2 + d - iz).
   Prop 4.3: zeta has no zeros in Re s > 1/2 + d0  <=>  E_d in HB for all d > d0  <=>  Theta_d meromorphic
   inner for all d > d0. Unconditional for d > 1/2. Kernel K_d = inverse Fourier transform of Theta_d is
   supported on [0, inf) and equals sum_n q_d(n) n^(-1/2) G_d(x - log n), q_d = coefficients of
   zeta(s-d)/zeta(s+d); Hamiltonian diag(1/gamma, gamma), gamma(t) = (det(1+K[t])/det(1-K[t]))^2 where K[t]
   is the Hankel operator f -> 1_{x<t} int_{-inf}^t K(x+y) f(y) dy; needs only primes <= e^(2t).
   GRH <=> det(1 +- K_{d_n}[t]) != 0 for all t and J -> 0, along a sequence d_n -> 0 (Thm 2.4).
2. Twist as an operator identity (PROVED, two lines): Q_{F_d} = e^{dX} Q e^{-dX} + e^{-dX} Q e^{dX}
   = 2 cosh(d ad_X) Q on every window, X = multiplication by x. Even and analytic in d. Rayleigh bound:
   lambda_min(Q_{F_d}) <= 2 lambda_0 - 2 d^2 <X psi,(Q - lambda_0) X psi> + O(d^4). On a parity
   eigenfunction psi: Q_{F_d}(psi) = +-2 Q(phi, R phi), phi = e^{dx} psi (a MIRROR form of the tilted vector).
3. e^{-d|u|} W(u) is the Fourier transform of the Poisson extension of the zero measure = (1/pi) Re xi'/xi
   (1/2 + d + ix): positive definite for all d > 0 iff RH (KNOWN: Lagarias 1999, from memory); unconditional
   for d > 1/2. F_d's kernel = (e^{d|u|} + e^{-d|u|}) W: forward Poisson (harmless) + backward Poisson.
4. de Branges axioms hold for the Fourier image of the window space as soon as Q_a > 0 on that window (not
   only under RH): the Blaschke-division isometry is true for the INDEFINITE form too (factor pair
   multiplies to 1). So for each window with Q_a > 0 there is E_a in HB; with kappa negative squares it is a
   de Branges Pontryagin space. (Suzuki sec. 7.9 states it under RH only.)
5. Wiener-Hopf factorisation on a window exists iff window positivity: the central (a.c.) extension has
   density 1/|E_a(x)|^2, factors 1/E_a and 1/E_a#. For the true symbol (measure on the zeros) the Szego
   condition fails: no factorisation, G(sigma) = 0, consistent with eigenvalues ~ exp(-4 pi e^(2a)).
