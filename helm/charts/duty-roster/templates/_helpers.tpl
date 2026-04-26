{{- define "duty-roster.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "duty-roster.labels" -}}
app.kubernetes.io/name: duty-roster
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: staff
{{- end -}}

{{- define "duty-roster.selectorLabels" -}}
app.kubernetes.io/name: duty-roster
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
