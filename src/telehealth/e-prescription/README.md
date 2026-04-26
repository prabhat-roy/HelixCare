# e-prescription

Service in the **telehealth** domain of HelixCare.

**Language:** Go · **Port:** 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/e-prescription/](../../../helm/charts/e-prescription/) — Helm chart
- [manifests/telehealth/e-prescription/](../../../manifests/telehealth/e-prescription/) — Raw K8s manifests
