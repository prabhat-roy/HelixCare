# Getting Started — HelixCare

Welcome. This guide gets you from a fresh clone to a running local stack in ~10 minutes.

## Prerequisites
- Docker 25+, Docker Compose v2
- Go 1.23, Java 21, Python 3.12, Node.js 22 (only the ones you'll touch)
- `kubectl`, `helm`, `tilt`, `skaffold`, `k6`, `dbt`, `argocd` CLIs (any subset is fine)

## 1. Clone + bring up local stack
```bash
git clone https://github.com/prabhat-roy/HelixCare.git
cd HelixCare
docker compose up -d        # full data plane: pg / mongo / redis / kafka / minio / keycloak / vault / observability
./scripts/smoke.sh http://localhost
```

## 2. Run one service in dev mode
```bash
tilt up                           # hot-reload core services through Tilt
# OR
skaffold dev --module=api-gateway # one specific service
```

## 3. Hit the API
```bash
curl http://localhost:8080/healthz
hurl --test api-testing/hurl/health.hurl
```

## 4. Run tests
```bash
make test          # unit tests across all services
k6 run load-testing/k6/smoke.js
```

## 5. Deploy to a real cluster
```bash
./scripts/deploy.sh staging aws    # helmfile sync + argocd sync
```

## Repo map
- `src/` — backend services (polyglot, see `CLAUDE.md` for the language matrix)
- `helm/charts/` — per-service Helm chart
- `manifests/` — plain k8s YAML per service
- `infra/terraform/{aws,gcp,azure}/` — multi-cloud platform IaC
- `gitops/` — ArgoCD + Flux + Argo Rollouts/Workflows/Events
- `kubernetes/` — namespaces, RBAC, network policies, quotas, PDBs, KEDA, Velero
- `security/`, `observability/`, `messaging/`, `networking/`, `databases/` — OSS tool configs (Helm values + READMEs)
- `chaos/`, `streaming/`, `analytics/`, `load-testing/`, `api-testing/`, `scripts/` — supporting capabilities
- `backstage/` — software catalog + templates + scorecards
- `AI_PLAN.md` — hierarchical AI strategy (Paperclip / OpenClaw / NemoClaw)
- `TOOLS.md` — full inventory of every OSS tool registered for this project + how to deploy it
- `CLAUDE.md` — Claude operating manual for this repo

## Where to look first
| You want to | Look at |
|---|---|
| Add a new service | `backstage/templates/*-service-template.yaml` |
| Understand event flow | `events/*.avsc` + `messaging/kafka/` |
| Debug latency | Grafana → Tempo (`observability/tempo/`) |
| Roll out safely | `gitops/argo-rollouts/rollouts/<service>-rollout.yaml` |
| Run chaos game-day | `chaos/chaos-mesh/workflows/gameday.yaml` |

If anything in this guide is wrong, it's a bug — open an issue.
