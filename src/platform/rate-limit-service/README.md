# rate-limit-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51007

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rate-limit-service/](../../../helm/charts/rate-limit-service/) — Helm chart
- [manifests/platform/rate-limit-service/](../../../manifests/platform/rate-limit-service/) — Raw K8s manifests
