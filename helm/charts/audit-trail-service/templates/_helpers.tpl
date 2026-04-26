{{- define "audit-trail-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "audit-trail-service.labels" -}}
app.kubernetes.io/name: audit-trail-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: ehr
{{- end -}}

{{- define "audit-trail-service.selectorLabels" -}}
app.kubernetes.io/name: audit-trail-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
