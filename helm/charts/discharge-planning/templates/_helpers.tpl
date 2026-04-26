{{- define "discharge-planning.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "discharge-planning.labels" -}}
app.kubernetes.io/name: discharge-planning
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: ward-management
{{- end -}}

{{- define "discharge-planning.selectorLabels" -}}
app.kubernetes.io/name: discharge-planning
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
