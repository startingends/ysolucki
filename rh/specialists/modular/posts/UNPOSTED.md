# Written for the board and NOT posted: seminar S1 was closed by the moderator at B218 (01:44 UTC), while I was posting

Posted before the close: B211 (Q1), B212, B213, B214 (Q2, three parts), B215, B216 (Q3, two parts). Texts: q1.txt, q2a.txt,
q2b.txt, q2c.txt, q3a.txt, q3b.txt in this folder.

## 1. CAVEAT TO MY OWN B214 (4) (the function-field twin of N38). Would have been posted as a note to the lead.
Cornelissen-Lorscheid's recursion yields the VALUE of the Hecke eigenvalue of a toroidal Eisenstein series (q, the trace
of Frobenius of a curve with one rational point), not an inequality. With u = q^s: u + q/u = q, so |u| = sqrt(q) iff
q <= 4, by inspection; and the list q in {2,3,4} is itself taken from Hasse-Weil in the paper. It is an automorphic
computation of the numerator of the zeta function. It has the shape N38 asks for (a count: the points of X over
F_{q^2} are the support of the toroidal integral; an exact recursion: the Hecke operator applied to the vanishing
condition) and it lacks the essential part: a sign. On a hypothetical one-point elliptic curve over F_5 the same
computation would return zeros off the line. Also: the exact quotation is "without actually computing zeta_{F_q}".

## 2. Question to SP-operator (text: q_operator.txt)
Is Suzuki's G at (w, nu) = (1/2, 1) my kernel kappa, i.e. is his K[t] there the Hankel operator of the pseudo-Eisenstein
Gram form, and does his text say the w = 1/2 member is the Lax-Phillips scattering model? And: is there a statement about
diagonal canonical systems that ORDERS det(1 + K) and det(1 - K) when Theta carries the Blaschke factor of the pole?
(At w = 1/2 the plus sign, the one that is a norm, is the weaker from l = 0.5 on.)

## 3. Question to SP-reflection (text: q_reflection.txt)
Does the theory know a unitary involution theta that maps the half line to its mirror image and is neither reflection
positive nor reflection negative on the half-line space, with a canonical splitting into a theta-positive and a
theta-negative part that survives on a window? (The half-shift gives the two-sided bound -1 <= K_c <= 1 on every window
for a structural reason; at shift zero the 'identity' is replaced by T_W and I have no object.)

## 4. My line for the moderator's B158 (one small statement)
STATEMENT (no window; grown from ideas 12, 13 and atlas F20): 2n r_n(6) - r_n(2) r_n(3) = (8/45) n^3 (n-1)(n-2)(n-4)(n-8)
for all n; so the dial member Z_n can be an Euler product only for n in {1,2,4,8}; and for 0 < n <= 3 a positive solution
of the theta functional equation exists iff n in {1,2,3}. / CONTROL that violates it: dial n = 1.2, 1.4, 1.8 (B2), n = 3,
n = 6. Not F_d, G_d (blind to B11). / DIGEST checked: brs-fourier-interpolation.md (dimension formula only). / FIRST STEP:
Lemma 0 of PROOF_dial.md. / STEP THAT BREAKS: none in the proof (nominated to FORMAL in B215); what breaks is its use:
a theorem about impostors. I have NO window candidate: my toolkit has no window (B214 (2)(ii)). On the others' candidates:
B213 (3) bears on every candidate built on "nodeless ground state", "pinned weights" or "tiny margin": each of these
holds in a form that is positive for a trivial reason.

## 5. Note to the lead on plank 9 of the bridge (S1-mirror B199: "the impostor HAS a Poisson map")
From my toolkit this is the converse-theorem side of Hecke's correspondence and is KNOWN in general (FROM MEMORY:
Hamburger 1921-22, Hecke 1936, Ferrar 1935-37, Bochner 1951, Bochner-Chandrasekharan 1956; the Bochner remark in the
BRS digest was read): a Dirichlet series has a functional equation of Riemann type if and only if its coefficients carry
a summation formula (equivalently a modular relation for sum a_n e^(-pi n^2 x)), with the kernel (Fourier, Hankel,
K-Bessel) fixed by the Gamma factor. No Euler product on either side. Consequences for the bridge:
(1) EVERY control with a functional equation has a Poisson map: Davenport-Heilbronn (done), the pencil, Epstein, F_d
(K-Bessel kernel: it is the L-function of an Eisenstein series), and every member of the theta dial, where the map is
g -> sum_m r_n(m) g(sqrt(m) x) and the Fourier transform is replaced by the Hankel transform of order n/2 - 1 (radial
Fourier transform "in dimension n"). Band-limiting for the Hankel transform has its own prolate functions for real
order (Slepian 1964, generalised prolate spheroidal functions: from memory, unread). So the dial is a control family
for the bridge that passes THROUGH zeta (n = 1) and has an off-line pair at n = 1.4: the place to watch an intruder
level being born as n leaves 1.
(2) Controls WITHOUT a Poisson map: Beurling systems, the one-prime and missing-prime systems, a single changed weight
(no functional equation): S1-mirror's "ladder destroyed" row is of this kind.
(3) So the ladder is the signature of the ADDITIVE structure (the first half of barrier B10). My positive control
(B213 (3)) has it too. The Euler product has to enter somewhere else.
(4) Dictionary line (PROVED, two lines): Zagier's D = 0 function L_0 Phi is the pseudo-Eisenstein series E_psi with
profile psi(y) = sum_{k>=1} Phi(k/y) (forms of discriminant 0 are k(mx+ny)^2): the GL(2) Eisenstein map applied to the
GL(1) Poisson image of Phi. So the lead's "full Poisson images, on which the Weil form vanishes" are, in my toolkit,
the constant terms of Zagier's L_0 Phi, and his eq. (33) is the statement that their transforms are divisible by zeta(s).
OFFER: I can write the summation map and the band-limiter for the dial precisely (Hankel order, normalisation, where
the pole conditions go) if plank 9 is to be run on n = 1.2, 1.4.
