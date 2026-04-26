package helixcare.phi_access

import future.keywords.if
import future.keywords.in

# Authorize a service-to-service call that touches PHI.
#  input := {
#    "subject":  { "service": "...", "scopes": ["..."], "mfa_at": int },
#    "resource": { "type": "Patient|Observation|...", "id": "...", "owning_facility": "..." },
#    "action":   "read|write|delete",
#    "purpose":  "treatment|payment|operations|research|emergency",
#    "consent":  { "active": bool, "scope": ["..."], "expires_at": int },
#    "now":      int
#  }

default allow := false

allow if {
    valid_purpose
    consent_or_break_glass
    minimum_scope
    mfa_recent
}

valid_purpose if { input.purpose in {"treatment","payment","operations","research","emergency"} }

consent_or_break_glass if {
    input.purpose == "emergency"   # break-glass auto-allowed but mandatorily audited
}
consent_or_break_glass if {
    input.consent.active == true
    input.consent.expires_at > input.now
    input.action in input.consent.scope
}

# A service can only request scopes it is registered to need.
minimum_scope if {
    required := required_scope[input.resource.type]
    required in input.subject.scopes
}

required_scope := { "Patient": "patient.read", "Observation": "observation.read", "MedicationRequest": "med.read", "DiagnosticReport": "dx.read" }

# MFA recency: within 8h for all PHI calls; 1h for delete.
mfa_recent if {
    input.action != "delete"
    input.now - input.subject.mfa_at < 28800
}
mfa_recent if {
    input.action == "delete"
    input.now - input.subject.mfa_at < 3600
}

# Always emit a structured audit event when allow is true.
audit := {
    "event":    "phi_access_decision",
    "decision": allow,
    "subject":  input.subject.service,
    "resource_type": input.resource.type,
    "resource_id_hash": sha256(input.resource.id),
    "purpose":  input.purpose,
    "ts":       input.now,
}
