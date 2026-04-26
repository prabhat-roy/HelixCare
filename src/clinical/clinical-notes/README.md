# clinical-notes

Service in the **clinical** domain of HelixCare.

**Language:** Go · **Port:** 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clinical-notes/](../../../helm/charts/clinical-notes/) — Helm chart
- [manifests/clinical/clinical-notes/](../../../manifests/clinical/clinical-notes/) — Raw K8s manifests
