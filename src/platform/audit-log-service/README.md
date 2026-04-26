# audit-log-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51008

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/audit-log-service/](../../../helm/charts/audit-log-service/) — Helm chart
- [manifests/platform/audit-log-service/](../../../manifests/platform/audit-log-service/) — Raw K8s manifests
