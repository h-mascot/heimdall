#!/usr/bin/env python3
"""Compatibility entrypoint for Heimdall skill-scan."""
from __future__ import annotations

import runpy
import sys
from pathlib import Path


CANONICAL = Path(__file__).resolve().parent / "scripts" / "skill-scan.py"

if not CANONICAL.exists():
    raise SystemExit(f"canonical scanner missing: {CANONICAL}")

sys.argv[0] = str(CANONICAL)
runpy.run_path(str(CANONICAL), run_name="__main__")
