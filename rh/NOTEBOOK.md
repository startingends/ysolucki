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

**N2. One rule behind every "all zeros real" result.** (lead) PROVED (classical). Let A(s) = Σ_{n≤N} c_n n^(−s),
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
