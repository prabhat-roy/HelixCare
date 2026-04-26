# payment-service

Service in the **billing** domain of HelixCare.

**Language:** Go · **Port:** 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/payment-service/](../../../helm/charts/payment-service/) — Helm chart
- [manifests/billing/payment-service/](../../../manifests/billing/payment-service/) — Raw K8s manifests
