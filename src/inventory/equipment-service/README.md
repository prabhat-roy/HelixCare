# equipment-service

Service in the **inventory** domain of HelixCare.

**Language:** Go · **Port:** 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/equipment-service/](../../../helm/charts/equipment-service/) — Helm chart
- [manifests/inventory/equipment-service/](../../../manifests/inventory/equipment-service/) — Raw K8s manifests
