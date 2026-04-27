# registration-service

Service in the patient domain of HelixCare.

Language: Go Â· Port: 50040

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/registration-service/](../../../helm/charts/registration-service/) â€” Helm chart
- [manifests/patient/registration-service/](../../../manifests/patient/registration-service/) â€” Raw K8s manifests
