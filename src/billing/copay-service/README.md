# copay-service

Service in the **billing** domain of HelixCare.

**Language:** Go · **Port:** 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/copay-service/](../../../helm/charts/copay-service/) — Helm chart
- [manifests/billing/copay-service/](../../../manifests/billing/copay-service/) — Raw K8s manifests
