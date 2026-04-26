# audit-trail-service

Service in the **ehr** domain of HelixCare.

**Language:** Go · **Port:** 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/audit-trail-service/](../../../helm/charts/audit-trail-service/) — Helm chart
- [manifests/ehr/audit-trail-service/](../../../manifests/ehr/audit-trail-service/) — Raw K8s manifests
