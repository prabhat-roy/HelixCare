#!/usr/bin/env bash
set -euo pipefail
TAG="${1:-$(git rev-parse --short HEAD)}"
for svc in $(ls src); do
  if [ -f "src/$svc/Dockerfile" ]; then
    echo ">>> building $svc:$TAG"
    docker build -t "harbor.helixcare.internal/helixcare/$svc:$TAG" "src/$svc"
  fi
done
