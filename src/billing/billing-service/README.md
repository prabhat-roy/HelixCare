# billing-service

Service in the billing domain of HelixCare.

Language: Go Â· Port: 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/billing-service/](../../../helm/charts/billing-service/) â€” Helm chart
- [manifests/billing/billing-service/](../../../manifests/billing/billing-service/) â€” Raw K8s manifests
