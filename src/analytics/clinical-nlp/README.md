# clinical-nlp

Service in the **analytics** domain of HelixCare.

**Language:** Go · **Port:** 50303

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clinical-nlp/](../../../helm/charts/clinical-nlp/) — Helm chart
- [manifests/analytics/clinical-nlp/](../../../manifests/analytics/clinical-nlp/) — Raw K8s manifests
