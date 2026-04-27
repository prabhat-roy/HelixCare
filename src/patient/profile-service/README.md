# profile-service

Service in the patient domain of HelixCare.

Language: Go Â· Port: 50041

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/profile-service/](../../../helm/charts/profile-service/) â€” Helm chart
- [manifests/patient/profile-service/](../../../manifests/patient/profile-service/) â€” Raw K8s manifests
