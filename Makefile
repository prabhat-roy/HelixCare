# HelixCare — top-level Makefile
# Aggregates per-service builds, tests, and deploys. Each service under src/<domain>/<service>
# has its own Makefile; this file fans out to them.

.PHONY: help bootstrap proto build test lint fmt clean \
        compose-up compose-down deploy-local helm-lint \
        scan-images sbom k8s-validate

help:
	@echo "HelixCare — common targets"
	@echo ""
	@echo "  bootstrap      Install local dev tooling (buf, golangci-lint, yamllint, hadolint)"
	@echo "  proto          Regenerate gRPC bindings from proto/"
	@echo "  build          Build all service container images"
	@echo "  test           Run unit + integration tests across all services"
	@echo "  lint           Lint all source (Go, Java, Kotlin, Python, Node, TS)"
	@echo "  fmt            Format all source"
	@echo "  compose-up     Start full local stack (docker compose up)"
	@echo "  compose-down   Tear down local stack"
	@echo "  deploy-local   Deploy to local kind/minikube via Helm"
	@echo "  helm-lint      helm lint on every chart in helm/charts/"
	@echo "  k8s-validate   kubeconform on manifests/"
	@echo "  scan-images    Trivy scan on every built image"
	@echo "  sbom           Generate SBOM (Syft) per image"
	@echo "  clean          Remove build artefacts"

bootstrap:
	@scripts/bootstrap.sh

proto:
	@cd proto && buf generate

build:
	@scripts/build-all.sh

test:
	@scripts/run-tests.sh

lint:
	@scripts/lint-all.sh

fmt:
	@scripts/fmt-all.sh

compose-up:
	@docker compose up -d

compose-down:
	@docker compose down

deploy-local:
	@scripts/deploy-local.sh

helm-lint:
	@find helm/charts -name Chart.yaml -execdir helm lint . \;

k8s-validate:
	@kubeconform -strict -summary manifests/

scan-images:
	@scripts/scan-images.sh

sbom:
	@scripts/generate-sbom.sh

clean:
	@find . -name 'bin' -type d -prune -exec rm -rf {} +
	@find . -name 'target' -type d -prune -exec rm -rf {} +
	@find . -name 'build' -type d -prune -exec rm -rf {} +