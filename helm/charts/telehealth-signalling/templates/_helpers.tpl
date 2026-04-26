{{- define "telehealth-signalling.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "telehealth-signalling.labels" -}}
app.kubernetes.io/name: telehealth-signalling
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: telehealth
{{- end -}}

{{- define "telehealth-signalling.selectorLabels" -}}
app.kubernetes.io/name: telehealth-signalling
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
