#!/usr/bin/env bash
set -euo pipefail
BASE="${1:-https://helixcare.internal}"
for svc in api-gateway identity-service platform-bff; do
  url="$BASE/$svc/healthz"
  if curl -fsS "$url" >/dev/null; then echo "OK   $url"; else echo "FAIL $url"; exit 1; fi
done
