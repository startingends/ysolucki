#!/usr/bin/env python3
"""Run a command under an address-space cap so a runaway job dies instead of the container.

  flock <scratch>/heavy.lock python3 tools/memcap.py <GB> <cmd> [args...]

One heavy job at a time (the flock), capped at <GB> gigabytes (this script).
"""
import os
import resource
import sys


def main():
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    try:
        gb = float(sys.argv[1])
    except ValueError:
        sys.exit(f"first argument must be a number of GB, got {sys.argv[1]!r}")
    if gb <= 0:
        sys.exit("GB must be positive")
    cap = int(gb * 1024**3)
    resource.setrlimit(resource.RLIMIT_AS, (cap, cap))
    os.execvp(sys.argv[2], sys.argv[2:])


if __name__ == "__main__":
    main()
