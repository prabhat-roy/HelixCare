# dispensing-service

Service in the **pharmacy** domain of HelixCare.

**Language:** Go · **Port:** 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dispensing-service/](../../../helm/charts/dispensing-service/) — Helm chart
- [manifests/pharmacy/dispensing-service/](../../../manifests/pharmacy/dispensing-service/) — Raw K8s manifests
