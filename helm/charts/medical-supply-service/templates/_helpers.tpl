{{- define "medical-supply-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "medical-supply-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "medical-supply-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "medical-supply-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "medical-supply-service.labels" -}}
app.kubernetes.io/name: {{ include "medical-supply-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: inventory
{{- end -}}
{{- define "medical-supply-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "medical-supply-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
