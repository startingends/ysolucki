<!-- local-idea-log owner=SP-modular -->
# Local idea log of SP-modular

Private working log of agent `SP-modular`. **Other agents: do not read or cite this file.**
Numbers here are local: an idea is cited as `SP-modular/#N`, never as `#N` (that means the main log).
Nothing here has been reviewed. An auditor copies the important entries into `docs/IDEAS.md`.

## #1 · The half-shift wall IS the modular surface: Suzuki's dial at w = 1/2 is the scattering theory of PSL2(Z)\H, and its window arithmetic is totients
- status: open
- source: SP-modular session 1, NOTES D4, D5
- date: 2026-11-11
- tags: instrument,F17,half-shift
- plain english: The project studies a quadratic form on a window whose positivity is RH. There is a sister form, half a unit to the right, whose positivity is a theorem, because it is literally the squared length of an actual function on the modular surface (a wave packet sent in from the cusp). When the packet reaches below height 1 the horoballs at the fractions a/c start to overlap, and each denominator c adds a term with weight phi(c)/c (Euler's totient: 1, 1/2, 2/3, 1/2, 4/5, ...). Example: for a bump between heights 0.30 and 1.35 the squared length is 0.2868684, computed once from the totients of c = 1, 2, 3 and once from zeta on the line Re = 1; the two agree to seven digits. So the sister form is a worked, provable model of 'positivity on a window with arithmetic atoms': everything the seminar computes for the Weil form (pinning of weights, first failure when an atom is changed, which parity fails first) can be computed there, where the truth is known.
- wall: Atlas F17 (half-shift wall) and wall WJ1 (nothing separates an impostor below its detection window): it does not attack them; it gives the F17 wall an exact, unconditional object on which the seminar's window instruments can be calibrated.
- new input: None toward RH. Instrument: an unconditional positive Hankel-plus-identity form with arithmetic atoms, where the reason for positivity (a norm) is known.
- claim: PROVED: Suzuki's Theta at (w,nu) = (1/2,1) equals ((s-1)/s) phi(s), phi = xi(2s-1)/xi(2s) the scattering function (NOTES D5). PROVED + COMPUTED: ||E_psi||^2 = ||f||^2 + sum_c (phi(c)/c) <f, kappa(-(v+v') - 2 log c) f> (NOTES D4). HEURISTIC: Suzuki's K[t] at w = 1/2 is this Hankel operator after rescaling; his Hamiltonian gamma_{1/2}(t) is then unconditional and made of totients.
- prediction: Before computing: if the totient weight at c = 2 is changed from 1/2 to 1/2 + eta, the form on functions supported above height T stays >= 0 only for eta in an interval around 0 whose width shrinks as T decreases, but only EXPONENTIALLY in log(1/T) (rate set by the zero-free region: resonances at rho/2), not doubly exponentially as for the Weil form. Impostor contrast: the Weil window pins Lambda(n) at rate exp(-4 pi e^(2L)) (board B150: forced by discreteness of the zeros); here the spectral side is absolutely continuous with a Szego condition, so the margin should NOT collapse.
- smallest: The identification of Suzuki's G at (1/2,1) with kappa (normalisations); then 'det(1+K[t]) > 0 for all t' as a Gram determinant.
- first test: Discretise the Hankel form on v in (-l, 0.3) for l = 0.5 .. 3; lowest eigenvalue of 1 + K and of 1 - K; pinning interval for the weight at c = 2, 3.
- kill line: The lowest eigenvalue of 1 + K on (-l, inf) decays faster than any exponential in l (then the half-shift model has the same degenerate margin as the Weil form and calibrates nothing).
- novelty: NOT SEARCHED beyond: Lagarias-Suzuki (read in part) and Suzuki's digest; Lax-Phillips / Pavlov-Faddeev unread. The identification is surely known to Suzuki and Lagarias; not found stated in what I read.
- log:
  - 2026-11-11: COMPUTED (halfshift_window*.log): first prediction (exponential margin) MISSED; margin collapses faster than exponential (0.415, 0.179, 0.0167, 1.2e-4, <= 1.9e-6 at l = 0.25 .. 1.25). So the half-shift form has the same degenerate margin as the Weil form. What survives: it is a POSITIVE CONTROL (positivity is a theorem) showing pinning of weights, missing-atom failure, one wrong-sign pole square and even-block-weakest. The kill line as I wrote it is met for 'the half-shift has room'; the instrument use stands.

