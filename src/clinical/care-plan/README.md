# care-plan

Service in the clinical domain of HelixCare.

Language: Go Â· Port: 50082

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/care-plan/](../../../helm/charts/care-plan/) â€” Helm chart
- [manifests/clinical/care-plan/](../../../manifests/clinical/care-plan/) â€” Raw K8s manifests
