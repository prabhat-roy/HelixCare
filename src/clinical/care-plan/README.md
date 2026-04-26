# care-plan

Service in the **clinical** domain of HelixCare.

**Language:** Go · **Port:** 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/care-plan/](../../../helm/charts/care-plan/) — Helm chart
- [manifests/clinical/care-plan/](../../../manifests/clinical/care-plan/) — Raw K8s manifests
