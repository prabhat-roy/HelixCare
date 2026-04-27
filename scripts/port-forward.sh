#!/usr/bin/env bash
set -euo pipefail
NS="${1:-helixcare}"
( kubectl -n "$NS" port-forward svc/postgres 5432:5432 & )
( kubectl -n "$NS" port-forward svc/redis 6379:6379 & )
( kubectl -n "$NS" port-forward svc/kafka 9092:9092 & )
( kubectl -n "$NS" port-forward svc/grafana 3001:3000 & )
echo "port-forwards backgrounded; ctrl-c to exit"; wait
