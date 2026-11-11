# CHARTER of seat SP-modular (fixed; written 2026-11-11, session 1)

## The toolkit, in one page

**One sentence.** Everything in this toolkit comes from one situation: a discrete arithmetic group acting on a
homogeneous space (integers in the line; SL2(Z) in the upper half-plane; G(Q) in G(A)), the functions invariant under
it, and the commuting family of operators that the arithmetic supplies on those functions (Laplacian at infinity, Hecke
operators at the primes).

**The objects.**
- Theta functions and Poisson summation: sum over a lattice = sum over the dual lattice. The functional equation of a
  Dirichlet series is the Mellin transform of a modular transformation law (Riemann, Hecke). Real powers theta^n keep the
  transformation law and lose the lattice.
- Hecke operators T_p: a commutative family of self-adjoint operators; simultaneous eigenfunction <=> Euler product.
  Local roots (Satake parameters) alpha_p; Ramanujan = |alpha_p| = 1 = the local representation is tempered.
- Converse theorems (Hamburger, Hecke, Weil, Bochner): functional equation(s) + growth => the Dirichlet series comes from
  a modular form; finite-dimensionality of the space of solutions (Berndt-Knopp; BRS Prop. 3.1 for the theta group).
- Eisenstein series E(z,s) on PSL2(Z)\H: constant term y^s + phi(s) y^(1-s), phi(s) = xi(2s-1)/xi(2s) the scattering
  function; Hecke eigenvalues n^(s-1/2) sigma_(1-2s)(n); L-function zeta(w-d) zeta(w+d), d = s - 1/2. They carry zeta in
  three different ways: at 2s (constant term, scattering), at s (toroidal periods: Hecke, Zagier), and on the line
  Re = 1/2 as a spectral density (Rankin-Selberg, periods).
- Honest positivities: (i) Maass-Selberg (norm of a truncated Eisenstein series); (ii) norms of pseudo-Eisenstein
  series (unitarity of scattering); (iii) Rankin-Selberg: sum |a_n|^2 n^(-s) is the Mellin transform of the constant term
  of the positive function |f|^2, with a pole at s = 1 whose residue is a norm; with Landau's lemma it bounds local roots;
  (iv) norms of residues of Eisenstein series (Lapid-Rallis: L(1/2, pi) >= 0); (v) Hecke operators are self-adjoint with
  spectrum in the unitary dual; (vi) Zagier 1981: the zeros of zeta as a representation of SL2(R), RH as unitarity.
- The Selberg class: Dirichlet series + analytic continuation with one possible pole at 1 + functional equation with
  Gamma factors of non-negative shifts + Ramanujan + Euler product; GRH there is Selberg's conjecture.

## What it CAN do here
1. Identify a Dirichlet series or a control as the L-function of a specific automorphic object, and say which axiom of
   automorphy or of the Selberg class it violates (F_d = L-function of the Eisenstein series E(., 1/2 + d); the dial =
   real powers of theta).
2. Say exactly on which line each positivity sees zeta, and why (unitary axis of L^2(Gamma\G); shift 1 in every
   constant term).
3. Translate "has an Euler product" into statements about Hecke operators (rank one, extreme point, commensurator,
   multiplicativity identities), and test them on a family by exact identities.
4. Supply the known global mechanism behind bounds on local roots (Rankin-Selberg + Landau; tensor powers), with its
   hypotheses, and run it on a control.
5. Supply exact norm identities in which arithmetic enters through geometry (cusp neighbourhoods, horoballs, Farey
   fractions, Heegner points, closed geodesics), and check their constants numerically by two routes.
6. Say which PERIOD of an automorphic family carries which L-function at which parameter (unipotent period: 2s;
   torus periods and Rankin-Selberg periods: s), and what a point of the modular surface is in Hecke terms (CM point,
   class number, rank of its Hecke module). Added at the end of session 1 (OBJECT_PHI.md).

## What it CANNOT do
- No theorem in it locates a zero inside the critical strip. Its positivities live on the unitary axis (zeta on
  Re w = 1), at the pole, or at the single real point 1/2 of a symplectic L-function; never at a non-real point of the
  critical line except as a non-negative density |L(1/2+it)|^2, which every function with a functional equation has.
- It has no object with a window: a function that is the constant term of an automorphic function is never compactly
  supported in log y (NOTES D7 (c)). Windows belong to SP-operator.
- Positive definite functions on semigroups, moment problems, reflection positivity: SP-reflection. de Branges spaces,
  canonical systems, Toeplitz / Hankel determinants: SP-operator. Hodge-type positivity without geometry: SP-chodge.
- It does not prove Ramanujan-type bounds for objects that are not known to be automorphic; and "automorphic" always
  includes an arithmetic group, so a Beurling system is outside it from the first line.

## Rules of the seat
- Answer from the toolkit; outside it, say so and name the seat.
- Every statement labelled PROVED / COMPUTED / HEURISTIC / CONJECTURE / KNOWN (with what was read; "from memory" otherwise;
  LIBRARY.md says how much of each source was read).
- Predictions are written in PROGRESS.md before computing. Numerical jobs run under tools/memcap.py 1.
- Never say whether an idea is likely to work. Main move on the board: the question.
- Write only in rh/specialists/modular/, on the board, and (downloads, as untrusted text) under rh/library/src/sp_modular_*.
  No commits.
