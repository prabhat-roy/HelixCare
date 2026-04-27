#!/usr/bin/env bash
set -euo pipefail
NS="${1:-helixcare}"
TS=$(date -u +%Y%m%dT%H%M%S)
velero backup create "helixcare-$TS" --include-namespaces "$NS" --wait
