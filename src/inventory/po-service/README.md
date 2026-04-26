# po-service

Service in the **inventory** domain of HelixCare.

**Language:** Go · **Port:** 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/po-service/](../../../helm/charts/po-service/) — Helm chart
- [manifests/inventory/po-service/](../../../manifests/inventory/po-service/) — Raw K8s manifests
