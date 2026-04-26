# email-service

Service in the **communications** domain of HelixCare.

**Language:** Go · **Port:** 50281

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/email-service/](../../../helm/charts/email-service/) — Helm chart
- [manifests/communications/email-service/](../../../manifests/communications/email-service/) — Raw K8s manifests
