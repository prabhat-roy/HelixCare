{{- define "data-retention.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "data-retention.labels" -}}
app.kubernetes.io/name: data-retention
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: compliance
{{- end -}}

{{- define "data-retention.selectorLabels" -}}
app.kubernetes.io/name: data-retention
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
