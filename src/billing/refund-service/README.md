# refund-service

Service in the **billing** domain of HelixCare.

**Language:** Go · **Port:** 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/refund-service/](../../../helm/charts/refund-service/) — Helm chart
- [manifests/billing/refund-service/](../../../manifests/billing/refund-service/) — Raw K8s manifests
