-- HelixCare vital-signs hypertable for remote-monitoring.
CREATE TABLE IF NOT EXISTS vital_signs (
  ts            TIMESTAMPTZ NOT NULL,
  patient_id_h  TEXT NOT NULL,        -- SHA-256 hashed patient id; reverse via audit svc
  device_id     TEXT NOT NULL,
  metric        TEXT NOT NULL,        -- heart_rate, spo2, bp_sys, bp_dia, temp_c, resp_rate, glucose
  value         DOUBLE PRECISION NOT NULL,
  unit          TEXT NOT NULL,
  region        TEXT NOT NULL,
  source        TEXT NOT NULL,        -- wearable, in-clinic, telehealth
  raw_fhir_obs  JSONB
);

SELECT create_hypertable('vital_signs','ts', chunk_time_interval => INTERVAL '1 day', if_not_exists => TRUE);

CREATE INDEX IF NOT EXISTS idx_vitals_patient_metric ON vital_signs (patient_id_h, metric, ts DESC);

SELECT add_retention_policy('vital_signs', INTERVAL '7 years');
SELECT add_compression_policy('vital_signs', INTERVAL '7 days');

CREATE MATERIALIZED VIEW vital_signs_5m
WITH (timescaledb.continuous) AS
SELECT
  time_bucket('5 minutes', ts) AS bucket,
  patient_id_h, metric,
  AVG(value) AS avg, MIN(value) AS min, MAX(value) AS max, COUNT(*) AS n
FROM vital_signs
GROUP BY bucket, patient_id_h, metric;

SELECT add_continuous_aggregate_policy('vital_signs_5m',
  start_offset => INTERVAL '6 hours', end_offset => INTERVAL '5 minutes',
  schedule_interval => INTERVAL '5 minutes');
