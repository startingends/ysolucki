"""Control group: functions that look like zeta but are KNOWN to violate RH.

Davenport-Heilbronn (1936):  f(s) = (1 - i*kappa)/2 * L(s, chi) + (1 + i*kappa)/2 * L(s, conj chi),
chi the character mod 5 with chi(2) = i,  kappa = (sqrt(10 - 2 sqrt 5) - 2) / (sqrt 5 - 1).
  - Dirichlet series with real periodic coefficients (1, kappa, -kappa, -1, 0), NOT multiplicative:
    no Euler product.
  - Functional equation of L-function type (odd character, conductor 5):
        Lambda_f(s) := (5/pi)^(s/2) * Gamma((s+1)/2) * f(s)  satisfies  Lambda_f(s) = Lambda_f(1-s).
  - Has zeros off the critical line; the lowest (Spira 1994) is near 0.808517 + 85.699348 i.

Any argument or numerical criterion that cannot tell zeta from f is not seeing what makes RH true
(barriers B1, B2 in docs/KNOWLEDGE.md).
"""
from __future__ import annotations

import mpmath as mp


def dh_kappa():
    return (mp.sqrt(10 - 2 * mp.sqrt(5)) - 2) / (mp.sqrt(5) - 1)


def dh_coeff(n: int):
    """Coefficient a_n of the Dirichlet series of f (period 5)."""
    k = dh_kappa()
    return (mp.mpf(0), mp.mpf(1), k, -k, mp.mpf(-1))[n % 5]


def dirichlet_L_mod5(s, conj: bool = False):
    """L(s, chi) for chi mod 5 with chi(2) = i (or its conjugate), via Hurwitz zeta."""
    s = mp.mpmathify(s)
    i = mp.mpc(0, -1 if conj else 1)
    chi = {1: 1, 2: i, 3: -i, 4: -1}
    return mp.power(5, -s) * mp.fsum(chi[a] * mp.zeta(s, mp.mpf(a) / 5) for a in (1, 2, 3, 4))


def dh(s):
    """The Davenport-Heilbronn function f(s), entire."""
    s = mp.mpmathify(s)
    return mp.power(5, -s) * mp.fsum(dh_coeff(a) * mp.zeta(s, mp.mpf(a) / 5) for a in (1, 2, 3, 4))


def dh_completed(s):
    """Lambda_f(s) = (5/pi)^(s/2) Gamma((s+1)/2) f(s); entire, Lambda_f(s) = Lambda_f(1-s),
    real on the critical line."""
    s = mp.mpmathify(s)
    return mp.power(5 / mp.pi, s / 2) * mp.gamma((s + 1) / 2) * dh(s)


def dh_offline_zero(guess=None):
    """Refine the lowest known off-line zero (Spira): ~ 0.808517 + 85.699348 i."""
    return mp.findroot(dh, guess or mp.mpc("0.808517", "85.699348"))
