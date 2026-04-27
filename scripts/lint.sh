#!/usr/bin/env bash
set -euo pipefail
echo "go vet"; (cd src && find . -name go.mod -execdir go vet ./... \;)
echo "yamllint"; yamllint -c .yamllint -s helm/ kubernetes/ gitops/
echo "kubeconform"; kubeconform -strict -ignore-missing-schemas kubernetes/ manifests/
echo "spectral"; spectral lint --ruleset api-testing/spectral/.spectral.yaml openapi/*.yaml
echo "trivy fs"; trivy fs --severity HIGH,CRITICAL .
