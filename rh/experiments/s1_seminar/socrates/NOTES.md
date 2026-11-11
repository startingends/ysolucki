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

## Turn 2 (2026-11-11; board B4-B70 read in full; I posted B71-B80; a container restart cut the turn after B78)

### What turn 1's questions produced (my reading of the board, for my own memory; not rulings)
- B4 -> B17, B60 (S1-mirror): mirror positivity gives only an ORDERING of the blocks, N(f_o) <= N(f_e); RH needs
  the two-sided bound |H_W| <= T_W (T_W = Weil form on the half window). S1-curv B31(a) and S1-parity B25 write the
  same algebra (I checked the factor conventions 8<phi,cosh>^2 / 4c^2 / E_+,E_0 agree; no conflict there).
- B5 -> B18: one-prime system passes every hypothesis of idea 21 and fails from L in (0.54, 0.56), odd block first.
  S1-parity B43 reproduced. "The integers" split into POSITIONS / COMPLETENESS / WEIGHTS (B50).
- B6 -> B16, B12, B23: L(chi)L(chi-bar) mod 5 has c(4) = -2 log 2, min eig -3.89; mirror test is about local roots,
  not zeros; claim sentence 2 of idea 21 DROPPED by its seat. n = 4 dial: one negative square from the factor at 2.
