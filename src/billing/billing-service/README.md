# billing-service

Service in the **billing** domain of HelixCare.

**Language:** Go · **Port:** 50160

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/billing-service/](../../../helm/charts/billing-service/) — Helm chart
- [manifests/billing/billing-service/](../../../manifests/billing/billing-service/) — Raw K8s manifests
