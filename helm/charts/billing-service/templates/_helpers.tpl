{{- define "billing-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "billing-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "billing-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "billing-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "billing-service.labels" -}}
app.kubernetes.io/name: {{ include "billing-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: billing
{{- end -}}
{{- define "billing-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "billing-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
