# claim-submission

Service in the **insurance** domain of HelixCare.

**Language:** Go · **Port:** 50182

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/claim-submission/](../../../helm/charts/claim-submission/) — Helm chart
- [manifests/insurance/claim-submission/](../../../manifests/insurance/claim-submission/) — Raw K8s manifests
