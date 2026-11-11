# Notebook: running brainstorm

Dated, informal, newest at the bottom. Anything goes here: half-thoughts, analogies, dead ends, questions.
When a note becomes testable it gets a number in `docs/IDEAS.md` and the note says so.
Labels: PROVED / COMPUTED / HEURISTIC / CONJECTURE / WILD.

---

## 2026-11-10

**N1. Start from the duality, not from the zeros.** (lead) Before any clever idea: rebuild primes from zeros
and zeros from primes ourselves. Done (U-1). Thirty-five prime powers already locate five zeros to 2 digits.
Thought: the "primes → zeros" sum is a spectrometer. RH is a statement about the *width* of its spectral
lines as more primes are added. Is there a sharp statement? → Q1.

**N2. One rule behind every "all zeros real" result.** (lead) ~~PROVED (classical)~~ **FALSE AS STATED** (found by the theory keeper, 2026-11-11: A(s) = 2^-s + 4^-s, ω = log 2 gives f(t) = √2 + cos(t log 2), no real zero; the proof needs c_1 ≠ 0 and its Phragmén–Lindelöf step was only a sketch; repaired statement is THEORY T25, open). Let A(s) = Σ_{n≤N} c_n n^(−s),
c_n real, zero-free in Re s > 1/2. Put E(z) = e^(iωz) A(1/2 + iz), E*(z) = e^(−iωz) A(1/2 − iz), so
f = E + E* on the real axis. R = E/E* is analytic in the upper half-plane (A(1/2 − iz) has real part of its
argument > 1/2 there), |R| = 1 on the real axis, and |R| is bounded as Im z → ∞ when ω ≥ ½ log N. By
Phragmén–Lindelöf |R| < 1 in the open upper half-plane, so f = E*(1 + R) ≠ 0 there; the lower half-plane is
symmetric. Hence all zeros of f are real. ∎
Everything else is a variation: Pólya's fake zeta functions, Taylor/Lagarias ξ(s+a) ± ξ(s−a), Gonek's
symmetrised Euler products, de Branges spaces.

**N3. Lee–Yang in Bohr's variables.** (lead) Replace p^(−it) by an independent variable x_p on the unit
circle (Bohr). "A is zero-free in Re s > 1/2" becomes "the polynomial Σ c_n n^(−1/2) x^(v(n)) has no zero in
the open unit polydisc", which is exactly the Lee–Yang property physicists use to pin partition-function
zeros to a circle. Hand check: sharp cut at 2 is Lee–Yang (zero at |x₂| = √2 > 1); sharp cut at 3 is not
(1 + x₂/√2 + x₃/√3 vanishes at x₂ = x₃ = −0.78). COMPUTED: matches the zero counts in U-3 exactly.
Move borrowed: Lee–Yang (a qualitative property of the system pins the zeros). → idea #6.

**N4. Why the product wins.** (lead) In Bohr's variables the Euler product is a product of one-variable
factors (1 − x_p/√p), each harmless alone, and *independent*. A sum over integers mixes the variables through
the ordering n ≤ N, which is additive information. So the two structures of B10 show up as: multiplication =
independence of the variables x_p; addition = the cut-off and the Gamma factor that couples them. RH needs a
coupling that does not destroy the Lee–Yang property. WILD: is the Gamma factor the *unique* coupling that
preserves it? → Q3, Q4.

**N5. One prime at a time.** (lead) WILD. Lee and Yang's theorem is proved by building the system bond by
bond (Asano contraction), each step preserving the property. Here: is there an operation "adjoin the prime p"
on symmetric functions, preserving real zeros, whose infinite composition is ξ? Each step would have to be
compensated by a change in the archimedean part (window, Gamma factor), since adding a prime alone lowers the
Weil form. → idea #7.

**N6. Blind tests.** (lead) Li's criterion sees a zero at height γ only at index ~γ² (idea #1). Suspect the
same blindness in every positivity test. Make it a rule: for each criterion, compute its "detection index"
on the impostor before using it for anything.

**N7. Memory accident.** (lead) An outer product of 78 734 × 12 500 doubles (8 GB) was killed by the kernel;
rerun in chunks under `tools/memcap.py 3`. Rule: every numpy job in this repo runs under memcap.

**N8. The owner's six rules, applied to my own ideas.** (lead) #6 (Lee-Yang lift) is exactly what rule 1
rejects: another look-alike family. Parked. The understanding it gave stays (U-3). Lesson: I was working
from the toolbox.

**N9. Working backwards (rule 3).** (lead) Details in `rh/KEY_LEMMA_SHAPE.md`. The two observations I did
not have this morning: (a) S1: nothing linear in the function can work, because the impostor lives in the
same 2-dimensional space as two honest L-functions; (b) S3: zero margin is fatal for estimates but harmless
for an equality-case argument, where zero margin is the *hypothesis*.

**N10. First failed attempt on #8, and why (wall W2).** (lead) At a first-failure window the null vector
gives a zero-side sum vanishing on an interval. Hoped: analytic continuation forces all coefficients to
vanish, then a counting argument (an entire function of exponential type a0 cannot vanish at all zeros,
whose density grows like log T) gives a contradiction. Fails: with infinitely dense frequencies the
exponentials are over-complete on any finite interval, so vanishing on an interval says nothing coefficient
by coefficient. I told myself "I can do it" and looked again: the density that kills uniqueness on the zero
side is the same density that makes the *prime* side finite on the window. So the contradiction must be
sought on the prime side, where the equation has finitely many terms. That is the next thing to try.

