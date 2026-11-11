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
