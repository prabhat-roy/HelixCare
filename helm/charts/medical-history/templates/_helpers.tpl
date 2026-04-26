{{- define "medical-history.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "medical-history.labels" -}}
app.kubernetes.io/name: medical-history
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: patient
{{- end -}}

{{- define "medical-history.selectorLabels" -}}
app.kubernetes.io/name: medical-history
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
