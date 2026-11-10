"""Pins the shared numerics against independent values. If one of these fails, no experiment
built on tools/rhlib.py can be trusted until it is fixed."""
import math
import os
import sys

import mpmath as mp
import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
import rhlib  # noqa: E402

# Published ordinates of the first zeros (Odlyzko's tables), 12+ digits.
KNOWN = [14.134725141734693, 21.022039638771555, 25.010857580145688, 30.424876125859513, 32.935061587739189]


def test_zeros_match_published():
    z = rhlib.zeros(5, cache=False)
    for a, b in zip(z, KNOWN):
        assert abs(a - b) < 1e-11


def test_zeros_match_mpmath_independent_implementation():
    z = rhlib.zeros(200, cache=False)
    for k in (1, 37, 200):
        assert abs(z[k - 1] - float(mp.zetazero(k).imag)) < 1e-9
    assert all(b > a for a, b in zip(z, z[1:]))


def test_zeros_are_zeros_of_zeta():
    for g in rhlib.zeros(30, cache=False)[::7]:
        assert abs(mp.zeta(mp.mpc(0.5, g))) < 1e-9


def test_zero_count_matches_riemann_von_mangoldt():
    z = rhlib.zeros(500, cache=False)
    T = (z[-1] + 811.5) / 2 if z[-1] < 811.5 else z[-1] + 0.05
    count = sum(1 for g in z if g < T)
    assert abs(rhlib.n_zeros_upto(T) - count) < 1.0  # S(T) is tiny at this height


def test_cache_roundtrip(tmp_path, monkeypatch):
    monkeypatch.setattr(rhlib, "_DATA", str(tmp_path))
    a = rhlib.zeros(20)
    b = rhlib.zeros(10)  # served from cache
    c = rhlib.zeros(25)  # extends cache
    assert a[:10] == b and c[:20] == a and len(c) == 25
    assert not os.path.exists(os.path.join(tmp_path, "zeros.txt.tmp"))


def test_xi_functional_equation_and_special_values():
    with mp.workdps(30):
        assert rhlib.xi(0) == mp.mpf(1) / 2 and rhlib.xi(1) == mp.mpf(1) / 2
        assert abs(rhlib.xi(mp.mpf("0.5")) - mp.mpf("0.4971207781883141")) < 1e-15
        for s in (mp.mpc(0.3, 2.0), mp.mpc(2.5, -7.0), mp.mpf("1e-12")):
            assert abs(rhlib.xi(s) - rhlib.xi(1 - s)) < 1e-20 * max(1, abs(rhlib.xi(s)))
        assert abs(rhlib.xi(mp.mpc(0.5, KNOWN[0]))) < 1e-14


def test_li_coefficients_three_ways():
    lam = rhlib.li_exact(6)
    # (1) closed form for lambda_1
    with mp.workdps(50):  # the closed form must be evaluated at matching precision
        assert abs(lam[0] - rhlib.li_lambda1_exact()) < mp.mpf(10) ** -40
    assert abs(float(lam[0]) - 0.0230957089661) < 1e-12
    # (2) independent numerical method: Cauchy integral on |z| = 0.3 instead of Taylor differentiation.
    #     (A value of lambda_3 first written from memory, 0.2076389248, was wrong in the 9th digit;
    #      this route and route (3) both confirm 0.2076389205543.)
    with mp.workdps(30):
        f = lambda z: mp.log(2 * rhlib.xi(1 / (1 - z)))
        r = mp.mpf("0.3")
        for n in (2, 3):
            c = mp.quad(lambda th: f(r * mp.expjpi(2 * th)) * mp.expjpi(-2 * n * th), [0, 0.25, 0.5, 0.75, 1]) / r**n
            assert abs(n * c.real - lam[n - 1]) < mp.mpf(10) ** -20
    assert abs(float(lam[1]) - 0.0923457352280) < 1e-12
    assert abs(float(lam[2]) - 0.2076389205543) < 1e-12
    # (3) independent data: sum over the zeros themselves, with a smooth tail estimate
    for n in (1, 2, 3):
        assert abs(rhlib.li_from_zeros(n, 1500) - float(lam[n - 1])) < 2e-6 * n * n
    assert all(x > 0 for x in lam)


def test_hardy_z_changes_sign_at_first_zero():
    assert rhlib.hardy_z(KNOWN[0] - 0.01) * rhlib.hardy_z(KNOWN[0] + 0.01) < 0
    assert math.isfinite(float(rhlib.riemann_siegel_theta(100.0)))


if __name__ == "__main__":
    sys.exit(pytest.main([__file__, "-q"]))
