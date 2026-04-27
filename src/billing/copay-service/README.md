# copay-service

Service in the billing domain of HelixCare.

Language: Go Â· Port: 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/copay-service/](../../../helm/charts/copay-service/) â€” Helm chart
- [manifests/billing/copay-service/](../../../manifests/billing/copay-service/) â€” Raw K8s manifests
