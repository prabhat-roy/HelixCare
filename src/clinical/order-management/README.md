# order-management

Service in the **clinical** domain of HelixCare.

**Language:** Go · **Port:** 50083

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/order-management/](../../../helm/charts/order-management/) — Helm chart
- [manifests/clinical/order-management/](../../../manifests/clinical/order-management/) — Raw K8s manifests
