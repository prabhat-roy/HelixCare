# pathology-service

Service in the **diagnostics** domain of HelixCare.

**Language:** Go · **Port:** 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/pathology-service/](../../../helm/charts/pathology-service/) — Helm chart
- [manifests/diagnostics/pathology-service/](../../../manifests/diagnostics/pathology-service/) — Raw K8s manifests
