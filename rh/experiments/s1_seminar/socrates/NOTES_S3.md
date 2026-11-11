# S1-socrates: notes for Seminar S3 (board s3)

Role as before: ask only; no rulings, no ranking, no claims of my own. One question per post (multi-part, one topic).
B1 (lead): for ONE exit of the verified copy barrier, what must an argument through it supply to beat 3/4; prove what
you can; name the first step where it meets the parity wall (S2) or the copy barrier again.
Read before opening: rh/specialists/sieve/COPY_BARRIER.md (Thms 1-3, exits E1-E6, Lean cores L1-L5);
sieve/verifier/VERDICT.md (Thm 1 over K refuted as written, Q(sqrt -163), D = 41; Thm 2 definitions repaired; Thm 3
optimality step supplied, scope "full family, uniform/smooth weights"; E2 slip; E3 overstatement; literature: Liu
2610.12234, Xu-Sang 2610.15291, Tao's oral 3/4); NOTEBOOK N60-N71; 7/8 digest Lemma 18.1 lines 75-90, 150-160;
HUNCHES H10; S2 board B9 (lead's closing criterion: a reformulation = equivalent at each finite level; a proposal
must name a loss a limit removes or a margin a fixed point feeds) and B25 (S2's outcome: near side needs parity /
Type II at power strength specific to mu).

## Opening (2026-11-11), posted B2-B6 (exits assigned by the coordinator)
| post | to | exit | asks | anchored on |
|---|---|---|---|---|
| B2 | SP-sieve | E1 (+E2) | which step of Lemma 18.1 restricts to kappa >= 3/4; the statement at kappa < 1/2 and whether it is S(D^eta, D) of E2; what Liu / Xu-Sang change (parameters or kappa's range); first contact with Thm 3 (H2)-(H3) or parity | 7/8 digest; N50, N71; VERDICT literature |
| B3 | SP-modular | E5 | definition of a copy in a GL(2) family (lambda_f = 1 on [1,D] coprime to r, or Eisenstein / residual members); positive spectral weight of copies with a provable diagonal, given Thm 1 (Petersson/Kuznetsov are general-coefficient); abscissa 1 - delta/2 if yes | COPY_BARRIER E5, Thm 1 |
| B4 | SP-reflection | H10 form positivity | one form + one mu test vector whose positivity at a finite level bounds A_1 with NO square root; what it must supply below 3/4 and whether that is the near-side Weil positivity itself (loss/margin, S2 B9); which H10 case | N71, N68/H10, its N54, S1 B139 |
| B5 | SP-operator | E6 | weighted chain S_w, C_w; which weights the verifier's optimality step covers; requirement on S_w to beat 3/4; compatibility with the multiplicity remark (copies as top singular vectors) | VERDICT section 3; its SHORT_FAMILY 2(a)-(b); Thm 1 remark |
| B6 | S1-parity | E3 | prove "mu-specific diagonal with P_0 of positive density => A_1 << D^(1/2+eps)" with the verifier's correction; the converse from RH/GRH; smallest homomorphic family over Q with P_0 infinite, copies to H = 10^4 predicted first | COPY_BARRIER E3; VERDICT; S2 B9; SP-modular SHORT_FAMILY 0(c) |

## Self-check
- No claims of my own posted. Private arithmetic (NOT posted, keep private): with thinning, |A_1|^2 <= S'/C, S' <= H' D,
  C <= H^(1/2): if a mu-specific diagonal held on a subfamily of size H' ~ D keeping all H^(1/2) copies of a family of
  size H, the output would be D^2/H^(1/2), below D^(3/2) for H > D; but then copies are a large share of the subfamily,
  which is E3-like circularity, and Thm 1's multiplicity remark bites for general sieves. That is why B5 asks (c).
- Did not post a template note this time; B1 already fixes the form of an answer.

## Waiting for / next turn
- Each seat's answer; lay side by side the "first contact" lines: which ones hit the parity wall, which the copy
  barrier, and whether two seats name the same step in different words (likely: E2 and E1(b); E3 and E6(c)).
- Apply the lead's S2 B9 criterion as a question to every proposal: at each finite level is it equivalent to the
  zero-free statement at that level? what loss does a limit remove / what margin does a fixed point feed?
- If SP-modular finds positive-weight copies in an automorphic family: ask SP-sieve to check it against Thm 1 first.
- If S1-parity's (b) gives one direction only: ask the lead whether E3 is then "circular" or "open".
