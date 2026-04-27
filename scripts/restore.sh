#!/usr/bin/env bash
set -euo pipefail
BACKUP="${1:?usage: restore.sh <backup-name>}"
velero restore create --from-backup "$BACKUP" --wait
