# i18n-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51012

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/i18n-service/](../../../helm/charts/i18n-service/) — Helm chart
- [manifests/platform/i18n-service/](../../../manifests/platform/i18n-service/) — Raw K8s manifests
