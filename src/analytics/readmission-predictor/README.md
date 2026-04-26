# readmission-predictor

Service in the **analytics** domain of HelixCare.

**Language:** Go · **Port:** 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/readmission-predictor/](../../../helm/charts/readmission-predictor/) — Helm chart
- [manifests/analytics/readmission-predictor/](../../../manifests/analytics/readmission-predictor/) — Raw K8s manifests
