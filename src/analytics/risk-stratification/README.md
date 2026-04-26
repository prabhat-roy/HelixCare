# risk-stratification

Service in the **analytics** domain of HelixCare.

**Language:** Go · **Port:** 50301

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/risk-stratification/](../../../helm/charts/risk-stratification/) — Helm chart
- [manifests/analytics/risk-stratification/](../../../manifests/analytics/risk-stratification/) — Raw K8s manifests
