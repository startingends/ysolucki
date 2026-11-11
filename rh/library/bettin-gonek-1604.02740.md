BACKGROUND ONLY: what this paper establishes and where it stops. Not a direction for the project, not a
recommendation, not a ranking (owner's instruction, `rh/library/INDEX.md`).

# S. Bettin, S. M. Gonek, "The θ = ∞ conjecture implies the Riemann hypothesis", arXiv 1604.02740 (Apr 2016); Mathematika 63 (2017) 29-33 (per search summaries)

Reader: READER-8, 2026-11-11. Source: arXiv TeX `theta_infinity_implies_RH_5_2_.tex`, saved as
`rh/library/src/mollif_1604.02740/bg.tex`. Includes, as section 8 below, what could and could not be obtained of
**D. W. Farmer, "Long mollifiers of the Riemann zeta-function", Mathematika 40 (1993) 71-87**: NOT OBTAINED
(Cambridge Core paywall; no open copy found by two web searches; the AIM summary page "Long Mollifiers" returns 404).
Everything said about Farmer here is SECONDARY, from Bettin–Gonek, Radziwiłł 1207.6583 and PRZZ 1802.10521.

## 1. What was read
**14,698 / 14,698 characters (364 / 364 lines)** of Bettin–Gonek: introduction, both theorems, the whole proof,
bibliography. Farmer 1993: nothing.

## 2. What it proves
I_N(T1,T2) := ∫_{T1}^{T2} |M_N(½+it)|² |ζ(½+it)|² dt, with M_x(s) log x := Σ_{n ≤ x} μ(n) n^{−s} log(x/n)
(Levinson's mollifier; M_x := 0 for x ≤ 1).
- **Background quoted.** Levinson: lim I_{T^θ}(0,T)/T = 1 + 1/θ for 0 < θ < ½ (their eq. (1.2)); Conrey: the same for
  θ < 4/7 "with a slightly different mollifier". "Initially it was believed (see [Farmer]) that (1.2) does not hold
  when θ > 1. However, Farmer produced a heuristic argument suggesting that it holds for every θ > 0, and called this
  the 'θ = ∞ conjecture'. Moreover, he proved that this conjecture implies κ = 1 [100% of zeros on the line]. He also
  argued that a slightly stronger form of the conjecture implies Montgomery's pair correlation conjecture."
  Radziwiłł: as θ → ∞, M_{T^θ} is essentially the best mollifier of its length; Levinson's method can give κ = 1 only
  with θ arbitrarily large.
- **Theorem 1.** Let θ > 0 and suppose I_N(0,T) ≪_ε T^{1+ε} for every ε > 0 and all 2 ≤ N ≤ T^θ. Then ζ has no zeros
  in Re s > ½ + 1/(2θ). If this holds with θ arbitrarily large, RH is true.
- **Theorem 2.** The same with I_N(T, 2T) in place of I_N(0, T) gives no zeros in Re s > ½ + 2/θ (a quasi-RH only for
  θ > 4). The authors call Theorem 2 "in a certain sense best possible": with one simple off-line zero ρ0 = β0 + iγ0,
  I_N(T,2T) = c1 N^{2β0−1} T^{−3} (log T)/(log² N) (1 + Re(N^{2iγ0}|ζ′(ρ0)|²/ζ′(ρ0)²) + o(1)) + O(T^{1+ε} + N^{β0−½+ε}/T),
  consistent with I_{T^θ}(T,2T) ≪ T^{1+ε} when θ < 4; whereas I_N(0,T) = N^{2β0−1}(log N)^{−2}(C(N) + o(1)) + O(…),
  C(N) bounded below, so I_{T^θ}(0,T) ≪ T^{1+ε} forces β0 ≤ ½ + 1/(2θ). (These two asymptotics are stated, not proved.)

## 3. Method in ten lines
1. Mellin: ∫_1^∞ M_x(½+it)(log x) x^{−w} dx = 1/((w−1)² ζ(w − ½ + it)) for Re w > 3/2.
2. Given a zero ρ0 with β0 ≥ ½, build G_t(w) = (w−1)²(w − 3/2 + it)ζ(w − ½ + it)/((w+1)²(w − ½ + it − ρ0)(w + it + 1)⁴):
   holomorphic in Re w ≥ 0 except that it cancels ζ's zero and adds a pole at w = ρ0 + ½ − it.
3. Its inverse Mellin transform g_t(u) vanishes for u > 1 and is O(1) on [0,1].
4. J_t(x) := (1/2πi)∫ G_t H_t x^w dw equals ∫_1^x M_y(½+it)(log y) g_t(y/x) dy, so |J_t(x)| ≪ ∫_1^x |M_y| log y dy.
5. Shifting the contour to Re w = 0 picks up the pole: J_t(x) = O(1) + x^{ρ0+½−it}(ρ0−1)/((3/2+ρ0−it)²(ρ0+3/2)⁴).
6. Hence x^{β0+½}/(1+|t|)² ≪ ∫_1^x |M_y(½+it)| log y dy + 1; Cauchy–Schwarz:
   x^{2β0}/(1+|t|)⁴ + 1/x ≪ ∫_1^x |M_y(½+it)|² log² y dy.
7. Multiply by |ζ(½+it)|², integrate over [T1, T2]: LHS ≥ x^{2β0} log(T1+2)/(1+T1)³ + T2 log T2/x;
   RHS ≤ log² x ∫_1^x I_y(T1,T2) dy.
8. T1 = 0, T2 = T, x = T^θ and the hypothesis give T^{2β0θ} ≪ T^{1+ε+θ}: β0 ≤ ½ + 1/(2θ).
9. The lower bound x^{2β0}/(1+t)⁴ is concentrated at BOUNDED t: the off-line zero is seen at low height with a long
   mollifier, and the factor (1+T1)^{−3} is what costs Theorem 2 its constant (2/θ instead of 1/(2θ)).
10. No mean value theorem is proved or used: the paper is a conditional implication only.

## 4. What is assumed
Theorem 1: the upper bound I_N(0,T) ≪ T^{1+ε} uniformly for N ≤ T^θ (a much weaker hypothesis than Farmer's
asymptotic). Theorem 2: the analogous bound on [T, 2T]. The weights are Levinson's (1 − log n/log N).

## 5. Where it stops
- Proves: upper bound for long mollified second moments ⇒ zero-free half-plane; θ = ∞ ⇒ RH.
- Does not prove any part of the hypothesis for any θ > 4/7, and makes no claim about what is provable.
- The paper's own comparison shows the hypothesis on [T,2T] with θ < 4 is CONSISTENT with an off-line zero; so
  long mollifiers at height [T, 2T] with θ below 4 cannot by themselves exclude off-line zeros. The [0, T] version
  contains the bounded heights and is stronger (1/(2θ)).
- What θ = ∞ would NOT give, as far as the texts read say: nothing about simplicity of zeros is derived here
  (BCF's NB asymptotic needs simple zeros separately; see `bcf-1211.5191.md`); pair correlation is attributed to "a
  slightly stronger form" (Farmer, unread); and Radziwiłł's Theorem 1 (`radziwill-1207.6583.md`) shows that for any
  fixed θ the mollified quantity (1/T)∫|1 − ζM|² stays ≥ c/θ, i.e. no FIXED length mollifies ζ completely on the line.

## 6. What it changes in our record
- `rh/NOTEBOOK.md` N53 (a) ("RH ⟺ the Möbius approximants are bounded in L²"; direction ⇐ argued via weak closure,
  Mazur, and Beurling's L^p theorem / a zero-free region). Bettin–Gonek's Mellin argument gives this direction in one
  line and needs no L^p input: multiply step 6 by |ζ(½+it)|²/(¼+t²) and integrate over all t. The left side is
  ≥ c x^{2β0} (c > 0 from bounded t), the right side is ≤ 2π log² x ∫_1^x ‖f_y‖² dy with f_y the NB function of the
  Levinson-weighted Möbius polynomial M_y. So sup_y ‖f_y‖ < ∞ ⇒ x^{2β0} ≪ x log² x ⇒ β0 ≤ ½; and the weaker growth
  ‖f_y‖² ≪ y^{2σ−1} ⇒ no zeros with β > σ. (Reader's adaptation, not stated in the paper; the steps are those of
  §2 of the paper with the weight 1/(¼+t²) in place of 1_{[0,T]}.) So N53 (a)'s ⇐ direction is essentially
  Bettin–Gonek 2016/17 in NB clothing, and it holds for Levinson's weights (1 − log n/log y), not for every w_N.
- N53 (b) "difficulty at bounded height with mollifier length to infinity": Bettin–Gonek's proof locates an
  off-line zero's signal exactly there (the x^{2β0}/(1+t)⁴ term), and their Theorem 2 vs Theorem 1 comparison is a
  published statement that the [T, 2T] version is weaker. So N53 (b)'s location of the difficulty is already in print
  (as a property of the implication, not as a "wall").
- IDEAS #34 form (4) ("long mollifiers at bounded height"): the published form is "I_N(0,T) ≪ T^{1+ε} for
  N ≤ T^θ, θ → ∞" (Bettin–Gonek Theorem 1); the record should cite it.
- N57: nothing here bears on the self-dual point.

## 7. Reliability
Refereed (Mathematika), 4-page note; the proof is short and was checked line by line by the reader (no gap found).
The two asymptotics for a single off-line zero (after Theorem 2) are stated without proof. Farmer 1993's content is
known here only through three secondary descriptions, which differ slightly: Bettin–Gonek say Farmer conjectured
(1.2) for every θ > 0 and proved it implies κ = 1; PRZZ (2020) say "mollifiers might be optimal when their size is
1 − ε in that they produce 100%" — the reader takes Bettin–Gonek's wording as primary since it states the conjecture's
form explicitly.

## 8. Farmer 1993 (secondary only; NOT read)
Conjecture ("θ = ∞"): lim_{T→∞} I_{T^θ}(0,T)/T = 1 + 1/θ for every θ > 0 (Levinson's mollifier). Proved there,
per Bettin–Gonek: the conjecture ⇒ κ = 1. Argued there (heuristic), per Bettin–Gonek: a slightly stronger form ⇒
Montgomery's pair correlation conjecture. Whether Farmer states a heuristic barrier, and the details of his
heuristic: unknown to this reader.
