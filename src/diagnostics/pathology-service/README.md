# pathology-service

Service in the diagnostics domain of HelixCare.

Language: Go Â· Port: 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/pathology-service/](../../../helm/charts/pathology-service/) â€” Helm chart
- [manifests/diagnostics/pathology-service/](../../../manifests/diagnostics/pathology-service/) â€” Raw K8s manifests
