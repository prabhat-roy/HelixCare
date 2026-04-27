# Streaming for HelixCare
- `debezium/` — CDC connectors for Postgres, MongoDB, MySQL → Kafka
- `flink/` — FlinkDeployment + 3 FlinkSessionJob templates (enrichment, anomaly detection, aggregation)
- `kafka-connect/` — Kafka Connect cluster Helm values
Apply: `kubectl apply -f flink/jobmanager-deployment.yaml; kubectl apply -f flink/jobs/`
