#!/usr/bin/env bash
set -euo pipefail
spectral lint --ruleset api-testing/spectral/.spectral.yaml openapi/*.yaml
