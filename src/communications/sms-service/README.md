# sms-service

Service in the **communications** domain of HelixCare.

**Language:** Go · **Port:** 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/sms-service/](../../../helm/charts/sms-service/) — Helm chart
- [manifests/communications/sms-service/](../../../manifests/communications/sms-service/) — Raw K8s manifests
