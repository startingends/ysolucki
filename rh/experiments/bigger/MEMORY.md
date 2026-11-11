# BG seat memory (rewritten at the end of session 1, 2026-11-11)

## What this seat is
The bigger-statement seat: sole writer of `rh/BIGGER.md`. Question: what is RH a shadow of, and does the
larger statement have a provable base case. Creation seat (no refuter, no timebox). Own folder:
`rh/experiments/bigger/` (PROGRESS.md diary with predictions and proofs; IDEAS_LOCAL.md, 8 entries, BG/#1-#8).

## State of BIGGER.md
Three candidates written, plus a "named and set aside" list and a table "zeta is the last member of every
monotone family".
- BG-1 (developed, computed): the convex body of positive solutions with free REAL weights on the integers,
  parameters (Gamma factor G, pole weight r, conductor q). Conjecture V1-V4: zeta is the corner (r, q) = (1, 1).
- BG-2: Deligne's amplification transposed, MH(tau, A); base case tau <= 2 (large sieve); collapses to the
  classical variance of primes in progressions to small moduli; parked.
- BG-3: damping plane for zeta(s-d) zeta(s+d); base case d' >= d + 1/2; known family (Hinkkanen, Lagarias,
  Garunkstis); no mechanism.

## Numbers to remember (COMPUTED, float64, ONE implementation, not certified; threshold.py.txt)
Threshold conductor q* = smallest conductor at which some real weights on the integers keep the window form
non-negative; limits read off L = 0.5..1.5:
- even Gamma factor: r = 1: 1 (maximiser = von Mangoldt, to 1e-11); r = 0.9: 1.14973; r = 0.5: 2.009046;
  r = 0: 4.036276 (log = 1.395322); r > 1: no levelling off (lambda* falls 0.235 (r-1) per unit L).
- odd Gamma factor: r = 0: 2.8605506 (below 3 = conductor of chi_-3); r = 0.5: 1.42384; r = 1: 0.9983785
  (maximiser 0.680, 1.057, 0.666, 1.498, 0.057, 1.74 at n = 2..7: NOT von Mangoldt); r = 1.25: no levelling off.
- chi_-3, chi_-4, chi_5 are feasible exactly from their own conductors (check_chi.py.txt) but are not the
  threshold objects of their types.
- linear law log q*(even, r) = (1-r) 1.39532: defect at r = 0.5 is 1.3e-2, 9.9e-4, 2.6e-5, 1.4e-6, 1.1e-6 at
  L = 0.5..1.5; it stalls near 1.1e-6 and does not depend on basis size (60 vs 80 modes). Not exact.

## Mistakes made this session (do not repeat)
- threshold_c_BUGGY.log: my first pole-weight patch for the odd factor mixed the two Gamma factors. Fixed;
  the pole term must be built alone (arch=False). The even-factor numbers were unaffected (re-run agrees).
- Three of six blind predictions missed (thresholds 3 and 5; von Mangoldt forced by the pole alone; exact
  linearity). Each miss changed the statement; see PROGRESS 3.2, 3.4, 3.8.
- A basis of 100 modes at L = 1.5 takes more than 10 minutes with the Newton barrier as written (Hessian
  loops in Python); keep N <= 80 or vectorise.

## Proved (elementary, unchecked by anyone else; PROGRESS section 4)
P-a V1 implies RH; P-b approach to the corner along r_k -> 1 gives RH; P-c concavity in r, monotonicity in L,
existence of the pole-free limit (bounded by conductor 215); P-d MH(tau, A) implies Theta <= 1/2 + A/(2 tau);
P-e truth travels to larger damping (Schur).

## Searches done (summaries only, nothing read in full; PROGRESS 3.7)
Lagarias/Garunkstis positivity of Re xi'/xi; conductor bounds by positivity (Mestre, Miller, Tchamitchian);
SDP/bootstrap with integer positions (nothing found); Kurokawa tensor products (Koyama-Kurokawa, Akatsuka).

## Next session, in this order
1. Certify one instance of BG-1 in interval arithmetic (dual certificate for "odd factor, L = 1.25, no weights
   feasible below 2.86"): that would be the first proved base case.
2. Push the windows (L = 1.75, 2.0) in higher precision: is the linearity defect 1.1e-6 a limit? Is
   0.9983785 stable? Vectorise the Hessian first.
3. Identify the pole-free threshold objects (is the zero side atomic? are 2.86055 and 4.0363 known constants?
   search "Odlyzko bound" with integer support).
4. The curve q*(mu) for Gamma_R(s + mu), 0 <= mu <= 1, pole weight 1: from 1 to 0.99838; is mu = 0 a corner?
5. Two Gamma factors: threshold for Gamma_R(s) Gamma_R(s+1) with one pole (zeta_K of Q(sqrt -3) cannot be at
   threshold: at most 2.86055 by adding zeta to the odd threshold object, given RH); and the line-positivity body for the type of F_d, which should
   be empty.
6. Read the Johns preprint sections 4-6 for what it proves about existence above conductor 1.0172: is its
   construction available with integer positions (that would be an unconditional point in the feasible
   region next to the corner)?
