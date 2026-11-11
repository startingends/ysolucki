# PROGRESS of SP-modular, session 1 (2026-11-11)

Written as I go. Times are UTC from `date -u`.

## 00:49 start. Read the record
Preamble, roster, SP-reflection's CHARTER/LIBRARY/MEMORY, HUB, KNOWLEDGE (B1-B11), JOURNAL J4, NOTEBOOK N33-N38,
ATLAS F17/F20/F22, ideas 12/13, board B13-B17, B69, B71, B81, B111-B113, B117, B118, B131-B133, B137, B139, B140,
B147-B150, B158, B160, B161, B163-B165, B168, B172; library INDEX; digests brs-fourier-interpolation.md and
suzuki-1606.05726.md in full.

## 00:53-01:25 sources read (details in LIBRARY.md)
Zagier 1981 (whole paper, OCR text); Lagarias-Suzuki math/0412039 (abstract, sec. 1, Thm 2.1, sec. 3 start, sec. 5);
Conrey-Ghosh math/9204217 (sec. 1-2, start of 3); Blomer-Brumley 1003.0559 (introduction); arXiv 1809.07605
(Maass-Selberg lemma); Long 0707.3315 (Berger's theorem); 2011.07796 (theta-power eigenform lemma); BRS source
(definition of moderate growth, M_k(Gamma_theta, eps), Prop. 3.1).

## PREDICTIONS written before computing (rule 4)
Wed Nov 11 01:08:01 UTC 2026
(P1) dial coefficients. r_n(m) = coefficient of q^m in (1 + 2q + 2q^4 + 2q^9 + ...)^n. By hand: r_n(2) = 2n(n-1),
     r_n(3) = (4/3)n(n-1)(n-2), r_n(7) = n(n-1)(n-2)(n-3)[8/3 + (8/315)(n-4)(n-5)(n-6)]; hand value r_2.5(7) = -2.1875.
     PREDICTION: the script reproduces -2.1875 exactly.
(P2) PREDICTION (60% confident): for n = 3.5 NO coefficient r_n(m), m <= 2000, is negative; (80%) none for
     n = 4.5, 5.5, 6.5, 7.5 either. If P2 holds, "coefficients >= 0" singles out the integers only for n <= 3.
     If it fails, the first negative m for n = 3.5 is of the form 4^a(8b+7)... no: those vanish at n = 3 only; I
     have no candidate m. Second guess recorded: if a negative exists it is at m = 2^(odd) large (where r_4 is small).
(P3) Hejhal's statement quoted by Lagarias-Suzuki: for 0 < y < 1 the constant term a_0(y,s) = xi(2s) y^s +
     xi(2s-1) y^(1-s) has zeros off the line with arbitrarily large real part. PREDICTION (from |phi(s)| =
     y^(2 sigma - 1) and |phi(sigma+it)| ~ sqrt(pi/t)): for y = 0.9 there is a zero near
     sigma = 1/2 + log(t/pi)/(4 log(1/y)), i.e. sigma about 4.5 to 5.5 for t between 15 and 30; for y = 1.1 the same
     search finds none. Impostor contrast: none (this is a check of a cited theorem, not a test of an idea).

## Results of the three predictions (logs: dial_coeffs.log, hejhal_check.log; one implementation each)
- (P1) HIT: r_2.5(7) = -35/16 = -2.1875 exactly (exact rational arithmetic).
- (P2) MISS for n = 3.5: negative coefficients exist (76 of the first 2000; first at m = 16, 40, 64, 88, 112, 128;
  minimum -1367.7 at m = 1888). Also n = 3.1 (first at m = 28, 47, 103) and n = 3.9 (m = 64, 128, 256, 448, ...: 9 of the
  first 1000). My second guess (multiples of large powers of 2, where r_4 is small) describes n = 3.5 and 3.9, not 3.1.
  HIT for n = 4.5, 5.5, 6.5, 7.5: no negative coefficient among the first 1000.
  Reading: coefficientwise positivity separates the integers from the non-integers on the dial exactly below
  n = 4 (PROVED on (0,3], computed at three points of (3,4)); above 4 the dial is blind to it (computed).
- (P3) HIT: y = 0.9: zero of a_0(y,s) at s = 4.70686244206 + 18.1261394951 i (predicted real part 4.659);
  y = 0.5: four zeros with real part 1.259 .. 1.458 for 15 <= Im s <= 30; y = 1.1: none found by the same search.
  mpmath, 30 digits, not interval-certified; "none found" is not a proof of absence (the theorem for y >= 1 is
  Hejhal / Lagarias-Suzuki).
