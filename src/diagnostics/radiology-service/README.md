# radiology-service

Service in the diagnostics domain of HelixCare.

Language: Go Â· Port: 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/radiology-service/](../../../helm/charts/radiology-service/) â€” Helm chart
- [manifests/diagnostics/radiology-service/](../../../manifests/diagnostics/radiology-service/) â€” Raw K8s manifests
