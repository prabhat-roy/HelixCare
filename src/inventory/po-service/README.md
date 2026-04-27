# po-service

Service in the inventory domain of HelixCare.

Language: Go Â· Port: 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/po-service/](../../../helm/charts/po-service/) â€” Helm chart
- [manifests/inventory/po-service/](../../../manifests/inventory/po-service/) â€” Raw K8s manifests