**N11. A number that separates true from false.** (lead) a0 = first-failure half-width. Finite for the
impostor (blind prediction 2.8 +- 0.5 on record in idea #8), infinite for zeta iff RH. WILD: is 1/a0 a
natural "distance from RH" for a general Dirichlet series, continuous in the coefficients? If so, the honest
L-functions sit at 1/a0 = 0, the boundary of the range. That would be the picture asked for in Q5: zero
slack because true L-functions are extreme points.

**N12. My first blind prediction missed, and that taught more than a hit would have.** (lead) Predicted
a0 = 2.8 for the impostor; lane A measured 1.71. My mental picture had a loud positive background that an
off-line zero must overcome. The truth is the opposite: the windowed form is almost exactly degenerate
(eigenvalues like 1e-30), a whisper is enough, and only the *height* of the bad zero matters, not how far
off the line it is. New picture: the window of half-width a is a telescope that resolves heights up to
about 4 pi e^(2a)/q, and it reports a violation the instant one comes into view.

**N13. What this does to the template (#8).** (lead) HEURISTIC. At a first-failure window for zeta itself the
null vector would be a wave packet at the height T of the first bad zero, and the equation says its envelope
h is reproduced by prime-shifted copies with phases n^(-iT), n up to about T/(4 pi), with total strength
log(T/2 pi). The available total weight is sum Lambda(n)/sqrt(n) ~ 2 sqrt(T/4 pi), vastly more than log T,
so a size argument cannot forbid it: only a statement about *phases of primes at frequency T* can.
So the key lemma is a statement that the primes up to X cannot be coherent at a frequency T ~ 4 pi X in a
specific self-reproducing way. Note the regime: frequency about 4 pi times the length. That is exactly where
the functional equation balances (the two halves of the approximate functional equation have equal length).
WILD: the null-vector equation is a fixed-point equation for a "prime-shift transfer operator at frequency
T"; RH would say this operator never has eigenvalue exactly log(T/2 pi) on the window. Compare its spectrum
for the impostor at T = 85.7 and for zeta at the same T.

**N14. From "what must enter at the prime side" to a bootstrap.** (lead) Chain of thought, kept in full
because the route matters more than the result:
1. Lane A's lattice identity says the windowed form is a Loewner (Pick) matrix of the log-derivative of the
   truncated completed zeta. Loewner: such matrices are non-negative exactly when the function maps the
   upper half-plane to itself. For the true function that is the classical "RH iff -xi'/xi is a Pick
   function". So window positivity = "the truncated data are still consistent with some Pick function".
2. Krein: a function positive-definite on (-2L, 2L) extends to all of R; the extension is nearly unique when
   the form is nearly degenerate, and here it is degenerate to 1e-30. So primes up to X almost determine
   what may come next. Each new prime power must land inside a "Weyl disc" fixed by the earlier ones.
3. So turn it round: do not put the primes in. Allow weights at all integers and ask what positivity allows.
4. PROVED (three lines, assumes RH, surely folklore): if Lambda gives a positive measure (RH) and another
   weight vector m with sum |m_n - Lambda(n)|/sqrt(n) finite also does, then the difference of the two
   zero-side measures is an almost-periodic function with mean zero that is >= 0 off a discrete set, hence
   identically 0, hence m = Lambda. So under RH the primes are an isolated solution.
5. Dual form, no primes and no zeros in it: for every positive-definite g with g(log n) >= 0 at all
   integers n >= 2, A(g) >= 0, where A is the archimedean-plus-pole functional. RH implies it. Is it
   provable outright?
6. For conductor 5 (odd) two honest L-functions share the archimedean term, so the feasible set is at least
   a segment; the impostor's coefficients sit in the feasible set only below L* = 1.71. CONJECTURE: the
   feasible set for all L is the convex hull of the genuine L-functions; Euler products are its extreme
   points. That would answer Q5: zero slack because true L-functions are extreme points.
7. Rule 5 check, done before computing: the core (positive solutions, prime-free dual, uniqueness) already
   exists in an unreviewed AI-produced preprint from October 2026 (N. Johns). I had not seen it. Recorded as
   idea #9 with that stated. What is left for us: the finite-window experiment, the control group, the
   extreme-point conjecture, and the link to the first-failure window (#8).
Lesson: two of my three "new" ideas today were already out there. Search first, think second.

**N15. The bootstrap experiment: the primes really are forced, and I mis-predicted how tightly.** (lead)
COMPUTED at window L = 1. Without primes the energy goes to -1.3. With them, 8e-30. Wiggle one weight and
positivity breaks at once: log 2 at n = 2 is pinned to 26 digits; the composite 6 is pinned to zero to 13
digits; 7, at the edge of the window, to 6 digits. Predicted "< 1e-20" for 6; got 1e-13. Second miss of the
day on a size, second time the direction was right. Pattern in my misses: I keep assuming one scale governs
everything; the truth has a ladder of scales (one per rung, one per integer).

**N16. Why zeta is rigid and conductor 5 is not: the threshold picture.** (lead) HEURISTIC.
For conductor 5 the allowed set is fat (weights can move by 10). For zeta it is a needle. The difference is
not "honest versus impostor"; it is that zeta sits at the smallest possible conductor. Picture a valley whose
floor rises as the conductor drops; at conductor 1 the floor touches zero at exactly one point, and that
point is the primes. This is the cleanest answer so far to Q5 (why no slack): RH is the statement that the
valley floor touches zero rather than going below it at conductor 1.
Reframing: let q* be the smallest conductor for which some positive solution exists with zeta's Gamma
factor. RH iff q* <= 1 (given uniqueness; Johns preprint, unreviewed). Unconditionally q* < 1.0172 there.
So there is a NUMBER measuring how far we are from RH: q* - 1 is at most 0.0172. Every improvement of that
bound is an unconditional theorem. That fits the owner's rule 6 exactly.
Questions this raises (not yet searched beyond the one preprint):
- Q6. How is 1.0172 proved? Which test functions? Is the bottleneck computational or structural?
- Q7. Their solutions allow prime-side weight anywhere beyond log 2. If weights are allowed only at logs of
  integers the threshold can only go up. Is the integer-restricted threshold also 1 (i.e. do the integers
  emerge for free), and can the restriction be used to get a better unconditional bound?
- Q8. In my experiment the weight at n is pinned to about 26, 24, 21, 18, 13, 6 digits for n = 2..7. Is
  there a law (digits as a function of n and L)? If digits grow without bound for each fixed n as L grows,
  then finite windows already "prove" each individual prime weight to any accuracy, with no zeros involved.
- WILD. Run the window forward as a sieve: at window L the weights at n <= e^(2L) are pinned; the first
  unpinned integer is next. Does positivity at window L predict whether the next integer is prime before it
  enters? If yes that is "primes predict primes" made exact (N14, step 2), and the predicting rule is the
  object to study.

**N17. The positivity sieve works.** (lead) COMPUTED, n = 2..10. Open the window just enough to let the
integer n in; keep the earlier weights; ask what weight positivity allows at n. Answer each time: exactly
one value to several digits, and it is log p if n is a power of p and 0 otherwise. 6 and 10 come out as
zero, 8 as log 2, 9 as log 3, 7 as log 7. Nothing in the input says which numbers are prime: only the Gamma
factor, the pole, and "never negative". In plain words: **the rule that energy is never negative, applied
window by window, generates the primes one at a time.**
The needle narrows like exp(-8 sqrt n): about 2, 3.5, 4.5, 5.4, 6.2, 6.8, 7.4, 8.0, 8.6 digits.

**N18. What the sieve says RH is.** (lead) HEURISTIC. Each step has an allowed interval I_n computed from
the past. RH = the sieve never jams: the true weight is always inside I_n and the window never goes negative
between integers. So a counterexample to RH would be a first n (around 4 pi n ~ height of the bad zero,
from lane A's detection law) at which the interval predicted from all earlier primes MISSES the true
value: the primes up to n-1 would "predict" a wrong weight at n by more than exp(-8 sqrt n).
That is a statement about primes only. It is exponentially sharp, which looks hopeless for estimates, but
it is exactly the kind of statement an IDENTITY could give: if the centre c_n of the interval has a closed
form in terms of Lambda(2..n-1), then RH becomes "c_n - Lambda(n) is tiny", a question about a recursion.
- Q9. What is c_n explicitly? It is determined by the near-null vector(s) of the window form: a ratio of two
  quadratic expressions in that vector. Compute c_n - Lambda(n) (sign, size) and look for its law.
- Q10. Is the interval's centre off from the truth by a comparable amount to its width (then the truth sits
  at a generic point inside), or is the truth at an END of the interval (then true primes are extreme, as in
  N16)? In the L = 1 table the room above was 20 to 500 times smaller than the room below for small n:
  the truth sits near the UPPER end. WILD: the true weight is the largest weight positivity allows?
  If "Lambda(n) = sup of the allowed interval, up to exp(-..)" held, primes would be defined by a greedy
  rule: at each integer put as much weight as positivity permits. Test: is room above / room below -> 0?
  (Sieve table: 0.075, 0.2, 0.24, 0.36, 0.37, 0.36, 0.42, 0.42, 0.49: not going to 0 at admission. At L = 1
  for old integers: 0.002, 0.01, 0.03, 0.06, 0.15, 0.42: small for integers that entered long ago. So the
  truth drifts to the upper end as the window keeps growing after admission. Worth a proper test.)

**N19. The derivative formula I wanted for #8 probably already has a name.** (lead) FROM MEMORY, to be
searched before any claim. For a positive-definite kernel on a growing window, the resolvent kernel obeys
the Bellman-Krein (Krein-Sobolev) identity: d/dr Gamma_r(t,s) = Gamma_r(t,r) Gamma_r(r,s), and
d/dr log det = an edge value of the resolvent. That is exactly a formula for how the window form changes
as the window widens, in terms of the solution's value at the window edge. The window family is then a
"Krein system" with a potential a(L); positivity for all L iff a(L) never blows up. Lane A's idea A4 says
the same. Recalled prior work that must be read before going on: Burnol (Sonine spaces; the archimedean
part alone is exactly solvable, with Painleve-type functions), Suzuki ("Hamiltonians arising from
L-functions in the Selberg class": RH iff a certain canonical-system Hamiltonian exists for all a).
If that recollection is right, "RH iff the potential has no singularity" is KNOWN and by owner rule 2 is
only a reformulation. The open part would be: what do the primes do to the potential, kick by kick.

**N20. Integrable structure, with primes as kicks.** (lead) WILD, testable.
Lane A's lattice identity has the shape (T(w) - T(w'))/(w - w'). Kernels of that shape are the "integrable
operators" of mathematical physics; their determinants are tau-functions and obey exact differential
equations (the sine kernel gives Painleve V; the sine kernel IS the time-and-band-limiting operator behind
lane A's prolate law). So between two consecutive prime powers the window determinant tau(L) should obey
an exact ODE, and each prime power log n applies an explicit jump. Then:
   RH  iff  tau(L) never vanishes  iff  a kicked integrable system never hits a pole.
What would be new input (rule 2): exact evolution equations, i.e. identities, which is the only kind of
tool S3 allows. Why it might avoid W1/W2: nothing converges and nothing is estimated; a pole of an
integrable flow is forbidden by conservation laws when it is forbidden at all.
What a kill would look like: the kicks destroy integrability (no closed evolution across a kick), leaving
just the definition of tau.
First test (cheap, with matrices we have): compute log tau(L) for zeta and the impostor on a fine grid of
L in [0.3, 1.9]; check the Bellman-Krein identity numerically between kicks; measure the jump in
d/dL log tau at L = (1/2) log n for n = 2..30 and look for a closed form in Lambda(n) and the edge values.

**N21. A habit to keep.** (lead) Four of today's "new" ideas turned out to be partly or wholly known within
one search (#2 Yoshida/Suzuki, #6 Gonek, #9 Johns, N19 Krein/Suzuki). The territory around window
positivity is crowded. What nobody in the papers read so far has done is run the CONTROL (the impostor) and
make blind numerical predictions. That is our edge: an experimental method, not yet a new idea.

**N22. Search result for N19.** (lead) SEARCHED: Suzuki, arXiv 1606.05726 (J. Funct. Anal. 2021) and
arXiv 1204.1827 give an equivalent condition for (G)RH in terms of canonical systems: the Hamiltonian must
exist for every value of the parameter. Read only as search summaries. So the "Krein system with no
singularity" restatement is known; by rule 2 it is not an idea. Burnol's Painleve results: one search found
nothing; still only a recollection. N20 (integrable flow with prime kicks) stays open and unsearched beyond
this; before any work on it, fetch both Suzuki papers and look for what he does with the prime terms.

**N23. Owner: stop exploring, create; look where nobody has looked; there is no procedure.** (lead)
Taken as rules 7 and 8. What I did differently for the next idea: instead of asking "what is known near
window positivity", I asked "which other field has a theorem of exactly this SHAPE (one positive direction,
zero margin, proved without estimates), and what did its proof need that we have never supplied?"

**N24. The shape, and who else has it.** (lead) Weil's criterion in Castelnuovo form: with
N = (prime terms) - (archimedean terms), RH iff N(f) <= 2 d1(f) d2(f), d1, d2 the two pole functionals.
That is: N has ONE positive direction. Same shape as: the Hodge index theorem on a surface; the
Alexandrov-Fenchel / isoperimetric inequality (mixed area of plane convex bodies is the form of
(1/2)(1 + d^2/dtheta^2) on the circle: one positive mode, two null modes, the rest negative);
log-concavity statements for matroids. In the last decade the last family got proofs with no geometry at
all, by a local-to-global step that loses nothing at the threshold.
PROVED (from the formulas, two lines): the kernel of N off the diagonal is pointwise >= 0. The prime atoms
are Lambda(n)/sqrt(n) >= 0, and Gauss's integral for the digamma function puts the cosine term with a minus
sign in the archimedean part, so -arch has kernel +e^(u/2)/(2 sinh u) > 0. In geometric words: distinct
"curves" meet non-negatively, and all the negativity is self-intersection. In physical words: ferromagnet.
This sign is an input Weil's criterion never uses. It fails at once for the impostor.

**N25. What has to be invented.** (lead) The local-to-global step (Branden-Huh; Oppenheim's trickle-down)
needs cubic data: a non-negative symmetric 3-tensor T ("triple intersections") with N = T contracted with a
positive vector and every slice Lorentzian. Symmetry of T is what makes a sum of Lorentzian slices
Lorentzian. Our form comes with no such T. Candidates to invent it from:
 - chains in the divisibility order (the Selberg identity Lambda log + Lambda*Lambda = Lambda_2 is a
   balance identity of exactly the kind such a tensor must satisfy);
 - mixed volumes of generalised permutohedra: the lattice of divisors of a squarefree M is the Boolean
   lattice, whose "Chow ring" is the cohomology of the permutohedral variety; ample classes there are the
   strictly submodular functions, and a concave function of log d is one. Multiplication = the variety,
   addition = the ample class. That is a dictionary for B10 I have not seen.
 - hand check: for M = 30 the six proper divisors form a hexagon under divisibility, with edge weights
   log r / sqrt r (r the ratio prime) and opposite edges equal; rescaling makes it the 0/1 hexagon, i.e. the
   six (-1)-curves on the plane blown up at three points. Its intersection matrix (hexagon adjacency minus
   identity) has eigenvalues 1, 0, 0, -2, -2, -3: one positive, two null, three negative.
Honest worry: on atoms the Weil form is trivially positive (infinite self-energy), so the hexagon by itself
proves nothing about RH; the content is in spread-out functions. The test is whether a certificate T exists
on a discretised window.

**N26. Further out (not yet ideas, written down so they are not lost).** (lead) WILD.
 - If zeta is the solution at the smallest possible conductor (N16), the other Gamma factors have smallest
   conductors too, and the preprint I read says the quadratic fields are NOT at theirs. So there may be
   extremal objects that are not L-functions: "what solves the odd Gamma factor at its threshold?" A family
   of new objects of which zeta is the one that happens to be arithmetic.
 - Mixed area is the form of 1 + d^2/dtheta^2. If the arithmetic form were literally of that kind for some
   "angle" variable, the zeros would be the frequencies of a second-order operator on a circle and the two
   null modes would be the two poles. What is the circle?
 - The certificate T is a statement about triples of scales. Zeros see pairs (pair correlation). Is there a
   number-theoretic meaning of a positive triple correlation of primes that nobody has asked for because
   nothing needed it?

**N27. First tests of the created idea (#10), and an unexpected clean fact.** (lead) COMPUTED.
- The form N = primes - arch has exactly one positive eigenvalue on every window tried; without the primes
  the background alone has four at L = 1. The primes take away the surplus directions and leave one.
- Half of the impostor's couplings are negative: it is not a ferromagnet at all.
- THE CLEAN FACT: allow one atom anywhere with any weight on a window of half-width 0.5. Positivity is
  possible only if the atom sits at 2.000 (1.994 and 2.014 both fail) and weighs log 2. And with no atom
  the background goes negative just past the point where 2 would enter. **The Gamma factor already knows
  that the first prime is 2.** The additive structure (where the integers are) is not an extra input: it is
  forced by the smooth term through positivity. That is barrier B10 seen from the inside.
- My stated reason for prediction (c) was wrong even though the number was right. Third time today a
  mechanism in my head was wrong while the direction was right. Keep predicting; it is the only way I find
  out.

**N28. Where this leaves the creative thread.** (lead)
What exists now that did not this morning: (1) a sign (the arithmetic intersection kernel is non-negative
off the diagonal), (2) a shape (Lorentzian, same as the isoperimetric inequality), (3) a borrowed proof
mechanism that loses nothing at zero margin (local-to-global for Lorentzian forms), (4) two controls that
fail it in the predicted way, (5) the observation that positions and weights of primes are both forced by
the Gamma factor through positivity, one integer at a time.
What does not exist: the cubic object (triple intersections) the mechanism needs. That is the thing to
invent. Three seeds: chains in the divisibility order with Selberg's identity as the balance law; mixed
volumes of permutohedra with a concave function of log n as ample class; a numerical certificate found
first and understood afterwards.

**N29. From ferromagnet to random walk to curvature.** (lead) Chain of thought:
1. N = W - Delta with W >= 0 off the diagonal and Delta the (large, positive) self-energy on the diagonal.
2. Perron-Frobenius: N has a positive top eigenfunction u, eigenvalue lambda_1 (= 4.31 at L = 1).
3. Divide by u (ground-state transform). Then N = -(Laplacian of the graph with weights u W u) + lambda_1 u^2.
   PROVED (algebra): "N has at most one positive eigenvalue" iff the reversible jump process with those
   rates and stationary measure u^2 has spectral gap >= lambda_1.
4. So RH on a window = a Poincare inequality for an explicit jump process: jumps by log of prime powers
   and by a smooth kernel, tilted by u.
5. The zero margin reads: gap = lambda_1 with the excited level almost infinitely degenerate. The only
   processes like that are close to "resample from the stationary law at rate lambda_1". In kernel terms:
   prime atoms + Gamma kernel = 2 cosh(u/2) in the weak sense, which is the prime number theorem with the
   zeros as the error. So RH says: the actual kernel never exceeds its own mean field. Physicists prove
   statements of exactly that form for ferromagnets (infrared bounds) by reflection positivity.
6. PROVED (formula): the Gamma kernel is e^(u/2)/(2 sinh u) = sum over m >= 0 of e^(-(2m + 1/2) u), a
   positive mixture of decaying exponentials (completely monotone), hence reflection positive; its rates
   2m + 1/2 are the trivial zeros. The prime atoms are a positive measure but not reflection positive on
   their own. WILD: is the SUM reflection positive after the tilt by u? Reflection positivity + ferromagnet
   is precisely the hypothesis of the infrared bound.
Three tools carried over, none used on this problem as far as two searches and my memory go (memory is not
evidence): Bakry-Emery curvature, Ollivier coupling curvature, infrared bounds. Recorded as idea #11.

**N30. What these have in common, and the single missing object.** (lead)
Ideas #10 and #11 and step 6 above all need the same thing: a statement about THREE scales at once
(a triple intersection number, a Gamma_2, a chessboard estimate). Pair statements are what the explicit
formula gives; they are equivalent to RH and nothing more. The new mathematics, if there is any here, is
the cubic structure. Nobody needed it before, so nobody looked. That is where to look.

**N31. A process failure of my own, kept because it will recur.** (lead) After a context summary I no longer
saw that I had already split the tracks, recorded the owner's "longer time boxes", and launched creation
run 1. The owner's instruction appeared to me as new and I started to carry it out again. I noticed only
because an edit failed on text that had already been changed. Fix: the hub's "Running jobs" section and the
Answered table are the memory; read them and the git log before acting on anything that looks new.

**N32. What round 2 did to my two created ideas, and what grew out of the wreckage.** (lead)
- #10 (certificates): seat R2-cubic proved that a certificate exists whenever positivity holds. So my test
  "search for a certificate" could never have told us anything. The one cubic with a formula is the
  Bakry-Emery form, i.e. idea #11 in disguise, and it loses a factor 2 on the mean-field model. Parked.
- #11 (curvature): seat R2-curv showed the factor 2 is structural and the tool is blind to the Beurling
  control. Killed. The process picture is also already in an unrefereed 2026 preprint.
- What they found that I did not ask for: the whole curvature deficit sits at the window EDGE; and the
  prime kernel is a Gram matrix on prime powers (their Theorem D).
- Built on that (rule 9), idea #21: the kernel has a SECOND positivity, of mirror (Hankel) type on the
  integers, with an explicit spectrum: one atom per prime on the coordinate axes of the dual semigroup, and
  the trivial zeros on its diagonal. The zeros of zeta are the spectrum of the FIRST (shift) positivity.
  One object, two spectra: places and zeros. Test: 5 of 6 blind predictions hit, including the one that
  matters (a real-character L-function passes although its couplings are not all positive, so this
  criterion is right exactly where idea #10's sign condition was wrong).
- The missing step now has a name borrowed from physics: mirror positivity implies shift positivity
  (Kallen-Lehmann) is a theorem with one time variable. Here there is one time per prime, and the mirror
  positivity lives on the integers, not on the continuum. First honest sub-question: two primes.
- Unexpected in the table: the dial at n = 4 fails by exactly ONE negative eigenvalue, and n = 4 is
  zeta(s) zeta(s-1) times a factor, whose zeros sit on two lines beside the centre line. Is the number of
  negative mirror eigenvalues counting something about where the zeros are? One data point; do not believe
  it yet.

**N33. Idea #21 died in the seminar, twelve hours after I was pleased with it. What it left.** (lead)
- Killed by S1-mirror with an exact counterexample: zeta(s-d) zeta(s+d). Everything I had required holds for
  it (sum of squares on the prime side, positive mixture of exponentials on the Gamma side, atoms at the
  true integers) and its zeros are off the centre line. I had predicted on the board that the mirror test
  would fail for the complex pair mod 5; it did (-3.89). I had NOT seen the twist.
- The useful residue: mirror positivity is blind to the twist n -> n^d. So is the sign fact of idea #10.
  So is every hypothesis I have written down today. All of them describe a CONE of objects; RH is about
  one POINT of it. The only ingredient that picks the point is the size of the local roots (modulus 1,
  Ramanujan), together with the centre of the functional equation. New barrier B11.
- That reframes the question honestly: among the family F_d, d real, what singles out d = 0, stated on the
  prime side? If the lowest window eigenvalue has a KINK at d = 0 the true zeta is an extreme point of the
  cone; if it is smooth and one-sided it is not. Asked on the board, with a prediction required.
- The seminar format worked: a moderator's question exposed the weak point in forty minutes; a participant
  built the counterexample; a second participant reproduced the numbers by another route. None of that
  would have happened in the relay.
- Formal checking now works. Lean refused my first file because I cited a lemma that does not exist. Same
  lesson as the lambda_3 constant on day one: what I remember is not what is true.


---
## 2026-11-11 (lead), after seminar turn 2: thinking with the record open. None of this is proved unless marked.

**N34. Where Perron breaks, block by block.** (PROVED modulo irreducibility; posted B140.) Fold to (0, L]; k = prime
atoms + Gamma jump kernel 2w ≥ 0. Even block = (Perron operator) + 8 c cᵀ with c = cosh(x/2) > 0: the only wrong-sign
term is the pole. Odd block: pole has the right sign, Gamma part is w(|x−y|) − w(x+y) ≥ 0 because w decreases (method of
images), and the only wrong-sign entries are the prime mirror atoms on x + y = log n. So below L = ½ log 2 the odd
block is a Perron operator. In the even block the ground state is (B − μ)⁻¹c with μ between the first two eigenvalues
of B: the anti-maximum principle (name recalled, unsearched). A rank-one push of arbitrary strength does NOT keep one
sign, so "block ≥ 0 ⇒ nodeless" is a statement about the pole strength 8 against a threshold t*(L).

**N35. The damping plane (L, ε).** Multiply the Weil kernel by e^(−ε|u|): atoms become Λ(n) n^(−1/2−ε), the form is
that of the line Re s = ½ + ε. FACTS: (i) e^(−δ|u|) is positive definite, so by the Schur product theorem the set of
ε for which the window form is ≥ 0 is a ray [ε*(L), ∞), and ε*(L) is non-decreasing in L (PROVED, two lines).
(ii) ε*(L) ≤ ½ for every L unconditionally (classical positivity of Re(−ζ′/ζ) right of 1). (iii) sup_L ε*(L) = Θ − ½,
Θ the supremum of real parts of zeros (standard). So RH ⟺ ε* ≡ 0⁻, a zero-free strip ⟺ sup ε* < ½, and the classical
world sits at ε = ½. (iv) The tilted control is the same family: kernel of F_d = W·2cosh(du) = W_(−d) + W_(+d), so
"F_d ≥ 0 on a window" is "damped + anti-damped ≥ 0", and tilting ONE prime is damping one prime's atoms only.
For zeta, ε*(L) is negative and of the size of the lowest eigenvalue over its ε-derivative. STATUS: a reformulation
(rule 2) until it brings an input. What it offers that the window picture did not: a scalar that interpolates between
theorems we have (ε = ½) and RH (ε = 0), with one free monotonicity. NOT SEARCHED. A computable first test:
ε*(L) for the impostor, F_d, G_d and the one-prime system, and ∂μ/∂ε for zeta.
PARTLY IN PRINT (SP-operator and READER-1, Suzuki arXiv 1606.05726 read whole): Suzuki's canonical systems are
attached to the SHIFTED functions ξ(s−ω)^ν/ξ(s+ω)^ν, ω the shift off the line; unconditionally they exist for ω > ½
or on an unquantified initial interval. That is this plane's ε-direction for a Hankel operator, not for the window
form. The Schur-monotone ray and the scalar ε*(L) for the window form were not found there.

**N36. The multiplier cone.** More generally S_L = {even φ on (−2L, 2L): W·φ is ≥ 0 on the window}. Under RH it
contains every positive definite φ (Schur) and is strictly bigger: on the zero side W·φ ≥ 0 says Σ_γ φ̂(t − γ) ≥ 0,
which holds for many signed φ̂ because the zeros are dense and regular. 2cosh(du) is in S_L exactly for d ≤ d_c(L).
The cone S_L is a new invariant of an L-function on a window; the seminar's tables (tilt thresholds, hybrids) are
points on its boundary. Not searched.

**N37. The natural cubic has mirror slices.** Composition of correspondences is convolution; the trace form
T(f, g, h) = N(f∗g, h) contracts with the identity δ₀ to N. Its slices in (f, g) have kernels depending on a + b: they
are MIRROR (Hankel) forms, and the mirror form of the Weil kernel is pole square minus squares (one positive square,
B25/B45, unconditional). So the unconditional "one positive square" lives on the slices of the trace cubic, while RH
is the same statement for its contraction. Sign bookkeeping kills the direct use of the trickle-down lemma (the
slices of the cubic that contracts to N are positive semidefinite of high rank, not Lorentzian; in the continuum the
prime mirror form is not even semidefinite, T72). Recorded as a failure with its exact step, for the atlas:
the mirror form and the shift form of N have OPPOSITE signs on the primitive part (S1-mirror's complementarity).

**N38. Barrier B11 has a function-field twin, and the proof there says what kind of input is missing.**
P(T) = (1 − T)(1 − qT): rational, functional equation, integral, point counts N_k = 0 ≥ 0 for all k, roots 1 and q
instead of modulus √q. It is "ζ(s − ½)ζ(s + ½)" for a curve: every hypothesis that does not use an actual curve is
satisfied. What excludes it in geometry is never a count or a functional equation; it is (a) Riemann–Roch on the
SURFACE (a dimension is ≥ 0), (b) Stepanov's auxiliary polynomial (uses x ↦ x^q on functions), or (c) Manin's proof
of Hasse: deg(mφ + n) is a degree, hence ≥ 0, and satisfies d_(n+1) − 2d_n + d_(n−1) = 2 by the group law, hence is
the quadratic n² − a n + q. Common shape: a quantity that is non-negative BECAUSE IT COUNTS SOMETHING, computed by
an exact recursion to be the quadratic form. Hasse's bound is the 2×2 Toeplitz positivity (c₀ = 2, c₁ = a/√q). For ℚ
the analogue would be: a family of non-negative integers or dimensions d(f), attached to window functions f, with an
exact second-difference law coming from the additive structure of ℤ, equal to the Weil form. In the record the only
quantities that are counts are the negative-square indices (Theorem 4) and the sieve weights (non-negative sums over
integers, which lose a factor 2 to parity). Nobody in the record has looked for the recursion. Worth a creation seat.

**N39. What a one-signed solution buys: a pointwise bracket (posted B-claim re B181).** PROVED given hypothesis (F)
(f = N_e⁻¹c ≥ 0, S1-cubic's candidate, computed true for zeta, false for three controls): for every test φ with
⟨φ,c⟩ > 0, inf_x R_φ ≤ t₀ ≤ sup_x R_φ, R_φ = Nφ/(c⟨φ,c⟩), t₀ the critical pole strength (zeta has t = 2). So with
(F), positivity of the even block is equivalent to one function φ with W∗φ ≥ 0 pointwise on the window: a linear,
one-vector certificate in place of a semidefinite statement. Equally rigid (needle of width μ₁/μ₂ around the ground
state), so no way round WJ2; what changes is the kind of statement. With φ = 1 the constant 5.3722 of the archimedean
term cancels exactly against 2ζ′/ζ(½) and what is left is −4Σ sin(γL)/γ. Not searched.

**N40. Why the tiny eigenvalues are positive, and the comparison form of idea #27** (lead, 2026-11-11;
experiment `rh/experiments/e27_relative/`). Labels on each line.
- SETTING. λ = e^L. For g even on ℝ with g(0) = 0 = ĝ(0), put ℰ(g)(x) = x^(1/2) Σ_{n≥1} g(nx). Its Mellin transform is
  ζ(s)·(Mg)(s), so the Weil form pairs ℰ(g) to zero with everything (KNOWN: Connes–Consani 2106.01715 §3; needs g
  regular enough; the two conditions at 0 are what removes the pole).
- IDENTITY (HEURISTIC until a seat checks the convergence): if g is supported in [−λ, λ], then ℰ(g) vanishes for
  x > λ, its restriction f to the window [1/λ, λ] is a window function, and
      Q_L(f) = W(T),   T = ℰ(g) restricted to x < 1/λ = x^(−1/2) Σ_{m≥1} (B⊥ĝ)(m/x),
  where B⊥ĝ is the part of ĝ OUTSIDE the band [−λ, λ]. So the window form of f is the Weil form of a tail that is
  built only from the out-of-band part of ĝ. In the log variable T = (ψ ∗ Σ_m m^(−1/2) δ_{log m}) cut to u < −L,
  with ψ(v) = e^(−v/2)(B⊥ĝ)(e^(−v)): a chirp whose local frequency is at least 2π e^(2L).
- DEFINITION. D_L(f) = inf ‖B⊥ĝ‖² over all such g with ℰ(g) = f on the window (g is free on (0, 1/λ)): the least
  energy that must leak out of the band. It is ≥ 0 for free and its near-null directions are the prolate functions.
  Idea #27's claim: Q_L ≥ κ(L) D_L with κ(L) bounded below.
- WHY IT MIGHT HAVE ROOM (HEURISTIC). On a high-frequency, short function the Weil form is positive for classical
  reasons: the archimedean term contributes about (1/2π) log(frequency) per unit of energy and the primes only see
  the autocorrelation at lags log n, which is small for a chirp. So W(T) ≥ c‖T‖² is plausible UNCONDITIONALLY on the
  tails of the near-null directions. What is not clear is the passage from ‖T‖ to ‖B⊥ĝ‖ and the directions that are
  not near-null.
- COMPUTED (one implementation, lane A's builder in a Fourier basis, truncated; predictions written first, two of
  eight missed): (1) the merged ladder of small eigenvalues follows 1 − χ_n for n = 4, 6, 8, 10, 12 (even block
  n ≡ 0 mod 4, odd block n ≡ 2 mod 4) with ratios 2.7, 1.9, 1.3, 1.1, 0.9 at L = 0.5 and 4.7, 3.1, 2.1, 1.45, 1.65 at
  L = 0.75; (2) the explicit vector ℰ(h_n − (h_n(0)/h_b(0)) h_b) cut to the window has Rayleigh quotient 1.10 to
  1.41 times the true eigenvalue of its rung at L = 0.5, 0.75, 1.0 (eigenvalues from 1e-6 down to 1e-29) and overlap
  deficiency 7.5e-6, 4.2e-7, 7.2e-8 with the true ground state; (3) form-level ratio κ_K on the span of the first K
  explicit vectors per parity at L = 0.5: 0.99, 0.60, 0.36, 0.35 (even), 1.00, 0.60, 0.30, 0.22 (odd): it does not
  collapse, but it drifts down with K, and I do not know its limit.
- NOT NEW: the mechanism (1) is the heuristic of Connes–Consani 2106.01715 §3 and the archimedean theorem of
  2006.13771 has this shape. Possibly new: the numbers in (2), (3), the definition of D_L as a form on the whole
  window space, and the identity read as "window form = Weil form of the leak". Not searched beyond the digests.

**N41. The primes disappear under Möbius inversion, and the constant is about 2L** (lead, 2026-11-11; bridge planks
7, 7b). (a) PROVED (three lines): let f be a window function and ψ its Möbius inverse on the window, f = Zψ,
Zψ(u) = Σ_{m ≤ e^(L−u)} m^(−1/2) ψ(u + log m). For u in the window, Σ_n Λ(n) n^(−1/2) f(u + log n)
= Σ_N N^(−1/2) log N · ψ(u + log N) (Λ ∗ 1 = log; the shifted arguments stay above −L, so the cut is never met), and
the prime term of the Weil form is twice ⟨f, that⟩. Hence Q_L(Zψ) = pole(Zψ) + arch(Zψ) − 2⟨Zψ, Σ_N N^(−1/2) log N ·
ψ(· + log N)⟩: the von Mangoldt function is gone; only the integers up to e^(2L) appear. A congruence, so positivity is
unchanged; what changes is that every object is now additive (Poisson summation applies). (b) The same on the tail:
for T = 1_{v>L} Σ_m m^(−1/2) ψ(v + log m), primes(T) = 2⟨T, Σ_m m^(−1/2) log m · ψ(· + log m)⟩. (c) HEURISTIC:
with orthogonal chirps, W(T) ≈ ∫|ψ|² K_L, K_L(L + a) = Σ_{m ≤ e^a}(2L + a − 2 log m)/m ≥ 2L; the 2L is the log of
the lowest local frequency 2π e^(2L) over 2π. COMPUTED: this predicts 61–91% of the measured constant on the bottom
rungs at three windows. (d) The obstruction to turning (c) into a proof is exact: the null space of ψ ↦ W(T_ψ)
(tails of functions living below the window). Only the least-leak representative can satisfy a lower bound, and on
it the cross terms between dilates are what is not controlled.

**N42. The October 2026 quasi-RH proof: what its mechanism is, second-hand** (lead, 2026-11-11, from a web-fetch
summary of an exposition and a result page; the papers themselves are being read whole by READER-4; every statement
here is "as reported", unchecked).
- CLAIM: no zeros of ζ (and of Dirichlet and some Hecke L-functions) in Re s > 7/8; a shorter proof gives 11/12.
- SHAPE: it is an attack on 1/L, not on positivity. A power saving for smoothed Möbius sums
  A₁(D) = Σ μ(n)ν(n)W(N(n)/D) ≪ D^(θ+ε) over the Eisenstein integers gives a zero-free half-plane Re s > θ
  (a zero ρ would force the Mellin transform of every weight W to vanish at ρ).
- NEW INPUT, three parts: (i) nobody can bound ONE Möbius sum, so it is embedded in a family of sextic-residue
  twists A_u(D) = Σ μ(n)ν(n)(u/n)₆W(·); (ii) AMPLIFIER BY COPIES: for u = p⁶ the twist is trivial except where
  p | n, so the untwisted sum reappears about Y = H^(1/6) times inside the family, and |A₁|² ≲ (mean square of the
  family)/Y; (iii) the mean square Σ_u|A_u|² ≪ D^(2+θ+ε) is proved by Poisson summation and an identity that
  REPLACES μ(n) BY CUBIC GAUSS SUMS, which are Fourier coefficients of Kubota's cubic theta function (an
  automorphic form on a metaplectic cover), plus the quadratic large sieve and a cube-removal recursion.
  Exponent: (2 − 1/6)/2 = 11/12. The field ℚ(√−3) is used because it has the cube roots of unity.
- USES: Möbius function (the Euler product, through 1/L), complete multiplicativity and reciprocity of the residue
  symbols, an automorphic summation formula. DOES NOT USE (as reported): the functional equation in the zero-free
  step, or any positivity beyond a non-negative weight.
- AGAINST OUR RECORD. (a) It is exactly the kind of input bridge 1 said the next bridge needs: something the
  impostor lacks (a Möbius function), used through a family. (b) If correct it makes one of our statements
  unconditional: the damping threshold of N35 satisfies ε*(L) ≤ 3/8 for every window, i.e. the Weil kernel times
  e^(−3|u|/8) is positive definite. (c) In the Möbius-inverted coordinates of N41 the window form is written with
  Z and the companion is ψ = Z⁻¹f, a Möbius sum of f; a power saving for smooth Möbius sums is a bound on Z⁻¹ on
  windows, which is what the constant of the whole-space comparison (0.30–0.33 on L ≤ 1) depends on.
  (d) MY INFERENCE, not from the sources: with k-th power twists the same arithmetic gives (2 − 1/k)/2, i.e. 3/4 for
  quadratic twists; a rumoured "barrier at 3/4" is quoted in one source. Quadratic Gauss sums have no theta-function
  summation formula of the needed kind, which may be why the cubic family is used. To be checked against the papers.
- CAUTION (owner): solving the quasi version is not solving RH; this is read for what kind of input works.

**N43. The amplifier's loss, the object that would remove it, and a second sheet** (lead, 2026-11-11; structural
mode, rule 13; RISK labels as stated).
- WHY 1 − 1/(2m). The quasi-RH proof recovers one Möbius sum from a family of order-m twists in which the trivial
  twist occurs on a fraction H^(1/m)/H of the rows. To reach ½ the single member would have to be a POSITIVE
  PROPORTION of the family's mean square. No family of characters of bounded order does that (only the trivial
  family). So the object that would make the amplifier lossless is a family, with an EXACT mean-square formula, in
  which the member we care about carries a fixed fraction of the total.
- SUCH A FAMILY EXISTS AT THE CM POINT (KNOWN in outline: the pretrace formula at a point). Spectrally decompose a
  smoothed delta at ω on the modular surface:  Σ_j |u_j(ω)|² h(t_j) + (1/4π)∫ |E(ω, ½+it)|² h(t) dt = Σ_γ k(ω, γω),
  and the right side is a count of representations by x² + xy + y² (hyperbolic distances from ω to its images).
  The continuous part is |Φ(½+it)|²/|ξ(1+2it)|², i.e. ζ_K on the line, and it is a positive proportion of the
  total; the identity is exact; the geometric side is arithmetic of the norm form. But it lives ON the line: it
  sees moments, not zeros off the line. (Its known use: subconvexity at CM points. Recalled; not read.)
- WHERE THE OFF-LINE ZEROS ARE IN THIS PICTURE (lead's derivation, unchecked). Let Q(λ) be the Krein function of the
  point interaction at ω (regularised resolvent kernel G_λ(ω, ω)); it is Herglotz in λ = s(1 − s), so on the
  physical sheet it has no non-real zeros. Its jump across the continuous spectrum is 2πi times the density, and the
  density continues analytically as Φ(s)Φ(1 − s)/(ξ(2s)ξ(2 − 2s)). So a zero of ζ_K OFF the line is a point where Q
  takes the SAME value on the physical and on the second sheet. RH for ζ_K ⟺ the two sheets of the Krein function of
  one point interaction agree only over the spectrum. Herglotz positivity governs sheet I; nothing known governs
  the coincidence set of the two sheets. Rule 2: this is a reformulation until the second sheet has a structure.
- WHAT I RECALL AND MUST NOT TRUST: Bombieri and Garrett ("Designing pseudo-Laplacians", and Garrett's notes on
  pseudo-cuspforms) built self-adjoint operators whose discrete spectrum is λ_s for zeros of E(ω, s) ON the line,
  and showed that such an operator can carry only part of the zeros (a spacing obstruction, linked to pair
  correlation). If that is right, it is exactly the object rule 13 asks for at this wall, already built, with the
  exact place where it stops. Reader seat sent.

**N44. Two independent derivations agree, and the wall moves to "what ω has that a class-number-2 point lacks"**
(lead, 2026-11-11, after SP-operator's `rh/specialists/operator/OBJECT_PHI.md`, written without seeing N43).
- AGREEMENT. SP-operator derived independently: Q(s) − Q(1 − s) = Φ(s)²/((1 − 2s)Λ(2s)Λ(2 − 2s)) for the Krein
  function Q of the point interaction at ω; so zeros of Φ are where the two sheets of Q agree (N43). Two derivations,
  same statement; normalisation unchecked by both. Its sentence for the wall: **self-adjointness makes real the
  zeros of Krein functions and of separating constant terms, never of form factors**; Φ is a form factor.
- FAKE FIRST, applied by the seat itself: every statement of that picture holds verbatim at a CM point of class
  number 2, where the zeros of s ↦ E*(z, s) leave the line. So the operator picture does not use what ω has.
- WHAT ω HAS (lead). For K of class number one, the evaluation f ↦ f(ω) is a joint eigen-functional of the Hecke
  algebra restricted to the torus K^× (the Heegner "cycle" is the single point). That is why Φ has an Euler product:
  multiplicity one for torus-invariant functionals (Tunnell–Saito; recalled, unread) makes the period factor into
  local pieces. For class number 2 a single point is not torus-invariant; its Epstein zeta function is
  (ζ_K ± L(s, ψ))/2 for the class-group character ψ, a Davenport–Heilbronn-type combination. So **the impostor IS the
  Eisenstein family evaluated at a point that is not a torus orbit.** In this setting the fake has a location.
- A TEST I RAN BY HAND and that failed: Hecke correspondences T_p for split p = ππ̄ map ω to itself twice (the two
  endomorphisms π, π̄); so at a zero, E(·, ρ) has zero average over the other p − 1 points of T_p(ω). Iterated over n
  this is only the factorisation ζ_{O_f}(s) = ζ_K(s) × (finite Euler factors at f) for the orders of conductor f:
  nothing new. Recorded as a dead end.
- WHERE THAT LEAVES THE WALL, as a question for the next attempt: positivity attached to TORUS PERIODS exists for
  cusp forms (Waldspurger: |period|² = central L-value × local factors ≥ 0). For the Eisenstein series the period is
  ζ_K(s) itself, linear, not squared, so nothing is non-negative. The object that would make this wall trivial: a
  representation in which ζ_K(s)·ζ_K(1 − s̄)̄ (the analytic continuation of |ζ_K(½ + it)|²) is the squared norm of a
  torus-invariant vector for EVERY s, not only on the unitary axis. Off the unitary axis the principal series is not
  unitary (complementary series only for real s in (0, 1)), so the norm is indefinite there. That indefinite form, on
  the non-unitary principal series of parameter s, evaluated on the torus-invariant vector, is the next object.

**N45. Two specialists converge on "outer", and the modular surface becomes a two-parameter family through ζ_K**
(lead, 2026-11-11, after SP-reflection's `rh/specialists/reflection/OBJECT_PHI.md`; written without seeing SP-operator's).
- CONVERGENCE (rule 13 (b) working as intended). SP-operator: RH_K ⟺ the Eisenstein value at ω, as a function of the
  spectral parameter, is OUTER (the Green function at ω is cyclic for the outgoing semigroup). SP-reflection: RH_K ⟺
  E(ω, ·) is the minimum-phase (outer) square root of its own spectral density; "the trivialising object is a causal
  (Lax–Phillips outgoing) structure plus cyclicity, not a positivity." Two toolkits, one statement. It is of known
  type (Nyman–Beurling cyclicity in disguise: SP-reflection notes the spectral measure of ω is, up to an outer weight,
  the Nyman–Beurling measure of ζ_K). What is new is where it puts the difficulty: in a PHASE, not in a sign.
- SP-REFLECTION'S DEFECT FUNCTION (its risk, idea SP-reflection/#5; proved given inner–outer factorisation; checked
  numerically to ~1e-3 at ω): A(z) := (1/2π)∫ log|E(z, ½+it)| dt/(¼+t²) = log(3/π) − ½ log ht(z) + Dfc(z), with
  Dfc(z) = Σ_{Re ρ>½} log|ρ/(1−ρ)| ≥ 0 over the zeros ρ of s ↦ E(z, s). A non-negative function on the modular
  surface that vanishes exactly at the points z whose Eisenstein family has no zero right of the line.
- WHAT FOLLOWS (lead; elementary unless marked):
  (1) For EVERY z, t ↦ E*(z, ½+it) is real (E*(z, s) = E*(z, 1 − s) and E*(z, s̄) = conj E*(z, s)). Simple zeros of a
      real function persist under small real perturbation, so zeros leave the line only through COLLISIONS (double
      zeros). The family z ↦ E*(z, ·) is a two-parameter de Bruijn–Newman family, and Δ_z E = s(1 − s)E is its "heat
      equation".
  (2) At the elliptic points i and ω every E(·, s) has a critical point (a Γ-invariant function's differential at a
      fixed point of an order-2 or order-3 rotation vanishes). Near ω only Taylor terms of weight divisible by the
      stabiliser survive; by Hecke's formula for Epstein zeta functions with harmonic polynomials (RECALLED, to be
      read), those coefficients are the L-functions of the Grössencharacters of K of matching infinity type. So the
      Taylor expansion of the family at ω is the generating function of the Hecke L-functions of K.
  (3) Generic z (Epstein zeta of a transcendental form; class number > 1 at CM points) has zeros off the line
      (Davenport–Heilbronn; Bombieri–Hejhal; recalled). So RH at a class-number-one CM point is a SIMULTANEOUS
      RE-COLLISION of infinitely many zero pairs at one point of the surface. That is Rodgers–Tao's "RH is barely
      true" in geometric form, and it says no monotone flow along the surface can prove it (a flow does not force
      infinitely many collisions at once). What forces them can only be what the point has: SP-operator's sentence,
      "complex multiplication, not the stabiliser" — other class-number-one CM points (√−2, (1+√−7)/2, …,
      (1+√−163)/2) are not elliptic fixed points.
  (4) CONJECTURE (Rodgers–Tao analogue, unsearched): Dfc > 0 at points arbitrarily close to ω. If true, ω is on the
      boundary of the RH set, and the RH set near ω is a measure-zero object: the CM points.
- THE QUESTION THIS LEAVES (for the next step): the RH set {Dfc = 0} contains (conjecturally) exactly the
  class-number-one CM points and the cusp end of the constant-term picture (Lagarias–Suzuki: the constant term at
  height ≥ 1 has all zeros on the line; recalled). What is the mechanism that makes a CM point of class number one
  a re-collision point? Candidate: the Hecke algebra of the torus fixes the point, and the zeros of E(z, ·) are
  joint data of the Laplacian AND the Hecke operators, which commute; at a generic point only the Laplacian acts.

**N46. Two candidates of F5 examined by hand; both reduce, and the reason is one pattern** (lead, 2026-11-11).
- (ii) THE BOHR LIFT. On the infinite torus T^∞ (one variable z_p per prime) the Euler product at σ₀ > ½ is
  F(z) = Π_p (1 − p^(−σ₀) z_p)^(−1): each factor outer in its variable, F ∈ H²(T^∞) since Σ p^(−2σ₀) < ∞, log F a
  random-type series converging a.e. So the lift is outer and zero-free almost everywhere; ζ(σ₀ + it) is its
  restriction to one Kronecker line. The impostor's lift is a SUM of two such functions and vanishes on a set of
  positive measure (Bohr–Jessen; this is why it has ≫ T zeros in the strip). So T^∞ separates ζ from the impostor
  robustly, at the level of "almost every point" (Bohr–Landau: off-line zeros of ζ have density zero; recalled).
  RH is the statement for the SPECIFIC line, i.e. pointwise; that is Bagchi's strong recurrence (1981, recalled,
  unread). Wall, exactly: pointwise control on T^∞ needs continuity of log F, and for a series in independent
  variables uniform convergence ⟺ Σ |a_p| < ∞ ⟺ σ₀ > 1. The lift hits the wall precisely at the edge of the strip.
- (i) THE HECKE MODULE OF δ_ω. Hecke operators commute with the resolvent, so T_p applied to the Green function at
  ω gives the Green function at the cycle T_p ω = (1+χ(p))·ω + 3·CM(−3p²) (SP-modular's relation). Twisting the
  Krein function by the Hecke eigenvalue gives functions Q_p with Q_p(s) − Q_p(1−s) = λ_p(s)·Φ(s)²/(...), and the
  Hecke relation then says, at a zero ρ: Σ_{w ∈ CM(−3p²)} [G_ρ(ω, w) − G_{1−ρ}(ω, w)] = 0 for every split p. But the
  sheet difference of a Green function between two points is the product E*(ω, s)E*(w, 1 − s)/(…), so the relation
  is a consequence of Φ(ρ) = 0 and carries nothing.
- THE PATTERN (a lesson worth a rule): **every identity LINEAR in the spectral data of δ_ω reduces, at a zero, to
  Φ(ρ) = 0.** The Euler product (the Hecke structure) is already used up in the factorisation of Φ. Information
  beyond it must come from an object that is QUADRATIC or non-linear in the spectral data and is not itself a
  function of |Φ| on the line (which the impostor shares). The only such object found so far is the continuation
  of the density, Φ(s)², i.e. the sheet difference of the Krein function, and its analytic continuation off the line
  is the whole problem. Rule H9 (proposed): before building on an identity, check whether it is linear in the
  object whose zeros are sought; if it is, it cannot see them.

**N47. A prediction about round 2, written before any specialist answers** (lead, 2026-11-11, after a container
restart at about 02:40 UTC; all five seats resumed from their transcripts).
The cheapest non-linear object in the spectral data of δ_ω is the LOGARITHM: log Φ_ω = log ζ + log L(·, χ₋₃) has
Dirichlet coefficients supported on prime powers; log Φ_{i√5} does not (it is the log of a sum of two products).
Φ′/Φ is the input of Weil's explicit formula. So my prediction: the separating non-linear invariants the three
seats propose will each turn out to be, after unfolding, a functional of Φ′/Φ, i.e. the Weil form in another
language, and the circle closes: positivity of that form is what the project started from. If one of them is NOT a
functional of Φ′/Φ (genuinely higher order: a determinant, a product of two Green functions at different points,
a Rankin–Selberg square), that one is the lead to follow. Scored when the three "Round 2" sections are in.

**N48. Bombieri–Garrett read whole: N43 is in print, and one open convergence question is worth stating exactly**
(lead, after READER-5's digests `rh/library/2002.07929.md`, `garrett-notes.md`, `cdv-pseudo-laplaciens-198{2,3}.md`).
- ALREADY KNOWN (credit, and stop re-deriving): the two-sheet identity is Bombieri–Garrett Cor. 46–47 and Remark 14;
  the Krein function at ω is Colin de Verdière's F(s, j) (1982, Thm 3 Cor.); "an eigenvalue needs a second real
  condition" is their Cor. 52; the operator with boundary condition "vanish at the CM points" exists (S̃_θ, on the
  non-cuspidal part E⁰, Friedrichs extension; the delta is in E^(−1/2−ε) only after the cusp forms are removed); its
  discrete spectrum is contained in the zeros on the line and may be EMPTY (their numerics suggest empty); at most
  94% of zeros could occur (RH + pair correlation); one operator carrying all zeros was Colin de Verdière's 1983
  conjecture, reported false by Bombieri (2011). §6.7: the symmetric reading u_w = u_{1−w} is "fundamentally
  flawed" because the correction vanishes exactly at the zeros, and would "prove" RH for Epstein zeta functions too
  (that is rule H9 and the impostor test, found by them in 2020). None of it uses the Euler product or Hecke operators.
- THE ONE THING LEFT OPEN THAT HAS THE SHAPE RULE 13 (c) ASKS FOR. Cor. 30 (unconditional): a symmetric meromorphic
  G(w, a), built from ζ_K data, has all its zeros on the line or in [0, 1], for every cut-off a. READER-5's algebra (not
  in the paper): G = J − r_a X with X = θE_w θE_{1−w}/(2(1 − 2w)) and r_a → 1. So a family with zeros on the line
  CONVERGES POINTWISE to the second-sheet function J − X. By Hurwitz, IF the convergence is locally uniform on a domain
  off the line, the limit has no zeros there (or vanishes identically). This is wall W1 in its sharpest known form,
  with the limiting function explicit. To make it useful two facts are needed and neither is in the paper:
  (a) is G(·, a) → J − X locally uniformly on Re w > ½, away from the line? (a convergence question about one
      explicit family, of the kind the impostor cannot settle in our favour: the same G exists for Epstein data, so
      uniformity must FAIL there, and where it fails is computable);
  (b) what are the zeros of J − X? At a zero ρ of ζ_K off the line X(ρ) = 0, so (J − X)(ρ) = J(ρ): the limit sees ρ
      only if J(ρ) = 0, i.e. only if the continued solution satisfies the second condition there. So even (a) would
      prove only that off-line zeros of ζ_K are not common zeros of J. Recorded as the exact distance between this
      object and RH.
- CHEAP COMPUTATION THAT WOULD DECIDE (a) FOR THE IMPOSTOR (allowed under rule 13: it decides a structural question):
  for the class-number-2 CM data (d = −20), G(·, a) at a = 2, 4, 8 near the impostor's off-line zero: if uniformity
  fails there, it fails at a rate a computation can see, and the rate is the invariant that separates ω from i√5.
  Not started; will be assigned once round 2 is in.

**N49. One formula behind the quasi-RH exponent, its barrier, and Bagchi's theorem** (lead, 2026-11-11, after
SP-operator's round 2; labels on each line; novelty NOT searched).
- SP-OPERATOR, ROUND 2 (`rh/specialists/operator/OBJECT_PHI.md`, last section). (1) PROVED: |Φ|² on the line
  determines Φ (real-analytic), so "not a function of |Φ|" must read "not a weakly continuous functional of the
  spectral measure". (2) PROVED: the cyclicity angle of the Green function at z satisfies −log cos α(z) = Dfc(z):
  outer = minimum phase = cyclic, one object derived three ways. (3) Dfc is only UPPER semicontinuous under weak
  limits (Szegő–Kolmogorov–Krein): defect can appear in a limit, never disappear. (4) PROVED: Dfc is additive over
  products and every finite Euler product has Dfc = 0: multiplicativity is the only lever; the impostor is a sum.
  So the wall has a DIRECTION: RH_K = "no logarithmic mass escapes as P → ∞ in the Euler product". That is the
  Balazard–Saias–Yor identity seen as a Fatou gap (BSY: RH ⟺ ∫ log|ζ(½+it)| dt/(¼+t²) = 0).
- THE AMPLIFIER FORMULA (lead; elementary). In the quasi-RH argument, if a family of H twists of length-D Möbius
  sums has a full mean square of diagonal size H·D (provable only when H ≳ D, by Poisson/large sieve) and contains
  H^δ members within o(√D·...) of the untwisted sum, then |A₁|² ≲ H·D/H^δ, so A₁ ≪ D^(1 − δ/2 + ε) at H ≈ D:
  **zero-free half-plane Re s > 1 − δ/2.** δ = 1/6 gives 11/12 (their exponent before the bootstrap).
- WHY THE RUMOURED 3/4 (lead; HEURISTIC barrier, unproved). A "copy" is a member whose twist is trivial on all n
  except at a few primes: an imprimitive character induced from the trivial one. (a) In power-residue families of
  order m (indexed by u, conductor ≈ u) the copies are the m-th powers: δ = 1/m ≤ 1/2 (m ≥ 2). (b) In the family of
  ALL Dirichlet characters to moduli q ≤ Q (size H ≈ Q²) the copies are the principal characters, one per modulus:
  δ = 1/2 again. (c) If copies had positive density (δ = 1) they would form a kernel of index O(1), the family would
  have only O(H^(1−δ)) distinct members, and its mean square could no longer be proved diagonal unconditionally
  (the large sieve needs ≳ D DISTINCT members): the argument becomes circular. So amplification by algebraic copies
  is capped at δ = ½, exponent 3/4, unless a family of a new kind exists. Consistent with the one unsourced remark
  ("a barrier at 3/4"); the papers state no barrier.
- THE SAME FORMULA AT δ = 1 IS BAGCHI'S THEOREM (Bagchi 1981, recalled, unread: RH ⟺ ζ is strongly recurrent,
  i.e. for every compact K in ½ < σ < 1 and ε > 0, the set of τ with sup_K |ζ(s+iτ) − ζ(s)| < ε has positive lower
  density). In the t-family A(τ) = Σ μ(n) n^(−iτ) W(n/D) the full mean square IS diagonal unconditionally
  (Montgomery–Vaughan mean value theorem, ∫₀^H |A(τ)|² dτ ≈ (H + D)·D), so the only missing input is a
  POSITIVE-PROPORTION set of approximate copies: exactly strong recurrence. Exact copies never occur in t (n^(−iτ) = 1
  for all n ≤ D needs τ log p ∈ 2πℤ for all p ≤ D); approximate ones have density about ε^(π(D)) by Kronecker.
- WHAT THIS SAYS (lead). The quasi-RH proof is a DISCRETE, ALGEBRAIC substitute for Bagchi recurrence: it replaces
  "ζ approximately recurs along t" (≡ RH) by "μ exactly recurs in a family of algebraic twists" (provable, but at
  square-root density at most). Rule 13 (c) for the wall "copies have at most square-root density": the object that
  would make it trivial is **a family of twists of μ, with ≳ D distinct members and an unconditional diagonal mean
  square, in which a POSITIVE PROPORTION of members are near-copies of the untwisted sum.** Characters cannot be it
  (argument (c)). Candidates of a new kind to think about: twists that are not characters (dilations n ↦ μ(n)·f(n/k)?
  automorphic coefficients whose families contain the constant term with positive spectral weight? approximate
  copies coming from a group action with a spectral gap, where "near-copy" is quantitative mixing rather than
  exact triviality). NONE examined yet. This is the structural question I now hold.

**N50. Round 2 lands; my N47 prediction partly fails, and the failure is the lead** (lead, 2026-11-11).
- READER-6 CORRECTIONS TO N45 (digests `rh/library/math0412039.md`, `1204.6297.md`, `2110.09368.md`, `1601.01724.md`,
  `ki-cras-2006.md`, `1008.0995.md`, `2411.18492.md`): collisions and square-root branching of zeros of E(z, ·) are
  KNOWN (McPhedran Thm 1; Bétermin–Šamaj–Travěnec Lemmas 4.1–4.2); Hecke's expansion at CM points is a K-type
  expansion, coefficients = Grössencharacter L-functions (Reznikov, Prop. (Hecke)); class number > 1 has cT + o(T)
  off-line zeros in every strip (Voronin, Lee Thm 1.3); my Bombieri–Hejhal citation was wrong in direction; the cusp
  is OUTSIDE the RH set (real zero in (½, 1) for reduced y ≥ 7.0556; Lagarias–Suzuki's statement is about an integral
  in T, not about E); the de Bruijn–Newman framing of the z-family and any flow in z were NOT found.
- THE QUASI-RH EXPONENTS, READ CORRECTLY (from READER-4's digest of the 7/8 paper, Lemma 18.1: "Let 3/4 ≤ κ ≤ 1 … with
  the hypothesis β* ≤ (1 + κ)/2", applied with κ = 2β* − 1): the method outputs β* = (1 + κ)/2 where κ is the
  exponent of an auxiliary moment. The halving is the Cauchy–Schwarz of the amplifier. Square-root cancellation in the
  auxiliary sums (κ = ½) would give 3/4: that is the natural reading of "a barrier at 3/4" (mine, not the authors').
  So: **every argument of the form "an individual sum bounded by a family's mean square" loses a square root and
  is capped at 3/4; rule H9 says purely linear identities see nothing; RH needs a sign-sensitive object that is
  neither linear nor a mean square.**
- SCORE OF N47: SP-operator's invariant (the cyclicity angle, = Dfc) is defined through the zeros or the outer
  factorisation: as predicted, a function of Φ′/Φ-type data. **SP-reflection's is NOT** (round 2,
  `rh/specialists/reflection/OBJECT_PHI.md`): λ_T(z) := min of the Wiener–Hopf form of W_z(u) = ⟨cos(uD) g_z, g_z⟩,
  g_z = (Δ + 2)^(−1) δ_z, under ∫₀^T φ e^(−u/2) = 1: a RATIO OF DETERMINANTS built only from the distances in the orbit
  of z. It decreases to (9/(32π²)) ht(z)^(−1) e^(2 Dfc(z)) (proved given Krein's theorem), so RH_K ⟺ λ_T(ω) tends to
  the explicit constant. Its minimiser at ω, under RH_K, has the Möbius function of ℤ[ω] as coefficients. At ω the
  orbit counts are ONE shifted convolution of one Hecke eigenfunction, ε(m) r_K(m) r_K(m+3); at i√5 they are FOUR.
  Prediction half wrong; that half is exactly a determinant, the exception I named. Follow it.
- WHY IT IS THE RIGHT KIND OF OBJECT (lead). A Toeplitz/Wiener–Hopf determinant is quadratic in the data without a
  Cauchy–Schwarz loss (it is exact), sign-sensitive through its limit (Szegő), and its symbol on the line is
  |Φ(½+it)|²/|ξ(1+2it)|², which has a ZERO OF ORDER TWO at every zero of Φ on the line. Determinants of symbols with
  zeros are the Fisher–Hartwig problem; their asymptotics are known for finitely many singularities (Barnes G-factors,
  Widom, Basor, Ehrhardt, Deift–Its–Krasovsky) and they are the origin of the Keating–Snaith moment conjectures. So:
  **RH_K ⟺ a Wiener–Hopf determinant whose symbol has infinitely many Fisher–Hartwig singularities (one per zero on
  the line) converges to the value Szegő predicts; an off-line zero is invisible in the symbol and shows up only as a
  missing amount e^(2Dfc) in the limit.** The open question with room: is there an UNCONDITIONAL rate for λ_T(ω) →
  limit (a Fisher–Hartwig asymptotic with infinitely many singularities, uniform in their number up to height T)?
  If the rate is controlled by the singularities alone (which are on the line by definition), the limit cannot carry an
  extra e^(2Dfc). That is the first bridge-2 hunch with a sign-sensitive, loss-free object. Assigned to SP-operator
  (who has read Basor–Chen and Basor–Ehrhardt) and SP-reflection (who built λ_T).

**N51. SP-modular's round 2, one correction to its next test, and a prediction about round 3 before it lands**
(lead, 2026-11-11).
- SP-MODULAR, ROUND 2 (`rh/specialists/modular/OBJECT_PHI.md`, last section). Exact up to one constant, with the Gamma
  factors matching (checked to 15 digits, using Patterson's Thm 8.1 as quoted by Dunn–Radziwiłł):
  Λ_K^(3)(2s)·RS(|θ₃|²)(s) = C·3^(−s)(1 + 3^(1−2s))(1 − 3^(−s))·Λ_K(s)Λ_K(3s − 1). A positive kernel k_θ whose
  transform carries every zero ρ of ζ_K TWICE, at ρ and at (ρ + 1)/3 (the dilation s ↦ 3s − 1 fixes ½ and divides
  the displacement by 3). No such object exists at i√5 (proved for twisted-multiplicative coefficients; it separates
  the FIELD, not the point: ℚ(i) has no cubic theta either). Also proved: the cusp-form part of the resolvent depends
  only on s(1 − s) and cancels from every two-sheet comparison, so Waldspurger's factorisation (where ω and i√5
  differ) is invisible to the zeros. Its proposed next test is log-concavity of k_θ(e^u).
- CORRECTION TO THAT TEST (lead; Schoenberg 1951, recalled): a Pólya frequency kernel of infinite order (log-concavity
  is its order-2 shadow) has a two-sided Laplace transform equal to 1/Ψ with Ψ in the Laguerre–Pólya class, i.e. a
  transform with NO zeros at all. So log-concavity points the wrong way: it is a property of kernels whose
  transforms are zero-free, and Λ_K has zeros. The right class of sufficient conditions for "the Fourier transform of
  a positive even kernel has only real zeros" is Pólya's (1926–27: kernels of the form e^(−a cosh u) and their
  "universal factors") and de Bruijn's (1950: kernels whose logarithm's derivative satisfies a monotonicity); the
  ξ-kernel Φ itself is the test case where these conditions are known to fail to be verifiable. Sent to SP-modular.
- PREDICTION FOR ROUND 3, written before SP-operator and SP-reflection answer: the limit of SP-reflection's λ_T is a
  Szegő–Kolmogorov infimum under one interior constraint; Szegő's infimum depends only on the OUTER part of the
  symbol, i.e. on |Φ| on the line, and the comparison is with the actual value at the constraint point (the atom
  3/π). That is the Balazard–Saias–Yor identity; the rate question is the Báez-Duarte–Balazard–Landreau–Saias
  conjecture for ζ_K (Nyman–Beurling distance d_N² ~ C/log N, with T ≈ log N), and Burnol's unconditional LOWER
  bound for d_N is the Fisher–Hartwig contribution of the zeros on the line. So I expect the answer to question (3):
  "the inner factor is invisible to every asymptotic of determinants of the symbol; an unconditional rate of
  convergence is RH itself (Nyman–Beurling)": a reformulation, not a bridge. If either seat finds a mechanism by which
  the ARITHMETIC of the orbit counts (one shifted convolution at ω versus four at i√5) enters the rate and not only the
  symbol, my prediction fails and that is the lead.

**N52. Round 3 (SP-operator): N51's prediction HIT; the one exit left is the orbit side** (lead, 2026-11-11).
- SP-operator, round 3 (`rh/specialists/operator/OBJECT_PHI.md`, last section): λ_T = 1/K_T(i/2, i/2), the
  reproducing kernel at s = 1 of the de Branges space of the Krein system with spectral measure w_ω dt; Krein–Szegő
  forces the limit unconditionally, for every impostor alike; RH_K is the value of a Poisson integral of log w
  (Balazard–Saias–Yor for ζ_K). The factor e^(2Dfc) is invisible to every Fisher–Hartwig / strong-Szegő theorem,
  because those read the symbol through norms on the line, where an off-line quartet is a smooth positive bump. No
  Fisher–Hartwig theorem exists for a growing number of singularities, and this symbol is outside the strong-Szegő
  class anyway (Mertens divergence). REFORMULATION, as predicted. Two things in it are worth keeping:
  (a) off-line zeros ARE visible in the determinant at finite T (Claeys–Its–Krasovsky crossover: a quartet acts as
      a merged order-4 singularity for T ≪ 1/δ and switches off for T ≫ 1/δ): the seminar's visibility law in
      determinant form;
  (b) at ω the symbol is formally a product of local almost-periodic symbols on frequency lattices ℤ·log p, pairwise
      disjoint by unique factorisation, so the Szegő–Widom constants factor over primes with no cross terms (proved
      for finite products); at i√5 there is no such factorisation. Exchanging T → ∞ and P → ∞ is RH again.
- THE EXIT (rule H7, named by the seat): compute lim λ_T from the ORBIT side, without the symbol. There the object
  is λ_T(ω) evaluated at the explicit Möbius test vector: a double sum of μ_K(a)μ_K(b) against the lattice counts
  ε(m) r_K(m) r_K(m + 3) of x² + xy + y², i.e. a BILINEAR Möbius correlation over ℤ[ω] (type II information). That is
  exactly the kind of sum the quasi-RH tools bound (twisted Möbius sums over ℤ[ω] in families). SP-reflection's
  round 3 item (2) asks for this double sum and for what the 7/8 theorem gives for it. That is the next plank, and
  the first point in this whole line where the October 2026 input could enter OUR object.
- SP-MODULAR ROUND 2b (`rh/specialists/modular/OBJECT_PHI.md`): correction accepted and checked (Gröchenig
  2007.12889); the "every zero twice" structure is a union Z(F) ∪ Z(F)/3, not an invariance; the kernel factors
  K ⋆ K(3·), and the impostor at i√5 gives a positive kernel K₁ ⋆ K₁(3·) with off-line zeros, so NO theorem "positivity
  of one factor forces real zeros of the other" can exist (proved by the fake). The theta adds only Landau's lemma at
  Re s = 1. The one positivity tied to θ₃ that does not factor through K is the cusp part ⟨|θ₃|², u_j⟩ (Ichino-type
  triple products); unexamined. Recorded as dead except for that item.

**N53. Three walls are one wall: a Möbius-specific mean square in the SHORT-FAMILY regime** (lead, 2026-11-11;
labels per line; novelty not searched).
- (a) NYMAN–BEURLING, BOUNDED VERSION (elementary; probably known: Báez-Duarte, Bagchi, Burnol). Let f_N be the Möbius
  approximants Σ_{k≤N} μ(k) w_N(k) ρ(1/(kx)) of 1 on (0, 1). If sup_N ‖f_N‖₂ < ∞ and f_N → 1 in any weaker sense
  (in L^p, p > 1, which follows from a zero-free region by Beurling's L^p theorem, now available at p = 8/7 if the
  October 2026 theorem stands), then 1 lies in the weak, hence (Mazur) the norm, closure of the span in L²: RH. Conversely
  RH gives bounded approximants. So **RH ⟺ the Möbius approximants are bounded in L²**: a statement WITH ROOM (any
  constant). By Mellin–Plancherel ‖f_N‖₂² = (1/2π)∫ |ζ(½+it) M_N(½+it)|² dt/(¼+t²), M_N = Σ μ(k)w_N(k)k^(−s).
- (b) WHERE IT IS HARD. Dyadic block at height T contributes T^(−2)∫_T^{2T}|ζM_N|². For T ≥ N^(7/4) the mollifier has
  length ≤ T^(4/7) and Conrey's theorem bounds the block by ≍ T^(−1): summable, harmless. Everything lies at heights
  T ≪ N^(7/4), above all at BOUNDED height with N → ∞: a mollifier infinitely longer than the height. Expanding |M_N|²
  turns it into the twisted second moment of ζ with twists (a/b)^(it), a, b ≤ N ≫ T, known only for lengths up to
  about T^(1/2+δ) (Bettin–Chandee–Radziwiłł; recalled, unread).
- (c) THE SAME WALL IN THE QUASI-RH PROOF. Their mean square needs a family LONGER than the sum (H = D^(1+θ), θ > 0):
  that is the large-sieve regime, where Montgomery–Vaughan's (H + D)·Σ|a_n|² has the diagonal as main term. In the
  NB problem the "family" is the t-interval of length T and the sum has length N ≫ T: the opposite regime, where the
  large-sieve bound is dominated by the D-term for EVERY sequence and carries no information. And the amplifier of
  N49 needs H ≥ D for the same reason. So: **the amplifier's 3/4 cap, the twisted-moment length barrier, and RH via
  bounded Nyman–Beurling approximants all sit at one wall: a mean square of twisted Möbius sums in which the family
  is NOT longer than the sum, where only arithmetic specific to μ can help.**
- (d) RULE 13 (c): what object would make the short-family regime trivial? An exact formula (Poisson, theta, trace
  formula) for Σ_{u in a family of size H}|A_u(D)|² that stays exact when H < D, i.e. a family whose dual under
  Poisson is again SHORT. Their transfer step (two Poisson summations, "returns to the same family with
  H′/Σ′ ≤ H/Σ") changes the ratio of family to length; whether it can run in the regime H < D is the precise
  question. Given to two seats at once (rule 13 (b)).

**N54. SP-reflection round 3 lands on the same wall independently** (lead, 2026-11-11; it had not read N53).
- PROVED there: e^(2Dfc(ω)) − 1 is exactly a continuous Nyman–Beurling distance for ζ_K (Pythagoras + Krein–Szegő);
  an unconditional certificate Dfc(ω) ≤ ½ log(1 + NB integral of any admissible test function), useless
  quantitatively (≈ 0.16/log X) and unable to certify Dfc = 0; the explicit Möbius vector f* is square integrable
  iff RH_K. Its truncation is a double sum of μ_K against the orbit counts, and what that needs is "an asymptotic for
  a mollified second moment of ζ_K on the critical line" — the long-mollifier wall of N53 (b), reached from the
  positivity toolkit without seeing N53. Fake first: at i√5 the first step the fake cannot take is the explicit
  vector itself (its Dirichlet inverse diverges at s = 1), consistent with N53 (c)'s pole at 0.808.
- So four independent routes (bridge 1 via the impostor, the amplifier formula, the operator determinant, the
  positivity determinant) end at ONE wall: Möbius-specific mean squares in which the family is not longer than the
  sum (equivalently: twisted / mollified second moments with mollifier longer than the square root of the height,
  at bounded height in the limit). The October 2026 proof works on the other side of that wall (family longer than
  the sum). Two seats (SP-modular, SP-operator) are on "what object makes the short-family regime exact".
- Blind conjecture of SP-reflection to keep (testable later, not now under rule 13): λ_T^Eis(ω) − limit ≈ 0.15942/T
  under RH_K.

**N55. SP-modular on the short-family object: the regime is where the fake dies, and the candidate exact formula is
a Kuznetsov formula on the cubic cover** (lead, after `rh/specialists/modular/SHORT_FAMILY.md`).
- The step needing H > D is the theta transformation followed by the quadratic large sieve, Σ_h|T_h(X)|² ≪ 𝓗 + 𝓗²/X
  (their (2.15)); Poisson in u is exact for every H. At H = D^(1−θ) the cube-removal recursion returns the problem
  to itself (b = 1 is a fixed point). Both dualities they use are self-dual at H = D.
- **Sharp sentence for the wall:** "the Möbius side cannot supply its own duality: 1/L has no functional
  equation; multiplying μ by a sextic Gauss sum produces a theta coefficient with a functional equation, but only on
  the dual side." That is barrier B1 seen from the Möbius side.
- **The fake confirms the regime:** the impostor's pole at 0.808 forces S ≥ D^1.616, which breaks the diagonal bound
  exactly when H < D^0.617. So the impostor is INVISIBLE in their regime H ≥ D and EXCLUDED at H = D^(1/2). The
  short-family regime is precisely where the Euler product starts to matter. What a bound would buy:
  S(D^(1/2), D) ≪ D^(3/2+ε) gives Re s > 3/4 without amplifier and 17/24 with the sixth-power amplifier (one step
  heuristic); the bound at H = D^η for every η > 0 is RH_K.
- **Rule 13 (c), the object:** an EXACT formula for S(H, D) with H < D. Candidate named by the seat: a
  Kuznetsov(-Bruggeman) formula on the cubic metaplectic cover, turning the cubic Gauss sums into Kloosterman-type
  sums with the family size entering only through a test function (Livné–Patterson; Kodama 2004; a spectral large sieve
  on the cubic cover). Reader sent.

**N56. SP-operator on the short-family object: the extremal direction is the trivial twist** (lead, after
`rh/specialists/operator/SHORT_FAMILY.md`; two formulas checked numerically there, one error caught by the check).
- Exact: ‖f_c‖² = Σ_k |Σ_{d≤N} c_d ⌊k/d⌋|²/(k(k+1)) under M_c(1) = 0; G_N = P_N T₁* Γ T₁ P_N with T₁ the divisor matrix
  (multiplicative Toeplitz with symbol ζ) and Γ = [1/max(m, n)] the Hardy–Cesàro operator. WINDOW IDENTITY (the
  multiplicative analogue of bridge plank 5): {1..N} is divisor-closed, so Möbius inverts the divisor matrix exactly
  there, and d_N² = Σ_k ∫_k^{k+1} |R_N(k) + y·M_N(1)|² dy/y², R_N(k) = Σ_{N<d≤k} μ(d)⌊k/d⌋: all the energy lives beyond
  the window, on blocks where family and sum have the SAME length — N53's borderline H ≈ D exactly.
- The decisive operator fact: the D-term of the large sieve is the top singular value of the sampling operator with
  nodes log n, produced by clusters of nodes within 1/T; **its extremal vectors are the trivial twist** (t ≈ 0 in the
  t-family; the rows u = p⁶ in the sextic family). So in the short regime every mean square is equivalent to the
  untwisted Möbius sum itself and cannot amplify. Beating it needs an exact statement that μ is orthogonal, to
  square-root size, to the cluster-smooth vectors.
- Both specialists, independently, now agree on the wall's description (SP-modular: the dualities are self-dual at
  H = D and the Möbius side has no duality of its own; SP-operator: the extremal direction is the copy direction).
  The project's map of this region is complete enough to state the target in one line:
  **TARGET: an exact identity, specific to μ (or to μ·Gauss sum over ℤ[ω]), valid in the regime family ≈ sum length,
  that separates μ from the cluster-smooth (copy) directions.** The one candidate in sight: a Kuznetsov formula on the
  cubic cover (READER-7 reading). Nothing else proposed by any seat survived the fake test.

**N57. The short-family wall is a CONVEXITY barrier at a self-dual point; the known way through such barriers**
(lead, 2026-11-11; HUNCH, labels per line).
- From SP-modular (SHORT_FAMILY.md, items 1, 5): Poisson in u maps the family of size H to a dual family of size about
  D²/H, and theta automorphy maps it back; at H = D both are self-dual and give "only a convexity-type bound". So the
  borderline H ≈ D, where SP-operator's window identity puts ALL of the Nyman–Beurling energy (N56), is a self-dual
  point of an exact involution, and the trivial bound there is the convexity bound of a family.
- Breaking convexity at a self-dual point is a solved KIND of problem elsewhere: subconvexity for L-functions in the
  conductor aspect (Duke–Friedlander–Iwaniec; Conrey–Iwaniec; Michel–Venkatesh) works by (i) an amplifier, (ii) an
  exact spectral formula (Kuznetsov / Petersson) for the amplified family, (iii) a non-trivial bound for the
  arithmetic side (Weil's bound for Kloosterman sums, or its cubic analogue). Our situation has (i) (sixth-power copies),
  would need (ii) on the cubic cover (READER-7), and (iii) would be a bound for cubic-Kloosterman-type sums (known in
  some ranges: Livné–Patterson, Heath-Brown; recalled).
- HUNCH (risky): run the DFI architecture for the sextic Möbius family at H = D on the cubic cover. A power saving at the
  self-dual point would give, by N49/N55's arithmetic, an exponent below 11/12 by the short route and possibly below
  7/8 with the bootstrap; it would NOT give RH (that needs the bound at H = D^η for every η > 0, i.e. far from the
  self-dual point, where no involution helps). Honest scope: an improvement of the quasi-RH theorem, if it works at
  all. The owner's caution "solving the quasi is not solving RH" applies; it is recorded as the only concrete route
  any seat has found through the wall, and as a way to learn what the wall is made of.
- FAKE FIRST: the impostor has no metaplectic theta (no Gauss-sum identity for its Dirichlet inverse), so step (ii)
  has no analogue for it: passes.

**N58. READER-7: the DFI route lacks its spectral formula, and the extremisers are our kind of sequence; and bridge 1's
"bulk" is the same wall** (lead, 2026-11-11).
- READER-7 (digests `rh/library/louvel-1107.0197.md`, `hbp-1979.md`, `dunn-radziwill-2109.07463.md`, `dunn-2403.13151.md`,
  `kodama-2004.md`, `dfdh-2607.07911.md`): the Kuznetsov formula on the cubic cover exists (Louvel Thms 4.1–4.3, proof
  for the Kubota multiplier only asserted), but its arithmetic side is a sum over MODULI at two fixed frequencies;
  no published tool turns an average over TWISTS into a spectral sum; no spectral large sieve on the cover exists; no
  formula for the sextic cover. Corrections: "Kodama 2004" is not metaplectic; Gauss sums sit on the spectral side,
  not as Kloosterman sums. **Warning for N57:** the (AB)^(2/3) term of the cubic large sieve is proved SHARP
  (de Faveri–Dunn–Hoffstein Thm 1.1) and its extremisers are Gauss-sum-weighted sequences — exactly the type our Möbius
  vector becomes after the Gauss–Jacobi conversion. So at the self-dual point our vector may sit on the extremal
  side of the very tool that lets the October proof cross H > D. Not established for μ; recorded as the most likely
  reason the DFI-type hunch fails. Ingredient (ii) of N57 does not exist in print.
- UNIFICATION (lead; elementary): bridge 1 ended with "RH is decided in the bulk below the band edge c = 2πe^(2L)". A
  window of half-width L contains the integers up to e^(2L); heights t below the band edge are those with
  t/2π < e^(2L): the sum is LONGER than the height. That is the short-family (long-mollifier) regime of N53, and the
  band edge is its self-dual point H ≈ D. So **five routes end at one wall** — bridge 1 (positivity side), the
  amplifier (Möbius side), the operator determinant, the positivity determinant, and Nyman–Beurling boundedness —
  and on every side the provable part (the ladder; the quasi-RH family H > D) lies on the far side of the same
  self-dual point, where the functional equation alone suffices or a family is long enough for a large sieve.
- STEP BACK (owner: "use the ideas as a hub; when you hit a wall step back and brainstorm"): opening Seminar S2 with
  this single question; moderator and five seats; board `rh/board/s2`.

**N59. Seminar S2, first answers: the near side of the wall is named PARITY by two seats independently** (lead).
- SP-modular (B10, `rh/specialists/modular/S2_B3.md`): a long sum over moduli governed by the bottom of a fixed spectrum
  (Patterson's X^(5/6) bias from θ₃); after Poisson the factor that μ produces makes the series entire and kills
  exactly the θ₃ term (GRH forces this: otherwise S ≥ D^(23/12)); result: no exponent below the trivial D². The dual
  sums live where the spectral family is longer than the sum again. Its risk-analogy: an off-line zero of 1/L
  behaves like an exceptional eigenvalue, and μ removes the one bottom term the structure knows.
- SP-operator (B11, `rh/specialists/operator/S2_B4.md`): on a box {d | P(z)} the divisor matrix is an exact tensor
  product over primes, so the Möbius vector maps EXACTLY to the Eratosthenes indicator; Buchstab's recursion
  R_N(k) = −Σ_p R^(<p)_{N/p}(⌊k/p⌋) (proved, checked exactly in 12 cases) glues boxes to the window. Prediction:
  prime-number-theorem strength only, because box → simplex is the sieve truncation at the parity-critical level.
  Impostor fails at line one (no tensor product over primes). Also proved: the NB Gram matrix [1/max(m, n)] is
  archimedean; its profinite twin [1/lcm(m, n)] is a tensor product; the two forms are not ordered.
- So the wall, on its near side, is plausibly the PARITY PROBLEM: in the short-family regime μ must be separated from
  the trivial twist, and sieve-type information cannot tell μ from its parity-flipped twin. A sieve seat (SP-sieve)
  has been started to say exactly what parity-breaking inputs exist and whether any reaches the sextic family or
  the t-family. If the wall is parity, the question for a bridge is the known one: an input of Type II strength in the
  critical range, specific to μ. The impostor fails at the tensor-product line in every proposal so far.
- SP-reflection (B13, B15, B16; `rh/specialists/reflection/s2/`): on the full torus the Möbius mean square is Σ μ²/n
  for every length (PROVED); an exact gcd identity (checked at N = 80) writes the t-family mean square as a product-form
  Möbius correlation on ℚ₊^×, which on the near side reduces EXACTLY to binary Möbius correlations at shifts up to
  N/T: the near side needs a POWER SAVING IN AVERAGED CHOWLA (Chowla is the parity problem's statement for μ) — a third
  seat, a third language, the same parity wall. And: the profinite Nyman–Beurling problem is solved EXACTLY by local
  Szegő problems at each prime (value ≈ 0.443, bounded); the archimedean one is 3–4 times larger and should grow
  under RH; PROVED that no positive-definite / Markov semigroup joins the two endpoints monotonically for the Möbius
  form (blind prediction of monotonicity missed). Reading: **every finite place is exactly solvable; the whole
  difficulty is the archimedean place, entering through the long sum** (barrier B10 restated exactly).
- S1-mirror (B18, `rh/experiments/s1_seminar/mirror/S2_B7.md`): per-prime Poisson identity (PROVED, known in substance;
  checked to 1e-15): log p·Σ_k p^(−k/2)(φ∗φ)(k log p) = Σ_m F(2πim/log p)², so
  Σ_ρ F(ρ)² + Σ_m F(−2m)² + Σ_p Σ_m F(2πim/log p)² = F(1)²: one square at the pole against squares at zeros, trivial
  zeros and every local Euler pole. Exact, no inequality. **The sentence to keep: every per-prime duality has
  time–frequency area 2LT/π, independent of p, so none of them sees e^(2L): the band edge is placed by the PRIME
  NUMBER THEOREM, not by any identity.** Widder's three hypotheses each dropped in turn: every exact structure that
  keeps a sign lives on the far side; Krein–Langer handles finite index only, and the near side has infinite index on
  every window. Outside structure named: Kurasov–Sarnak's Lee–Yang crystalline measures on a Kronecker line.
- STATE OF S2 after four of six answers: every proposal is either exact and sign-free on the near side (per-prime
  Poisson, the tensor box, the gcd identity, Patterson's residue) or sign-carrying and confined to the far side;
  three seats name the near-side requirement as parity / averaged Chowla with a power saving. My B9 criterion is close
  to being met; I hold the close until S1-parity and SP-sieve answer.
- S1-parity (B19, `rh/experiments/s1_seminar/parity/S2_B6.md`): the folding identity splits the prime sum at √D exactly
  like Vaughan's identity; the long range (√D, D] enters only through the mirror form, sign-definite on one-signed test
  functions. PROVED (odd block, given the half window positive): a pole-free system with couplings ≥ 0 cannot fail on
  one-signed vectors; zeta can fail there only by its one pole square beating three non-negative terms. What remains
  is a rank-one domination required only on non-negative functions: a COPOSITIVITY statement, for which no exactness
  theory is known. (This is K-atlas's pairing F22 × F30 of N-era record, now with the Vaughan split made explicit.)
  Impostor: first false line Λ ≥ 0; its coupling on its own failure vector is −0.0335 (prediction missed). Λ ≥ 0 helps
  only in the odd block; in the even block it costs 0.118 of the pole term.
- SP-sieve (B21, `rh/specialists/sieve/S2_B10d.md`), session 1. PROVED: Vaughan's identity holds for ANY invertible
  Dirichlet series, so the impostor has it word for word; its first false line is the coefficient size bound
  ‖β‖² ≪ N^(1+ε). CORRECTION to N55/N58: the impostor's inverse has poles with Re s > 1 (Davenport–Heilbronn zeros
  right of 1; Saias–Weingartner 2009, abstract), so "pole at 0.808" is not its rightmost; the conclusion there (the
  impostor is excluded on the near side) only gets stronger. PROVED: at H = D^(1/2) Type I is negligible off the
  copies (smoothed Pólya–Vinogradov over O); in L² the bilinear large sieve beats D² for NO (M, N), because conjugate
  characters of a single row already reach D²; and S ≪ D² for μ over ALL rows (copies included) would by itself give
  Re s > 23/24. The L¹ (Bombieri–Vinogradov) count is zero-density information and never sees the copies. KNOWN, read:
  Friedlander–Iwaniec 1998 break parity only with error O(log δ/log Δ); Friedlander–Iwaniec 2022 / Siebert / Granville:
  any fixed improvement of the linear sieve in progressions rules out exceptional zeros ("the exceptional character
  pretends to be μ"). HEURISTIC: the wall has that shape one level up; the only parity-sensitive input in the sextic
  family is γ₂³ = μα, and it acts only on the dual (long) side.
- **S2 CLOSES by my B9 criterion** (six of six answers in): every proposal is either exact and sign-free on the near
  side, or sign-carrying and confined to the far side; four seats name the near-side requirement as parity / averaged
  Chowla / Type II at power strength specific to μ. That is the classical central difficulty of the subject, now
  located precisely in each of our five languages. Two concrete threads survive: (i) SP-sieve's B22: stratify the
  sextic rows by the order of their character (1/2/3/6 with counts H^(1/6), H^(1/3), H^(1/2), H); parity lives on the
  quadratic stratum u = w³: does Poisson there absorb μ? (ii) SP-sieve's conjecture: a Siebert-type theorem in which a
  constant-factor gain at the copies for H < D gives a zero-free region (scope: quasi-RH, not RH).

**N60. S2's last thread, and a consequence for which controls are even possible** (lead, after B26, B27,
`rh/specialists/modular/S2_B22_B23.md`).
- B22: NO absorption on the quadratic stratum: a quadratic Gauss sum squared is χ(−1)p, a character value with no
  constant −1 (on the cubic side the −1 that becomes μ comes from the primary Jacobi sum); the double-cover theta has
  coefficients only on squares, which are exactly the copies, so any absorption lands on the trivial characters
  (circular). Had it worked: copies of density ½ in the stratum, A₁ ≪ D^(3/4) — exactly N49's cap, where parity sits.
- B23 (CORRECTION): 0.808 is the impostor's LOWEST off-line zero, not its rightmost; by Bohr–Kronecker its zeros reach
  real part σ₁ ≈ 1.1204 (computed, primes to 10⁷; prediction missed). So its inverse has unbounded coefficients
  (S ≥ D^2.24 along a sequence) and it is excluded in EVERY regime simply by the normalisation |μν| ≤ 1. SP-modular's
  earlier "invisible for H ≥ D" was wrong and is corrected in its file.
- CONSEQUENCE (lead). In the Möbius-side formulation the Davenport–Heilbronn function is not a useful control: the
  bound |coefficients of 1/L| ≤ 1 already kills it. A control for the short-family wall must have a functional
  equation, zeros off the line, AND a Dirichlet inverse with bounded (or divisor-bounded) coefficients. A completely
  multiplicative unimodular f gives L(s, f) whose logarithm converges where Σ|f(p)|²p^(−2σ) does, hence no zeros in
  Re s > ½ almost surely for random f (Helson-type; recalled) and no functional equation. Every known object with a
  functional equation and divisor-bounded inverse coefficients is in the Selberg class, where GRH is open. So **on
  the Möbius side there are no controls at all**: whatever crosses the short-family wall must work for the whole
  Selberg class or use something beyond it, and nothing on the board can test it. Rule H1 cannot be applied there;
  the only available test is the impostor's failure at the normalisation line, which is free.

**N61. Two more "trivialising objects" examined by hand, both closed** (lead, 2026-11-11, while the audit runs).
- AN INDEX. The project proved (idea #22, Theorem 4) that sup_L κ₋(Q_L) = the number of distinct off-line zeros:
  the off-line count IS a Morse index, an integer invariant constant along any continuous family of NON-DEGENERATE
  forms. The object that would make RH trivial is therefore a homotopy from a form of known index 0 to Q_L along which
  no eigenvalue crosses 0. Candidates on record: (a) the window L (first-failure template; bridge 1 found no early
  warning and the index can only change at a null vector, which is the claim itself); (b) the damping ε from 3/8
  (where index 0 is now a theorem, if the October 2026 result stands) down to 0: Schur makes the positive set a ray
  [ε*(L), ∞), so there are no crossings to control, only the endpoint, which is the claim; (c) the point z on the
  modular surface from a known point to ω: the RH set is conjecturally discrete (N45, READER-6), so no path stays
  inside it. In each case the homotopy is monotone or has no admissible path, and non-degeneracy at the end IS the
  statement. Closed as a reformulation; the record now says why an index argument needs a family transverse to all of
  these, which none of the toolkits supplies.
- THE ARCHIMEDEAN PLACE AS A LIMIT OF FINITE PLACES (from SP-reflection's S2 finding that every finite-place
  Nyman–Beurling problem is exactly solvable and the archimedean one is the obstacle). Γ-factors are q → 1 limits of
  products of local factors (q-Gamma); each local Szegő problem is exactly solvable and outer. But the archimedean
  factor is zero-free anyway; the obstruction is the GLOBAL product over p, not the local factor at ∞. Closed.
- What both say: every exact, sign-carrying structure the project has found acts either locally (one place at a time)
  or on the far side; the near side needs a GLOBAL input specific to μ. That is the parity wall of S2 again, now from
  the index-theory side. Recorded so that the next seat does not re-derive it.

**N62. Why every positive-prime-side method stops at the edge of the strip, in one inequality** (lead, 2026-11-11;
elementary; classical in spirit — de la Vallée Poussin's 3 + 4cos θ + cos 2θ ≥ 0 and the explicit-formula zero-free
regions of Stechkin/Heath-Brown/Kadiri — but this exact bookkeeping was not found in the record).
- The de la Vallée Poussin trick is of the kind asked for in S2's B9: NON-LINEAR (a product ζ³(σ)ζ⁴(σ+iγ)ζ(σ+2iγ)),
  SIGN-SENSITIVE (Λ ≥ 0 and 3 + 4cos + cos2 ≥ 0), not a mean square; and the impostor fails it (Λ ≥ 0 is false).
  Its explicit-formula version: take an even test function g on [−L, L] with g(u) ≥ 0, so that the prime side
  Σ Λ(n) n^(−½) g(log n) is non-negative; then Σ_ρ ĝ(ρ) ≤ (pole terms) + arch(g).
- THE BOOKKEEPING. A zero at ½ + δ + iγ contributes about e^(δL)·|ŵ| to the left; the pole contributes about
  e^(L/2)·|ŵ| to the right. So a positive-prime-side test function can see an off-line zero only if δ > ½ − o(1),
  i.e. only near Re s = 1. **The pole dominates, and that is the whole reason classical zero-free regions hug the edge.**
- THE ESCAPE AND ITS LIMIT. Killing the pole needs ĝ(±i/2) = ∫ g(u)e^(±u/2)du = 0, impossible for g ≥ 0. But g need be
  non-negative only AT the points log n (that is idea #9's positivity sieve). For a test function of bandwidth Ω, the
  points log n with n > Ω are denser than its oscillation, so "g(log n) ≥ 0" is effectively "g ≥ 0 on (log Ω, L)":
  the only freedom is on (0, log Ω), where the integers are sparse. That freedom ends exactly where e^(2L) ≈ Ω: the
  BAND EDGE again (bridge 1), now from the classical side. S1-parity's S2 result is the same fact in the window
  form: on one-signed vectors zeta can fail only by its single pole square beating non-negative terms.
- SO the map has a sixth face: (pole dominance in positive-weight explicit formulas) = (the band edge) = (the
  short-family wall). Recorded as a note on idea #34.

**N63. The pole and positivity are one fact (Landau's theorem); the version at the critical line exists, is
classical, and is believed FALSE — which rules out a whole class of approaches** (lead, 2026-11-11).
- LANDAU: a Dirichlet series with non-negative coefficients has a singularity at the real point of its abscissa.
  Every non-negative arithmetic weight built on the integers has abscissa 1, so its singularity is the pole at s = 1.
  That is WHY the pole dominates in every positive-weight method (N62): positivity of coefficients and the pole at 1
  are the same fact.
- THE OBJECT THAT WOULD MAKE IT TRIVIAL AT ½ (rule 13 (c)): a non-negative weight whose abscissa is ½ and whose
  singularities in Re s > ½ are the zeros of ζ. It EXISTS in the classical literature as a ONE-SIDED Mertens bound:
  if √x − M(x) ≥ 0 (or M(x) ≤ C√x) for all large x, then ∫ (C√x − M(x)) x^(−s−1) dx has a non-negative integrand,
  Landau applies, its only real singularity right of ½ would be a real zero of ζ in (½, 1) (there are none), so
  1/ζ is holomorphic in Re s > ½: RH (and simple zeros). (Classical: Landau, Ingham; recalled, unread.)
- BUT the one-sided bound is believed false: under the linear independence of the zeros' ordinates, M(x)/√x is
  unbounded in BOTH directions (Ingham 1942; the Mertens conjecture itself is false, Odlyzko–te Riele 1985; recalled).
- LESSON, as a rule (H10, proposed): **coefficient positivity at the critical line is (conjecturally) unavailable for
  any arithmetic weight; so a proof of RH cannot be "a one-sided bound for an arithmetic sum". It must use either
  two-sided cancellation (the parity wall of S2) or positivity of a FORM (Weil's), never positivity of
  coefficients.** Idea #9 (positivity sieve) and every positive-weight explicit-formula method live under Landau's
  theorem and are confined to the edge; Weil's form positivity is the only positivity in the record not confined by
  it — and its near side is the short-family wall (#34). The two remaining kinds of input are therefore exactly:
  form positivity on the near side, or Type II cancellation on the near side.

**N64. The wall HAS been crossed, by a little, in one of its forms — recalled, being checked** (lead, 2026-11-11).
In the t-family (mollified second moments of ζ) the self-dual point is mollifier length T^(1/2). Recalled, unread:
Conrey (1989) reached θ = 4/7 for Möbius-type mollifiers using Deshouillers–Iwaniec bounds for sums of Kloosterman
sums (spectral theory of SL₂(ℤ)); Bettin–Chandee–Radziwiłł reached θ < ½ + 1/66 for general coefficients. If accurate,
this is the architecture of N57 (spectral formula + Kloosterman bounds past the self-dual point) actually working,
over ℚ, in the t-family, and it is the furthest anyone has pushed into the near side in that form. What it buys is
PROPORTIONS of zeros on the line (Levinson–Conrey), not zero-free regions (SP-sieve's #32: zero-density, never
exclusion), and Nyman–Beurling boundedness (N53) needs θ → ∞ at bounded height. READER-8 is checking exact statements
and inputs. The question to carry: **why do Möbius-type coefficients go further than general ones (4/7 against
½ + 1/66)?** That difference is Type II structure specific to μ crossing the self-dual point — the one thing S2 said
is needed.

**N65. READER-8 corrects the map in three places and supplies its dictionary** (lead, after the digests
`rh/library/{bcr-1411.7764,conrey-1989,bettin-gonek-1604.02740,radziwill-1207.6583,burnol-lower-bound-0103058,bcf-1211.5191,balazard-deroton-0812.1689,przz-1802.10521,bdbls-0306251}.md`).
- CORRECTION 1 (N53 (b), (c); #34 form (4)): in the Nyman–Beurling integral, heights T ≥ N^(2/3+ε) are harmless with
  TRIVIAL bounds (convexity + Montgomery–Vaughan; Balazard–de Roton); the open range is T ≤ N^(2/3), i.e. mollifier
  exponent θ ≥ 3/2, not θ > ½. My "the D-term carries no information" was wrong for N^(2/3) ≤ T < N².
- CORRECTION 2 (#34's sentence "only arithmetic specific to μ can help"): Bettin–Chandee–Radziwiłł cross θ = ½ for
  GENERAL coefficients (θ < 17/33) by Poisson + trilinear Kloosterman-fraction bounds; Möbius structure buys more
  (Conrey θ < 4/7: Vaughan's split gives the Deshouillers–Iwaniec bilinear bound its extra variable). So near the
  self-dual point the wall is crossed WITHOUT μ-specific input; μ-specific input pushes further; beyond θ ≈ 1 nothing
  is known for either (BCR: the formula fails in general for θ > 1; their route is sharp at θ < 1).
- CORRECTION 3 (N57): ½ is crossed here without an amplifier; Kuznetsov enters only inside Deshouillers–Iwaniec.
- THE DICTIONARY (Bettin–Gonek Thm 1, read whole by the reader): an upper bound ∫₀^T |ζM_N|² ≪ T^(1+ε) for all N ≤ T^θ,
  INCLUDING bounded heights, implies no zeros in Re s > ½ + 1/(2θ). So zero-free abscissa σ ↔ mollifier exponent
  θ = 1/(2σ − 1). Reading the October 2026 theorem through it: 7/8 ↔ θ = 4/3, 11/12 ↔ θ = 6/5, the heuristic 3/4 cap
  ↔ θ = 2, RH ↔ θ = ∞; the Nyman–Beurling open range θ ≥ 3/2 ↔ σ ≤ 5/6. (The converse direction of the dictionary
  is my assumption, not checked.) So **the algebraic-family method reaches, in zero-free strength, what a mollifier
  bound at θ = 4/3 would give, while the best mollifier technology over ℚ stops below θ = 1**: the two methods are
  on different sides of the same scale, and the quasi-RH method is currently AHEAD on it. That is a fact about the
  October proof worth knowing: it beats everything mollifiers can do, by a different kind of input.
- Also: Radziwiłł's unconditional lower bound (1/T)∫|1 − ζM|² ≥ c/θ for every length (each zero on the line costs
  c/θ) is the same mechanism as Burnol's 1/log N; #34's predicted Type II range [D^(1/4), D^(1/2)] is Conrey's 1989
  split (classical).

**N66. SP-modular on transport: the hybrid family dilutes the amplifier; one concrete extension worth checking**
(lead, after `rh/specialists/modular/TRANSPORT.md`).
- CORRECTION to N65: at BOUNDED height, mollifier exponent θ and zero-free abscissa ½ + 1/(2θ) are the same
  statement (Bettin–Gonek one way, a Perron argument the other; sketch). So the October 7/8 gives θ = 4/3 at bounded
  height for ζ and ζ_K "for free" — and nothing more on the mollifier scale: on [0, T] with θ > 1 the bound asserts
  ζM ≈ 1 at all heights, which no method reaches. "Ahead" holds in zero-free strength only.
- PROVED: exact copies occur only at trivial archimedean type (a Hecke character trivial on almost all primes is
  trivial), so adding the t-direction (Grössencharacters α^k·N^(−it)) enlarges the family without adding copies:
  it only dilutes. The t-family lacks copies because its only "Gauss sum" is the Gamma factor at the single place at
  infinity, and μ is a product over finite places.
- THE ONE CONCRETE EXTENSION (SP-modular's risk): the Gauss–Jacobi absorption is pointwise in n, so it survives
  twisting by an infinity type α^k; if Kubota's theta step works for higher K-types (Dunn–Radziwiłł already use angular
  twists), the method gives Re s > 7/8 for Grössencharacter L-functions of K of every infinity type — among them the
  degree-2 L-functions of CM-by-K forms, e.g. the curve x³ + y³ = 1: a zero-free half-plane for a modular
  L-function of degree 2 obtained without any degree-2 input. Scope: an extension of the quasi-RH theorem, not RH
  (owner's caution). It is the most concrete NEW theorem-shaped statement any seat has produced in this phase; its
  first test is whether the theta transformation with K-type k exists in print (Kubota–Patterson; Dunn–Radziwiłł §4).

**N67. Transport closed; the copy principle, now argued structurally** (lead, after SP-sieve's
`rh/specialists/sieve/TRANSPORT.md`, written without reading SP-modular's).
- Two seats independently: at bounded height, "no zeros in Re s > σ" ⟺ I_N(0, T₀) = O(N^(2σ−1+ε)) (PROVED, Perron + a
  1/ζ ≪ t^ε lemma one way, Bettin–Gonek with T fixed the other). The coupled all-heights form is STRICTLY stronger
  (conjecture; needs a weighted density bound Σ N^(2β−1)|ζ(½+iγ)/ζ′(ρ)|² ≪ T^(1+ε)). So the October theorem's place on
  the mollifier scale is a restatement, and the hybrid family gives exactly the 7/8 again.
- THE COPY PRINCIPLE (SP-sieve, item 9, with N49 (c)): exact copies of the untwisted sum require the family to be
  parametrised by a homomorphism whose kernel has INTERMEDIATE density: (i) trivial kernel (the t-family; Kronecker:
  PROVED no copies); (ii) positive-density kernel ⇒ the family is a finite group and the copy bound is trivial or
  circular (PROVED by orthogonality; depth-aspect/Postnikov families are of this kind); (iii) residue-symbol families
  of order m have kernel = m-th powers, density H^(1/m), and need m-th roots of unity in the field (non-archimedean
  structure), m ≥ 2. Hence δ ≤ ½ and the exponent 1 − δ/2 ≥ 3/4 for amplification by copies. The heuristic barrier of
  N49 now has a structural argument, not a proof (it assumes every copy mechanism is a homomorphism kernel).
- CONSEQUENCE FOR THE GOAL: the October method, as a method, cannot reach ½; the record now says why in three
  independent ways (the (1+κ)/2 output, the copy principle, the dictionary's coupled form). What would be needed is a
  copy mechanism that is NOT a homomorphism kernel — approximate copies of positive density, which in the t-family is
  Bagchi recurrence (⟺ RH). The one concrete new theorem-shaped item this phase produced is an extension of the
  quasi-RH theorem (N66: Grössencharacters of every infinity type, CM elliptic curves), which is not RH.

**N68. A correction to my own rule H10, and the Stepanov/Chebyshev analogy examined** (lead, 2026-11-11).
- CORRECTION TO N63 / H10. The one-sided bound believed false is the one with a CONSTANT (M(x) ≤ C√x; ψ(x) − x ≤ C√x:
  Littlewood's Ω₊(√x log log log x) and Ingham kill those). With a slowly growing factor, a one-sided bound is
  RH-EQUIVALENT, not false: ψ(x) ≤ x + C√x log²x one-sided implies RH by Landau (the extra term contributes only the
  real singularity at ½), and RH implies it two-sided. So coefficient positivity at ½ is NOT ruled out; what is ruled
  out is positivity with a constant. H10 is restated below. The rest of N63 (Landau ties positivity to the pole at 1 for
  weights on the integers; that is why positive-weight methods hug the edge) stands.
- STEPANOV OVER ℤ (where nobody in the project had looked, but the literature has). Function-field RH by Stepanov /
  Bombieri: an auxiliary polynomial vanishing to high order at all F_q-points gives a one-sided bound
  N_n ≤ qⁿ + C q^(n/2) uniformly in n; rationality of the zeta function then forces |α| ≤ √q. Its ℤ-analogue is an
  auxiliary INTEGER divisible by p^m for every p ≤ x and of small size: Chebyshev's C(2n, n), Nair's ∫ xⁿ(1 − x)ⁿ. That is
  exactly Chebyshev's method, and its limits are known (recalled): it gives ψ(x) ≍ x with constants, and the integer
  Chebyshev problem (Gorshkov, Montgomery, Borwein–Erdélyi) prevents it from even reaching the prime number theorem.
  What Stepanov has and ℤ lacks is the multiplicity trick from Frobenius (d(x^q)/dx = 0 in characteristic p), which
  makes high-order vanishing CHEAP; over ℤ high p-adic valuation at all primes at once costs size linearly. The
  arithmetic analogue of that derivation is Buium's p-derivation δ_p(x) = (x − x^p)/p, but there is one per prime, not
  one for all primes. Closed, with the exact missing ingredient named: a single derivation that kills a "Frobenius"
  simultaneously at every prime.

**N69. The copy principle is now three proved barrier statements** (lead, after `rh/specialists/sieve/COPY_BARRIER.md`;
unverified; novelty of Thms 2–3 not searched).
- Thm 1 (folklore): any GENERAL-coefficient large sieve already pays for the copies (test vector a_n = 1), so the copy
  amplifier needs a μ-specific mean square. My form (ii) was FALSE as stated (the family of principal characters
  mod q ≤ Q has C = |F|); the limit comes from how the family is parametrised.
- Thm 2: for a multiplicative, local family u ↦ ψ_u whose conductor is supported on the primes of u plus a fixed set S,
  with finitely many primes whose own row is unramified there (P₀ finite), every copy is an S-part times a SQUAREFULL
  number, so C ≪ H^(1/2) ≪ |F|^(1/2). m-th power residue symbols: copies = m-th powers; quadratic symbols reach the
  bound exactly; the October family is sextic (H^(1/6)); all Dirichlet characters: C = Q ≈ 1.81|F|^(1/2).
- Thm 3: kernel copies + a μ-specific diagonal mean square valid only for H ≥ D^(1−ε₀) give at best |A₁| ≪ D^(3/4−ε₀/4):
  a zero-free half-plane no better than about Re s > 3/4. Exits named (E1–E6): the 7/8 paper's bootstrap (outside
  Thm 3); the short regime; P₀ infinite (copy density > ½ but then the mean square is RH-strength by itself);
  approximate copies (G5, tested negative at small scale); non-character families.
- This is the first BARRIER THEOREM of the project for a class of methods. Sent to an independent verifier and the
  finite cores L1–L5 to the formal seat.

**N70. The copy barrier, independently verified with corrections** (lead, after
`rh/specialists/sieve/verifier/VERDICT.md`).
- Thm 1: verified over ℚ (with the better constant (1 − η)²); REFUTED as written over number fields (counterexample
  ℚ(√−163), D = 41); corrected with a field constant κ_K. Thm 2: verified with corrections (the local condition is on
  O_p^*; "copy" must mean trivial as a Hecke character, which the verifier tied to the §0 definition via
  Pólya–Vinogradov up to conductor D^(2−ε); bound ≤ (ζ(3/2)/ζ(3))√X). Thm 3: verified with corrections, and the
  verifier SUPPLIED the missing optimality step (uniform weights on copies are Cauchy–Schwarz-optimal; smaller H only
  helps), so "at best ≈ 3/4" holds within the chain, for mean squares over the full family with uniform/smooth weights.
- Numerics (exact, predictions first, all hit): quadratic family copies are exactly the squares; all Dirichlet
  characters mod q ≤ Q give C/|F|^(1/2) → π/√3 = 1.8138.
- Literature: Thm 1 is in print for the quadratic family (Goldmakher–Louvel Remark 4, after Heath-Brown 1995); a
  "barrier at 3/4" is asserted in public (Tao, orally, as reported; a forum post) with no written argument found;
  Thms 2–3 were not found in print (shallow search: "not found", not "new").
- STATUS: the project's first verified barrier theorem for a class of methods. It limits one method; it says nothing
  about RH. Its exits (weighted or thinned families, approximate copies, the bootstrap, the short regime) are the only
  places that method could still go.
- FORMAL session 2: all five finite cores L1–L5 of the copy barrier are machine-checked (full build, 3968 jobs, 75
  theorems audited, only the three standard axioms; files `rh/formal/RHFormal/CB_L*.lean`). Over ℕ / ℚ only (the
  number-field versions are not formal); L5 holds under q > D (weaker than the written q > 2D); L4 found a harmless
  slip (+ε should be +ε/2 in Thm 3's wording). So the copy barrier is: proved (SP-sieve), verified with corrections
  (V-COPY), and its finite cores formal over ℚ. It is the most solid NEW result of this phase, and it is a limit on a
  method, not a step towards RH.

**N71. A first-moment amplifier is a tautology; the halving is intrinsic** (lead, 2026-11-11, examined by hand).
Trying to avoid the Cauchy–Schwarz halving (the (1 + κ)/2 of N50): sum A_u over the whole family with non-negative
weights. Then C·A₁ + Σ_{u non-copy} A_u = Σ_u A_u, and Σ_u A_u is computable exactly by Poisson in u (the complete
character sum vanishes for squarefree n ≠ 1, leaving dual terms). But Σ_{u non-copy} A_u = Σ_u A_u − C·A₁ by the same
computation: the identity returns itself. A first moment gives an equation, not an inequality; an inequality needs a
second moment, which halves. So the halving is not a weakness of the October proof but of the amplifier itself;
together with the copy barrier (N69–N70) it fixes 3/4 as the floor of the whole method, bootstrap included (its
fixed point (1 + κ)/2 needs κ ≥ ½). Recorded so no seat retries it. An inequality without halving would have to be
an EXACT positivity (form positivity, rule H10), not an amplifier.

**N72. Seminar S3, exit E5 closed (SP-modular, B7, `rh/specialists/modular/S3_B3.md`)** (lead).
PROVED: no Hecke eigensystem (cusp, Eisenstein or residual) is an exact copy (λ(p)² = λ(p²) + 1 excludes
λ(p) = λ(p²) = 1); the only members whose Möbius sums see ζ are the Eisenstein ones (the t-family inside GL(2)); the
copy direction carries no spectral weight (E(z, ½) ≡ 0). The Rankin–Selberg family is the one place a copy enters with
full weight (δ = 1, which by N49 would give ½), and it is circular three ways: first moment = N71's tautology, a
diagonal second moment is RH-strength by itself, a general sieve pays Δ ≥ HD (Thm 1). RISK, the reason in one line:
for every GL(n) family ζ divides L(π × π̄) and its pole at s = 1 IS that factor, so E5 closes at Landau's pole (N63).
An exit would need an orthogonality relation whose diagonal is the trivial character with no pole in each member.
- S3 exit E6 closed (SP-operator, B8, `rh/specialists/operator/S3_B5.md`). PROVED: for every weight the copy rows stay a
  top singular direction (weighted Thm 1), so a family "where the copies are not top" does not exist; weight on copies
  adds exactly C|A₁|² to the mean square (circular). Iwaniec's amplifier |Σ b_l (u/l)₆|² turns the problem into the
  mean square of b ∗ μ and breaks the Gauss–Jacobi step, which needs μ pointwise. Its two repairs meet parity
  (positively biased b) or land on 3/4 (b on cubes boosts only the quadratic copies of density H^(1/2)). Question B11
  to SP-sieve is open.
- CORRECTION to N50 and N71 (from SP-sieve's S3 B9, `rh/specialists/sieve/S3_B2.md`): the bootstrap's κ enters Lemma
  18.1 only through (18.12), |Q|² ≤ Z^(κz), which is the licence β* ≤ (1 + κ)/2 restated and holds by the definition
  of β*; the stated range κ ∈ [3/4, 1] is bookkeeping (works down to 13/18). So my reading "(1 + κ)/2 with κ ≥ ½ at
  square-root cancellation" was WRONG as a mechanism. The floor is carried by the Möbius side: Lemma 17.1's length
  condition (the Möbius polynomial not longer than the family: Thm 3's H2) and Lemma 17.6's sixth-power copies (H1).
  So E1 (the bootstrap) is not an exit; it feeds β* only into the L side. Liu and Xu–Sang change only L-side
  parameters (abstracts). Computation asked of SP-sieve: the comparison system's best exponent as a function of the
  copy slope (prediction first), to decide whether 3/4 floors the whole architecture or only its sextic instance.
- S3, H10's form positivity (SP-reflection, B12, `rh/specialists/reflection/s3/B4_long.md`): a Poisson-weighted H² norm
  on Re s = θ at s₀ = θ + Y applied to (s − 1)ζ(s)B(s)/s, B the smoothed Möbius polynomial: a defect below 2δ/Y gives a
  zero-free box (PROVED), and A₁ follows LINEARLY by a contour shift — so no Cauchy–Schwarz halving and no built-in
  3/4 cap. What it needs: a mollifier longer than the height, X ≥ Y^(1/(2θ−1)) (the S2 near side), equivalently
  correlations of the truncated Möbius divisor sums c_n = Σ_{d|n, d≤X} μ(d) at level of distribution 1/(2θ); below
  3/4 needs level above 2/3. Reformulation by my B9 criterion, but the first one in the record whose only difficulty
  is a LEVEL OF DISTRIBUTION (a known kind of quantity, for Selberg-sieve-type weights), with the parity wall at
  "level above ½ for weights that are not well-factorable". RISK flagged by the seat: by exactness, the 7/8 theorem
  would imply asymptotics for those correlations at levels in (½, 4/7) — a new consequence, or a scaling error.
  Decisive check approved (one computation, prediction first).
- S3 exit E3 closed (S1-parity, B15, `rh/experiments/s1_seminar/parity/S3_B6.md`). PROVED: in any copy amplifier the
  conclusion is just the copy-row part of the mean-square hypothesis (Theorem A: near-full-density copies + μ-specific
  diagonal ⇒ RH directly); copy density ≤ max(½, convergence exponent of P₀), so "P₀ infinite" is not enough — one needs
  Σ_{p∈P₀} p^(−s) divergent for some s > ½; a Poisson-able family of bounded order with P₀ of positive density takes only
  finitely many distinct characters (settles the barrier file's open conjecture in that case), so its diagonal is RH +
  GRH for finitely many characters: circular. Smallest case computed (all four predictions hit): ψ_u(n) = (n/u₃),
  copies = sums of two squares, exponent 0.86, provably not Poisson-able. Open: P₀ of density zero with convergence
  exponent > ½, and families of unbounded order (asked of SP-modular, B16).
- S3 so far: E1, E3, E5, E6 closed with proofs; the form-positivity answer (H10) is the one open line, pending a scaling
  check; E2 is the short-family wall itself.
- S3, H10 line decided (SP-reflection, B17, `rh/specialists/reflection/s3/LEVEL.md`): the vector of B12 was wrong and the
  "new consequence of the 7/8 theorem" was a packaging error, withdrawn by the seat after a re-derivation and a check
  (predictions hit). What survives: an exact criterion with no 3/4 cap (the Möbius vector is optimal for every Y; the
  correct threshold is 4δ/Y), known in type (Beurling 1955's L^p graded criterion: the 7/8 theorem ⟺ Nyman–Beurling
  density in L^(8/7)(0, 1)), and equivalent at each finite level to the zero-free box it certifies. Levels of
  distribution beyond ½ exist only for primes with well-factorable weights (Maynard 3/5, Lichtman 66/107, Pascadi 5/8).
- **S3 CLOSES** (lead): every named exit of the copy barrier is closed with a proof (E1 bootstrap — its floor is the
  barrier itself; E3 circular, with the exact condition on P₀; E5 higher rank — Landau's pole; E6 weights — copies stay
  top singular directions) or is the short-family wall itself (E2), and the one cap-free route (H10's form positivity)
  is Beurling's graded criterion, a reformulation at each level. The October architecture's limit and the place RH
  sits relative to it are now stated precisely and checked.

**N73. CORRECTION: 3/4 floors the amplifier chain, NOT the October architecture; the binding parameter is the density
of sixth powers among the Poisson frequencies** (lead, after `rh/specialists/sieve/S3_SLOPE.md`; reconstruction of
the 7/8 paper's comparison system, validated: margin 1.9e-4 against their certified 1.1e-4; optimised 0.874996
against Liu's 0.874957; predictions written first).
- The Möbius-side lemmas are SLACK at the optimum: copy slope 5/6 → ½ moves 0.8750 → 0.8722 only; relaxing Lemma 17.1
  gives 167/192 = 0.8698 once, then saturates. What binds is the low estimate against the principal signal, both
  carrying the density c of sixth powers among the Poisson frequencies (the pole of ζ_F(6z), the exceptional
  frequencies a⁶e). With c as a parameter: 0.810, 0.744, 0.609 at c = ¼, ⅓, ½; below 3/4 once c > 0.32.
- PROVED (algebra on the system): a floor no Möbius-side change can move: σ₀ ≥ 1 − 4c/5 (the bin with no zero
  witness). So the architecture can never reach ½: at best 3/5 (c = ½).
- So my N67/N71 sentence "3/4 is the floor of the whole method" is WRONG for the architecture; it holds for the
  amplifier chain (Thm 3). The decisive open question is now concrete: **does a family of CUBIC (c = ⅓) or quadratic
  (c = ½) symbols absorb μ the way the sextic Gauss sums do?** SP-modular's S2 B22 answer says the quadratic stratum
  does NOT (no constant −1 in a squared quadratic Gauss sum). The cubic case is unexamined; if it absorbs μ, the
  architecture would give about 0.744 < 3/4: an improvement of the October theorem, still not RH (floor 3/5).
- B11 (PROVED): an exact untruncated amplifier b = (μψ) ∗ 1 exists, but every finitely supported amplifier breaks the
  Gauss-sum identity. B13: near level 1 the correlation is Chowla's two-point correlation (parity wall).

**N74. READER-9 on Stepanov over ℤ: my N68 was wrong in one place and already known in another** (lead, after
`rh/library/{bombieri-1973,stepanov-expositions,vanfrankenhuijsen-0806.0044,borger-0906.3146,connes-consani-2306.00456,connes-essay-1509.05576,f1-frontier-scan}.md`).
- WRONG (N68): "a one-sided bound N_n ≤ qⁿ + Cq^(n/2) plus rationality forces |α| ≤ √q" — false for curves (Bombieri
  §III: ω₁ = q, ω₂ = 1 satisfies the functional equation and violates RH; Tao: "the trace formula is not enough to
  convert upper bounds to lower bounds"; the lower bound is a separate Galois-cover argument). Over ℤ the one-sided bound
  DOES suffice (Landau; van Frankenhuijsen's Table 1). A genuine asymmetry: ℤ needs only the upper half.
- IMPRECISE (N68, G6): only Stepanov's/Schmidt's hyperelliptic proofs use a derivation; Bombieri's general proof uses
  none (p-power additivity and the degree-q purely inseparable Frobenius scaling pole orders), Tao's has no high-order
  vanishing at all.
- ALREADY KNOWN: the translation to Spec ℤ was proposed by van Frankenhuijsen (2008, §4), with a Nevanlinna function
  f(z) = Π_{p≤x}(1 − pz)^([log_p x]) whose counting function is ψ(x); his named obstacles: no analogue of the choice
  b_i = a_i^(p^μ), "the arithmetic coordinate cannot be compared with the geometric coordinate … there is no
  diagonal", no bound for the Nevanlinna height; "there is no Frobenius flow on Spec ℤ". One structure for all primes
  appears as Borger's W*(Spec ℤ) = Spec ℤ ×_{F₁} Spec ℤ (ℤ's own λ-structure is trivial), the Connes–Consani ℕ^×-topos,
  Buium–Simanca's multi-prime derivations. Connes's stated frontier: an intersection theory and Riemann–Roch on the
  SQUARE of the arithmetic site; what exists is curve-level only (genus 0 over the sphere spectrum, with an
  "infinite genus" paradox).
- So G6 is not "where nobody looked"; it is a known programme with named obstacles. What the record can add is the
  asymmetry above: over ℤ the Stepanov-type UPPER bound alone would suffice, so the missing piece is exactly the
  "cheap high-order vanishing at all primes" step, with nothing needed for the lower half.

**N75. Why the October family is the only one: absorption and the sharp sieve pull in opposite directions**
(lead, after `rh/specialists/modular/CUBIC_ABSORB.md`; five identities checked at 74 split primes to 3.5e-14).
- On squarefree n, μ = (sextic Gauss sum)·(cubic Gauss sum) up to units. One-variable cubic family: the dual has one
  cubic Gauss sum, μ is absorbed into a SEXTIC Gauss sum — coefficients of the 6-fold cover's theta, whose Whittaker
  model is not unique (Kazhdan–Patterson): no Patterson formula, absorption fails. Two-variable cubic family (the
  divisor-weighted one): μ·γ₂² = α·γ̄₂ IS a cubic theta coefficient, absorption works — but then every twist and the
  theta multiplier are even powers of the sextic character, the quadratic character never appears, and only the cubic
  large sieve remains, whose excess term is sharp (Dunn–Radziwiłł; de Faveri–Dunn–Hoffstein).
- **The rule (SP-modular): absorption needs a Gauss sum that contains μ; the sharp (quadratic) sieve needs an odd
  power of the sextic character after the theta step. Only the sextic family has both.** That is the structural reason
  the October proof works over ℚ(√−3) with sixth-order symbols and nowhere else in sight, and why c is stuck at 1/6.
- Pending: SP-sieve reruns its c = ⅓ case with the cubic sieve's excess term (ML)^(2/3) in the low estimate.

**N76. A conditional improvement of the October theorem, and the one hypothesis it needs** (lead, after section 7 of
`rh/specialists/sieve/S3_SLOPE.md`; prediction [0.80, 0.86] written first, hit).
- In the two-variable cubic family (μ absorbed into cubic theta coefficients, N75), with half the cubic large-sieve
  excess in the low estimate and the Möbius diagonal only for families of length ≥ D^(7/6), the comparison system gives
  **no zeros of ζ in Re s > 0.8136** (0.7786 without the D^(7/6) restriction; the copy amplifier alone 8/9). No term
  inside the system kills it.
- What it rests on, outside the system: after the theta step the cubic twist becomes a frequency shift with no character
  left, so the needed dual mean square is an OPEN HYPOTHESIS:
      (H_cub)  Σ_{h ≤ K} | Σ_n τ₃(hn) W(N(n)/L) |² ≪ (K + L + (KL)^(2/3))·(KL)^ε,
  τ₃ the coefficients of Kubota's cubic theta function. Until (H_cub) is proved or found, 0.8136 is its value, not a
  theorem; even if proved it improves the zero-free half-plane, not RH (absolute floor of the architecture 3/5, N73).
- Lead in the literature: READER-7 noted a proved Lindelöf-on-average bound in the twist aspect for the cubic Gauss-sum
  series (arXiv 2410.03048, §6: Σ_{N(m)≤M}|ψ(hm, σ+it)|² ≪ N(h)^(1/2) M^(1+ε), 1 < σ ≤ 5/4). Whether it implies (H_cub)
  (or a weaker version enough for an exponent below 7/8) is the next question. This is the most concrete
  theorem-shaped item of the whole session; its honest scope is quasi-RH.

**N77. (H_cub) follows from Heath-Brown's cubic large sieve — so 0.8136 may rest on published results; now under
adversarial verification** (lead, after `rh/specialists/modular/H_CUB.md`).
- A shift of a Gauss sum's frequency is a cubic character: g(h, n) = conj((h/n)₃)·g(1, n), plus reciprocity; so
  Heath-Brown's cubic large sieve (Thm 2, as quoted in Dunn–Radziwiłł) gives (H_cub) with arbitrary coefficients, in
  the form SP-sieve's assumption A2 uses (L ≤ K, so non-squarefree rows cost nothing). SP-modular's earlier "no
  character left in h" (CUBIC_ABSORB 3(c)) was wrong and is corrected there. The dual is a multiplicative twist
  (PROVED); N76's dilation sign was slightly off (the family carries the frequency h², with τ₃(h²) = 0, so no theta main
  term — consistent).
- REMAINING RISKS, stated: R1, the theta multiplier's sign after the step (2.14) (App. A.2 of the paper not re-read;
  if wrong only the pre-theta bound of length D remains); and the comparison system for the cubic family is SP-sieve's
  RECONSTRUCTION with modelling assumptions A1–A3, not a written proof; removing the (KL)^(2/3) term (→ ≈ 0.766) fails
  on every route examined.
- STATUS: a CANDIDATE zero-free half-plane Re s > 0.8136 for ζ (below 7/8 and below the published follow-ups at
  0.8749), resting on (i) published inputs, (ii) one sign to re-read, (iii) a reconstruction to be turned into a proof.
  Honest scope: it would improve the quasi-RH theorem, not prove RH. Sent to an independent adversarial verifier
  before anything else is built on it.

**N78. The 0.8136 candidate is REFUTED as modelled** (lead, after `rh/specialists/sieve/verifier_cub/VERDICT.md`).
- The absorption identity μγ₂² = αγ̄₂ is right (checked at 72 split primes and 144 composites), the object is still
  1/L_K (a zero-free region would be one for ζ), and the theta-multiplier sign R1 resolves in the candidate's favour
  (χ^(−4), from App. A.2). BUT the bookkeeping mixed two families: the family that absorbs μ is the TWO-variable one,
  whose absorption needs two Poisson summations (each costs N^(−1/2), the dual box doubles in log-size: dual range D⁴/U,
  not D²/H), while the model used the one-variable normalisation. With that single correction in SP-sieve's own script:
  0.8136 → 1.011 (no zero-free region), 0.7786 → 0.982; even with sextic-quality inputs elsewhere 0.900; and the
  11/12-type amplifier cannot even start (it needs U < D^(3/2)). Further gaps listed (A2, A4, the cubic Lemmas 17.1 and
  17.6, no cubic Prop 19.2 / Lemma 20.2 certificate).
- What survives: nothing below 7/8. The rule of N75 (absorption needs μ inside a Gauss sum; the sharp sieve needs an odd
  power of the sextic character) is now strengthened: the one family that absorbs μ with cubic symbols pays a second
  Poisson summation that destroys the gain. The October family remains the only one in sight.
- Process note: the chain N73 → N76 → N77 was carried by three seats agreeing; the adversarial verifier caught an error
  none of them saw. The verification track is doing its job; nothing of N76–N77 had been built on.

**N79. The Stepanov asymmetry does not escape the wall** (lead, 2026-11-11). Over ℤ only the upper bound
ψ(x) ≤ x + O(x^(1/2+ε)) is needed (N74). The ℤ-analogue of Stepanov's auxiliary object is an integer divisible by p^m
for all p ≤ x whose size is known independently: factorial ratios (Chebyshev, Diamond–Erdős), sizes by Stirling,
valuations by Legendre. Their exponents are Chebyshev's identity log⌊x⌋! = Σ_k ψ(x/k) inverted by Möbius: an
auxiliary integer of square-root quality is a combination of factorial ratios whose coefficients reproduce μ up to
length x with square-root cancellation. So the construction step IS the Möbius wall (#34), and the asymmetry buys
nothing. Recorded as the eighth language of the same wall.

**N80. The whole-space constant measures the closest pair of zeros: bridge 1's last gap is closed, and the wall it
meets is de Bruijn–Newman's** (lead, after the foothold seat's FH session 5; `rh/BRIDGE.md` plank 13).
- Measured: the impostor's κ_min falls in two steps, 0.43 → 0.16 at L = 1.3–1.4 and 0.12 → 0.04 at L = 1.65–1.70,
  before going negative at 1.72. The first step is a close ON-line pair (40.163/40.683) carrying 86–99% of the
  minimiser's Weil value; only the second is the off-line quartet at 85.70, visible 0.05–0.07 in L before the lowest
  eigenvalue crosses (which at 1.70 still follows the prolate law, 1e-28). Zeta's κ_min (0.33 → 0.30 → 0.205) is
  likewise carried by its closest resolved pair each time, and the pair was predicted before reading. Both of the
  lead's predictions missed: the constant is neither flat nor within 20% of zeta's.
- Structural reading (the point of the measurement). Under the backward heat flow of de Bruijn–Newman, an off-line
  quartet is what a close on-line pair becomes after it collides: the two configurations are continuous with each
  other, and the collision is where a form like Q loses positivity. A constant that sees the off-line quartet early
  must therefore also see close on-line pairs, and it does, with the same signature. So "Q ≥ κ·D_L with κ bounded
  below for all L" (plank 8) would be a quantitative statement that zeta's zeros stay uniformly away from collision,
  i.e. a slack-type statement of the kind Λ < 0 would give. Rodgers–Tao (2018) proved Λ ≥ 0: zeta has no slack.
  HEURISTIC, not a theorem: the link between κ_min at window L and the heat-flow parameter has not been made precise.
  If made precise it would be a clean negative result: no uniform constant in the comparison Q ≍ D_L.
- Consequence for hunches (rule H11, new): **any positivity statement for zeta with a margin is false; the margin has
  to be allowed to depend on the zeros' own spacing, i.e. the statement must be scale-free in pair gaps.** Bridge 1
  asked for a margin. The next bridge must aim at a statement that is exactly tight along Lehmer pairs (a "Λ = 0"
  statement rather than "Λ < 0"), and the objects that are exactly tight are equalities or monotonicity statements,
  not inequalities with constants. This joins H10 (one-sided bounds with a constant are false).
- Open question worth one structural seat: is there a NORMALISED κ (κ_min divided by the relative gap of the closest
  resolved pair) that stays bounded below for zeta and goes to zero for the impostor? Back-of-envelope with the
  local mean spacing 2π/log(qt/2π): zeta 59.35/60.83 (relative gap ≈ 0.53) gives κ 0.30; zeta 111.03/111.88 (≈ 0.39)
  gives 0.205; the impostor's on-line pair 40.163/40.683 (q = 5, ≈ 0.29) gives ≈ 0.14. Ratio κ/gap ≈ 0.57, 0.53,
  0.48: roughly proportional on three points across two functions (not a fit; L differs between the points). So the
  first step of the impostor's fall is ordinary pair behaviour, and the separating question is whether the second
  step (the off-line quartet) breaks the proportionality. Rule 13 says: find the setting where κ_min has an exact
  formula. Candidate: the TWO-ZERO MODEL, the minimum of the Weil quadratic form over functions supported in
  [−L, L] when the zero side is reduced to one pair (γ ± δ, or a quartet ½ ± β + i(γ ± δ)) plus the archimedean
  term. That is a 2×2 or 4×4 prolate Gram problem with a closed form in (δ, β, L). It would make the de Bruijn–Newman
  link exact in a model: κ as a function of the pair's position along the heat flow, through the collision.

**N81. The two-zero model: the comparison constant is a Gram eigenvalue at the zeros, and it vanishes exactly at a
collision** (lead, after SP-operator session 2, `rh/specialists/operator/TWO_ZERO.md`).
- Found: D_L is NOT a neutral norm. On packets above the band edge D = 2‖Möbius-inverse of f‖² (4 digits), and below
  a pinning height T_D(L) ≈ 1.55·2πe^(2L)/q its evaluation kernel is O(1) at every zero and up to 1e23 between zeros
  (impostor included). So D "knows" the zeros, and κ_min is the bottom of the Gram matrix of D-kernels at the zeros
  (model M3: the closest pair alone gives 0.336/0.229/0.169 against measured 0.298/0.205/0.138; with neighbours, 1.5%).
  The flat model M1 (closed form, proved) misses the data; it is kept as the exactly solvable caricature.
- PROVED inside M3 (elementary): for a pair, κ₂ = 4J·u + O(u²) with u = δ² on the line and −β² off it. So κ vanishes
  exactly at the collision and changes sign continuously, linearly in the heat-flow parameter. This makes N80's
  de Bruijn–Newman reading exact INSIDE the model: the margin of the comparison is u·J.
- Candidate statement (S), conjecture on three points: c·Δ ≤ κ_min(L) ≤ C·Δ with Δ = −Z′(γ₁)Z′(γ₂)/log²(qγ/2π) for the
  binding consecutive pair in the pinned band (negative for an off-line quartet). Measured κ/Δ = 0.65, 0.78, 0.91.
  Its content: the upper bound forbids any uniform margin; the lower bound is an interpolation inequality whose
  constant is the local discriminant of the pair. Not RH-equivalent. Transfer needs small normalised gaps or a
  Rodgers–Tao-type averaged argument (not attempted). Literature from memory only (liminf of normalised gaps on RH).
- Odd and worth keeping: at the true zeta positions κ is a SPIKE; moving the pair by 0.01 collapses it to 0.02. The
  D-geometry is rigid at scale 1e-3, because D's kernel is pinned to the actual zeros. This is the first object on the
  record whose geometry is tied to the true zero positions rather than to their density.
- Prediction score of the seat: 2 hits, 2 partial, 3 misses (main miss: it predicted κ > 0 at the collision).
- Next (rule 12, confirm before building): an independent verifier tests (S) at new binding pairs with the kill
  line κ/Δ ∉ [0.3, 2]. Sent.

**N82. Statement (S) is KILLED; what survives is a factor-2 tracking with no selection rule** (lead, after V-TZ,
`rh/specialists/verifier_tz/VERDICT.md`).
- With the written rule (binding pair = argmin Δ in the band (2πe^(2L)/q, 1.55×)) the impostor scores κ/Δ = 0.16 and
  0.18, below the kill line 0.3. The original impostor point had been scored by where the minimiser sits (40.16/40.68,
  above T_D(1.5) = 39.1), i.e. a choice made after seeing the data. No band cut-off works: zeta at L = 1.0 needs a
  factor < 1.66, at L = 1.1 one > 1.97. The pair 121.37/122.95 never binds. The degree rule 90L is not enough
  (0.277 at degree 110 against 0.221 at 176 for zeta at L = 1.1).
- Survives: scored by the pair the minimiser actually sits on, κ/Δ ∈ [0.66, 1.17] over nine points (zeta, χ₅,
  impostor). The spike at the true zero positions is real (reproduced with an independent all-mpmath whitening;
  K_D at the pair goes 0.74 → 6.5 → 655 as the pair is moved 0, 0.01, 0.1 off the true zeros).
- Structural reading (lead). The pinning has a simple cause: D = 2‖Möbius-inverse‖² is, on the window space, a norm
  of f DIVIDED by the L-function, so K_D(z, z) behaves like |ξ(z)|² times a Paley–Wiener kernel: small at the zeros,
  huge between them. The pencil (Q, D_L) is then the comparison of the Weil form with a ξ-divided norm, and κ_min is
  the bottom of the Gram matrix of reproducing kernels at the zeros, indefinite (Krein) when zeros are off the line.
  That is the de Branges / Lagarias picture of Weil positivity (Hilbert spaces of entire functions built from ξ; RH ⇔
  a Hermite–Biehler property). So bridge 1 ends, at both gaps, inside a known framework: the near-null ladder is
  Poisson summation, and the whole-space constant is interpolation at the zeros. Sent to a reader to check against
  the literature rather than asserting it from memory.
- Prediction scores this round: lead N80 (both missed), SP-operator (2 hit, 2 partial, 3 missed), V-TZ (see verdict).

**N83. H-2 result: amplification is cheap; unitarity at a zero is what is missing** (lead, after SP-modular,
`rh/specialists/modular/LOCAL_PARAMETERS.md`; construction only, several facts from memory).
- The table of H-2 stands row by row; the GL_n / cover rows share one reason (every constant term is L(z)/L(1+z),
  so a denominator zero sits at Re z = β − ½ < 0, outside the L²-residue region).
- The lead's thesis "no operation on global zeros amplifies" is false as worded: ρ ↦ Π_ρ = Ind(|·|^(ρ−½)) (the
  Eisenstein series E(·, ρ)) and then Sym^k Π_ρ (isobaric on GL_{k+1}) multiplies the exponent β by k with the
  unitary bound fixed at ½. But the counterexample is EMPTY: Langlands' argument needs unitarity at k = 1, and for
  GL₂(ℝ) with γ ≠ 0 unitary ⇔ tempered ⇔ β = 0, so the input is the conclusion. Also "ρ is a zero" is a global
  condition (a toric period of E(·, ρ) vanishes, Hecke), which Sym^k does not carry (heuristic for k ≥ 2).
- **The triangle.** Three properties: (A) automorphic with Hecke data at the primes, (B) unitary at the parameter,
  (C) parameter controlled by a zero of ζ. Every candidate examined has at most two: Eisenstein at ρ, incl.
  E*(ω, s): A + C. Pseudo-Laplacians (Colin de Verdière, Bombieri–Garrett): B + C (if they have eigenvalues at
  all), and Hecke-equivariance kills them. Residual spectrum, Kazhdan–Patterson and the October sextic theta: A + B
  (they encode poles of ζ, or Gauss sums, never zeros). Residue at the scattering pole ρ/2: A only.
- The object that would make the wall trivial (SP-modular's words): a Hilbert space in which a zero of ζ is a
  spectral parameter, Hecke operators still act, and Sym^k stays in the family. Ratings: Quality 5, Toward RH 1.
- Lead's reading. The triangle is the sharpest form of the target so far, and it turns H-2 into ONE structural
  question for the next construction: is there a REASON (a theorem) that A + B + C cannot coexist, or only an absence
  of examples? If A + B force the parameter to be an automorphic spectral parameter of the usual L², then C fails
  because zeros of ζ are not Maass parameters, and any Hilbert–Pólya space must break A in a controlled way (Connes'
  adele class space keeps a weaker A: the action of the idele class group). The precise question: what is the
  weakest form of A that still lets Sym^k act? That is where the triangle might have a gap.

**N84. Why Λ ≥ 0 cannot reach the bulk: the oscillation obstruction** (lead, 2026-11-11; construction by thought,
no measurement; the facts are classical, the packaging is the lead's).
- Two positivities use the primes. (P1) de la Vallée Poussin: Σ Λ(n) n^(−σ) w(n/N) P(t log n) ≥ 0 for a positive
  trigonometric polynomial P. Positivity of P forces its mean a₀ > 0 (Fejér–Riesz), and the mean is exactly what
  pairs with the pole at 1, so the zero term is bounded by the pole term: zero-free only within c/log t of Re s = 1.
  (P2) Weil: archimedean ≥ primes + poles, with Λ entering with a MINUS sign against g*g̃, which has no sign.
- Attempted object: the cone of positive-definite h with h ≤ 0 off [−log 2, log 2]. On it the prime side of (P2)
  has a sign by Λ ≥ 0, so Weil positivity on the cone needs only archimedean + poles ≥ 0. It fails rule 15 (ii): to
  detect a zero at height γ the test must oscillate at frequency γ over length > log γ (the band edge), and an
  oscillating h is positive half the time, so the cone only contains short, non-oscillating tests, i.e. the soft
  regime of CORE 1.
- **The obstruction in one line: Λ ≥ 0 bites only on non-oscillating tests, and the bulk is made of oscillating
  ones.** The oscillation n^(iγ) is itself completely multiplicative, so it can be ABSORBED into an Euler product
  (ζ(s − iγ)) without losing multiplicativity, but then the positivity is lost. Read this way, the October trick
  (absorbing μ into a sextic Gauss sum, N75) is a partial absorption of oscillation into multiplicative structure
  that keeps a sieve-type positivity. The target in these terms: a positivity that survives the absorption of n^(iγ)
  for γ in the bulk, i.e. positivity of a multiplicative object twisted by a multiplicative oscillation. Over
  function fields this is exactly what the Frobenius twist does (the oscillation q^(−inθ) is the Frobenius power,
  and positivity comes from geometry, not from the coefficients).

**N85. H-1 is a shadow: the local Weil discriminant misses the one off-line zero on record; the D-kernel has an
exact formula** (lead, after SP-operator session 3, `rh/specialists/operator/LOCAL_DISCRIMINANT.md`).
- Refuted: at the impostor's failed window (L = 1.72) the off-line quartet's own W is +0.43 while κ_min = −0.048.
  Proved: W_k ≥ κ_min; for an on-line pair its own part is G², so W_k ≥ λ_min(G) ≥ 0 when all other zeros are on
  the line; for an off-line pair its own part GJG has two negative eigenvalues; at a double zero W_k equals the
  OTHER zeros' contribution (> 0, not 0: H-1's tightness claim corrected). With a separation hypothesis the
  criterion is equivalent to RH and then a pure reformulation of Weil's.
- Found (checked to 0.1–0.7% on the diagonal, 0.2–3.5% off it, zeta and impostor): below the pinning height
  K_D(γ, γ′) = ½∫₁^∞ e^(−i(γ−γ′)(L + log N)) conj R_N(ρ) R_N(ρ′) dN/N, R_N = partial sum of the L-function minus the
  pole term. A mean value of the dual Dirichlet polynomials at the zeros; no μ and no Λ in it. One density hypothesis
  on the out-of-band parts is unproved. In the 2×2 inequality Λ multiplies weights of no sign, so the Euler product
  is present and does nothing pair by pair. Ratings (seat): Quality 6, Toward RH 2.
- Lead's reading: H-1's open problem ("a pair-local quantity whose prime side is a Λ-weighted sum with a weight of
  forced sign") collides head-on with N84: pair-local at height γ forces oscillation at γ, and a forced sign forces
  a positive mean that pairs with the pole. So inside the class "Λ times a weight", pair-locality and a forced
  sign exclude each other. That is a barrier statement (to be made precise; Quality could be 6, Toward RH 1), and it
  says the missing positivity cannot come from the coefficients. It has to come from a structure (a Hilbert space
  with the Hecke action, or geometry), which is exactly the triangle of N83. Both remaining lines now point at the
  same question; it goes to two specialists at once (rule 13(b)).

**N86. The operator side of the triangle: the scaling flow is the amplifier, and it has no fixed bound** (lead, after
SP-operator session 4, `rh/specialists/operator/TRIANGLE.md`; construction, no new computation).
- Barrier lemma (PROVED; classical in substance: de la Vallée Poussin, Landau, H10). For h = h₀ + h₁ with h₀ on
  |x| < log 2 and h₁ ≥ 0: every zero's arithmetic term is at most 2^(−(½−β))·P₁ < P₁ (P₁ = the pole term carried by
  h₁), on or off the line; separating two zeros at gap s with contrast η forces m = ∫h₁ ≥ (η − s log 2)/(2 + s log 2)
  and P₁ ≥ √2·m. **Forced-sign criteria count zeros and never locate one.** N84/N85 are now a lemma.
- Krein structure. (H_L, D, Q) is a Pontryagin space; each off-line quartet adds at most 2 negative squares and the
  count does not decrease with L (impostor: 0 at L = 1.70, 1 at 1.72, 2 at 1.8). The only Krein isometries coming from
  the Dirichlet-series structure are the translations T_a (the scaling flow), for zeta and impostor alike: unitary on
  on-line zeros, a BOOST of rapidity aβ on each quartet. So the amplifier exists in operator form.
- It fails three ways: compressed to a fixed window it is nilpotent (no nontrivial multiplier is a Krein isometry of
  a fixed window); its Paley–Wiener bound grows like e^(kaβ), exactly the boost; tensor powers keep Λ ≥ 0 but the
  pole recedes (k/2) as fast as the deviation grows (kβ). Lemma 2 (PROVED): a Krein isometry power-bounded in D
  cannot boost a quartet. Ratings (seat): Quality 5, Toward RH 1.
- **The object, now in operator language:** a Krein isometry of a FIXED window space, power-bounded in D for an
  arithmetic reason (a family of Euler products absolutely convergent at a fixed abscissa), boosting every off-line
  quartet. Vertex (B) of the triangle = that bound.
- **The seat's named gap, and why it matters (lead).** Everything in GL₁ acts by multipliers (functions of s), and
  multipliers cannot be both window-preserving and boosting. The gap is an operator that MOVES EVALUATIONS BETWEEN
  POINTS. On GL₂ that is exactly what a Hecke operator is (T_p f(z) = Σ f((az + b)/d), a correspondence), and in
  function fields the Frobenius that proves RH is a correspondence on C × C, not a multiplier. So the operator seat,
  from its own side, arrived at the modular seat's vertex (A) as the place where (B) could come from. Waiting for the
  modular seat's TRIANGLE.md to compare.

**N87. The two seats meet: the missing ingredient is ONE thing in two languages** (lead, after SP-modular session 2,
`rh/specialists/modular/TRIANGLE.md`, and SP-operator session 4, N86; the seats did not read each other).
- Modular: N83's "at most two" was wrong for one object. P_ρ = |det|^(iγ) ⊗ Ind(|·|^β, |·|^(−β)) (Eisenstein series
  at ½ + β twisted by a unitary character) has (A) Hecke action, Satake parameters p^(±β+iγ); (B) unitarity at k = 1
  for free (complementary series; β < ½ is ζ(1 + it) ≠ 0 plus the functional equation); (C) a Hecke torus period
  that vanishes exactly at the zero (L(½, P_ρ) = ζ(ρ)ζ(1 − ρ̄), from memory). An off-line quartet IS a
  complementary-series parameter. Dictionary: Sym^k P_ρ unitary ⇔ kβ < ½ (Tadić, from memory), so zero-free
  regions = bounds toward Ramanujan for P_ρ. But the dictionary is tautological unless something forces Sym^k
  unitary, and Theorem 1 (Jacquet–Shalika, from memory) shows the Rankin–Selberg L(s, Sym^k P × Sym^k P̃) has a pole
  at 1 + 2kβ that MOVES with k: no automorphic input supplies it. Langlands' fixed half-width is decay at the cusp,
  i.e. cuspidality. A cuspidal P_ρ would be an exceptional Maass eigenvalue (Kim–Sarnak 7/64 would then give
  Re ρ < ½ + 7/64 ≈ 0.609, from memory); nobody can make a zero control a cusp form. Ratings: Quality 6, Toward RH 1.
- Operator (N86): the amplifier is the scaling flow; it fails because its only bound moves with the boost; the
  object needs a bound that is FIXED for an arithmetic reason.
- **Same thing:** "pole moving with k" (modular) = "Paley–Wiener bound growing like the boost" (operator); "decay at
  the cusp" (modular) = "power-bounded on a fixed window" (operator). Rule 13(b) worked: two toolkits, one gap.
- **Lead's reading, a structural reason for the gap (from both).** A fixed window / a truncation at a cusp height
  must be invariant under the Hecke operators, which move the height (or translate the window) by log p for every
  prime p. Over ℚ the group generated by the log p is DENSE in ℝ (logs of primes are independent), so no fixed
  window or truncation is Hecke-invariant except trivial ones. Over a function field every log-height is a multiple
  of log q, a LATTICE, so the window can be a circle and the truncation can be Hecke-invariant; that is where the
  fixed half-width comes from there. This is the F₁ picture in spirit (known), but it gives one concrete test
  setting where the obstruction disappears for one prime: S = {∞, p}, where only T_p must be respected and p^ℤ is a
  lattice.

**N88. The Euler product lives on the torus, the functional equation on the line** (lead; known in substance: Bohr,
Bagchi, Hedenmalm–Lindqvist–Seip; recorded for the framing).
- On the infinite torus T^∞ = Π_p S¹ the Euler product is a product of independent coordinates and the random Euler
  product Π (1 − z_p p^(−s))^(−1) has NO zeros in σ > ½ almost surely (its log is a convergent random series). The
  functional equation holds only on the Kronecker line z_p = p^(−it) (Poisson summation uses ℚ discrete in the
  adeles), a measure-zero set. RH = the line inherits the torus's almost-sure property. The line is generic for this
  iff Σ_{p≤x} p^(−it) has square-root cancellation, i.e. wall #34 again (Bagchi's strong-recurrence equivalent is
  the known form). No exit; it explains WHY the two ingredients never meet: they live on different spaces, and the
  only bridge between them (equidistribution of the line) is the Möbius wall.

**N89. The fixed bound is missing at the INFINITE place, not because the log p are dense; N87 corrected** (lead, after
SP-modular session 3, `rh/specialists/modular/DISCRETE_ORBIT.md`; construction; several facts from memory).
- Proved: in S = {∞, p} no T_p-equivariant truncation exists. At the cusp T_p acts on the S-height h = y·p^n as a
  difference operator of step log p; a cutoff commuting with it is periodic in log h and cannot vanish high in the
  cusp (a lattice gives periodic multipliers, not cutoffs). Off-line, E(·, ρ) has no cuspidal part except on the
  lattice γ ∈ (π/log p)ℤ; two primes leave only γ = 0.
- **Correction to N87.** Over F_q(t) the truncation is not Hecke-invariant either; the fixed bound there is Harder's
  compact support of cusp forms (from memory), which needs a cusp with NO archimedean direction. Over ℚ a cusp means
  a ℚ-split torus, which is ℝ-split, so the height group always contains ℝ₊ (proved). The lead's "dense subgroup"
  reason was wrong: one prime with a lattice already fails, because of the continuous archimedean height. The
  lead's prediction for S = {∞, p} is half broken: the zeros stay visible there (the quotient is SL₂(ℤ)\H, the
  scattering factor is the full ξ(2s−1)/ξ(2s)); the half about Sym^k at p seeing only the p-factor holds.
- Proved no-go: a Dirichlet series whose frequencies lie in a group keeps them there under products and quotients;
  ζ's frequencies log n generate a dense group, so ζ is not built from zetas whose periodic orbits lie in a lattice.
  Candidates: definite quaternion graphs (discrete, positive, zeros invisible), Selberg zeta of SL₂(ℤ) (zeros
  visible at ρ/2, lengths dense, positivity does not reach), Connes–Consani site (each prime's orbit a lattice, each
  alone without zeros). Ratings (seat): Quality 6, Toward RH 1.
- **Lead's synthesis: the infinite place plays both parts.** In Weil's form the archimedean term is the ONLY positive
  term (CORE 1: soft positivity is archimedean), and the archimedean height is the ONLY obstruction to the fixed bound
  that turns the amplifier into a proof (this entry). So the open tension of CORE is now located at one place, ∞:
  the positivity has to come from ∞ and ∞ is what prevents it from being uniform. The object that would make the wall
  trivial: an "infinite place without a continuous direction" (Haran's real prime as a non-archimedean-like place,
  Deninger's foliation, Connes–Moscovici's prolate operator, all known programmes). A reader goes to them for
  knowledge only: does any of them actually construct a cusp, or a window, at ∞ with a fixed bound?

**N90. Nobody has a cusp at ∞ without a continuous direction; and why: one chain from the functional equation to
the moving bound** (lead, after READER-10: `rh/library/haran-1508.04636.md`, `deninger-0709.2801.md`,
`harder-compact-support.md`; knowledge only).
- Reader's answer: NO in all three. Haran treats the real prime as a genuine place, but his bundles live on the usual
  adelic double coset, so the continuous height is still there (line bundles: ℝ_{>0}); no reduction theory, no
  bound. Deninger: the infinite place is the fixed points of the flow; his positivity (Re ρ = α/2) holds only for
  compact spaces WITHOUT fixed points, i.e. without an infinite place; the archimedean term is explicitly missing.
  Harder (second-hand, three expositions): cusp forms of level K are supported in a fixed set, compact modulo the
  centre; the mechanism is that deep in the cusp a function EQUALS its constant term, which needs a discrete cusp.
  N89's side claim "truncation is not Hecke-invariant over F_q(t)" is in none of the texts (unverified).
- **Lead's chain (construction by thought; links marked).**
  (1) The functional equation of ζ is Poisson summation for ℚ ⊂ 𝔸 (Tate), which needs ℚ DISCRETE in 𝔸; ℚ is dense in
  𝔸_f, so discreteness needs the archimedean factor ℝ (standard). Over F_q(t) discreteness comes from the finite
  constant field instead, with every place non-archimedean.
  (2) At p the unramified vector 1_{ℤ_p} is compactly supported and equal to its own Fourier transform; that is
  why a p-adic Whittaker function vanishes EXACTLY deep in the cusp (the character integral over ℤ_p is 0 beyond a
  height), which is Harder's "equals its constant term". At ∞ no function is compactly supported on both sides
  (uncertainty principle); the best is the Gaussian, so the Whittaker function e^(−2πy) only DECAYS (standard).
  (3) Bridge 1's near-null ladder is the same uncertainty principle seen from the other side: the prolate defects
  1 − χ_n measure how far a window function is from being band-limited (BRIDGE 1–5). HEURISTIC link: the moving bound
  of N86–N87 is (2) for the amplifier.
  So: **functional equation ⇒ an archimedean place ⇒ the uncertainty principle ⇒ (soft positivity AND no fixed
  bound).** Both parts that ∞ plays in N89 are one fact, the uncertainty principle at ∞, and the functional equation
  is what forces ∞ to be there. Quality 5 (clean, links (1)–(2) standard, (3) heuristic), Toward RH 1; known in spirit
  (Tate, Connes–Moscovici's prolate operator, F₁).
- What it says a proof must do: either (a) a fixed bound that survives an uncertainty principle (only an
  APPROXIMATE vanishing deep in the cusp, controlled well enough: the archimedean defect decays like e^(−2πy) while
  the amplifier's boost grows like a power of the height; whether a decaying defect can replace exact vanishing in
  Harder's argument is a precise question), or (b) deform ℚ together with ∞ (the q → 1 picture), keeping the
  functional equation at every stage, then pass to the limit by Hurwitz. (a) is the one the project can attack.

**N91. Two constructions by the lead, both closed by counting before any run** (lead, 2026-11-11).
- **Correction to N90 (a).** "Approximate vanishing deep in the cusp" cannot help P_ρ: Harder's mechanism makes a CUSP
  FORM equal its (zero) constant term; P_ρ is an Eisenstein series whose constant term y^(½+β) + c·y^(½−β) is the
  obstruction itself (it is the moving pole of N87). The decay e^(−2πy) of the non-constant terms is irrelevant.
  (a) is withdrawn; (b) (deform ℚ with ∞, keep the functional equation, pass to the limit) stands as stated.
- **H-3, the separable form (construction, rule 13(a): where is the hard object exactly solvable?).** The
  Landau–Gonek formula Σ_{0<γ≤T} x^ρ = −(T/2π)Λ(x) + error is unconditional, so for a Dirichlet polynomial A of
  length N ≤ T^(1−ε) the zero sum G_T(A) = Σ_{0<γ≤T} A(ρ)·conj A(1 − ρ̄) equals (T/2π)·a*Ma + error with
  M = diag(log(T/2πn)) − (Λ(m/n)(m/n)^(−½) + transpose). Both parts are SUMS OVER PRIMES of operators acting on
  one exponent v_p(n) each (log n is additive; Λ(m/n) ≠ 0 only when m/n is a prime power). On a divisor box
  {n | M₀} the domain is a product too, so M = log(T/2π) + Σ_p M_p EXACTLY, the M_p commute, and the bottom of M is
  attained at an Euler-product-shaped A = ⊗_p A_p (Minkowski sum of spectra). This is the Euler product acting as an
  exact decoupling in the bulk (N up to T^(1−ε) is far beyond Montgomery's line N = T^(½)). The impostor's Λ is not
  supported on prime powers with multiplicative structure, so its M does not decouple: a clean, exact difference.
- Why it does not detect RH (counting, done before any run): G_T sums over ALL zeros up to T, about (T/2π)log T of
  them, and a polynomial of length N ≤ T has fewer degrees of freedom than that, so it cannot be small at every
  on-line zero while large at one off-line quartet; a quartet's negative term is diluted, and G_T ≥ 0 is expected
  whether or not RH holds. So positivity of M with margin (even if proved, and it is a finite one-prime problem per
  prime) says nothing about where the zeros are. To detect a quartet the zero sum must be WEIGHTED to the quartet's
  neighbourhood (Weil's ĝ(γ)), and the weight in γ is exactly what breaks the product structure (a weight in t
  couples the primes, like the window in N88). Ratings: Quality 4, Toward RH 1.
- Lesson recorded as rule H12: **the Euler product decouples the primes exactly; any localisation in the height t
  re-couples them.** Decoupling and localisation are the analytic face of N88 (torus versus line) and N90 (∞).

**N92. Synthesis: the routes of this session converge on one known framing** (lead, 2026-11-11; for CORE).
- N86–N91 located the missing fixed bound at ∞ (N89), traced it to the uncertainty principle forced by the
  functional equation (N90), and found that the Euler product decouples the primes exactly while any localisation
  in t re-couples them (N91, H12). These are four faces of one fact: **the norm map of the idele class group, C_ℚ →
  ℝ₊*, has a CONTINUOUS target because of ∞, whereas over F_q(t) the degree map C_K → ℤ has a discrete one.** This is
  Connes' 1999 starting point (known); the session rediscovered it from inside three toolkits.
- What the function-field proof actually uses, read in this light: amplification there is trivial (finitely many
  zeros, genus g: a bound N_k = q^k + O(g q^(k/2)) for all k forces max|α_i| ≤ √q by a power-sum argument with 2g
  terms); the content is the BOUND, from Riemann–Roch (Stepanov's auxiliary function) or Hodge index. Over ℚ the
  matching bound ψ(x) = x + O(x^(½+ε)) is RH itself, and Stepanov over ℤ reduces to the Möbius wall (N79). So the
  "fixed bound" the triangle asks for is the Stepanov bound, and its absence over ℚ is wall #34 again.
- Map, then (each wall reached from several directions on the record): ANALYTIC (#34, Möbius cancellation in short
  families; the mollifier length θ in Levinson–Conrey is the place where the Euler product and the functional
  equation already meet in the bulk, θ = 4/7 > ½, and Bettin–Gonek ties θ to zero-free regions, T116–T118);
  SPECTRAL (the triangle, cuspidality at a zero); GEOMETRIC (∞ continuous, no Spec ℤ × Spec ℤ). They are one
  obstruction seen three ways. Honest standing: Toward RH ≤ 2 for everything on the record.
- Process consequence: a "different kind" of idea, in the owner's sense, cannot be another description of this
  obstruction. It must be an object on which ∞ acts with a discrete target, or a proof of a bound of Stepanov type
  over ℤ for a SINGLE structured family (not all of ψ), or an exact identity in the Levinson–Conrey setting that
  removes the dependence on θ. The third is the only one with a concrete starting object on the record (T118:
  RH ⇒ Levinson-weighted approximants bounded; the open part).

**N93. Levinson–Conrey: θ enters twice, one part is forced by ∞, and even 100% on the line is not RH** (lead, after
SP-sieve, `rh/specialists/sieve/LEVINSON_THETA.md`; construction only, several facts from memory).
- (A) main term, FORCED: (1/T)∫|1 − ζ·M_θ|² ≥ c/θ for every Dirichlet polynomial of length T^θ (Radziwiłł, from
  memory), by the uncertainty principle at ∞: CORE's tension appears inside Levinson's method. (B) error term,
  TECHNOLOGY: θ < 4/7 comes from the Type II term T^(−½)·y^(7/8) (Deshouillers–Iwaniec after Vaughan); removing it
  needs exact off-diagonal formulas for Möbius-type mollifiers at every length (from memory).
- Euler-product mollifier: decouples the main term per prime, but its support is of length about e^y, the
  off-diagonal is uncontrolled, and truncation re-couples the primes (H12 exactly). Reflected mollifier: impossible
  (1/ζ has no functional equation). Levinson's step written as Littlewood's lemma for V·B: with B = 1/ζ it is a
  tautology; not tight along colliding pairs (a collision moves κ by about 1/(T log T)).
- **Decisive (Bombieri–Hejhal, from memory): almost all zeros of Davenport–Heilbronn-type combinations lie on the
  line, yet they have ≫ T zeros off it. So κ = 1, even Farmer's θ = ∞, is consistent with off-line zeros: density
  methods are twist-blind at 100%.** Ratings (seat): Quality 4, Toward RH 1.
- With N92 this closes the third option. The first (an object where ∞ has a discrete target) has no known instance
  (N89–N90); the second (a Stepanov bound for one structured family over ℤ) reduces to the Möbius wall (N79).

**N94. T131 proved in corrected form; and the lesson: objects linear in μ cannot see the Euler product** (lead, after
SP-operator session 5, `rh/specialists/operator/LOCAL_DISCRIMINANT.md` §7).
- Lemma A (PROVED; checked to 1e-6 at γ = 14.13, 21.02, and correctly failing at t = 17.5): evaluation at a zero
  depends only on the leak, F(γ) = −∫_λ^∞ ĝ(ξ) ξ^(−½−iγ) R_{ξ/λ}(½ − iγ) dξ; the pole subtraction in R_N comes out of
  g(0). Theorem B (PROVED): K_D = K_T131 − ¼⟨P_⊥τ_γ′, P_⊥τ_γ⟩, so the N85 formula is an exact UPPER bound with error
  ¼·dist(τ_γ, closure)², strictly positive; (ADM) was FALSE and is no longer needed. Smallness of the error (0.1–0.7%)
  is measured, not proved. Ratings (seat): Quality 7, Toward RH 1.
- **Rule H13 (from the proof).** The only arithmetic the proof uses is μ∗1 = δ, which every Dirichlet series shares
  with its own inverse, the impostor included. Anything built LINEARLY from the Möbius inverse (a norm, a kernel, a
  Gram of Möbius-inverted functions) sees only the inverse operator, whose coefficients are all 1: the inversion
  cancels multiplicativity exactly. In the coefficients a(n) or μ(n), multiplicativity is a NONLINEAR condition.
- **Lead's turn (the coordinates in which the Euler product is linear).** In log-derivative coordinates the Euler
  product IS linear: it says Λ is supported on the prime powers (for the impostor Λ_DH lives on all n). The Weil form
  is linear in Λ. So the Euler product enters the Weil form as a SUPPORT condition, and the natural way to use it
  linearly is to make the test function vanish where Λ lives. That is H-4 below.

### H-4 (HUNCHES part H): the prime-sampling cone (built to target; one seat: SP-operator)
- (v) first. What would make the wall trivial: a test class on which the prime side of the Weil form is EXACTLY zero
  while the class still resolves single zeros in the bulk. Then Weil positivity on that class is a purely
  archimedean statement, and the archimedean place's uncertainty principle, which is the obstruction everywhere else
  (N90), becomes the TOOL: a function forced to vanish on a dense set must carry high frequencies, where the
  archimedean term log|t| is positive.
- The object. C_P(L) = { h positive definite, supported in [−2L, 2L], h(±log p^k) = 0 for every prime power
  p^k ≤ e^(2L) } (a convex cone: the positive-definite cone cut by finitely many linear conditions). On C_P the
  explicit formula reads Σ_ρ ĥ(γ_ρ) = W_∞(h) + ĥ(i/2) + ĥ(−i/2): no primes at all. Hence (a) RH ⇒ W_∞ + poles ≥ 0 on
  every C_P(L); (b) the converse holds if (Detect): an off-line zero, if one exists, is seen by some h ∈ C_P(L).
- Why it might not be a pure reformulation: the attack on "W_∞ + poles ≥ 0 on C_P" is a SAMPLING theorem. The set
  {log p^k} has density about e^x/x near x (prime number theorem); by Beurling–Landau-type density arguments a
  function vanishing there must have frequency content of order e^(2L)/(2L) near the top of the window, i.e. close
  to the band edge 2πe^(2L) (Montgomery's line), where W_∞ ≈ ∫ĥ(t) log(|t|/2π) dt is positive. Degrees of freedom:
  a window function resolving frequencies up to e^(2L) has about L·e^(2L) of them, against π(e^(2L)) ≈ e^(2L)/(2L)
  constraints, so C_P is large (codimension a fraction 1/L² of the space) and (Detect) is not excluded by counting.
- Checklist: (i) the Euler product is used, linearly, as the support of Λ, and the impostor is excluded by
  construction (its prime side does not vanish on C_P); (ii) in the bulk (forced frequencies near the band edge);
  (iii) tightness along colliding pairs: unknown, to be determined; (iv) a fresh verifier once built; (v) above.
- Risks, named: (Detect) may fail (the cone may be too thin where the off-line zero lives); the pole term
  2∫h(x)cosh(x/2)dx weights the window's edge by e^L and may dominate; the density argument may give frequencies a
  factor L below the band edge, i.e. exactly in the soft regime. Ratings now (unbuilt): Quality 3, Toward RH 3.

**N95. H-4 is a shadow: the support of Λ alone does not decide positivity; its values do** (lead, after SP-operator
session 6, `rh/specialists/operator/PRIME_SAMPLING.md`; sections 1–4 written before any run; one implementation,
dual lower bounds, not certified; all three of the seat's predictions hit).
- Corrections to N94: the pole term on h = g∗g̃ is 2ab (a = ∫g e^(−u/2), b = ∫g e^(u/2)), of signature (1, 1), not
  positive; the forced frequency e^(2L)/(2L) sits about 4πL below the band edge, inside the bulk, and on C_P the
  archimedean + pole term equals the zero sum exactly, so positivity there is as hard as the zero statement.
- Duality (PROVED, Prop. 2.1): κ_P(L) = sup over ALL real weights c on the prime powers ≤ e^(2L) of
  λ_min(W_∞ + poles + Σ c_s B_s; D). So C_P remembers only WHERE Λ lives and forgets its values; (Detect) at window L
  holds exactly when no fake weights on the prime powers restore positivity. C_P-positivity holds wherever the full
  form is positive (PROVED), so it cannot fail at small L.
- Computed: zeta κ_min 0.297833 / κ_P ≥ 0.298196 (L = 1), 0.204610 / 0.204627 (L = 1.25): the constraints cost zeta
  almost nothing. The impostor at L = 1.72: κ_min = −0.048 but κ_P ≥ +0.0335: 24 fake weights make its archimedean
  form positive on the window, so its off-line quartet is INVISIBLE to the cone. (Detect) fails there. The impostor
  at L ≥ 1.8 was not run (no matrices dumped). Collisions: C_P-positivity is blind to them.
- Known? Positivity for support avoiding all prime powers is known (Yoshida; Connes–Consani, support in
  (−log 2, log 2)); the vanishing variant is not known to the seat (no search). Ratings (seat): Quality 6, Toward RH 1.
- **Rule H14.** The Euler product as a SUPPORT condition on Λ is not enough: positivity depends on the VALUES
  Λ(p^k) = log p, and imposing the values is the Weil form itself. Read with H13: linear in μ is blind; linear in the
  support of Λ is blind; linear in the values of Λ is the full problem. The ingredient the impostor lacks has to be
  used with its exact values, and no linear device on the record lightens that.

**N96. H-4 at L = 1.8: the impostor's quartet is probably no longer hidden, NOT established** (lead, after SP-operator,
`PRIME_SAMPLING.md` §7–7.1; interim, runs still going).
- Impostor at L = 1.8: κ_min = −0.3042 (degree 165) / −0.3043 (180); two negative squares; 28 constraints. Best dual
  value so far ≈ −0.25 (still creeping up with the search scale; the weight matrices reach |W_s| ~ 1e35, badly
  conditioned). A dual value is only a LOWER bound for κ_P: a negative number does not prove detection, and there is no
  primal certificate (an explicit h ∈ C_P with negative form). At L = 1.72 the same method gained +0.08 and hid the
  quartet (re-checked: +0.0356). Seat's prediction (still hidden, p = 0.55) missed as far as computed.
- If it holds: the cone detects this quartet within about 0.08 in L of the first failure, so (Detect) is "eventually
  true" here, with a lag. That would keep H-4 alive as a CRITERION (RH ⇔ W_∞ + poles ≥ 0 on every C_P, if (Detect)
  holds with a lag in general) but not as a route: by N95 positivity on C_P is exactly as hard as the zero statement.
  Toward RH stays 1–2. L = 2.0 runs (43 constraints) are pending.
- Needed to settle: a primal certificate at L = 1.8 (the minimiser of the constrained form), not a better dual.

**N97. N96 withdrawn: no certificate either way at L = 1.8; H-4 closed** (lead, after SP-operator, `PRIME_SAMPLING.md` §7.2).
- In the lowest 80 eigendirections the constrained minimum is +0.138 (the impostor's on-line pair): the constraints
  steer h off both negative directions. On the whole space an inaccurate conic solve gives −0.060, but demanding a PSD
  margin of 1e-4 or 1e-3 is infeasible, so no margin certificate exists, and the exact check ran out of memory.
  κ_P(1.8) ∈ [−0.233 (dual), ≈ +0.14 (uncertified upper)]: sign undetermined. L = 2.0: κ_min = −0.3067, dual moves
  1.3e-6: no sign. All runs stopped.
- So (Detect) fails at L = 1.72 (κ_P ≥ +0.0356, floats) and is undetermined beyond. N96's "probably detected" is
  withdrawn. H-4 is closed as a shadow (N95, H14); it stays on record as a criterion of unknown validity.

**N98. The nonlinear uses of the Euler product, mapped (lead, construction by thought; classical facts, packaging the
lead's).** H13–H14 closed every LINEAR use. The nonlinear ones on record or in the literature:
- Quadratic in Λ, statistical: prime pair correlations Σ Λ(n)Λ(n + h) ↔ zero pair correlation F(α) for α > 1
  (Goldston–Montgomery), i.e. beyond Montgomery's line, in the bulk. But statistics are density statements and the
  impostor family is expected to share them (Bombieri–Hejhal, conditional, from memory): twist-blind like N93.
- Multiplicative, "pretentious" (Halász, Granville–Soundararajan): uses multiplicativity in an essentially nonlinear
  way (f(p) determines f), but its conclusions are repulsion near n^(it), i.e. zero-free regions at the EDGE
  (Re s near 1); square-root cancellation is far beyond it.
- Structural (Hecke algebra, Rankin–Selberg, functoriality): the triangle of N83/N87; needs cuspidality at a zero,
  which nothing supplies.
- **Classification, then.** Linear: blind (μ), insufficient (support of Λ), or the full problem (values of Λ).
  Nonlinear statistical: twist-blind. Nonlinear multiplicative: edge only. Structural: needs an object nobody can
  build. The gap is therefore precisely named: a use of the Euler product that is pointwise (not statistical), in
  the bulk (not the edge), and not through a Hilbert space of automorphic forms. No such use is known; it is what
  "Toward RH ≥ 3" requires. Ratings: Quality 4 (a classification, not a theorem), Toward RH 1.

**N99. The hybrid Euler–Hadamard product: pointwise and in the bulk, but linear in Λ, so short by X^(½−β)** (lead,
after SP-sieve, `rh/specialists/sieve/HYBRID_FE.md`; construction only; GHK recalled, not read).
- With ζ = P_X Z_X (1 + errors) at s and 1 − s and the functional equation: −Re S_X = log|χ(s)| + log|Z_X(1−s)/Z_X(s)|
  + error, where S_X(t, δ) = Σ_{n≤X} Λ(n) v_X(n) n^(−½−it)·2 sinh(δ log n)/log n. By the symmetry ρ → 1 − ρ̄, ρ̄ the
  zero terms cancel except an odd part; an off-line quartet forces |S_X| ≈ X^(δ+β)/log X near its height, against a
  typical X^δ. Λ ≥ 0 bounds S_X only by its non-oscillating majorant X^(½+δ) (the pole term, N84): short by X^(½−β).
  Closing the gap needs a POINTWISE square-root bound for S_X at one height, which is the zero-free statement at that
  height (circular). Range: X up to T^(1−ε), beyond Montgomery's line; tight along collisions only because it is an
  identity. Impostor: the same identity holds with its own Λ_f (both signs, all n): twist-blind except for |Λ| ≤ log.
  Ratings (seat): Quality 4, Toward RH 1.
- Lead: this is N84's obstruction in pointwise form, and the cleanest statement yet of what is missing: **a
  pointwise square-root bound for one short prime polynomial at one height.** The hybrid product reduces RH at
  height T exactly to that, with X = T^c; the Euler product enters only through Λ, linearly (H13–H14 again). N98's
  classification stands with one more entry (pointwise linear: reduces to the bound it needs).

**N100. Guth–Maynard dissected; correction to N98: density COUNTS do separate ζ from the impostor, and the
separating input is the SIZE of the inverse coefficients** (lead, after READER-11,
`rh/library/guth-maynard-2405.20552.md`, v2 read whole).
- Their theorem: for |b_n| ≤ 1, #large values ≤ T^(o(1))(N²V^(−2) + N^(18/5)V^(−4) + T N^(12/5)V^(−4)), giving the
  zero-density exponent 30/13. Key idea: bound the top singular value of (n^(it))_{t∈W} through its cubic trace minus
  the "flat" part; Poisson without stationary phase keeps three t-variables apart; additive energy of the
  large-value set W split into high (Heath-Brown), low (L²/L⁴ of Σ_{t∈W} v^(it)) and intermediate (no sparse set
  nearly invariant under u ↦ (m₁u + m₃)/m₂). Coefficients enter only through |b_n| ≤ 1, in one lemma; no Λ or μ.
  It stops at a COUNT; pointwise it is trivial; and for bounded coefficients a count of zero is false (the paper
  builds examples with ≫ N^(2−2σ) large values).
- **Correction to N98.** "Statistical ⇒ twist-blind" holds for pair-correlation-type statistics and for proportions
  on the line (N93), NOT for density counts: an exponent below 1 in N(σ, T) (already Ingham's, for every σ > ½)
  separates ζ from Davenport–Heilbronn, which has ≍ T zeros in such strips (recalled, not read). The separating step
  is the zero-detection by mollification, where the inverse coefficients must be BOUNDED: |μ| ≤ 1 for ζ, unbounded for
  the impostor (consistent with N99, where |Λ| ≤ log n was the only impostor-sensitive line).
- **Sharpened gap.** Every proved result that separates ζ from the impostor uses the Euler product only as a SIZE
  bound on the inverse (or log-derivative) coefficients, and size alone cannot give a pointwise statement, because
  bounded coefficients can have large values (Guth–Maynard's own examples). So the missing input is an arithmetic
  property of μ (or Λ) BEYOND its size that forbids alignment with every n^(it) at square-root scale. Ratings: the
  paper's method is Quality 9 (a real breakthrough on its own problem), Toward RH 2 for us (density, size only);
  N100's correction: Quality 5, Toward RH 1.

**N101. The analytic tensor-power trick over ℚ exists, and its fixed bound IS the short-family wall** (lead,
construction by thought after N99–N100; facts classical, the reduction is the lead's, unchecked).
- N99 needs a pointwise bound |S_X(t)| ≪ X^ε at height T with X = T^c. The sup norm is a limit of moments, and the
  k-th power S_X^k is the "tensor power": a Dirichlet polynomial of length N = X^k whose coefficients count ordered
  factorisations into k prime powers. Unique factorisation (the Euler product, NONLINEARLY) makes the diagonal of
  ∫_T^{2T} |S_X|^{2k} exactly Gaussian (k!·(Σ_p log²p/p)^k): this is the arithmetic analogue of Deligne's tensor
  power, with the deviation multiplied by k (an off-line zero makes |S_X|^{2k} grow like X^{2kβ}).
- Fixed k = 1/(εc) suffices to beat the trivial bound, so N = T^{1/ε} ≫ T: a long polynomial on a short range of t,
  the short-family wall (#34) exactly. In arithmetic terms: ∫_T^{2T}|S_X^k|² = T·Σ_I (Σ_{n∈I} a_n)² over multiplicative
  intervals I of relative width 1/T, and the off-diagonal is the VARIANCE of k-fold prime products in short
  intervals around their smooth mean (Goldston–Montgomery for k = 1; higher k by the same calculation). An upper-bound
  sieve gives the COUNTS in I to the right order (Brun–Titchmarsh for almost-primes) but not the deviation from the
  mean, which is the part needed; the sieve bound alone is T^(1/ε − 1) too large.
- So the tensor-power amplifier over ℚ is: moments of prime polynomials; its "fixed bound" is square-root variance of
  k-almost-primes in multiplicatively short intervals, for every fixed k. Over F_q(t) the same variance is a
  character-sum bound (Weil/Deligne, Katz–Sarnak equidistribution). One obstruction again, now with the amplifier
  built and the bound named arithmetically. Ratings: Quality 5, Toward RH 2 (the cleanest version of the target: a
  short-interval variance statement for almost-primes with k factors, all k, which is a sieve-flavoured statement
  rather than a zero statement; it is still RH-strength).

**N102. N101 checked by SP-sieve (`HYBRID_FE.md`, "Check of N101"): (2)–(4) correct, (1) half right, no foothold yet.**
- (1) Forward: M_2k ≪ T^(1+o(1)) at ONE fixed k ≥ 1/(2cε) gives |S_X| ≪ X^ε (Gallagher/Sobolev); Gaussian constants
  are not needed. Converse overstated: |S| ≪ X^ε only gives M_2k ≪ T^(1+2kcε); equivalence is in exponents only.
  (2) Exact with a smooth kernel; with sharp intervals only Gallagher's inequality. The twist n^(−iT) removes the
  smooth mean; the off-diagonal is the excess variance. (3) The sieve loses N/T = T^(kc−1). (4) Goldston–Montgomery
  (under RH, α = c), from memory.
- (5) No known square-root variance for products of exactly k primes ≤ X beyond the trivial range X^k ≤ T
  (Soundararajan's moment lemma); Type I/II does not help (both variables are primes, no smooth variable). Known only
  for smooth convolutions (d₂, Jutila; partial d_k) and over function fields (Keating–Rudnick and successors); from
  memory. One lead to read before closing (5): Gorodetsky, arXiv 2111.00853 (variance of rough numbers, unconditional).

**N103. Gorodetsky does not reach N101's range; question (5) closed** (lead, after READER-12,
`rh/library/gorodetsky-2111.00853.md`, v3 read whole, refereed: Math. Z. 308 (2024)).
- Counts y-rough integers in additive intervals (x, x + H], x averaged over [0, X]. Unconditional for
  y ≥ (2 + ε)log H and (1 + a)log H/loglog H ≤ (1 − ε)log X/log y, so y = X^(o(1)) always. Variance = the full-period
  variance M(H, y); Poisson (H·P_y) only for H = y^(o(1)), otherwise H·P_y·λ(u), λ < 1. Inputs: fundamental lemma of
  the sieve, Hall's identity, saddle point; no zeros, no mean values of Dirichlet polynomials.
- N101 needs y ≈ N^(1/k) (primes of size N^(1/k)), i.e. u ≤ k bounded; there the error H²·P_y·u^(−u) has no
  cancellation and exceeds the variance, and the paper's own §1.6.2 (Friedlander–Granville–Hildebrand–Maier
  oscillation) shows the main term fails. So the only unconditional variance results for prime-built sets live where
  the primes are tiny (y = X^(o(1))): the sieve's natural range, where nothing about zeros is seen. (5) closed: no
  foothold for N101. The analytic tensor-power line ends at #34 like the others.

**N104. Three finite cores machine-checked (FORMAL session 3; 3971 jobs, 88 audited theorems, standard axioms, no
sorry).** T140 two-factor Kronecker-sum core (`T140_KroneckerSum.lean`: bottom of c·I + A⊗I + I⊗B is
c + λ_min(A) + λ_min(B), attained at x₀⊗y₀); T139 support closure (`T139_SupportClosure.lean`: Dirichlet products and
inverses stay on a submonoid; log 2, log 3 in no common lattice cℤ, so ζ is not P/Q with lattice-supported P, Q);
T129 pair-Gram core (`T129_PairGram.lean`: det Gram(p+m, p−m) = 4 det Gram(p, m); bounds det/tr ≤ λ_min ≤
det·tr/(tr² − 2det)). Not formal as worded: the r-factor induction, the divisor-box identity, generalised
frequencies, the u-expansions. The keeper updates THEORY statuses.

**N105. Bagchi's recurrence is the density-to-pointwise converter, and it is circular in the same place** (lead;
known: Bagchi 1981, Voronin; packaging the lead's).
- Amplifier: vertical shifts τ (the Kronecker flow on the torus of N88). If ζ were strongly recurrent near an
  off-line zero ρ₀ (ζ(s + iτ) ≈ ζ(s) on a disc around ρ₀ for a positive-density set of τ), Rouché would give ≫ T
  off-line zeros up to T. Fixed bound: Selberg's density estimate N(½ + δ, T) = o(T), PROVED (via |μ| ≤ 1, N100). So
  recurrence + density ⇒ RH, and Bagchi: strong recurrence ⇔ RH.
- Where it is circular: universality approximates only NONVANISHING targets (the random Euler product has no zeros
  in σ > ½ a.s., N88), so recurrence near a zero has density zero unless there is no such zero. The amplifier exists
  and the fixed bound exists; the missing step is recurrence at zero-containing configurations, which is RH.
- This is the first converter on the record whose FIXED BOUND IS PROVED (a density estimate). What fails is the
  amplifier's reach, not the bound: the mirror image of N86–N87 (amplifier fine, bound missing). Quality 5,
  Toward RH 1.
- Lead, follow-up (construction, no run): can the two halves be glued, i.e. an amplifier that multiplies the NUMBER
  of off-line zeros (for which the proved density bound is the fixed bound)? Candidates: vertical shifts (Bagchi,
  circular); base change (one zero of ζ is a zero of every ζ_K, so a FAMILY density bound over {ζ_K} would be
  contradicted), but family density theorems come from orthogonality over the family, which cannot see a COMMON
  factor (ζ is the principal member; the bounds are for the new parts L(s, χ_D)); twists by n^(it) are shifts.
  So the number-multiplying amplifiers either need RH or land on a common factor that averaging cannot see.
  Recorded as one more face of the obstruction; no new object.

**N106. Novelty of the copy barrier: PARTLY KNOWN** (lead, after READER-13, `rh/library/NOVELTY_copy_barrier.md`;
~30 arXiv queries, 10 web, 5 MathOverflow, ~12 sources read in the relevant sections).
- T106 (general sieves pay for the copies): KNOWN in substance (Heath-Brown, Acta Arith. 72 (1995) 236–237, read:
  square rows, about M^(1/2) of them, each contributing about N²; folklore in Conrey–Iwaniec–Soundararajan
  arXiv 1105.1176; dual form in Goldmakher–Louvel). T109, T114: known. T107, T108, T110, T111: PARTLY known (special
  cases: power-residue kernels, BGL arXiv 1112.1650; the Dirichlet family); the general kernel lemma with the
  C·H^(1/2) copy bound was NOT found. T113 (amplification by copies cannot pass Re s > 3/4): NOT FOUND IN WRITING; a
  "3/4" is asserted orally (Tao, via secondary sources) without argument.
- Not obtained: Montgomery's Topics, Iwaniec–Kowalski, Iwaniec–Sarnak, Duke–Friedlander–Iwaniec, Conrey–Iwaniec,
  Huxley, Jutila, Bourgain. So "not found" is bounded by that scope.
- Consequence for the ratings: the copy barrier's new content is the general kernel lemma (T110–T111) and the written
  barrier T113. Quality stays 6 (a barrier with an oral precedent), Toward RH 1.
