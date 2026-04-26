# gdpr-service

Service in the **compliance** domain of HelixCare.

**Language:** Go · **Port:** 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/gdpr-service/](../../../helm/charts/gdpr-service/) — Helm chart
- [manifests/compliance/gdpr-service/](../../../manifests/compliance/gdpr-service/) — Raw K8s manifests
