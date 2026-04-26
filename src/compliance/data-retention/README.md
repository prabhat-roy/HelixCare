# data-retention

Service in the **compliance** domain of HelixCare.

**Language:** Go · **Port:** 50321

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/data-retention/](../../../helm/charts/data-retention/) — Helm chart
- [manifests/compliance/data-retention/](../../../manifests/compliance/data-retention/) — Raw K8s manifests
