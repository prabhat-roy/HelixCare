# drug-interaction

Service in the **pharmacy** domain of HelixCare.

**Language:** Go · **Port:** 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/drug-interaction/](../../../helm/charts/drug-interaction/) — Helm chart
- [manifests/pharmacy/drug-interaction/](../../../manifests/pharmacy/drug-interaction/) — Raw K8s manifests
