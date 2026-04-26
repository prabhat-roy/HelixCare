{{- define "clinical-notes.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "clinical-notes.labels" -}}
app.kubernetes.io/name: clinical-notes
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: clinical
{{- end -}}

{{- define "clinical-notes.selectorLabels" -}}
app.kubernetes.io/name: clinical-notes
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
