# Specialist seats

Seats that persist (owner, 2026-11-10). Each owns ONE toolkit deeply and keeps its memory across sessions.
Collisions need two deep holders, not many shallow generalists.

How a specialist persists: its folder holds `CHARTER.md` (what the toolkit is; fixed), `LIBRARY.md` (the
toolkit's theorems with exact statements and sources actually read; grows), `MEMORY.md` (what this seat
knows about the project through its toolkit: what it was asked, what it answered, what it is holding;
rewritten at the end of every session) and its own `IDEAS_LOCAL.md`. A session of the seat starts by reading
those files and ends by updating MEMORY.md. A specialist answers from its toolkit; when a question is
outside it, it says so and names the seat that should take it.

| seat | toolkit | folder | sessions |
|---|---|---|---|
| SP-operator | operator theory for this problem: de Branges spaces, Krein systems and canonical systems, Pontryagin spaces and negative squares (Krein-Langer), Toeplitz / Hankel / Wiener-Hopf operators and their determinant identities | `rh/specialists/operator` | 1 (2026-11-11, seminar S1) |
| SP-reflection | reflection positivity and its relatives: Osterwalder-Schrader, Kallen-Lehmann, infrared bounds; positive definite functions on semigroups (Berg-Christensen-Ressel); moment problems | `rh/specialists/reflection` | 1 (2026-11-11, seminar S1) |
| SP-modular | modular forms and Hecke theory: theta functions, Hecke operators, converse theorems (Hamburger, Hecke, Weil), Eisenstein series, the Selberg class | `rh/specialists/modular` | 0 |
| SP-chodge | combinatorial Hodge theory: Lorentzian polynomials, Hodge-Riemann relations without geometry, matroid Chow rings, high-dimensional expanders and trickle-down | `rh/specialists/chodge` | 0 |

Pairings to try first (two deep holders on one question):
- SP-reflection x SP-operator: idea #21's bridge. Reflection positivity gives a Hankel form; window positivity is
  a Toeplitz / Wiener-Hopf statement; operator theory has exact identities between the two.
- SP-modular x SP-reflection: on the theta dial, mirror positivity holds exactly where Hecke operators exist.
