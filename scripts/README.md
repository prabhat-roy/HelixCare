# Operator scripts for HelixCare
| Script | Purpose |
|---|---|
| seed-data.sh | Load dev fixtures into Postgres + Mongo |
| migrate.sh   | Run per-service DB migration (Flyway / golang-migrate / Alembic) |
| deploy.sh    | Helmfile sync + ArgoCD sync per env / cloud |
| smoke.sh     | curl /healthz across critical services |
| backup.sh    | Velero backup of namespace |
| restore.sh   | Velero restore from backup |
| lint.sh      | go vet + yamllint + kubeconform + spectral + trivy fs |
| build.sh     | Docker build all services |
| port-forward.sh | Open all common ports locally |
| tools-up.sh  | Sync every OSS tool registered for this project |
