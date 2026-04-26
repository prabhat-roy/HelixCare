# dead-letter-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51010

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dead-letter-service/](../../../helm/charts/dead-letter-service/) — Helm chart
- [manifests/platform/dead-letter-service/](../../../manifests/platform/dead-letter-service/) — Raw K8s manifests
