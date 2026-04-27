#!/usr/bin/env bash
set -euo pipefail
hurl --variable password="$HURL_PASSWORD" --test --report-html out/ \
  api-testing/hurl/health.hurl \
  api-testing/hurl/auth.hurl
