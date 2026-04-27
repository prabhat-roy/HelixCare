# equipment-service

Service in the inventory domain of HelixCare.

Language: Go Â· Port: 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/equipment-service/](../../../helm/charts/equipment-service/) â€” Helm chart
- [manifests/inventory/equipment-service/](../../../manifests/inventory/equipment-service/) â€” Raw K8s manifests
