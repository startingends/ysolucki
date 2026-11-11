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
