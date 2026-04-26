# eligibility-service

Service in the **insurance** domain of HelixCare.

**Language:** Go · **Port:** 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/eligibility-service/](../../../helm/charts/eligibility-service/) — Helm chart
- [manifests/insurance/eligibility-service/](../../../manifests/insurance/eligibility-service/) — Raw K8s manifests
