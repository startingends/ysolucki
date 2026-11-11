# Hunches: how the quasi-RH proof was built, how ours were built, and what to do differently

Asked for by the owner (2026-11-11): dissect the quasi-RH proof as "how they found another island similar to
ours": which hunches it went on, what each led to, how they compare with ours, how to make better ones.
STATUS: Part A was first read off a second-hand summary and has been checked against the reader's digests (part A′). ORIGINAL NOTE: Part A is read off a second-hand summary of an exposition (notebook N42); the papers are being
read whole by READER-4, who has been asked for the proof's design choices from the published text. Part A will be
corrected against that digest. Nothing here is about how the authors or their system reasoned; it is about the
choices visible in the published argument.

## A. The bets visible in the quasi-RH argument (as reported)
| # | what was needed | the bet | what it bought |
|---|---|---|---|
| 1 | a statement that an estimate can prove | aim at a zero-free HALF-PLANE and translate it into a power saving for smoothed Möbius sums (attack 1/L, not the zeros) | a target with slack: any power saving gives a theorem. No exact identity, no positivity, is needed |
| 2 | one Möbius sum cannot be bounded by anything known | put it in a FAMILY (twists by sixth-power residue symbols) and bound the family in mean square | mean squares are what Poisson summation and large sieves can reach |
| 3 | an average does not control one member | choose the family so that the member REPEATS: at perfect sixth powers the twist is trivial, so the original sum occurs about H^(1/6) times | |A₁|² ≤ (mean square)/(number of copies): the exponent (2 − 1/6)/2 = 11/12 |
| 4 | the mean square must include the degenerate rows, where general large sieves fail | move to an arena with MORE structure: over ℚ(√−3) the Möbius function is, up to a simple factor, a cube of a cubic Gauss sum, and those are coefficients of an automorphic form (Kubota's theta) | an exact summation formula for the hard object, in place of an inequality that loses |
| 5 | close the estimate | a recursion in which the bound at one scale feeds the next; then an extremal argument on the supremum of the real parts of zeros | 11/12, then 7/8 |
| 6 | return to ζ | descend from the bigger field by a factorisation of its L-functions | the theorem for ζ and Dirichlet L-functions |
Not used, as reported: the functional equation in the zero-free step; any positivity.

### A′. Corrections and additions after the papers were read (READER-4, 2026-11-11)
Paper 1 (11/12, 49 pp.) was read whole; paper 2 (7/8, 199 pp.) to 45% (overview, the framework, statements of the
moment lemmas; not their proofs). Digests: `rh/library/openai-qrh-11-12.md`, `openai-qrh-7-8.md`, each with a section
"Design choices of the proof". All statements of the papers are "claimed"; the reader re-derived the easy steps and
checked one identity numerically (one printed formula is wrong by a complex conjugate; harmless in paper 1).
Status by named sources: the 7/8 paper is reported formally verified in Lean; experts "largely agree the result is
correct"; nothing is refereed.
- **Row 3 of the table is right, and the order six is FORCED, not chosen for the count of copies.** Sixth-order Gauss
  sums absorb μ and turn into cubic Gauss sums (a Gauss–Jacobi identity; at every prime the cube of the normalised
  cubic Gauss sum is −1 times a unit, and "the −1 IS μ").
- **The step I had not seen (their step 7): transform in the column with the row fixed, so that the sextic twist
  becomes a QUADRATIC one**, and then use the quadratic large sieve, which is sharp, instead of the cubic or sextic
  one, which loses. The text names the alternative it avoids. This is a design move worth a rule: *change which
  variable carries the hard character until a sharp tool applies.*
- **The functional equation IS used in the 7/8 paper** (in its zero detector), together with complete
  multiplicativity, the theta automorphy and the family; it is not used in the 11/12 paper. So row "not used" holds
  for paper 1 only.
- **Paper 2's organising device: one probe with two exact representations** (one bounded directly, the other a sum
  of rows in which the row u = 1 carries the signal as a residue), and an extremal argument on the supremum of the
  real parts of zeros over the whole family, with explicit margins that vanish exactly at 7/8.
- **Where the centre of the strip enters:** through the normalisation |μ·ν| ≤ 1 against which the mean square is
  measured (our barrier B11 in their language).
- **The limit of the method:** the papers state none. "A barrier at 3/4" is commentary only. The reader's own
  inference agrees with mine: symbols of order m would give 1 − 1/(2m).
- **For the controls** (reader's analysis): the impostor fails at their first step and at the Gauss-sum step (its
  Dirichlet inverse is not μ times a character); ζ(s−d)ζ(s+d) is handled correctly by the method (it gives the true
  shifted region); a Beurling system has no lattice, no reciprocity, no theta function.

Two more rules from this, added to part D:
- **H7. One object, two exact representations.** Look for a probe that can be written exactly in two ways, one
  that can be bounded and one that contains the unknown; then the unknown is squeezed without being estimated
  directly. (Weil's form is such an object; bridge 1's plank 5 is another instance. Their probe is a third.)
