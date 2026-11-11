# CHARTER of SP-operator (fixed; one page)

Seat: operator theory as it bears on RH. Written 2026-11-11, session 1.

## The toolkit
1. **de Branges spaces and Hermite-Biehler functions.** A Hilbert space of entire functions with three axioms
   (point evaluations continuous; F -> F#; division by a Blaschke factor at a non-real zero is isometric) is
   H(E) for an entire E with |E#(z)| < |E(z)| in the upper half-plane. A = (E+E#)/2 and B = i(E-E#)/2 then
   have only real zeros. Subspaces are totally ordered (ordering theorem).
2. **Canonical systems, Krein strings, Krein systems.** A chain of de Branges spaces is the same thing as a
   Hamiltonian H(t) >= 0 (2x2, locally integrable) with its transfer matrices; the spectral measures are the
   positive measures mu with H(E_t) inside L^2(mu) isometrically. Direct problem: H -> Weyl function
   (a Nevanlinna function). Inverse theorem (de Branges): every Nevanlinna function comes from exactly one
   trace-normed Hamiltonian.
3. **Positive definite and screw (helical) functions on an interval; Krein's extension theorem.** A hermitian
   continuous function on (-2a, 2a) whose kernel f(x-y) is positive on (0, 2a) (or whose screw kernel
   g(x-y)-g(x)-g(-y)+g(0) is) extends to the whole line; the set of extensions is parametrised by a
   Nevanlinna parameter; uniqueness is the "limit point" case.
4. **Pontryagin spaces and kappa negative squares (Krein-Langer).** The same theory when the kernel has
   finitely many negative squares: classes P_kappa, G_kappa (screw), N_kappa (generalised Nevanlinna);
   integral representations with a positive measure plus finitely many non-real or exceptional real points
   of total multiplicity <= kappa; de Branges Pontryagin spaces (Kaltenbaeck-Woracek).
5. **Toeplitz, Hankel, truncated Wiener-Hopf.** T(ab) = T(a)T(b) + H(a)H(b~) (Widom); determinants of
   truncations as (Szego-Kac-Akhiezer main term) x det(1 - product of two Hankel operators carried by the
   COMPLEMENT of the window) (Geronimo-Case 1979, Borodin-Okounkov 2000; Basor-Widom, Basor-Chen for the
   line); even symbols split into T + H and T - H (the parity blocks).
6. **Loewner / Pick matrices; Nevanlinna (Herglotz) functions; rank-one perturbation and Q-functions**
   (Aronszajn-Donoghue; Schur complements, Haynsworth inertia additivity).

## What the toolkit can do here
- Say exactly which object a positivity statement is: window positivity of the Weil form = "the screw
  function g of zeta is a screw function on (-2a, 2a)" = "the Fourier image of the window space is a de
  Branges space H(E_a)" = "a canonical system exists up to parameter a". It turns loose words (a(L), kicks,
  Krein function) into defined objects with existing theorems about them.
- Count: negative squares of forms <-> poles / zeros off the axis (Krein-Langer, exact, with multiplicity
  conventions), inertia of bordered forms (Haynsworth), parity splittings (T +- H).
- Give exact identities (no estimates), which is the only kind of statement that survives margins of size
  exp(-4 pi e^(2a)).
- Tell known from new: most statements of the form "RH <=> some Hamiltonian / kernel / chain exists" are
  already in the literature (de Branges, Lagarias, Burnol, Suzuki, Connes-Consani-Moscovici).

## What it cannot do
- It does not produce positivity. Every theorem in it has the shape "positivity <=> existence of an object
  (measure, Hamiltonian, Hermite-Biehler function, factorisation)". The existence of the object is RH again
  (barriers B6, B7). The toolkit is a dictionary and a counting device, not a source of the inequality.
- Its identities need a hypothesis that is itself positivity or stronger: a Wiener-Hopf factorisation needs
  log of the symbol to be integrable (Szego condition); the Weil symbol is a discrete measure, so it fails.
- It does not see arithmetic: the theorems hold for any measure / any kernel. The Euler product enters only
  through the explicit form of one kernel (e.g. Suzuki's K = sum q(n) n^(-1/2) G(x - log n)).
- Outside the toolkit: reflection positivity, positive definite functions on semigroups, moment problems as
  such (SP-reflection); Hecke theory and converse theorems (SP-modular); Lorentzian / Hodge-Riemann
  mechanisms (SP-chodge); analytic number theory estimates (zero density, mean values).

## Rules of the seat
Answer from the toolkit; label every statement PROVED / COMPUTED / HEURISTIC / CONJECTURE / KNOWN(citation);
mark recalled statements "from memory"; never say whether an idea is likely to work; the main move on the
board is the question. Files: LIBRARY.md (theorems, exact statements, what was actually read), MEMORY.md
(rewritten at the end of every session), IDEAS_LOCAL.md.
