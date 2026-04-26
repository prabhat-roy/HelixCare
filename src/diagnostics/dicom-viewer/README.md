# dicom-viewer

Service in the **diagnostics** domain of HelixCare.

**Language:** Go · **Port:** 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dicom-viewer/](../../../helm/charts/dicom-viewer/) — Helm chart
- [manifests/diagnostics/dicom-viewer/](../../../manifests/diagnostics/dicom-viewer/) — Raw K8s manifests
