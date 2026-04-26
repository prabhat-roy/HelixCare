# outbox-relay

Service in the **platform** domain of HelixCare.

**Language:** Go · **Port:** 51002

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/outbox-relay/](../../../helm/charts/outbox-relay/) — Helm chart
- [manifests/platform/outbox-relay/](../../../manifests/platform/outbox-relay/) — Raw K8s manifests
