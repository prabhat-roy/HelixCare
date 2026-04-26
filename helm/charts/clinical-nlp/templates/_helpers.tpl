{{- define "clinical-nlp.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "clinical-nlp.labels" -}}
app.kubernetes.io/name: clinical-nlp
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: analytics
{{- end -}}

{{- define "clinical-nlp.selectorLabels" -}}
app.kubernetes.io/name: clinical-nlp
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
