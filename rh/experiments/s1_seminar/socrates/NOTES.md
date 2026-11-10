# S1-socrates NOTES (moderator of seminar S1; memory between turns)

Role: I only ask. No rulings, no scores, no likelihoods, no claims of my own. One question per post, addressed,
quoting a line or a number. Board: `python3 tools/board.py --board s1 read --me S1-socrates --unread`.

## Turn 1 (2026-11-10, board at B1-B3 when I arrived; I posted B4-B11)

### What I read
claude.md Workflows (Socratic seminar), SUBAGENT_PREAMBLE, PROJECT_BRIEF rules 1-9; IDEAS #10, #11, #21 with logs;
NOTEBOOK N23-N32; r2_cubic (PROGRESS, PROOF_trickle, PROOF_BE_cubic, refuter verdict table); r2_curv (PROGRESS,
PROOF_bochner_parity, refuter PROGRESS incl. R9, R10, R13); r2_parity (PROGRESS, heads of the three PROOF files);
e21_reflection (PROGRESS, mirror.log, mirror.py.txt). Not read in full: second halves of PROOF_parity_index and
PROOF_first_failure, r2_parity refuter beyond its predictions, docs/KNOWLEDGE.md, docs/HUB.md.

### Board before me
B1 lead (open): what must a bridge mirror positivity -> shift inequality say, where does it use the integers, is it
   true in the two-prime model. B2 lead (claim, COMPUTED): mirror.log table. B3 lead (question, to all): weakest
   precise statement "mirror + Gamma + integers => block inequalities" not already false for Beurling.

### What I asked, and why
| post | to | question (short) | why (the thing in the files that made me ask) |
|---|---|---|---|
| B4 | S1-mirror | Write the bridge's conclusion as one displayed inequality: which kernel's shift form, on which side? | Lemma 2 (parity) states RH as UPPER bounds on N; the cited one-variable theorem gives a LOWER bound on a shift form. The direction is never written down in idea 21. |
| B5 | S1-mirror | One prime: define "the shift inequality on that lattice" so it can be typed in; is it true for the one-prime system on every window; if not, which hypothesis fails? | Idea 21's "smallest" starts at two primes and says "on that lattice" without saying where the diagonal and the pole go; N25: on atoms the Weil form is infinite; N27: no-atom form fails from L = 0.362. A one-prime system looks mirror positive by the criterion itself. |
| B6 | S1-mirror (re B2) | Control L(chi)L(chi-bar), chi mod 5, chi(2) = i: entry c(4), smallest eigenvalue; is the test about zeros or about local roots? | New input (2) says "real local roots"; the claim says "zeros on the centre line". Different properties; no control in mirror.log has complex local roots. |
| B7 | S1-curv | Restate W-curv-3 as a checkable statement given D4 (indefinite on boxes, -1.12) versus refuter R9 (PSD on log-integers, -2.1e-16; -0.475 at 3/2, 4/3). How many positive points inside the window L = 1? | Seat and its refuter read D1 in opposite words; idea 21 is built on the refuter's reading. |
| B8 | S1-curv | Is the open-path (edge) term of B3 a Hankel-type form (e.g. reflecting at x = L)? Which computation decides, what number means "unrelated"? | Both are boundary remainders of a translation-invariant kernel; nobody has compared them. (The refuter disputes "deficit sits at the edge": deleting the open-path term LOWERS the constant, 0.522 -> 0.240 at the centre. Not yet asked.) |
| B9 | S1-cubic | R* = n-1: is the end pair (0, n-1) the only obstruction; exact statement believed for R = n-2; does anything in the lemmas use integers? | P5 numbers; same R* for Beurling; separation 2L is also the top of the mirror variable. |
| B10 | S1-parity | With D5 (N_even - N_odd = 4 Hankel): does either block inequality follow from the other when Hankel >= 0, what is missing; is the odd-block-first failure (0.37-0.38) explained by it; any step using integers? | Parity's blocks and curv's D5 are stated in different files and never combined. Theorem U says positions need not be logs of integers. |
| B11 | lead (re B3) | Is "Euler product with real roots + this Gamma factor + atoms at integers" different from "F is zeta"? What does the mirror FORM let a proof use (rule 2)? Which two-prime number would make you drop the bridge? | D1's own proof says the matrix IS the Euler product of -zeta'/zeta. |

### Self-check on my own conduct
- B5 contains "so it passes your test" and B10 contains "so ... N(f_o) <= N(f_e) for every phi". Both are one-step
  inferences from the seats' own statements (the criterion; D3 + D5), used to set up a question. They are close to
  the line of "no claims of my own". Next turn: phrase such steps as "does it follow that ...?".
- B6 names c(4) for a specific control without stating its value. Good; keep it that way.

### Waiting for
- S1-mirror: B4 (direction), B5 (one prime, definition), B6 (complex-root control).
- S1-curv: B7 (restated wall), B8 (edge vs mirror).
- S1-cubic: B9. S1-parity: B10. lead: B11.

### Follow-ups held in reserve (ask only when the answers make them specific)
1. n = 4 dial: mirror.log shows exactly ONE negative eigenvalue; N32 asks whether that integer "counts something
   about where the zeros are". Parity's Theorem 4 gives the negative index of the SHIFT form as the number of
   off-line zeros. Ask S1-parity / lead: what is nu for the n = 4 member, and can the integer 1 be predicted from
   the Euler factor at 2 alone (local roots and multiplicities), without the zeros?
2. To S1-curv: the refuter's "deleting the open-path term lowers the constant (0.522 -> 0.240)" versus the seat's
   "deficit comes from the window edge (-1.57)": what definition of "the deficit sits at" does each number measure?
3. To S1-curv: refuter R10: Theorem A (A1) second line needs lambda_1 > 0 (false for L <= 0.10). Does the seat
   accept the repair? (Verification matter; ask only if it bears on the bridge.)
4. To S1-cubic: Lemma D (every certificate annihilates the near-null ladder): what does the mirror sum of squares
   do on lane A's near-null vector? Needs B5's definition first.
5. To S1-cubic: where do the fibre rows p = e^{x/2}, q = e^{-x/2} (as functions a^{+-1/2} of a = e^x) sit in the
   mirror spectrum, and with which sign?
6. To anyone answering B3 with "Beurling passes mirror positivity on its own lattice": at L = 0.5 the feasible
   position interval for the first prime is about [1.9996, 2.0085] (parity) with 2 near the LEFT end. Does a
   bridge have to explain that asymmetry?
7. If two answers to B4 give different directions or different kernels: put the two displayed inequalities side
   by side and ask each author which line of the other's they would change.

### Things to watch for in answers
- An answer that restates the idea instead of writing the object (B4, B5): ask again for the formula.
- An answer to B6 that changes the claim silently: ask which sentence of idea 21 is now withdrawn.
- "It is true for Beurling too" without a line number: ask for the line.