- **H8. Move the difficulty to the variable where the sharp tool lives.** Before estimating, ask whether a
  transformation in the other variable turns the hard structure (sextic) into one with a sharp theorem (quadratic).

## B. The bets in our own work
| bet | what it led to | where it stopped, and the reason in one line |
|---|---|---|
| positivity sieve (#9): positivity forces the primes | certified theorem FH-2 on small windows | each step needs feasibility of the truth on the next window, which is RH on that window |
| mirror positivity (#21): the primes are a second positivity of the same kernel | the two-involutions picture | killed by a control: ζ(s−d)ζ(s+d) satisfies every hypothesis used |
| certificates / curvature (#10, #11) | Lemma C, Theorem F | existence is equivalent to the statement; the one formula loses a factor 2 |
| relative positivity (#27, bridge 1) | planks 1–7 confirmed; explanation of the tiny eigenvalues and their constant | the impostor shares every plank: nothing in it uses the Euler product |

## C. The comparison
1. **Their first object is one the impostor does not have** (a Möbius function). Ours, each time, was a structure the
   impostor has too (a positive form, a ladder, a summation map). We found that out at plank 9 of bridge 1, after
   seven planks; they could not have made that mistake because of where they started.
2. **They chose an island an estimate can reach.** A half-plane needs any power saving. We aimed at the exact
   statement, which has no slack (barrier B3), and then tried to manufacture slack (idea #27). Their island is on
   our own map: it is the line ε = 3/8 of the damping parameter in notebook N35.
3. **They left the original arena for one with an exact formula for the arithmetic object**, and came back by a
   factorisation. We stayed with ζ over ℚ and with structures general enough to be shared by controls. Our
   "bigger statement" track looked for a bigger statement; they looked for a bigger TOOLKIT.
4. **They made an average control an individual by repetition.** We had the amplification idea on record three
   times (notebook N38; the atlas pair F17×F22, "powerless at ζ"; the bigger-statement seat's BG-2) and each time
   recorded that it fails, without recording what would make it work.
5. **They used the Möbius side without the functional equation; bridge 1 used the functional equation without
   the Möbius side.** The two are complementary halves, and neither work combines them.

## D. Rules for the next hunch (proposed by the lead; to be confirmed by the owner)
- **H1. Impostor first.** Before plank 1, name the first step the Davenport–Heilbronn function and ζ(s−d)ζ(s+d)
  cannot take. If there is none, it is not a bridge to RH, whatever its numbers.
- **H2. Slack first.** Choose an island that an inequality with room can reach, and say what the room is. On our
  map: lower the damping threshold below 3/8 on some class, or prove a comparison with a constant.
- **H3. Go where the hard object has an exact formula.** Keep a list of such places (Möbius as cubes of cubic
  Gauss sums over ℚ(√−3); squares and the Jacobi theta function; divisor functions and Eisenstein series) and ask of
  each whether our object lives there.
- **H4. Look for repetition.** Ask where the object recurs inside a family, exactly (imprimitive members, perfect
  powers, windows inside windows), and what mean-square statement would then bound it.
- **H5. When an idea is recorded as failing, record what would have to be true for it to work**, as a statement
  someone could search for. (The atlas format already asks for this; apply it to dismissed ideas too.)
- **H6. Pair the unused halves.** The next hunch should use the functional equation and the Möbius side together.

## E. New hunches made with these rules (lead, 2026-11-11). HUNCHES, each with its plank zero. None is tested.

**The observation they rest on.** On the Möbius side even the FULL Riemann hypothesis is a statement with room:
RH ⟺ smoothed Möbius sums of length D are ≪ D^(1/2+ε) for every ε. On the positivity side (Weil's form, the
window form, everything this project built) RH has no room at all (barrier B3). The quasi-RH proof lives entirely on
the side with room. Our planks 5–7 already contain the dictionary between the two sides: the window form in the
Möbius-inverted variable, f = Zψ, ψ = Z⁻¹f.

### Hunch 1. RH as a growth rate, and the functional equation as a doubling law
- STATEMENT. Let Z_L be the cut Dirichlet-convolution operator on the window (f = Z_Lψ; its inverse is the Möbius
  sum of f). Let G(L) be the norm of Z_L⁻¹ on a fixed smooth class. A zero at distance β to the right of the line
  makes G(L) grow like e^(2βL) (a resonance at the zero's height); zeros on the line make it grow polynomially.
  So RH ⟺ G(L) = e^(o(L)); the October 2026 theorem is G(L) ≤ e^(3L/4 + o(L)).
- THE HUNCH. Exponential growth means G(2L) ≈ G(L)²; RH means G(2L) ≤ (polynomial in L)·G(L). A doubling
  inequality with polynomial loss, proved once, gives RH by iteration, and it has room (any polynomial). The
  functional equation is the natural source of a doubling law: by plank 5 the window form of f is the Weil form of a
  tail outside the window, and the seminar's doubling step writes the form on [−L, L] through the form on a window of
  half the size and an explicit mirror form.
- FAKE FIRST. Davenport–Heilbronn: 1/L has a pole at real part 0.808, so its G grows like e^(0.62 L): it fails the
  very first statement. ζ(s−d)ζ(s+d): rate e^(2dL). The one-prime system has no functional equation, so no
  doubling law. Passed.
- ROOM. Any polynomial loss per doubling.
- PLANK ZERO (computable now): G(L) for zeta, the impostor and F_d on windows up to L = 1.5 by our builders;
  blind prediction to be written first: zeta's G(2L)/G(L) stays below 4 on L ∈ [0.25, 0.75]; the impostor's
  ratio exceeds zeta's by a factor that grows with L. Then: does the half-window identity give ANY inequality
  between G(2L) and G(L), even a bad one?
- WHAT WOULD KILL IT: the impostor's G is indistinguishable from zeta's on all computable windows (then the
  resonance is as invisible here as in the form), or the doubling identity relates G(2L) to G(L)² only.

**Hunch 1, plank zero: OUTCOME** (S1-parity, `rh/experiments/s1_seminar/parity/HUNCH1.md`; floats, one implementation;
predictions written first, most hit).
- G must be measured on a fixed FREQUENCY BAND (the L² norm is provably blind to signs: it equals the norm with |μ|).
  On |t| ≤ 100 zeta's G grows LINEARLY (1.95 → 9.18 from L = 1 to 6), peaked at its first zero; the impostor grows at
  rate 1.85 per unit L (= e^0.617) and crosses zeta between L = 2 and 2.5; F_d's rate is visible only from L ≈ 4–5.
- **What the Möbius side sees that the Weil form did not:** from L = 1 (sums of length 7) the frequency at which
  the impostor's Möbius operator is LARGEST is already the height of its off-line zero (86.00, 85.78, …, 85.70).
  The Weil-form ladder was regular 0.01 before failure (bridge 1, planks 10, 12). On this side the off-line zero
  shows in the SHAPE at once, in the size only later.
- **Doubling: exact block identity** M_{2L} = [[M_L, 0], [H_μ R, M_L]] with H_μ the mirror of the Möbius measure
  about the midpoint (checked to 1e-15; probably Vaughan's identity at cut-off √D, unsearched). Best inequality:
  G(2L) ≤ G(L) + (e^(2L) − 1)·G(L)². QUADRATIC: the hunch's own kill line for its strong form.
- **The decisive structural fact:** F_d has an Euler product, a functional equation and its own summation
  formula, and still G(2L) ≈ G(L)². So **no doubling law can come from the functional equation alone; it must use
  local roots of modulus one** (barrier B11). The one-prime system satisfies every doubling law: for this hunch it
  is not a fake (its zeta has no zeros). My line "no functional equation, so no doubling law" was wrong.
- What remains of the hunch, stated exactly: split the integer-comb mirror H₁ into its pole part (the e^(2L)) and
  its Poisson-dual part, and find cancellation between them after Möbius inversion on both sides, down to a bound
  linear in G(L). That is type-II information (bilinear sums of μ), which is exactly what the quasi-RH proof
  obtains from the cubic theta function. So Hunch 1 and Hunch 2 have met: the missing step of the first is the
  input of the second.

### Hunch 2. Positivity because it is a norm: the Weil form over ℚ(√−3) as a period of the cubic theta function
- THE OBSERVATION. Every proof of a Riemann hypothesis in geometry gets its positivity from a quantity that is
  non-negative because it is a degree, a dimension or a norm (notebook N38). Over ℚ we have never had such an
  object. The quasi-RH proof shows that over K = ℚ(√−3) the Möbius function IS made of coefficients of an
  automorphic form: μ(n) is, up to an elementary factor, the cube of a cubic Gauss sum, and cubic Gauss sums are the
  Fourier coefficients of Kubota's theta function.
- THE HUNCH. Write the prime term of the Weil form of ζ_K = ζ·L(χ₋₃) in the Möbius-inverted variable (planks 7),
  replace μ by cubes of theta coefficients, and the window form becomes a TRILINEAR expression in an automorphic
  form on the cubic cover. Trilinear periods of automorphic forms are the one place where squares of periods are
  known to equal non-negative quantities (unfolding gives norms; triple-product formulas give |period|² = L-value).
  The hunch is that the window form of ζ_K, or its tail form W(T), is the squared norm of an explicit vector built
  from the cubic theta function and the test function.
- FAKE FIRST. The impostor has no Gauss sums and no theta function; ζ(s−d)ζ(s+d) corresponds to a non-unitary
  (complementary-series) parameter, where a norm does not exist. Passed, and for a structural reason.
- ROOM. None is needed if it is an identity (as in geometry); that is also its risk.
- PLANK ZERO (for the modular-forms specialist): (i) the exact identity between μ over the Eisenstein integers and
  cubic Gauss sums, from the papers; (ii) the Weil explicit formula for ζ_K on a window, in the Möbius-inverted
  variable, with that substitution made: what object is it? (iii) one numerical instance: the window form of ζ_K at
  L = 0.5 by our builder against the candidate expression. Blind prediction before (iii).
- WHAT WOULD KILL IT: the substitution produces a signed trilinear sum with no period interpretation; or the
  expression makes sense equally for a non-unitary parameter.

### Hunch 3 (smaller). Use the new theorem as an input on our own map
The damping threshold is now ≤ 3/8 on every window (if the proof stands). Our planks were all built at ε = 0.
Rebuild planks 3b and 8 at ε = 3/8, where positivity is a theorem: the whole-space comparison constant κ(L, ε) is
then a quantity that is provably positive at ε = 3/8 and measured ≈ 0.30 at ε = 0. How it moves between the two is
a curve nobody has, and its derivative in ε at 3/8 is a statement about the worst possible zeros.
PLANK ZERO: κ_min(L, ε) at L = 0.5, 0.75 for ε = 0, 1/8, 1/4, 3/8 with the foothold seat's pencil.


## F. The structural mode (owner, A23). Lead's thinking, 2026-11-11. RISKY; labelled as such.

### F1. The structural question: in what setting do the zeros have an exact formula?
Not "an equivalent of RH", but a setting in which a zero is a THING: an object you can hold, with a formula.
Three such settings are on record in mathematics, and each makes its own Riemann hypothesis trivial or provable:
- zeros as eigenvalues of Frobenius (curves): positivity is a degree or a dimension; for Fermat curves the
  eigenvalues ARE Jacobi sums and RH is the identity |Gauss sum|² = p;
- zeros as eigenvalues of a Laplacian (Selberg): self-adjointness;
- p-adic zeros as eigenvalues of an operator on an Iwasawa module (the main conjecture, proved through Gauss sums
  and Stickelberger's factorisation).
For ζ itself the settings where a zero is a thing are of a weaker kind, and I had never lined them up:
 (i) a zero ρ of ξ(2s) is a POLE of the Eisenstein series, with residue an explicit Laplace eigenfunction E_ρ of
     eigenvalue (ρ/2)(1 − ρ/2). The exact norm identity for it (Maass–Selberg at a zero; I re-derived it:
     (1 − Re ρ)·∫_{truncated domain}|E*(z, ρ/2)|² = |ξ(ρ−1)|²·T^(1−Re ρ)) proves Re ρ < 1 and nothing more. It is the
     classical proof of non-vanishing on the edge. The spectral parameter is ρ/2, the wrong one: self-adjointness
     pins ρ/2 to a line, which is the edge of the strip, not its centre.
 (ii) **a zero ρ of ζ_K(s), K imaginary quadratic of class number one, is a NODE: the Eisenstein eigenfunction
     E*(·, s) has eigenvalue s(1 − s), the right parameter, and its value at the CM point z_K is ξ_K(s)** (Hecke:
     the Eisenstein series at a CM point is the Epstein zeta function of the norm form). So for K = ℚ(√−3), z_K = ω:
     RH for ζ·L(χ₋₃) ⟺ every member of the Eisenstein family that vanishes at the single point ω has a REAL
     Laplace eigenvalue. On the critical line this is a known picture: |ξ_K(½+it)|²/|ξ(1+2it)|² is the spectral
     density of the point-evaluation functional at ω in the continuous spectrum, so the zeros on the line are
     exactly where that density vanishes.
 (iii) the Möbius function of the SAME field is a cube of coefficients of an automorphic form on its cubic cover
     (the quasi-RH input).
THE RISK I AM TAKING: (ii) and (iii) are two exact formulas at the same point ω of the same surface for the same
field, one for the zeros and one for the Möbius function, and nobody in our record (nor, as far as the digests
show, in the papers read) has put them in one sentence. The hunch is that they are two faces of ONE object: the
orbit of the point ω under the cubic cover (the place where the cubic theta function's coefficients are generated
is the stabiliser structure of ω, the units of ℤ[ω]), and that the quasi-RH theorem is a statement about how well
the point-evaluation at ω can be approximated inside the continuous spectrum. If so, the wall "the spectral
parameter is on the wrong line" (i) is replaced by "a period vanishes" (ii), and positivity is to be looked for as
the positivity of a spectral density, which is free. [CORRECTED in F4: that density is positive and EMPTY; the
impostor's twin has it too.] LIKELY WRONG in detail; the first test is not a computation
but whether three toolkits describe the same object (F3).

### F2. Walls, and the object that would make each trivial
| wall | what would make it trivial | does such an object exist anywhere? |
|---|---|---|
| B3, no slack (positivity is exact) | the form is a NORM: W = T*T with T written without the zeros | function fields (Rosati); for ζ: the candidates are a spectral density (F1 (ii)) or a period squared |
| WJ2, accuracy e^(−4π e^(2L)) | an exact identity on the near-null space | found: bridge plank 5 (window form = Weil form of the tail). It made the ladder trivial; it does not reach the bulk |
| B1 / plank 9, the impostor shares everything | an object the impostor cannot have | a Möbius function; a Gauss-sum identity; a CM point (the impostor is not a period of anything) |
| B11, the twist ζ(s−d)ζ(s+d) | unitarity of a representation (the twist is the complementary series, where a norm exists only for |d| < ½ and degenerates) | exists: this is the Eisenstein series at parameter ½+d; the "trivialising object" is the unitary dual of SL₂ |
| W1, look-alikes converge only given RH | an operator, not a sequence of functions: self-adjointness instead of a limit | pseudo-Laplacians (Colin de Verdière) give exactly the look-alike theorems; what is missing is the one whose boundary condition is "vanish at ω" |
| W2 / Montgomery's line, the bulk | prime correlations as an exact sum, not an estimate | the Gauss-sum side: correlations of μ become shifted convolutions of theta coefficients, which automorphic forms compute exactly |
| "the right parameter" (new, from F1 (i)) | an eigenvalue problem whose parameter is ρ and not ρ/2 | F1 (ii): evaluate at a CM point instead of taking the constant term |

### F3. One object, three toolkits (running)
THE OBJECT: Φ(s) := E*(ω, s), the completed Eisenstein series of SL₂(ℤ) at the point ω = e^(2πi/3); equivalently
the completed Dedekind zeta function of ℚ(√−3), ξ(s)·L*(s, χ₋₃); equivalently the form factor of the point ω in the
continuous spectrum of the modular Laplacian. SP-modular, SP-operator and SP-reflection each express Φ, and the
statement "Φ(s) = 0 only on Re s = ½", in their own toolkit, without reading each other first; then they compare.

### F4. The three descriptions side by side (all three written without reading the others)
Files: `rh/specialists/{operator,reflection,modular}/OBJECT_PHI.md`. Object: Φ(s) = E*(ω, s) = 3(√3/2π)^s Γ(s) ζ_K(s).
| | SP-operator | SP-reflection | SP-modular |
|---|---|---|---|
| what Φ is | the FORM FACTOR of the point interaction at ω (not its Krein function) | the density of a positive-definite measure (the Γ-orbit of ω) | a TORUS PERIOD (parameter s); every norm in the toolkit is a unipotent period (parameter 2s) |
| where off-line zeros sit | where the two sheets of the Krein function agree | where the outer square root of the density is not E(ω, ·) | nowhere in any norm; Lapid–Rallis reaches one real point only |
| RH_K becomes | E(ω, ·) is OUTER (Green function at ω cyclic for the outgoing semigroup) | E(ω, ·) is the MINIMUM-PHASE square root of its density | (no reformulation offered as a positivity) |
| what the positivity sees | \|Φ\|² on the line | \|Φ\|² on the line; "positive and empty" | the same; the degree-two impostor E*(i√5, s) has it too |
| what distinguishes ω | complex multiplication, not the order-3 stabiliser | not found | rank ONE of the Hecke module of δ_ω: T(p)δ_ω = (1+χ(p))δ_ω + 3·Σ CM(−3p²) |
| its risk, and why it fails | energy-dependent coupling: spectrum = zeros of Φ exactly; fails because the coupling has non-real poles (zeros of ζ(2s)) | defect function Dfc(z) ≥ 0 on the surface, vanishing exactly at RH points; new only as a family in z | Hecke-equivariant point interaction: constrained space is {0} (Hecke multipliers are complete) |
**Agreement of all three:** positivity and self-adjointness see only the MODULUS of Φ on the line, and the modulus
is shared by impostors; RH is a statement about a PHASE (outerness / minimum phase). Two of three said it in the same
words, independently. **Disagreement:** SP-modular contradicts F1's last sentence: the spectral density of δ_ω is
positive and EMPTY ("positivity is free" is true but says nothing). Accepted: F1 is corrected by this.
**Dead:** Hunch 2 as stated (θ₃³ is not an automorphic form; the pointwise cube of coefficients is not a period).
**Live, from SP-modular:** Σ |c_θ(n)|² N(n)^(−s) = 3⁵ ζ_K(s) ζ_K(3s−1)/ζ_K(2s): ζ_K is the transform of TWO positive
measures (δ_ω, and |θ₃|² by Rankin–Selberg), resting on Patterson's coefficients as quoted; and the correction that
the project's impostor is degree one and is not a value of E(z, s); its degree-two twin is E*(i√5, s).
**In print, found by SP-modular:** Bombieri–Garrett 2020 build the operator with the right parameter; at most 94% of
the zeros can be eigenvalues, and their numerics suggest none are (reader READER-5 is reading it whole).

### F5. What the comparison says, in one paragraph (lead)
The information that separates ζ_K from its impostors is a PHASE, and phase is exactly what positivity cannot see.
Finite Euler products are outer in Re s > ½ (every factor 1 − p^(−s) has its zeros on Re s = 0); outer functions
form a multiplicative semigroup, closed under products and NOT under sums, which is why the impostor (a sum) loses
it. So the whole problem, in this language, is a LIMIT: does outerness survive P → ∞ in the Euler product? Outerness
survives a limit exactly when no logarithmic mass escapes: ∫ P_{s₀}(t) log|F_P(½+it)| dt → ∫ P_{s₀}(t) log|ζ_K(½+it)| dt
(the escaping mass IS SP-reflection's defect Dfc). Wall: "outerness is lost in limits". Rule 13 (c): what object
would make it trivial? A notion of convergence of the Euler product under which outer functions form a CLOSED set,
and in which the partial products converge. Outer functions are closed under convergence of the log-moduli in
L¹(Poisson); they are not closed under any norm in which Euler products are known to converge. The next structural
question is therefore: **is there a space, natural for the Hecke algebra, in which the Euler product converges and
outerness is closed?** Candidates to think about, none examined: (i) the Hecke module of δ_ω itself (rank one is a
multiplicative statement); (ii) the Bohr lift to infinitely many variables (each prime a variable, where the Euler
product is a product of one-variable outer functions and "outer in infinitely many variables" has a theory: Helson,
Nikolski, Hedenmalm–Lindqvist–Seip); (iii) the adelic picture, where the product over places is the definition.
- **H9 (lead, from N46).** Before building on an identity, check whether it is LINEAR in the object whose zeros are
  sought (Hecke relations, Poisson summation, factorisations are). A linear identity evaluated at a zero returns the
  zero. Information must come from a quadratic or non-linear object that is not a function of the modulus on the line.
- **H10 (lead, from N63; CORRECTED in N68).** Landau's theorem ties every non-negative arithmetic weight on the integers
  to the pole at 1. Positivity at ½ with a CONSTANT is false (Littlewood, Ingham); with a slowly growing factor it is
  RH-equivalent, so it is not excluded but is the statement itself. A proposal must say which it uses.
- **H11 (lead, from N80).** A positivity statement for zeta with a uniform MARGIN is expected false: the whole-space
  constant κ_min of the window pencil is carried by the closest resolved pair of zeros (both for zeta and for the
  impostor), and under de Bruijn–Newman an off-line quartet is a collided pair, so a margin would be "Λ < 0", against
  Rodgers–Tao. A proposal must be TIGHT along Lehmer pairs: an equality, a monotonicity, or a margin normalised by the
  pair gaps. Heuristic until the two-zero model (SP-operator, `rh/specialists/operator/TWO_ZERO.md`) makes it exact.

## G. Where nobody has looked: candidates after the copy principle (lead, 2026-11-11). Honest odds attached.
The record now says (N49, N50, N60, N63, N67): amplification by copies is capped at 3/4 (copies are kernels of
homomorphisms; character families give at most square-root density); moments do not change the copy proportion
(2k-th moments need families of size D^k and their copies grow by the same power); the October bootstrap's fixed
point is (1 + κ)/2 with κ ≥ ½ at square-root cancellation, again 3/4; coefficient positivity at ½ is believed false;
on the Möbius side there are no controls. What is left has to be a mechanism of a different KIND. Candidates:
- G1. Copies across SCALES instead of across twists (Buchstab: A(D) = −Σ_p A^(<p)(D/p), exact, SP-operator's S2
  recursion). The family is the set of scales D/p; self-similarity, not orthogonality. Odds: low; the recursion is the
  Dirichlet series in disguise unless a contraction is found. Plank zero: is the Buchstab map a contraction on any
  normed space of "Möbius-like" sequences, with fixed point μ? If yes, its rate is an exponent.
- G2. Galois/Artin families (twists by characters of a non-abelian extension): copies = Frobenius in a subgroup, of
  positive density ⇒ finite family ⇒ circular by the copy principle. DEAD before birth; recorded so no seat tries it.
- G3. Copositivity hierarchy for the odd block (#28): Parrilo/Pólya certificates exist at some level r for each
  strictly copositive form; RH would need r uniform in L while margins are 10^(−30): DEAD by the same accuracy wall
  as WJ2 unless the certificate is relative (bridge 1's lesson). Odds: very low.
- G4. A mechanism that is not a mean square and not linear, with positivity at every level (Deligne's shape, S2 B9):
  the record has no candidate positivity at level k. The one structural place where positivity at all levels exists
  is the Rankin–Selberg / tensor-power tower of a CM form (SP-modular: the theta kernel factors K ⋆ K(3·)). Odds: low,
  but it is the only shape not yet killed.
- G5 (the boldest, and the one I hold): **near-copies that are not kernels.** Bagchi recurrence says ζ approximately
  recurs along t on a positive-density set iff RH. The October proof replaced approximate recurrence along t by exact
  recurrence in an algebraic family. Is there an INTERMEDIATE object: a family in which the untwisted sum recurs
  approximately, with a proportion strictly between H^(1/2) and H, proved by an equidistribution theorem rather than
  by an algebraic identity (e.g. twists by Hecke characters of growing conductor whose values on primes up to D are
  close to 1 for a provable proportion, via equidistribution of Frobenius / Sato–Tate-type statements for the family
  of characters)? The copy principle forbids EXACT kernels of intermediate density above ½, not approximate ones.
  Plank zero (computable, cheap): for the family of characters (u/·)_6 with N(u) ≤ H, measure the proportion of u for
  which |A_u(D) − A₁(D)| ≤ D^(1−η) for small η, at D = 10⁴–10⁶; predict first: only the sixth powers (proportion
  H^(1/6)/H). A surprise there would be the first sign of a mechanism of a new kind.
  OUTCOME (`rh/experiments/g5_nearcopies/`, quadratic analogue over ℚ, D up to 4·10⁴): approximate copies occur at
  the rate of random pairs (12.5–13.4% against a 10–11% baseline); no intermediate-density mechanism visible.
  Predictions hit (run 1 was ill-posed and is recorded as such). G5 is not supported at this scale.
- G6 (lead, from N68; RISK, very speculative). Stepanov's function-field proof needs ONE derivation that kills Frobenius
  (d(x^q)/dx = 0), making high-order vanishing at all rational points cheap. Over ℤ the analogue of "vanishing at all
  points" is divisibility by p^m for all p ≤ x, and there is no single derivation: Buium's p-derivations come one per
  prime. Borger's λ-rings are exactly rings with COMMUTING Frobenius lifts at all primes at once (big Witt vectors;
  Borger's "descent to F₁"). Hunch: a Stepanov-type auxiliary-function argument over a λ-ring (an auxiliary big-Witt
  vector with high "ψ-adic" vanishing simultaneously at all p, of controlled size) is the one place where a
  single object sees all Frobenii at once. Plank zero (pure mathematics, no computation): state what "size" and
  "vanishing order" would mean for an element of W(ℤ) or of a λ-ring of finite type, and check whether Chebyshev's
  C(2n, n) has a λ-ring interpretation (its p-adic valuations are the carries of Kummer). Odds: very low; recorded
  because it is the only candidate in the record that addresses "one structure for all primes at once" directly.

## H. Hunches built to a target (owner rules 14–15; lead, 2026-11-11). Read `rh/CORE.md` first.
Checklist for every hunch: (i) Euler product used, and where; (ii) in the bulk (resolves individual zeros below the
band edge); (iii) exactly tight along colliding pairs; (iv) verifier named; (v) "what object would make the wall
trivial?" answered BEFORE any measurement. Construction first.

### H-1. The local Weil discriminant (main line; one seat: SP-operator, resumed by id)
- (v) first. The wall (CORE 3–4): the Euler product only averages, and RH has no slack. The object that would make
  it trivial is a criterion that is LOCAL in the zeros (one pair at a time, so no averaging is needed), exactly
  tight at a collision (so no slack is needed), and whose terms are prime sums (so the Euler product can prove it).
- The construction. For consecutive zeros γ_k < γ_{k+1} resolved by the window L, let V_k = span of the two
  D-reproducing kernels at γ_k, γ_{k+1} (D = the Möbius norm, CORE 5) and W_k(L) = the lower eigenvalue of the 2×2
  pencil (Q, D) on V_k. Built from the window, not from a global minimum, so there is no "binding pair" to choose
  (the defect that killed (S)).
- Claims to prove, in this order. (a) For an on-line pair W_k ≥ 0 and W_k = 0 exactly at a double zero; for the
  pair ρ, 1 − ρ̄ of an off-line quartet W_k < 0 (pair-local Weil criterion: RH ⇔ W_k(L) ≥ 0 for all k, L, if (a)
  holds and the kernels separate). (b) The D-kernels at zeros have a PRIME-SIDE expression, because D is a norm of
  f/L built with μ: K_D(γ, γ′) = (explicit formula in μ, Λ and the archimedean factor). Then W_k ≥ 0 is a 2×2
  inequality between prime sums: the Euler product enters through μ and Λ ≥ 0, pointwise in the pair.
  (c) What the impostor's version of (b) looks like (its "μ" is not multiplicative): where exactly the two differ.
- Checklist: (i) yes, through μ in D and the explicit formula for the kernels; (ii) yes, pairs below the pinning
  height; (iii) yes in the two-zero model (κ₂ = 4Ju); (iv) a fresh verifier after (a)–(c) are written.
- Risk: (a) may be only a reformulation of Weil's criterion (rule 6 bans pure reformulations). It is not one if
  (b) gives an inequality the Euler product can attack pair by pair. Rating now: Quality 3, Toward RH 2.

### H-2. The deviation amplifier (second object, not yet assigned)
- (v) first. CORE 6: over function fields an off-line zero is killed because some operation adds deviations
  (zeros of C^k are sums of zeros) while the Euler-product bound stays one unit from the centre. The object that
  would make RH trivial over ℚ: a family F_k of functions with Euler product and functional equation whose zeros
  include points ½ + kβ + iγ_k for each zero ½ + β + iγ of ζ. Then kβ < ½ for all k, so β = 0.
- Construction step (before any measurement): for each known operation on L-functions (Rankin–Selberg, symmetric
  powers, base change, theta lifts, metaplectic Eisenstein series, the GL_n Eisenstein constant terms
  Π ξ(⟨λ, α^∨⟩)/ξ(⟨λ, α^∨⟩ + 1)), write what it does to a hypothetical off-line zero: shifts it, keeps it,
  divides its deviation (GL_n degenerate Eisenstein series put ζ's zeros at parameters ρ/n: deviation divided by n),
  or multiplies it. The table is the result; a single "multiplies" entry would be a new object.
- Rating now: Quality 2, Toward RH 2 (known programme in spirit: F₁, Deninger, Connes–Consani); worth it only if
  the table finds an operation not on that list.

### H-2, construction step done by the lead (2026-11-11; no measurement)
What each operation does to a hypothetical off-line zero ρ₀ = ½ + β + iγ, measured as RATIO r = deviation / distance
from the centre to the line of absolute convergence (for ζ, r = β/(½) = 2β; RH ⇔ r = 0 for every zero):

| operation | effect on ρ₀ | r |
|---|---|---|
| base change ζ_K = ζ·L(s, χ_K), Rankin–Selberg with the trivial form | ρ₀ stays a zero | unchanged |
| shift ζ(s − w) | ρ₀ + w; centre moves with it | unchanged |
| dilation ζ(ks) = Σ (n^k)^(−s) | ρ₀/k; centre 1/(2k), convergence at 1/k | unchanged (scale-invariant) |
| GL_n Eisenstein constant terms Π ξ(⟨λ,α^∨⟩)/ξ(⟨λ,α^∨⟩+1); metaplectic covers ζ(nz)/ζ(nz+1) | zeros at λ-parameters (ρ − 1)/n etc. | unchanged, and always in the NON-spectral chamber (the +1 shift of Gindikin–Karpelevich): Maass–Selberg positivity only sees Re ρ ≥ 1 |
| function fields, C^k (Künneth) | zeros of H^k are sums of k zeros; centre k/2, trivial bound at k | unchanged (2β)! |
| Deligne's actual trick: F^(⊗2k) for a lisse sheaf F on a CURVE U | weight 2kw grows, abscissa stays at weight/2 + 1 (dim U = 1) | multiplied by k: deviation grows, half-width fixed |
| Langlands: Sym^k π, π automorphic on GL₂/ℚ | local Satake parameter α_p ↦ α_p^k, abscissa stays at 1 | multiplied by k (this is how Ramanujan follows from functoriality) |

- **What the table says (the construction's result).** No operation on ζ itself amplifies: every operation on the
  GLOBAL zeros rescales deviation and half-width together. The two operations that amplify act on LOCAL parameters
  of an object living over a fixed base (a sheaf on a curve; a form on GL₂ over Spec ℤ), and the fixed half-width is
  the dimension of the base. In Weil II, global RH for X comes from LOCAL purity of a family's fibres over a curve
  (Lefschetz pencil). So the converter needs the zeros of ζ to be LOCAL parameters (Satake / archimedean spectral
  parameters) of a family over a base, not global zeros of anything.
- **The target object, sharpened.** A family {Π_γ} of automorphic representations (on any reductive group over any
  number field) whose archimedean Langlands parameter at one place encodes ½ + iγ for the zeros of ζ, with Sym^k
  (or a tensor-power operation) staying in the family. Temperedness at ∞ (archimedean Ramanujan, Selberg's 1/4
  type) would then be RH, and Langlands' argument proves temperedness from analytic continuation of all Sym^k.
  This is Hilbert–Pólya in Langlands' language, and the record's Colin de Verdière / Bombieri–Garrett pseudo-
  Laplacians are the closest known attempt (their "spectrum" is defined by a constant-term condition, not by
  automorphy, which is why no Sym^k exists for it).
- Rating: Quality 3, Toward RH 2. Known in spirit (Langlands, Sarnak, Deninger). New here only as a sharp target:
  "local parameters over a fixed base" is the property that every global construction on the record lacks, and it
  is the same property the October authors used without saying so (their sextic theta lives on a cover, whose Gauss
  sums are LOCAL parameters at each prime, N75).

- **H12 (lead, from N91).** The Euler product decouples the primes exactly (Landau–Gonek form on a divisor box is a
  sum of one-prime operators); any localisation in the height t (needed to see ONE zero) re-couples them. A hunch
  must say what plays the role of the localisation and why it does not undo the decoupling.

- **H13 (lead, from N94).** Objects linear in the Möbius inverse are blind to the Euler product (they see only
  μ∗1 = δ). Multiplicativity is nonlinear in a(n) and μ(n), LINEAR in Λ (a support condition). Use the Euler product
  in Λ-coordinates.

### H-4. The prime-sampling cone: see NOTEBOOK N94 (built to target; assigned to SP-operator).
- **H14 (lead, from N95).** The support of Λ alone does not decide positivity (fake weights on the prime powers can
  restore it); the values log p are needed, and imposing them is the full Weil form. H-4 closed as a shadow.
