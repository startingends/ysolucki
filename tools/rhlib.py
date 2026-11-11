"""Shared numerics for the RH project. Small on purpose; every function is pinned by tests/.

Conventions
- Nontrivial zeros are rho = 1/2 + i*gamma. `zeros(n)` returns the first n positive
  ordinates gamma_1 < gamma_2 < ... as Python floats (double precision, ~1e-13 relative).
  They are computed by Arb (python-flint), which isolates zeros of the Hardy Z-function ON the
  critical line. Using them therefore ASSUMES nothing beyond what is rigorously verified:
  RH is known to hold up to height 3e12 (Platt & Trudgian 2021), far above anything cached here.
- xi(s) = (1/2) s (s-1) pi^(-s/2) Gamma(s/2) zeta(s); entire, xi(s) = xi(1-s), xi(0) = xi(1) = 1/2.
- Li coefficients: lambda_n = sum_rho [1 - (1 - 1/rho)^n]  (sum pairing rho with conj(rho)).
  Li's criterion: RH  <=>  lambda_n >= 0 for all n >= 1.
"""
from __future__ import annotations

import math
import os
from functools import lru_cache

import mpmath as mp

_DATA = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "rh", "data")


def zeros(n: int, cache: bool = True) -> list[float]:
    """First n positive zero ordinates gamma_k. Cached under rh/data/ (gitignored)."""
    if n <= 0:
        return []
    path = os.path.join(_DATA, "zeros.txt")
    have: list[float] = []
    if cache and os.path.exists(path):
        with open(path) as f:
            have = [float(x) for x in f.read().split()]
    if len(have) >= n:
        return have[:n]
    import flint

    old = flint.ctx.prec
    flint.ctx.prec = 80
    try:
        new = flint.acb.zeta_zeros(len(have) + 1, n - len(have))
        have += [float(z.imag.mid()) for z in new]
    finally:
        flint.ctx.prec = old
    if cache:
        os.makedirs(_DATA, exist_ok=True)
        tmp = path + ".tmp"
        with open(tmp, "w") as f:
            f.write("\n".join(repr(g) for g in have) + "\n")
        os.replace(tmp, path)
    return have[:n]


def xi(s):
    """Riemann xi function (mpmath precision). Handles the removable points s = 0, 1."""
    s = mp.mpmathify(s)
    if s == 0 or s == 1:
        return mp.mpf(1) / 2
    return mp.mpf(1) / 2 * s * (s - 1) * mp.power(mp.pi, -s / 2) * mp.gamma(s / 2) * mp.zeta(s)


def li_lambda1_exact():
    """lambda_1 = 1 + gamma/2 - log 2 - (1/2) log pi  (= 0.0230957...)."""
    return 1 + mp.euler / 2 - mp.log(2) - mp.log(mp.pi) / 2


@lru_cache(maxsize=8)
def li_exact(nmax: int, dps: int = 60) -> tuple:
    """lambda_1..lambda_nmax from the Taylor expansion of log xi(1/(1-z)) at z = 0:
    d/dz log xi(1/(1-z)) = sum_{n>=0} lambda_{n+1} z^n, i.e. lambda_n = n * [z^n] log xi(1/(1-z)).
    Numerically delicate for large n (precision loss ~ n digits); keep nmax modest or raise dps.
    """
    with mp.workdps(dps + 3 * nmax):
        f = lambda z: mp.log(2 * xi(1 / (1 - z)))  # 2*xi so f(0) = 0
        c = mp.taylor(f, 0, nmax)
        return tuple(mp.mpf(n) * c[n] for n in range(1, nmax + 1))


def li_from_zeros(n: int, nzeros: int = 2000) -> float:
    """lambda_n from the first `nzeros` zeros, plus a smooth tail estimate.

    Each conjugate pair contributes 2*Re[1 - (1 - 1/rho)^n]. For gamma >> n this is ~ n^2/gamma^2
    (exactly n/(1/4+gamma^2) for n = 1); the tail uses the zero density (1/2pi) log(t/2pi).
    Only trustworthy for n << gamma_nzeros. Used as an independent cross-check of li_exact.
    """
    gs = zeros(nzeros)
    tot = 0.0
    for g in gs:
        rho = complex(0.5, g)
        tot += 2 * (1 - (1 - 1 / rho) ** n).real
    T = gs[-1]
    # leading large-gamma behaviour of the pair term: 2*Re[...] ~ n^2 / gamma^2  (n=1: 1/gamma^2)
    tail = (n * n) * (math.log(T / (2 * math.pi)) + 1) / (2 * math.pi * T)
    return tot + tail


def riemann_siegel_theta(t):
    return mp.siegeltheta(t)


def hardy_z(t):
    return mp.siegelz(t)


def n_zeros_upto(T: float) -> float:
    """Riemann-von Mangoldt main term: N(T) ~ theta(T)/pi + 1."""
    return float(mp.siegeltheta(T) / mp.pi + 1)
