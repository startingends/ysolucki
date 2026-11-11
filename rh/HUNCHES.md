# Hunches: how the quasi-RH proof was built, how ours were built, and what to do differently

Asked for by the owner (2026-11-11): dissect the quasi-RH proof as "how they found another island similar to
ours": which hunches it went on, what each led to, how they compare with ours, how to make better ones.
STATUS: provisional. Part A is read off a second-hand summary of an exposition (notebook N42); the papers are being
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
