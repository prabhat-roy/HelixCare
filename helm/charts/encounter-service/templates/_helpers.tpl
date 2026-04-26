{{- define "encounter-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "encounter-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "encounter-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "encounter-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "encounter-service.labels" -}}
app.kubernetes.io/name: {{ include "encounter-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: clinical
{{- end -}}
{{- define "encounter-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "encounter-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
