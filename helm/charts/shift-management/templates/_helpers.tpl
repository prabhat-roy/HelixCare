{{- define "shift-management.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "shift-management.labels" -}}
app.kubernetes.io/name: shift-management
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: staff
{{- end -}}

{{- define "shift-management.selectorLabels" -}}
app.kubernetes.io/name: shift-management
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
