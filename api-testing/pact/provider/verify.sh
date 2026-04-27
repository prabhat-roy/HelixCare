#!/usr/bin/env bash
set -euo pipefail
pact-provider-verifier https://pact-broker.helixcare.internal \
  --provider helixcare_identity_service \
  --provider-base-url http://identity-service.helixcare.svc:50060 \
  --provider-version "${GIT_SHA:-local}" \
  --publish-verification-results
