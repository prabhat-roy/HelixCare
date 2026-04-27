# lab-order-service

Service in the diagnostics domain of HelixCare.

Language: Go Â· Port: 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/lab-order-service/](../../../helm/charts/lab-order-service/) â€” Helm chart
- [manifests/diagnostics/lab-order-service/](../../../manifests/diagnostics/lab-order-service/) â€” Raw K8s manifests
