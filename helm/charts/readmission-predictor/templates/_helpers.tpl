{{- define "readmission-predictor.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "readmission-predictor.labels" -}}
app.kubernetes.io/name: readmission-predictor
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: analytics
{{- end -}}

{{- define "readmission-predictor.selectorLabels" -}}
app.kubernetes.io/name: readmission-predictor
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
