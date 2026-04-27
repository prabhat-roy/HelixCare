# tenant-service

Service in the platform domain of HelixCare.

Language: Go Â· Port: 51006

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/tenant-service/](../../../helm/charts/tenant-service/) â€” Helm chart
- [manifests/platform/tenant-service/](../../../manifests/platform/tenant-service/) â€” Raw K8s manifests
