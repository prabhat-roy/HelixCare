#!/usr/bin/env bash
set -euo pipefail
ENV="${1:?usage: deploy.sh <env>}"
CLOUD="${2:-aws}"
echo "Deploying HelixCare to $ENV on $CLOUD"
helmfile -f "deploy/${ENV}/${CLOUD}.helmfile.yaml" sync
argocd app sync "helixcare-$ENV" --grpc-web
