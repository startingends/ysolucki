"""The control group must really be what we say it is: same functional equation shape as an
L-function, no Euler product, and a zero off the line."""
import os
import sys

import mpmath as mp

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "tools"))
import controls  # noqa: E402


def test_dh_is_the_stated_combination_of_L_functions():
    k = controls.dh_kappa()
    for s in (mp.mpc(2, 3), mp.mpc(0.3, 40)):
        combo = (1 - 1j * k) / 2 * controls.dirichlet_L_mod5(s) + (1 + 1j * k) / 2 * controls.dirichlet_L_mod5(s, conj=True)
        assert abs(controls.dh(s) - combo) < 1e-12


def test_dh_matches_its_dirichlet_series_where_it_converges():
    s = mp.mpf(6)
    direct = mp.fsum(controls.dh_coeff(n) / mp.mpf(n) ** s for n in range(1, 400))
    assert abs(controls.dh(s) - direct) < 1e-12


def test_dh_has_no_euler_product():
    a = controls.dh_coeff
    assert abs(a(2) * a(3) - a(6)) > 0.1  # multiplicativity fails: a(2)a(3) = -kappa^2, a(6) = 1


def test_dh_functional_equation_and_reality_on_the_line():
    for s in (mp.mpc(0.3, 10), mp.mpc(-1.5, 3), mp.mpc(0.8, 85.7)):
        a, b = controls.dh_completed(s), controls.dh_completed(1 - s)
        assert abs(a - b) < 1e-10 * max(abs(a), 1e-30)
    v = controls.dh_completed(mp.mpc(0.5, 17.3))
    assert abs(v.imag) < 1e-10 * abs(v.real)


def test_dh_violates_rh():
    z = controls.dh_offline_zero()
    assert abs(controls.dh(z)) < 1e-10
    assert abs(z.real - 0.808517) < 1e-5 and abs(z.imag - 85.699348) < 1e-5
    # the mirror image 1 - conj(z) is a zero too (functional equation + real coefficients)
    assert abs(controls.dh(1 - z.conjugate())) < 1e-9
    assert z.real > 0.5 + 0.3
