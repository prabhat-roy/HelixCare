{{- define "patient-registration.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "patient-registration.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "patient-registration.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "patient-registration.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "patient-registration.labels" -}}
app.kubernetes.io/name: {{ include "patient-registration.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: patient
{{- end -}}
{{- define "patient-registration.selectorLabels" -}}
app.kubernetes.io/name: {{ include "patient-registration.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