## #2 · Two involutions on the log line: the mirror R (parity blocks) and the scattering involution S = R o phi (automorphy); Zagier's form is the Weil form on S-even functions
- status: open
- source: SP-modular session 1, NOTES D7
- date: 2026-11-11
- tags: dictionary,W2,F22
- plain english: The seminar splits window functions into even and odd parts under x -> -x and finds that positivity is |H| <= T (mirror sum against shift sum). Automorphic functions are 'even' for a different reflection: x -> -x followed by the phase of zeta on the line Re = 1. Zagier's 1981 unitarity statement is the Weil form restricted to functions even in that second sense. Example of what goes wrong: a function even in the second sense is never supported on a window (its mirror image leaks all the way down the cusp), so Zagier's test functions and the project's window functions have only 0 in common.
- wall: Wall W2 / atlas F22 (two disjoint test classes): this is a third test class (S-even functions), disjoint from windows; recorded so that nobody tries to feed Zagier's representation with window functions.
- new input: None: a dictionary. What it adds: the exact obstruction (poles of I(F;s) at rho'/2 inside the strip of the explicit formula).
- claim: PROVED (NOTES D7): fhat_F(r) = I(F; 1/2+ir); zero side of the Weil form of the constant-term profile = sum_rho |<F,E*(.,rho)>|^2/|xi(2 rho)|^2 under RH (Zagier's 'natural' norm); no compactly supported profile (zero count); Z(E_psi) = 2[T_W + Re H_W^phi], H_W^phi = sum_rho phi(rho) fhat(-gamma)^2.
- smallest: Done (the three statements above).
- first test: Numerical: sum_rho phi(rho) fhat(-gamma)^2 for the window ground states of lane A, from the zero list in tools/rhlib.py; compare with H_W.
- novelty: Zagier 1981 read whole; Cornelissen-Lorscheid 2009, Lorscheid 2010 read in part: none states the relation to Weil's form. Lachaud 2002/2003 (toroidal forms and Connes) NOT read: likely overlap.
- log:

## #3 · Dial identities: the multiplicativity defect is (8/45) n^3 (n-1)(n-2)(n-4)(n-8); coefficientwise positivity singles out the integers exactly below n = 4
- status: open
- source: SP-modular session 1, PROOF_dial.md
- date: 2026-11-11
- tags: control,dial,F20,proved
- plain english: The theta dial has a knob n; zeta sits at n = 1. Being an Euler product can be tested at the first place it could fail: is a(6) = a(2)a(3)? The difference is one polynomial, and its roots are 0, 1, 2, 4, 8: the dimensions in which numbers can be multiplied and lengths multiply (reals, complex numbers, quaternions, octonions). Example: at n = 1.4 the defect is -2.009; at n = 3 it is 48; at n = 4 it is exactly 0. A second test, 'all coefficients are >= 0' (they count lattice points when n is a whole number), holds on 0 < n <= 3 exactly at n = 1, 2, 3: at n = 2.5 the coefficient of q^7 is -35/16.
- wall: None: control statements (ideas 12, 13; atlas F20). They say what the dial's special points are, so that 'Hecke operators exist only at special points' is an identity and not a memory.
- new input: None toward RH (theorems about impostors).
- claim: PROVED: PROOF_dial.md Theorems A, B, C. COMPUTED: negatives at n = 3.1, 3.5, 3.9; none for n = 4.5 .. 7.5 up to m = 1000.
- prediction: P1, P2, P5 in PROGRESS.md: two hit, one missed (I predicted no negative coefficient at n = 3.5; there are 76 below 2000).
- smallest: Done. Open: every non-integer n in (3,4) has a negative coefficient; none for n >= 4.
- kill line: n/a
- novelty: Two searches, summaries only; integer case believed classical (Lehmer 1948, unread); real-n identity not found. NOT established as new.
- log:

## #4 · At the half-shift positivity is free and RH is a RATE; at shift zero RH is a positivity and the rate is free
- status: open
- source: SP-modular session 1
- date: 2026-11-11
- tags: framing,B3,WJ2
- plain english: Two neighbouring pictures of zeta trade roles. On the modular surface (half a unit to the right) every quadratic form in sight is non-negative for a trivial reason (it is a length), and RH is instead the statement that long horocycles spread evenly at the fastest possible speed (error y^(3/4), Zagier). On the project's windows it is the other way round: the speed at which the lowest eigenvalue dies, exp(-4 pi e^(2L)), is forced by the zeros being discrete and says nothing, and RH is the sign. Example: Zagier's criterion: fraction of a horocycle of height y inside a region = area fraction + O(y^(1/2)) always, + O(y^(3/4 - eps)) iff RH.
- wall: Barrier B3 / wall WJ2 (zero margin): suggests looking for the statement in which RH is a rate with room, namely one living at a positive shift w and a finite window t (Suzuki's plane), instead of a sign with no room.
- new input: Not yet an input. Candidate: an inequality between the rate at shift 1/2 and the first failure in w at fixed t.
- claim: HEURISTIC as a framing; each half is sourced: Zagier 1981 sec. 1 (read) for the rate, SP-operator B150 for the forced margin.
- first test: For fixed t compute w*(t) = inf of w with ||K_w[t]|| < 1 ... (Suzuki's K); is w*(t) increasing to Theta - 1/2, and is there a differential inequality in (w,t)? Compare notebook N35's eps*(L).
- novelty: NOT SEARCHED.
- log:

## #5 · Function-field twin of Zagier's programme exists in print and is a dimension count with a Hecke recursion, not a norm (Cornelissen-Lorscheid); beyond three curves it needs Weil
- status: open
- source: SP-modular session 1, NOTES D7 (e)
- date: 2026-11-11
- tags: N38,B9,known
- plain english: Notebook N38 asks what kind of fact excludes the 'empty curve' in function fields. In my toolkit there is a published answer of exactly the shape asked for, in a tiny case: for the three elliptic curves with a single point over F_2, F_3, F_4, the condition 'integrates to zero over one torus', hit repeatedly with one Hecke operator, squeezes the candidate functions into a space of dimension q + 2 whose Hecke eigenvalues are 0, q, -q; an Eisenstein series at a zero s has eigenvalue q^s + q^(1-s); so Re s = 1/2. Example: q = 2: q^s + q^(1-s) in {0, 2, -2} forces |2^s| = sqrt 2. For every other curve the same space is finite-dimensional but its eigenvalues are only known through Weil's theorem.
- wall: Barrier B9 / notebook N38: a recorded instance of 'exact recursion + finiteness' proving a Riemann hypothesis; it shows the mechanism needs the quotient to be one-dimensional (a graph that is a ray plus finitely many vertices).
- new input: None for Q: the quotient PSL2(Z)\H is two-dimensional and the toroidal space is infinite-dimensional.
- claim: KNOWN (read): Cornelissen-Lorscheid arXiv 0710.2994 (whole), Lorscheid 1012.3223 (Cor. and Thm on temperedness).
- novelty: Read, not mine.
- log:

## #6 · Hecke-Gram / Hecke-Hankel rank test: an Euler product is a rank-one point of a positive cone (finite instrument for barrier B1)
- status: open
- source: SP-modular session 1
- date: 2026-11-11
- tags: instrument,B1
- claim: PROVED (NOTES D9): [sum_{d|(m,n)} a(mn/d^2)] is PSD iff a is a non-negative mixture of level-1 Hecke eigen-systems, rank one iff a single one. For degree one it is the Helson matrix [a(mn)]. Davenport-Heilbronn: rank 2, signature (1,1). F_d passes (blind to B11).
- log:

## #7 · Caution for N38: coefficients that COUNT are not enough (Epstein); the count must be attached to window functions
- status: open
- source: SP-modular session 1
- date: 2026-11-11
- tags: N38,caution
- claim: KNOWN: Epstein zeta functions of forms of class number > 1 have coefficients that count lattice points, a functional equation, and zeros off the line (KNOWLEDGE B2). On the dial, integer n >= 3 counts and has no Euler product (PROOF_dial).
- log:
