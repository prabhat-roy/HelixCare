#!/usr/bin/env bash
# One-shot deploy of every OSS tool registered for HelixCare via ArgoCD.
set -euo pipefail
argocd app sync -l "project=helixcare-tools" --grpc-web
