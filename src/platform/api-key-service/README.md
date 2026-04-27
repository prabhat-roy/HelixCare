# api-key-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51003

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/api-key-service/](../../../helm/charts/api-key-service/) â€” Helm chart
- [manifests/platform/api-key-service/](../../../manifests/platform/api-key-service/) â€” Raw K8s manifests
