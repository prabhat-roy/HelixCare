{{- define "slot-management.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "slot-management.labels" -}}
app.kubernetes.io/name: slot-management
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: appointments
{{- end -}}

{{- define "slot-management.selectorLabels" -}}
app.kubernetes.io/name: slot-management
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
