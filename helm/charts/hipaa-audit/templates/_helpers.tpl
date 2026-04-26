{{- define "hipaa-audit.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "hipaa-audit.labels" -}}
app.kubernetes.io/name: hipaa-audit
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: compliance
{{- end -}}

{{- define "hipaa-audit.selectorLabels" -}}
app.kubernetes.io/name: hipaa-audit
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
