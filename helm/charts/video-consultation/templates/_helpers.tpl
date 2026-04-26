{{- define "video-consultation.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "video-consultation.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "video-consultation.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "video-consultation.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "video-consultation.labels" -}}
app.kubernetes.io/name: {{ include "video-consultation.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: telehealth
{{- end -}}
{{- define "video-consultation.selectorLabels" -}}
app.kubernetes.io/name: {{ include "video-consultation.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
