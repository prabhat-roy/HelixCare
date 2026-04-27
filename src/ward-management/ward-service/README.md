# ward-service

Service in the ward-management domain of HelixCare.

Language: Go Â· Port: 50221

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ward-service/](../../../helm/charts/ward-service/) â€” Helm chart
- [manifests/ward-management/ward-service/](../../../manifests/ward-management/ward-service/) â€” Raw K8s manifests
