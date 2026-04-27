# Analytics for HelixCare
- `dbt/` — dbt project with staging + marts models, dual targets (Postgres dev, Trino+Iceberg prod)
- `airflow/dags/` — daily_etl, weekly_retrain, hourly data_quality DAGs
- `spark/jobs/` — PySpark batch jobs (daily aggregation, KMeans user segmentation)
