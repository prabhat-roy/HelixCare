# TOOLS.md — every OSS tool registered for HelixCare

This file is the single inventory of every OSS tool wired up for HelixCare.
Each tool has a `values.yaml` (Helm) and a `README.md` in its directory.

The ArgoCD ApplicationSet at [gitops/argocd/applicationsets/all-tools-applicationset.yaml](gitops/argocd/applicationsets/all-tools-applicationset.yaml)
discovers every tool directory under the categories below and deploys each as a
managed Application. Run `make tools-deploy` to sync them all.

| Category | Tool | Path |
|---|---|---|| security | [anchore](security/anchore/) | `security/anchore/` (scaffold) |
| security | [authentik](security/authentik/) | `security/authentik/` (scaffold) |
| security | [boundary](security/boundary/) | `security/boundary/` (scaffold) |
| security | [cert-manager](security/cert-manager/) | `security/cert-manager/` (scaffold) |
| security | [clair](security/clair/) | `security/clair/` (scaffold) |
| security | [coraza-waf](security/coraza-waf/) | `security/coraza-waf/` (scaffold) |
| security | [cosign](security/cosign/) | `security/cosign/` (scaffold) |
| security | [crowdsec](security/crowdsec/) | `security/crowdsec/` (scaffold) |
| security | [defectdojo](security/defectdojo/) | `security/defectdojo/` (scaffold) |
| security | [dependency-track](security/dependency-track/) | `security/dependency-track/` (scaffold) |
| security | [external-secrets](security/external-secrets/) | `security/external-secrets/` (scaffold) |
| security | [falco](security/falco/) | `security/falco/` (scaffold) |
| security | [grype](security/grype/) | `security/grype/` (scaffold) |
| security | [in-toto](security/in-toto/) | `security/in-toto/` (scaffold) |
| security | [infisical](security/infisical/) | `security/infisical/` (scaffold) |
| security | [keycloak](security/keycloak/) | `security/keycloak/` (scaffold) |
| security | [kube-bench](security/kube-bench/) | `security/kube-bench/` (scaffold) |
| security | [kube-hunter](security/kube-hunter/) | `security/kube-hunter/` (scaffold) |
| security | [kubearmor](security/kubearmor/) | `security/kubearmor/` (scaffold) |
| security | [kubescape](security/kubescape/) | `security/kubescape/` (scaffold) |
| security | [kyverno](security/kyverno/) | `security/kyverno/` (scaffold) |
| security | [nuclei](security/nuclei/) | `security/nuclei/` (scaffold) |
| security | [opa](security/opa/) | `security/opa/` (scaffold) |
| security | [opal](security/opal/) | `security/opal/` (deployable) |
| security | [openfga](security/openfga/) | `security/openfga/` (scaffold) |
| security | [openvas](security/openvas/) | `security/openvas/` (scaffold) |
| security | [ory-hydra](security/ory-hydra/) | `security/ory-hydra/` (deployable) |
| security | [ory-kratos](security/ory-kratos/) | `security/ory-kratos/` (deployable) |
| security | [permify](security/permify/) | `security/permify/` (scaffold) |
| security | [polaris](security/polaris/) | `security/polaris/` (scaffold) |
| security | [pomerium](security/pomerium/) | `security/pomerium/` (scaffold) |
| security | [sealed-secrets](security/sealed-secrets/) | `security/sealed-secrets/` (scaffold) |
| security | [slsa](security/slsa/) | `security/slsa/` (scaffold) |
| security | [sops](security/sops/) | `security/sops/` (scaffold) |
| security | [spicedb](security/spicedb/) | `security/spicedb/` (scaffold) |
| security | [spire](security/spire/) | `security/spire/` (scaffold) |
| security | [suricata](security/suricata/) | `security/suricata/` (scaffold) |
| security | [syft](security/syft/) | `security/syft/` (scaffold) |
| security | [teleport](security/teleport/) | `security/teleport/` (scaffold) |
| security | [trivy](security/trivy/) | `security/trivy/` (scaffold) |
| security | [vault](security/vault/) | `security/vault/` (scaffold) |
| security | [wazuh](security/wazuh/) | `security/wazuh/` (scaffold) |
| security | [zap](security/zap/) | `security/zap/` (scaffold) |
| security | [zeek](security/zeek/) | `security/zeek/` (scaffold) |
| security | [zitadel](security/zitadel/) | `security/zitadel/` (deployable) |
| observability | [alertmanager](observability/alertmanager/) | `observability/alertmanager/` (scaffold) |
| observability | [botkube](observability/botkube/) | `observability/botkube/` (scaffold) |
| observability | [coroot](observability/coroot/) | `observability/coroot/` (scaffold) |
| observability | [fluent-bit](observability/fluent-bit/) | `observability/fluent-bit/` (scaffold) |
| observability | [glitchtip](observability/glitchtip/) | `observability/glitchtip/` (scaffold) |
| observability | [grafana](observability/grafana/) | `observability/grafana/` (scaffold) |
| observability | [grafana-alloy](observability/grafana-alloy/) | `observability/grafana-alloy/` (deployable) |
| observability | [healthchecks](observability/healthchecks/) | `observability/healthchecks/` (scaffold) |
| observability | [jaeger](observability/jaeger/) | `observability/jaeger/` (scaffold) |
| observability | [kepler](observability/kepler/) | `observability/kepler/` (deployable) |
| observability | [kiali](observability/kiali/) | `observability/kiali/` (scaffold) |
| observability | [kubecost](observability/kubecost/) | `observability/kubecost/` (scaffold) |
| observability | [loki](observability/loki/) | `observability/loki/` (scaffold) |
| observability | [mimir](observability/mimir/) | `observability/mimir/` (deployable) |
| observability | [netdata](observability/netdata/) | `observability/netdata/` (scaffold) |
| observability | [opencost](observability/opencost/) | `observability/opencost/` (deployable) |
| observability | [otel-collector](observability/otel-collector/) | `observability/otel-collector/` (scaffold) |
| observability | [parca](observability/parca/) | `observability/parca/` (scaffold) |
| observability | [perses](observability/perses/) | `observability/perses/` (deployable) |
| observability | [pixie](observability/pixie/) | `observability/pixie/` (scaffold) |
| observability | [prometheus](observability/prometheus/) | `observability/prometheus/` (scaffold) |
| observability | [pyroscope](observability/pyroscope/) | `observability/pyroscope/` (scaffold) |
| observability | [sentry](observability/sentry/) | `observability/sentry/` (scaffold) |
| observability | [slo](observability/slo/) | `observability/slo/` (scaffold) |
| observability | [tempo](observability/tempo/) | `observability/tempo/` (scaffold) |
| observability | [tracetest](observability/tracetest/) | `observability/tracetest/` (scaffold) |
| observability | [uptime-kuma](observability/uptime-kuma/) | `observability/uptime-kuma/` (scaffold) |
| observability | [victoria-logs](observability/victoria-logs/) | `observability/victoria-logs/` (scaffold) |
| observability | [victoria-metrics](observability/victoria-metrics/) | `observability/victoria-metrics/` (scaffold) |
| messaging | [apprise](messaging/apprise/) | `messaging/apprise/` (scaffold) |
| messaging | [conduktor](messaging/conduktor/) | `messaging/conduktor/` (scaffold) |
| messaging | [kafka](messaging/kafka/) | `messaging/kafka/` (scaffold) |
| messaging | [mailpit](messaging/mailpit/) | `messaging/mailpit/` (scaffold) |
| messaging | [nats](messaging/nats/) | `messaging/nats/` (scaffold) |
| messaging | [novu](messaging/novu/) | `messaging/novu/` (scaffold) |
| messaging | [postal](messaging/postal/) | `messaging/postal/` (scaffold) |
| messaging | [pulsar](messaging/pulsar/) | `messaging/pulsar/` (scaffold) |
| messaging | [rabbitmq](messaging/rabbitmq/) | `messaging/rabbitmq/` (scaffold) |
| messaging | [redpanda](messaging/redpanda/) | `messaging/redpanda/` (scaffold) |
| messaging | [schema-registry](messaging/schema-registry/) | `messaging/schema-registry/` (scaffold) |
| networking | [cilium](networking/cilium/) | `networking/cilium/` (scaffold) |
| networking | [contour](networking/contour/) | `networking/contour/` (scaffold) |
| networking | [emissary](networking/emissary/) | `networking/emissary/` (scaffold) |
| networking | [gloo-edge](networking/gloo-edge/) | `networking/gloo-edge/` (scaffold) |
| networking | [istio](networking/istio/) | `networking/istio/` (scaffold) |
| networking | [kong](networking/kong/) | `networking/kong/` (scaffold) |
| networking | [kube-vip](networking/kube-vip/) | `networking/kube-vip/` (scaffold) |
| networking | [linkerd](networking/linkerd/) | `networking/linkerd/` (scaffold) |
| networking | [metallb](networking/metallb/) | `networking/metallb/` (scaffold) |
| networking | [multus](networking/multus/) | `networking/multus/` (scaffold) |
| networking | [submariner](networking/submariner/) | `networking/submariner/` (scaffold) |
| networking | [traefik](networking/traefik/) | `networking/traefik/` (scaffold) |
| databases | [cassandra](databases/cassandra/) | `databases/cassandra/` (scaffold) |
| databases | [cloudnativepg](databases/cloudnativepg/) | `databases/cloudnativepg/` (scaffold) |
| databases | [dragonfly](databases/dragonfly/) | `databases/dragonfly/` (scaffold) |
| databases | [druid](databases/druid/) | `databases/druid/` (scaffold) |
| databases | [elasticsearch](databases/elasticsearch/) | `databases/elasticsearch/` (scaffold) |
| databases | [iceberg](databases/iceberg/) | `databases/iceberg/` (scaffold) |
| databases | [manticore](databases/manticore/) | `databases/manticore/` (scaffold) |
| databases | [meilisearch](databases/meilisearch/) | `databases/meilisearch/` (scaffold) |
| databases | [mongodb](databases/mongodb/) | `databases/mongodb/` (scaffold) |
| databases | [nessie](databases/nessie/) | `databases/nessie/` (scaffold) |
| databases | [pinot](databases/pinot/) | `databases/pinot/` (scaffold) |
| databases | [postgres](databases/postgres/) | `databases/postgres/` (scaffold) |
| databases | [redis](databases/redis/) | `databases/redis/` (scaffold) |
| databases | [timescaledb](databases/timescaledb/) | `databases/timescaledb/` (scaffold) |
| databases | [trino](databases/trino/) | `databases/trino/` (scaffold) |
| databases | [typesense](databases/typesense/) | `databases/typesense/` (scaffold) |
| databases | [valkey](databases/valkey/) | `databases/valkey/` (scaffold) |
| databases | [yugabyte](databases/yugabyte/) | `databases/yugabyte/` (scaffold) |
| data | [benthos](data/benthos/) | `data/benthos/` (deployable) |
| data | [datahub](data/datahub/) | `data/datahub/` (deployable) |
| data | [hudi](data/hudi/) | `data/hudi/` (deployable) |
| data | [iceberg](data/iceberg/) | `data/iceberg/` (deployable) |
| data | [nifi](data/nifi/) | `data/nifi/` (deployable) |
| data | [openmetadata](data/openmetadata/) | `data/openmetadata/` (deployable) |
| data | [polaris](data/polaris/) | `data/polaris/` (deployable) |
| data | [trino](data/trino/) | `data/trino/` (deployable) |
| supply-chain | [dependency-track](supply-chain/dependency-track/) | `supply-chain/dependency-track/` (deployable) |
| supply-chain | [fosslight](supply-chain/fosslight/) | `supply-chain/fosslight/` (deployable) |
| supply-chain | [guac](supply-chain/guac/) | `supply-chain/guac/` (deployable) |
| supply-chain | [in-toto](supply-chain/in-toto/) | `supply-chain/in-toto/` (doc-only) |
| supply-chain | [scancode](supply-chain/scancode/) | `supply-chain/scancode/` (doc-only) |
| sustainability | [chaoss](sustainability/chaoss/) | `sustainability/chaoss/` (doc-only) |
| sustainability | [cloud-carbon-footprint](sustainability/cloud-carbon-footprint/) | `sustainability/cloud-carbon-footprint/` (deployable) |
| edge | [edgex-foundry](edge/edgex-foundry/) | `edge/edgex-foundry/` (deployable) |
| edge | [hawkbit](edge/hawkbit/) | `edge/hawkbit/` (deployable) |
| edge | [mainflux](edge/mainflux/) | `edge/mainflux/` (deployable) |
| edge | [thingsboard](edge/thingsboard/) | `edge/thingsboard/` (deployable) |
| streaming | [debezium](streaming/debezium/) | `streaming/debezium/` (scaffold) |
| streaming | [flink](streaming/flink/) | `streaming/flink/` (scaffold) |
| streaming | [kafka-connect](streaming/kafka-connect/) | `streaming/kafka-connect/` (values-only) |
| workflow | [camunda](workflow/camunda/) | `workflow/camunda/` (scaffold) |
| workflow | [conductor](workflow/conductor/) | `workflow/conductor/` (scaffold) |
| workflow | [dagster](workflow/dagster/) | `workflow/dagster/` (scaffold) |
| workflow | [flowable](workflow/flowable/) | `workflow/flowable/` (scaffold) |
| workflow | [kestra](workflow/kestra/) | `workflow/kestra/` (scaffold) |
| workflow | [n8n](workflow/n8n/) | `workflow/n8n/` (scaffold) |
| workflow | [node-red](workflow/node-red/) | `workflow/node-red/` (scaffold) |
| workflow | [prefect](workflow/prefect/) | `workflow/prefect/` (scaffold) |
| workflow | [zeebe](workflow/zeebe/) | `workflow/zeebe/` (scaffold) |
| domain-oss | [hapi-subscriptions](domain-oss/hapi-subscriptions/) | `domain-oss/hapi-subscriptions/` (deployable) |
| domain-oss | [open-health-stack](domain-oss/open-health-stack/) | `domain-oss/open-health-stack/` (doc-only) |
| domain-oss | [openmrs](domain-oss/openmrs/) | `domain-oss/openmrs/` (deployable) |
| domain-oss | [pathling](domain-oss/pathling/) | `domain-oss/pathling/` (deployable) |
| domain-oss | [synapse-fhir](domain-oss/synapse-fhir/) | `domain-oss/synapse-fhir/` (deployable) |
| mobile | [capacitor](mobile/capacitor/) | `mobile/capacitor/` (doc-only) |
| frontend-platform | [astro](frontend-platform/astro/) | `frontend-platform/astro/` (doc-only) |
| frontend-platform | [axe-core](frontend-platform/axe-core/) | `frontend-platform/axe-core/` (doc-only) |
| frontend-platform | [lighthouse-ci](frontend-platform/lighthouse-ci/) | `frontend-platform/lighthouse-ci/` (doc-only) |
| frontend-platform | [module-federation](frontend-platform/module-federation/) | `frontend-platform/module-federation/` (doc-only) |
| frontend-platform | [pa11y-ci](frontend-platform/pa11y-ci/) | `frontend-platform/pa11y-ci/` (doc-only) |
| frontend-platform | [webpagetest](frontend-platform/webpagetest/) | `frontend-platform/webpagetest/` (doc-only) |
| devx | [daytona](devx/daytona/) | `devx/daytona/` (doc-only) |
| devx | [devpod](devx/devpod/) | `devx/devpod/` (doc-only) |
| devx | [mirrord](devx/mirrord/) | `devx/mirrord/` (doc-only) |
| devx | [sourcegraph](devx/sourcegraph/) | `devx/sourcegraph/` (deployable) |
| chaos | [chaos/](chaos/) | `chaos/` (configs only — non-Helm) |
| analytics | [analytics/](analytics/) | `analytics/` (configs only — non-Helm) |
| api-testing | [api-testing/](api-testing/) | `api-testing/` (configs only — non-Helm) |
| load-testing | [load-testing/](load-testing/) | `load-testing/` (configs only — non-Helm) |
| scripts | [scripts/](scripts/) | `scripts/` (configs only — non-Helm) |
| backstage | [backstage/](backstage/) | `backstage/` (configs only — non-Helm) |

## Deployment
```bash
make tools-deploy   # apply ApplicationSet to ArgoCD
make tools-status   # show sync state
make tools-doctor   # verify every tool dir has values.yaml + README.md
```

