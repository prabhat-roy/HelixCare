# consent-service

Service in the **compliance** domain of HelixCare.

**Language:** Go · **Port:** 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/consent-service/](../../../helm/charts/consent-service/) — Helm chart
- [manifests/compliance/consent-service/](../../../manifests/compliance/consent-service/) — Raw K8s manifests
