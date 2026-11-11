<!-- local-idea-log owner=BG -->
# Local idea log of BG

Private working log of agent `BG`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `BG/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · Every monotone family on record has zeta as its last member (window, damping, conductor, heat time, pole weight)
- status: open
- source: BG
- date: 2026-11-11
- plain english: In each one-parameter family we know (how wide the window is, how much we damp, how big the conductor is, how long we heat), truth spreads in one direction only, and zeta always sits at the very end. Example: if the damped form is non-negative at damping 0.3 it is non-negative at 0.31, never the other way; it is proved from 0.5 upward and RH is damping 0. So no induction can run along these dials: there is nothing true beyond zeta to start from.
- claim: PROVED one line each (restriction; Schur product; adding Lebesgue measure): BIGGER.md table
- log:

## #2 · BG-1: the convex body of positive solutions with free real weights on the integers; zeta is its corner in the (pole weight, conductor) plane
- status: open
- source: BG
- date: 2026-11-11
- plain english: Forget primes and zeros. Keep the smooth term of the functional equation, a dial r for how strong the pole is, a dial q for the conductor, and permission to put any real weight on every whole number. Ask for the smallest conductor at which SOME choice of weights keeps the energy non-negative. Computed: for zeta's own data (r = 1) the answer is conductor 1 and the weights that achieve it are exactly log 2, log 3, log 2, log 5, 0, log 7, ...; for r = 0.5 it is 2.009; for r = 0 it is 4.036; for r = 1.1 nothing works at any conductor. So zeta is a corner of the allowed region. For the other kind of smooth term (the one that belongs to odd characters) the smallest conductor is 2.8606, below 3, the conductor of the first real character: there the extreme object is NOT built from primes.
- wall: W2/B10 and the zero margin B3. Not W1: no approximants. The unknowns are prime-side weights, so W2 does not apply. Zero margin is met only AT the corner; everywhere else on the boundary curve (r < 1) the objects are non-arithmetic and above the curve the feasible set has interior. Wall it meets: approaching the corner the interior shrinks to a point; and existence of the pole-free threshold object on all windows is itself unproved.
- new input: (1) free REAL weights on the integers with the threshold conductor as the objective (a concave programme), instead of testing given weights; (2) the pole weight r as a parameter, which separates the two parity blocks of wall WJ13 (r < 1 costs the even block, r > 1 the odd block); (3) nestedness in the conductor by adding Lebesgue measure; (4) lowest window eigenvalue of zeta = minus the log of the conductor at which the true primes would still be feasible on that window.
- claim: Conjecture V1-V4 in rh/BIGGER.md; V1 implies RH (proved, PROGRESS 4 P-a)
- prediction: Six blind predictions in PROGRESS 3.1-3.8. Hits: zeta type threshold 1 with von Mangoldt maximiser; r > 1 infeasible; q*(r) decreasing; q*_1.5(even,0) = 4.03628. Misses: odd and even pole-free thresholds predicted 3 and 5, measured 2.86055 and 4.0363; odd factor with a full pole predicted to give von Mangoldt at conductor 1, measured a different object at 0.99838; linear law predicted exact, defect stalls at 1.1e-6.
- smallest: A certified finite instance: on the window L = 1.25 no real weights on the integers 2..12 make the odd form non-negative at conductor below 2.86 (dual certificate in interval arithmetic). Next: an explicit positive solution for the pole-free even factor at conductor 4.2 on all windows.
- novelty: SEARCHED 2026-11-11, two web queries, summaries only (PROGRESS 3.7): conductor bounds by positivity are classical (Odlyzko, Mestre, Miller math/0112196) and known not to be sharp in general; Johns preprint has the conductor threshold for zeta with free positions. Not found: real weights restricted to integers, pole-weight parameter, corner, numbers 2.86055 / 4.0363 / 0.99838 / 1.39532. Not established as new.
- log:
  - 2026-11-11: COMPUTED threshold_a..e.log, float64, one implementation, N = 40..80 modes, L up to 1.5. See BIGGER.md table. Bug found and fixed in the odd+pole patch (threshold_c_BUGGY.log is invalid).

## #3 · The pole-free threshold objects: what are they? (odd: conductor 2.86055, weights -0.880, 0.894, -1.738 at 2,3,4; even: 4.0363, weights -1.3505, 0.9306, -2.3716)
- status: open
- source: BG
- date: 2026-11-11
- plain english: The extreme object for the odd smooth term is not the first odd character (conductor 3); it sits at 2.8606 and puts weight on 6. It is to the explicit formula what the best possible bound is to sphere packing in a dimension where no lattice achieves it. Half-thought: its zero side need not be atoms; is it a measure with a continuous part? Is 2.86055 a known constant (an Odlyzko-type bound restricted to integer positions)?
- log:

## #4 · Odd Gamma factor can carry a full pole at conductor 0.99838 < 1 with weights near but not equal to von Mangoldt
- status: open
- source: BG
- date: 2026-11-11
- plain english: Explicit feasible point at conductor 1: zeta's zeros plus the continuous density (1/2 pi)(Re psi(3/4+it/2) - Re psi(1/4+it/2)). The optimum is slightly better (0.99838) and moves the weights by 2 to 7 percent, with 0.057 on the composite 6. So the pole and the smallest conductor do not force the primes; the exact even Gamma factor does. Half-thought: the family of Gamma factors Gamma_R(s+mu), 0 <= mu <= 1, gives a curve q*(mu) from 1 to 0.99838; is it monotone, and is mu = 0 again a corner (nothing feasible for mu < 0)?
- log:
  - 2026-11-11: status -> parked: not new in substance (Barban-Davenport-Halberstam below the large-sieve range); blocked at: no independent control of the real singularity of sum_q q^-w sum_chi |P_chi(q^tau)|^2
  - 2026-11-11: status -> open: status set by mistake (meant for #5); this entry is open

## #5 · BG-2: Deligne's amplification transposed to characters is the variance of primes in progressions to small moduli
- status: parked
- source: BG
- date: 2026-11-11
- plain english: Deligne bounded every member of a family by bounding an average of even powers, each term being non-negative. For Dirichlet characters the same trick is free: if the average over all characters of conductor up to Q of the squared prime sum of length Q^tau is at most Q^A for larger and larger tau, every zero is within A/(2 tau) of the line. Proved for tau up to 2 (large sieve). Example: tau = 4, A = 2 would put all zeros within 0.25 of the line. But the first step past tau = 2 is already a zero-free strip, and the statement is the classical variance problem. What is missing from Deligne's proof is knowledge of the poles of the family series.
- claim: MH(tau, A) implies Theta <= 1/2 + A/(2 tau); proved, PROGRESS 4 P-d
- log:
  - 2026-11-11: status -> parked: not new in substance (Barban-Davenport-Halberstam below the large-sieve range); blocked at: no independent control of the real singularity of sum_q q^-w sum_chi |P_chi(q^tau)|^2

## #6 · BG-3: damping plane; critical damping of zeta(s-d)zeta(s+d) is d + theta; ground value 2 xi'/xi(1/2+d') jumps to minus infinity at theta
- status: open
- source: BG
- date: 2026-11-11
- plain english: Damp the kernel by e^(-d'|x|). For the product zeta(s-d) zeta(s+d) the damped form is non-negative exactly when d' is at least d plus the distance theta of zeta's worst zero from the line. Example: unconditionally d' >= d + 0.5 works; RH says d' >= d works. Known family (Hinkkanen, Lagarias, Garunkstis); no mechanism to lower d'.
- log:

## #7 · Half-thought: the linear law log q*(r) = (1-r) c0 misses by 1.1e-6; what is the defect?
- status: open
- source: BG
- date: 2026-11-11
- plain english: The dual certificate of the pole-free problem is a positive definite function vanishing at every log n; the defect is its Weil energy sum over zeros of ghat(gamma). It is tiny but apparently not zero. Is 1.1e-6 a limit or still falling slowly? Needs L = 1.75, 2.0 in higher precision.
- log:

## #8 · Half-thought: Kunneth amplification needs a product for the k-fold object convergent with loss independent of k
- status: open
- source: BG
- date: 2026-11-11
- plain english: A function with zeros at sums of two zeros, given by a product that converges and does not vanish for real part above 3/2, would put every zero of zeta within 1/4 of the line. Projection gives prod over rho of zeta(s - rho): circular. Deligne's gain comes from pencils whose fibres are new curves.
- log:
