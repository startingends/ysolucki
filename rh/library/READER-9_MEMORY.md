# READER-9 memory (reader seat, kept current)

Seat: READER-9. Writes only: `rh/library/<id>.md` digests, rows appended to `rh/library/INDEX.md`, sources under
`rh/library/src/<id>/` (untrusted text, never executed), and this file. No commits, no pushes. Digests report; they
never recommend.

## Brief (lead, 2026-11-11)
Subject: function-field RH via Stepanov's auxiliary-polynomial method (Bombieri Bourbaki 1973, Schmidt) and whether any
analogue over Z exists using structures with Frobenius lifts at all primes (Borger lambda-rings, Buium p-derivations,
Connes-Consani arithmetic/scaling site, Riemann-Roch / Hodge index, Deninger, Haran). Priority: (1) Bombieri 1973 or open
exposition of Stepanov; (2) Borger arXiv 0906.3146 intro + what F_1 is/isn't expected to give; (3) anything on
Stepanov/auxiliary polynomial for zeta / Spec Z; (4) latest Connes-Consani Riemann-Roch paper, what remains.
Answer (a) where Frobenius is used in Stepanov and what it buys; (b) analogues over Z proposed, what plays the Frobenius
derivation, what fails; (c) Borger's "all Frobenii at once", any derivation; (d) Connes-Consani frontier as they state it.
Compare with rh/NOTEBOOK.md N68 and rh/HUNCHES.md G6.

## Checked before starting
INDEX.md: no digest on function fields, Stepanov, Bombieri 1973, Borger, Buium, F_1, arithmetic site.

## Log
- 2026-11-11: seat started; memory file created.
- Fetched + READ WHOLE (as page images, 8 pp.; text layer drops formulas): Bombieri, Sem. Bourbaki 430 (June 1973),
  Numdam SB_1972-1973__15__234_0 -> src/bombieri-1973/. Key: Bombieri's version uses NO derivations; multiplicity
  p^mu comes from f being a p^mu-th power (f = sum sigma_i^{p^mu} (s_i o phi)); key lemma: injectivity of
  R_l^{(p^mu)} (x) (R_m o phi) -> R_l^{(p^mu)}(R_m o phi) when l p^mu < q, via ord(s o phi) = q ord(s). Thm 1: q=p^alpha,
  alpha even, q>(g+1)^4 => v_1 < q+(2g+1)q^{1/2}+1. (7) v_1 <= l + mq/p^mu + 1. Choice mu=alpha/2, m=p^mu+2g,
  l=[g/(g+1) p^mu]+g+1. Lower bound: Galois cover C'->C->P^1, twisted Frobenius delta_eta, sum over G.
- Fetched sources: Borger 0906.3146 (lrfoe13.tex 147k), van Frankenhuijsen 0806.0044 (zetaRH.tex 91k; proposes
  Nevanlinna model to translate Bombieri's proof to Spec Z!), Connes-Consani 2205.01391, 2306.00456 (RR for Z),
  2609.00299, 2606.06604, 2602.15941, 2307.06748.
- READ WHOLE: van Frankenhuijsen 0806.0044 (91,192/91,192 ch TeX). Key: Bombieri proof exposition; last section
  proposes translating ONLY the upper-bound step (since psi(x) <= x + O(x^{1/2+eps}) one-sided <=> RH, his Table 1);
  "construct a function vanishing at the first N primes to high order"; Nevanlinna model f(z)=prod_{p<=x}(1-pz)^{[log_p x]},
  N_f(0,1)=psi(x); basis s_i=z^{1-i}, coefficients integers b_i; "We do not know what the analogue of b_i=a_i^{p^mu}
  could be"; "no diagonal"; "do not know how to bound the Nevanlinna height". Frobenius-flow analogue: shift on R
  (Deninger), infinitesimal generator = derivative. Bombieri history: connection -> derivatives of order p = Cartier
  operator = p-th power; final proof has no derivations.
- READ WHOLE: Kopparty Rutgers notes "The Weil bounds" (45k ch pdftotext): Stepanov step explicit:
  R = A0(X,X^q) + g^{(q-1)/2} A1(X,X^q); Hasse derivs treat X^q as constant; condition l costs <= A+B+ld linear
  constraints independent of |S|; total M(A+B)+dM^2 < 2AB; nonvanishing needs A < q/2 - d; |S| <= (qB+d)/M;
  M ~ sqrt q gives |S| <= q/2 + O(d sqrt q). Bombieri part: Q = sum a_st^{2^{n-r}} M_s^{2^{n-r}} M_t.
- READ WHOLE: Tao blog 2 May 2014 "The Bombieri-Stepanov proof of the Hasse-Weil bound" (33,929 ch text):
  with q square, Frob_q = Frob_sqrt(q)^2; C1, C2 graphs; NO high-order vanishing needed at all ("factored out");
  V=R_l (x) R_m, dim pi_1 <= l + m sqrt q + 1, dim pi_2 <= l sqrt q + m + 1; injectivity if l < sqrt q (distinct pole
  orders d_i + sqrt q e_j). Remark 1: non-square q gives q+O(sqrt p sqrt q).
- Remaining: Borger 0906.3146; Connes-Consani 2306.00456 (+2205.01391 RR), 2609.00299, 2602.15941, 2606.06604,
  2307.06748 scan; Buium (p-derivations several primes); Deninger; Haran; searches "lambda-ring" "Riemann hypothesis".
- READ Borger 0906.3146 (v1, Jun 2009, "preliminary version"): intro, §1-3, §7 (Variants) whole; §4-6 statements
  and remarks only; post-\end{document} draft scanned. Key: Lambda-structure (flat X) = commuting psi_p lifting Frob_p;
  Lambda_! = big Witt space, Lambda_* = arithmetic jet space (multi-prime Buium p-jets); "Spec Z x_{F1} Spec Z must be
  defined to be W(Spec Z)"; Thm A: smooth proper over Z[1/M] with Lambda-structure => abelian Artin-Tate (Hodge (i,j)=0
  for i!=j); curves of genus >=1 have NO Lambda-structure; function-field variant: W_S(T) -> S x_k T, image = union
  of graphs of all Frobenius powers, Zariski dense (Prop, Moore determinant), not mono/epi; "translation of Weil's
  proof ... since current theory says nothing about archimedean place, hard to imagine succeeding without further
  ideas. Even so, it should be done." No uniformity property known over Z. No single derivation discussed anywhere.
  Naive zeta (draft): Z(X,t) as Witt vector with ghost <N_1,N_2,...>; "appear not to give any insight into Hasse-Weil".
- READ WHOLE Connes-Consani 2306.00456 (RR for ring Z, over S; dim_S H^0 - dim_S H^1 = ceil'(deg_2 D)+1, genus 0,
  K=-2{2}); no statement on RH/what remains. Scanned: 2205.01391 intro (RR over S[+-1], log 3, exceptional set L,
  Serre duality K=-2{2}); 2307.06748 intro+§2 (counting distribution N(u), arithmetic site, cites Borger: topos N^x
  = lambda-operations); 2602.15941 intro ("paradox": genus 0 vs infinite genus; Pic monoid = X_Q); 2609.00299
  abstract+intro (absolute twistor line; odd Frobenius). None states RR on the square / Hodge index.
- READ Connes essay 1509.05576 §§1,2,4,5 (not §3): shaded box: "what is missing is an intersection theory and a
  Riemann-Roch theorem on the square of the arithmetic site"; hoped RR inequality cdim H0(D)+cdim H0(-D) >= 1/2 D.D
  with D(f)=int Psi(lambda) f(lambda) d*lambda would suffice. No Stepanov mention.
- Scanned: Buium-Simanca 0805.0256 abstract+intro (delta_P = {delta_p1..delta_pd} finite set, commutation relations,
  gluing via "analytic continuation" along a Z_(P)-point; interesting functions exist only p_k-adically completed).
  Leichtnam 1307.3851 §2: Deninger RH via Hodge star => Theta - 1/2 antisymmetric (Serre's idea).
- KEY CORRECTION for N68: one-sided upper bound + rationality does NOT give RH for curves (Bombieri §III example
  omega1=q, omega2=1; Tao: "trace formula not enough to convert upper bounds to lower bounds"); lower bound needs
  Galois-cover twisted Frobenius. Over Z, one-sided suffices (vF table; N68's own Landau correction).
- NEXT: write digests (bombieri-1973, vanfrankenhuijsen-0806.0044, borger-0906.3146, stepanov-expositions,
  connes-consani-2306.00456, connes-essay-1509.05576, f1-frontier-scan), INDEX rows, handback.
- 2026-11-11: digests written: bombieri-1973.md, stepanov-expositions.md, vanfrankenhuijsen-0806.0044.md,
  borger-0906.3146.md, connes-consani-2306.00456.md, connes-essay-1509.05576.md, f1-frontier-scan.md; 7 rows appended
  to INDEX.md. Remaining: handback report.
