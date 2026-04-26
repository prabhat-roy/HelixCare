{{- define "prescription-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "prescription-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "prescription-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "prescription-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "prescription-service.labels" -}}
app.kubernetes.io/name: {{ include "prescription-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: pharmacy
{{- end -}}
{{- define "prescription-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "prescription-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
