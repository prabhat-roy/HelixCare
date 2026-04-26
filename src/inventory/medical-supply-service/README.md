# medical-supply-service

Service in the **inventory** domain of HelixCare.

**Language:** Go · **Port:** 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/medical-supply-service/](../../../helm/charts/medical-supply-service/) — Helm chart
- [manifests/inventory/medical-supply-service/](../../../manifests/inventory/medical-supply-service/) — Raw K8s manifests
