# sso-service

Service in the **identity** domain of HelixCare.

**Language:** Go · **Port:** 50021

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sso-service/](../../../helm/charts/sso-service/) — Helm chart
- [manifests/identity/sso-service/](../../../manifests/identity/sso-service/) — Raw K8s manifests
