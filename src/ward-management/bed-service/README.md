# bed-service

Service in the ward-management domain of HelixCare.

Language: Go Â· Port: 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/bed-service/](../../../helm/charts/bed-service/) â€” Helm chart
- [manifests/ward-management/bed-service/](../../../manifests/ward-management/bed-service/) â€” Raw K8s manifests
