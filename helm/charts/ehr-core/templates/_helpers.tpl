{{- define "ehr-core.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "ehr-core.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "ehr-core.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "ehr-core.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "ehr-core.labels" -}}
app.kubernetes.io/name: {{ include "ehr-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: ehr
{{- end -}}
{{- define "ehr-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ehr-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
