SENTRY_OPTIONS = {
    "system.url-prefix": "https://sentry.helixcare.internal",
    "system.secret-key": "REDACTED",
    "filestore.backend": "s3",
    "filestore.options": {"bucket_name": "helixcare-sentry-us-east-1"},
}
# Scrub PHI before storing events.
SENTRY_SCRUB_DATA = True
SENTRY_SCRUB_DEFAULTS = True
SENTRY_SENSITIVE_FIELDS = ["mrn","ssn","national_id","dob","date_of_birth","patient_name","email","phone"]
