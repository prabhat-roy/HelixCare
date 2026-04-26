# prescription-service

Service in the **pharmacy** domain of HelixCare.

**Language:** Go · **Port:** 50120

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/prescription-service/](../../../helm/charts/prescription-service/) — Helm chart
- [manifests/pharmacy/prescription-service/](../../../manifests/pharmacy/prescription-service/) — Raw K8s manifests
