# saga-orchestrator

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51001

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/saga-orchestrator/](../../../helm/charts/saga-orchestrator/) — Helm chart
- [manifests/platform/saga-orchestrator/](../../../manifests/platform/saga-orchestrator/) — Raw K8s manifests
