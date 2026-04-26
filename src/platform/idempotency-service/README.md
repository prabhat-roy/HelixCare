# idempotency-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51000

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/idempotency-service/](../../../helm/charts/idempotency-service/) — Helm chart
- [manifests/platform/idempotency-service/](../../../manifests/platform/idempotency-service/) — Raw K8s manifests
