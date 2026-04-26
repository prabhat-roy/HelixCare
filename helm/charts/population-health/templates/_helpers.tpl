{{- define "population-health.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "population-health.labels" -}}
app.kubernetes.io/name: population-health
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: analytics
{{- end -}}

{{- define "population-health.selectorLabels" -}}
app.kubernetes.io/name: population-health
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
