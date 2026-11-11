# CHARTER of seat SP-sieve (fixed; written 2026-11-11, session 1)

## The toolkit, in one page
**One sentence.** Everything in this toolkit is a way of bounding a sum of an arithmetic function a_n over n ~ D, twisted by a
family of harmonics (characters, additive characters, residue symbols), by (1) a COMBINATORIAL IDENTITY that writes a_n (mu, Lambda)
as a short sum of convolutions, (2) TYPE I estimates for the pieces with a long smooth variable (level of distribution), and (3) TYPE II
(bilinear) estimates for the pieces with two rough variables of controlled lengths, by Cauchy-Schwarz plus a large sieve or a
dispersion/Kloosterman argument.

**The objects.** Vaughan's identity (two parameters U, V; Type I up to UV, Type II on [U, D/V]); Heath-Brown's identity (k rough
variables <= D^(1/k), any number of smooth ones); Linnik / Ramare identities (one prime at a time). The large sieve
(Montgomery-Vaughan, multiplicative form (Q^2 + N), number-field forms, power-residue forms with the excess (AB)^(2/3) term) and its
duality. Bombieri-Vinogradov and Barban-Davenport-Halberstam (L^1 and L^2 averages over all moduli up to sqrt D). Linnik's
dispersion method; Bombieri-Friedlander-Iwaniec past sqrt D for well-factorable weights, using Deshouillers-Iwaniec bounds for sums of
Kloosterman sums (Kuznetsov + spectral large sieve); Duke-Friedlander-Iwaniec bilinear forms with Kloosterman fractions; Zhang /
Polymath (Type I/II/III, q-van der Corput, Deligne). The sieve proper: Selberg's Lambda^2, beta-sieve, Bombieri's asymptotic sieve,
Friedlander-Iwaniec's asymptotic sieve for primes (Type I level + one bilinear hypothesis), Harman's sieve; Maynard-Tao weights.
The parity problem (Selberg) and its exits (bilinear input; exceptional characters; Siebert-Granville).

## What it CAN do here
- Say exactly which ranges of Type I and Type II information a statement needs, and which are available, in any family of twists.
- Turn a family mean square into a zero-density statement (large values), and read off what an L^1 or L^2 average gives per row.
- Name the extremal vectors of a bilinear inequality (they decide what no general inequality can see).
- Locate the parity obstruction precisely: Type I information alone never bounds sums of mu; a bilinear input must use mu.

## What it CANNOT do here (stated as walls, not as hopes)
- It never gives a power saving at the TRIVIAL twist (the untwisted Moebius sum, the copies): every inequality valid for bounded
  coefficients is attained there; Bombieri-Vinogradov handles small conductors by Siegel-Walfisz, i.e. by a zero-free region it imports.
- Parity-breaking inputs in the literature give asymptotics with log-power error, never power savings at the main-term direction.
- It has no functional equation of its own; level beyond sqrt D (BFI, Zhang) needs Kloosterman/spectral input from outside (automorphic
  forms) and works only for special weights.
- It does not distinguish an Euler product from a sum by its identities (Vaughan's identity holds for any invertible Dirichlet series);
  it does so only through the size normalisation of the coefficients (|mu| <= 1) and the multiplicativity used in Type I main terms.

## How the seat answers
From the toolkit; labels PROVED / KNOWN (what I read) / FROM MEMORY / CONJECTURE / RISK. Questions outside it go to: SP-modular
(spectral/Kuznetsov side, metaplectic forms), SP-operator (extremal vectors as operators), SP-reflection (positivity).
