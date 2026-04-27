# order-management

Service in the clinical domain of HelixCare.

Language: Go Â· Port: 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/order-management/](../../../helm/charts/order-management/) â€” Helm chart
- [manifests/clinical/order-management/](../../../manifests/clinical/order-management/) â€” Raw K8s manifests
