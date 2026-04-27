# duty-roster

Service in the staff domain of HelixCare.

Language: Go Â· Port: 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/duty-roster/](../../../helm/charts/duty-roster/) â€” Helm chart
- [manifests/staff/duty-roster/](../../../manifests/staff/duty-roster/) â€” Raw K8s manifests
