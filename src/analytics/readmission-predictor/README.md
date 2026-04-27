# readmission-predictor

Service in the analytics domain of HelixCare.

Language: Go Â· Port: 50302

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/readmission-predictor/](../../../helm/charts/readmission-predictor/) â€” Helm chart
- [manifests/analytics/readmission-predictor/](../../../manifests/analytics/readmission-predictor/) â€” Raw K8s manifests
