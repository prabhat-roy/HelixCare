#!/usr/bin/env bash
set -euo pipefail
SVC="${1:?usage: migrate.sh <service-name>}"
LANG=$(yq '.language' "src/$SVC/.service.yaml")
case "$LANG" in
  go)        migrate -path "src/$SVC/migrations" -database "${DATABASE_URL}" up ;;
  java|kotlin) (cd "src/$SVC" && ./mvnw flyway:migrate) ;;
  python)    (cd "src/$SVC" && alembic upgrade head) ;;
  *) echo "no migrator wired for $LANG"; exit 1 ;;
esac
