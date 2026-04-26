# hipaa-audit

Service in the **compliance** domain of HelixCare.

**Language:** Go · **Port:** 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/hipaa-audit/](../../../helm/charts/hipaa-audit/) — Helm chart
- [manifests/compliance/hipaa-audit/](../../../manifests/compliance/hipaa-audit/) — Raw K8s manifests
