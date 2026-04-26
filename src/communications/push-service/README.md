# push-service

Service in the **communications** domain of HelixCare.

**Language:** Go · **Port:** 50282

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/push-service/](../../../helm/charts/push-service/) — Helm chart
- [manifests/communications/push-service/](../../../manifests/communications/push-service/) — Raw K8s manifests
