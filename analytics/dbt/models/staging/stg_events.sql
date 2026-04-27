{{ config(materialized="view") }}
SELECT event_id, event_time_ms, tenant_id, actor_id, correlation_id, payload
FROM {{ source("raw", "events") }}
WHERE event_time_ms >= EXTRACT(EPOCH FROM CURRENT_DATE - INTERVAL '90 days') * 1000
