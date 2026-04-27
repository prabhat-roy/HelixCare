# reminder-service

Service in the appointments domain of HelixCare.

Language: Go Â· Port: 50062

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/reminder-service/](../../../helm/charts/reminder-service/) â€” Helm chart
- [manifests/appointments/reminder-service/](../../../manifests/appointments/reminder-service/) â€” Raw K8s manifests
