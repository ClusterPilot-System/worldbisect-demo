#!/usr/bin/env bash
set -euo pipefail

test "$(<config.txt)" = "mode=good"
echo "application check: PASS"
