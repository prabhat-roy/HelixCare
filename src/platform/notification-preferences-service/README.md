# notification-preferences-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51005

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/notification-preferences-service/](../../../helm/charts/notification-preferences-service/) — Helm chart
- [manifests/platform/notification-preferences-service/](../../../manifests/platform/notification-preferences-service/) — Raw K8s manifests
