-- HIPAA audit log: append-only, 6+ year retention, region-replicated only within region.
CREATE KEYSPACE IF NOT EXISTS helixcare_audit
  WITH replication = { 'class': 'NetworkTopologyStrategy', 'us-east-1': '3' }
  AND durable_writes = true;

USE helixcare_audit;

CREATE TABLE IF NOT EXISTS phi_access_log (
  bucket_day      date,
  occurred_at     timestamp,
  event_id        uuid,
  subject_service text,
  subject_user    text,
  resource_type   text,
  resource_id_h   text,    -- SHA-256 of resource ID
  action          text,
  purpose         text,
  decision        text,
  source_ip_h     text,
  region          text,
  raw_envelope    blob,
  PRIMARY KEY ((bucket_day), occurred_at, event_id)
) WITH CLUSTERING ORDER BY (occurred_at DESC)
   AND default_time_to_live = 220752000   -- 7 years
   AND compaction = { 'class': 'TimeWindowCompactionStrategy', 'compaction_window_size': 1, 'compaction_window_unit': 'DAYS' };

CREATE TABLE IF NOT EXISTS consent_changes (
  patient_id_h    text,
  changed_at      timestamp,
  consent_id      uuid,
  scope           list<text>,
  granted_to      text,
  expires_at      timestamp,
  PRIMARY KEY ((patient_id_h), changed_at, consent_id)
) WITH default_time_to_live = 220752000;
