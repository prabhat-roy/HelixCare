# payment-service

Service in the billing domain of HelixCare.

Language: Go Â· Port: 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/payment-service/](../../../helm/charts/payment-service/) â€” Helm chart
- [manifests/billing/payment-service/](../../../manifests/billing/payment-service/) â€” Raw K8s manifests
