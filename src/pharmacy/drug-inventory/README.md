# drug-inventory

Service in the **pharmacy** domain of HelixCare.

**Language:** Go · **Port:** 50121

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/drug-inventory/](../../../helm/charts/drug-inventory/) — Helm chart
- [manifests/pharmacy/drug-inventory/](../../../manifests/pharmacy/drug-inventory/) — Raw K8s manifests
