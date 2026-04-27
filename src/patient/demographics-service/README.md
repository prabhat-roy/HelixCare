# demographics-service

Service in the patient domain of HelixCare.

Language: Go Â· Port: 50043

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/demographics-service/](../../../helm/charts/demographics-service/) â€” Helm chart
- [manifests/patient/demographics-service/](../../../manifests/patient/demographics-service/) â€” Raw K8s manifests
