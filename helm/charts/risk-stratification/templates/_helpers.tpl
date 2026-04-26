{{- define "risk-stratification.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "risk-stratification.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "risk-stratification.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "risk-stratification.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "risk-stratification.labels" -}}
app.kubernetes.io/name: {{ include "risk-stratification.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: analytics
{{- end -}}
{{- define "risk-stratification.selectorLabels" -}}
app.kubernetes.io/name: {{ include "risk-stratification.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
