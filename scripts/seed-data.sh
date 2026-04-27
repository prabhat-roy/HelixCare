#!/usr/bin/env bash
set -euo pipefail
NS="${1:-helixcare}"
echo "Seeding HelixCare in namespace $NS"
kubectl -n "$NS" exec -i sts/postgres -- psql -U app -d app -f /seeds/dev.sql
kubectl -n "$NS" exec -i sts/mongodb -- mongoimport --uri="mongodb://app:app@localhost/app" /seeds/sample.json
echo "Seed complete"