- B7 -> B29, B27: W-curv-3 withdrawn as worded; "one reflection, two test spaces"; exactly one positive point in
  the window L = 1. B8 -> B30: integrated open-path term is a Hankel-type form with a moving mirror; cosine 0.92
  with the D5 form (seat's blind prediction missed).
- B9 -> B51: end pair not special; "maximally non-local" WITHDRAWN; nothing in the cubic seat uses the integers.
- B10 -> B25: neither block follows from the other; m = 0 Gamma square cancels half the pole; no step uses integers.
- B11 -> B12: at zeta the hypothesis list IS "F is zeta"; new input "nothing proved".
- Then: B15 obstruction F_d = zeta(s-d)zeta(s+d); idea 21 killed (B69); barrier B11 written.
- New unproved statement everything in B58 reduces to: FACT 2, the folded ground states of both parity blocks are
  one-signed on (0, L]. S1-cubic asked the control question about it (B67). Not asked by me.

### What I asked in turn 2, and why
| post | to | question (short) | why |
|---|---|---|---|
| B71 | lead (re B69) | "Not about the integers at all; it is the size of the local roots" against one-prime and Beurling rows (roots of modulus 1, fail at 0.56 / 0.40). Full list of necessary items, one control per item; are two items the same in two languages? | Lead (B69) and S1-mirror (B50, B45) gave different answers to "what was missing". |
| B72 | S1-mirror (re B45) | Does "one wrong-sign square / one pole" separate from "roots of modulus 1"? Candidate control G_d = zeta(s) L(s-d,chi_4) L(s+d,chi_4). | On F_d both items fail together; nobody has a control that splits them. |
| B73 | S1-parity (re B59) | Before the F_d table: blind L_d as d -> 0; tilt pole / Gamma / primes one at a time at d = 0.1. | Barrier B11 says only the prime part knows the centre; the kernel has three tilted parts. |
| B74 | SP-reflection | Which condition on c itself is equivalent to "representing measure on |chi(p)| = 1"; smallest finite test separating d = 0.1 from d = 0 at p = 2. | Priority (2): d = 0 stated on the prime side. |
| B75 | SP-operator (re B60) | Is the doubling step |H_W| <= T_W a named object; a theorem reading it off the kernel; which hypothesis fails for F_d. | B60 is the surviving exact reformulation; needs a specialist. |
| B76 | S1-parity | Nominations for Lean: B25, B32, B56, B58; which step of B32 is infinite-dimensional; is B58 Fact 3 an equality or a cap + computed match. | Coordinator's item (3). |
| B77 | S1-curv | Nominations: F1-F4; list every hypothesis that could fail on some window. | Same; the checker already found one unstated hypothesis (lambda_1 > 0). |
| B78 | S1-mirror | Nomination: Theorem 2 of PROOF_mirror_criterion.md; Step 2's own bracket about the exponent; can Corollary 3 be stated prime by prime, finite-dimensional. | Same. |
| B79 | SP-reflection (re B25) | Needs SP-operator's toolkit: reconstruction when the mirror form has exactly one wrong-sign square (Pontryagin kappa = 1?); what changes for F_d; what corresponds to |H_W| <= T_W. | Cross-specialist (resume instruction, priority 3). |
| B80 | SP-operator | Needs SP-reflection's toolkit: the operators T_m k_a = k_(ma) of the mirror space; what kind of operator is T_p for zeta and for F_d; is d = 0 an operator identity and which identity on c; do the T_m extend to the window. | Cross-specialist; also priority (2). |

### Self-check
- 10 posts this turn (brief said 5 to 8; the resume message added the two cross-specialist questions).
- B72 proposes a control "to test, not asserted". B73's last sentence quotes barrier B11. B80 asks whether d = 0
  "is an operator identity"; I did NOT state the identity I suspect. Keep it that way.
- I did not ask S1-cubic for nominations (coordinator: its first turn was unfinished). It has PROVED items
  B51(b), B62 (block curve (1+3 theta)/(2+2 theta)), B63 (one-field form): ask next turn.

### Waiting for
lead B71; S1-mirror B72, B78 (may leave the board); S1-parity B73, B76 (+ its F_d table, B59); S1-curv B77;
SP-reflection B74, B79; SP-operator B75, B80. New seats to watch: K-atlas (pairings of failures), FORMAL (gaps).
Others' open questions I am watching: lead B70 (kink at d = 0), S1-cubic B65, B66, B67 (FACT 2 on controls).

### Reserve for turn 3
1. THE SIEVE (idea 9) after B58 Fact 3: feasible interval of a weight = mu sqrt(n)/(2g). So the sieve measures
   mu(L). Lead's B69 calls the sieve the one recorded statement forcing positions + completeness + weights at once.
   Ask (lead or S1-parity): for a control just inside its own threshold (F_d before its first failing window; zeta
   with a wrong weight within the allowed 1e-5), are the OTHER weights pinned as sharply around the wrong values?
   If yes, what does the sieve say that singles out the true ones?
2. FACT 2 (one-signed folded ground states): once B67's controls are in, ask whether it is a restatement
   (does it fail for F_d / Beurling exactly when positivity fails, or earlier, or never?).
3. If B74 and B80 come back with different "prime-side statements of d = 0", put them side by side and ask each
   specialist to translate the other's.
4. If B73 shows one tilt alone already fails at a small window: ask what that hybrid violates (it is not an
   L-function): which identity links the three parts at d = 0?
5. S1-cubic nominations (see self-check). Also B62: the two-halves constant 0.8364 vs 5/6: does F_d or the
   one-prime system sit on the same mean-field curve? (S1-cubic asked S1-curv B66; watch.)
6. Lead's B12(2) "a Hilbert space on which multiplication by each integer is self-adjoint ... a structure in
   search of a theorem": B80 now asks SP-operator about exactly these operators. Follow whatever comes back.
7. Unused from turn 1's reserve: fibre rows in the mirror spectrum (answered in substance by B25/B63: skip);
   position asymmetry (1.9996, 2.0080) with 2 at the left end: still unexplained, ask if a seat touches it.

## Turn 2, second resume (2026-11-11, after a second container restart)
Board on return: B80 when I read it (B81-B84 arrived while I was posting, see below), nothing answered, nothing lost (the board is on disk). Open: B65, B66, B67 (S1-cubic's),
B70 (lead's), and my B71-B80. Posted:
- B85 (note, to all): the 14 open questions listed by addressee; asked seats to say if a number lived only in a
  killed process rather than quote it from memory. No content repeated.
- B86 (question, S1-cubic, re B36): Lemma A written out for F_d: how many fibre nodes, which signature; what
  replaces the Perron step when the target signature has more than one positive eigenvalue; is d = 0 visible as a
  rank drop, on the prime side or only on the pole side. (Priority 2; S1-cubic had no open question to it.)
- B87 (question, S1-cubic): Lean nominations for B51(b), B52, B62, B63; is "E has one positive eigenvalue on every
  window" proved on L^2[-L, L] or on the box compression. (Closes the gap noted in my self-check.)
Turn-2 total: 12 questions + 1 note. Do NOT add more until answers arrive.
New on disk: rh/library/ (whole-paper digests; background only, never a direction; I skimmed README/INDEX only).
Reserve for turn 3 unchanged, minus item 5 (S1-cubic nominations: now asked).
Arrived while I was posting (read after):
- B81 (S1-mirror, answers B72): G_d = zeta(s) L(s-d,chi_4) L(s+d,chi_4) is mirror positive, has exactly ONE
  wrong-sign square, zeros off the line. So "one pole" does not single out d = 0; hope of B45 withdrawn by the seat.
  Seat's prime-side name for what F_d, G_d fail: "c(p^k) p^(-k/2) bounded in k and not tending to 0"; it calls this
  one more NECESSARY item (one-prime, Liouville, Beurling all have it).
- B82 (S1-mirror, answers B78): nominations: D1 as a finite identity (mathlib has vonMangoldt); Corollary 3 as a
  finite Hankel/Vandermonde statement; the Step 2 norm bound. Exponent in Theorem 2 corrected in the file.
- B83 (S1-mirror -> SP-reflection): boundedness = upper half of Ramanujan only? semigroup without identity;
  Levy-Khinchin. B84 (S1-mirror -> SP-operator): is R = T_W^-1 H_W the past/future angle operator; recursion.
Then I posted:
- B88 (note): correction of B85 (B72, B78 were already closed); open list as of B87 by addressee.
- B89 (question, S1-mirror, re B81): the "weight at 4 times 1.01" control (B19) sits between the B81 statement and
  B50 (iii): does it satisfy B81's statement; its local roots at 2; one statement on c(p^k) that F_d, G_d and the
  1.01 control all fail and zeta passes, as a test on [c(p^(i+j))].
Turn-2 total: 13 questions (B71-B80, B86, B87, B89) + 2 notes (B85, B88).
Lesson: read the board again immediately before posting a status note; B85 was stale by one minute.
Open and waiting: lead B71; S1-mirror B65, B70, B89; S1-curv B66, B77; S1-parity B67, B73, B76 (+ F_d table);
S1-cubic B86, B87; SP-reflection B74, B79, B83; SP-operator B75, B80, B84.
For turn 3: B71(c) asked the lead whether "weights exactly log p" and "roots of modulus 1" are one item; B89 asks
S1-mirror the same thing through a control. If the two answers differ, put them side by side.
