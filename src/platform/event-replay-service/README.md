# event-replay-service

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51009

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/event-replay-service/](../../../helm/charts/event-replay-service/) — Helm chart
- [manifests/platform/event-replay-service/](../../../manifests/platform/event-replay-service/) — Raw K8s manifests
