# refund-service

Service in the billing domain of HelixCare.

Language: Go Â· Port: 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/refund-service/](../../../helm/charts/refund-service/) â€” Helm chart
- [manifests/billing/refund-service/](../../../manifests/billing/refund-service/) â€” Raw K8s manifests
