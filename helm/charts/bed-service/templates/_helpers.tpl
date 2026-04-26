{{- define "bed-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "bed-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "bed-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "bed-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "bed-service.labels" -}}
app.kubernetes.io/name: {{ include "bed-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: ward-management
{{- end -}}
{{- define "bed-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bed-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
