{{- define "notification-orchestrator.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "notification-orchestrator.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "notification-orchestrator.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "notification-orchestrator.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "notification-orchestrator.labels" -}}
app.kubernetes.io/name: {{ include "notification-orchestrator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: communications
{{- end -}}
{{- define "notification-orchestrator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "notification-orchestrator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
