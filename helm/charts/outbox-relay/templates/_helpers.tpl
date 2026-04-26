{{- define "outbox-relay.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "outbox-relay.labels" -}}
app.kubernetes.io/name: outbox-relay
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "outbox-relay.selectorLabels" -}}
app.kubernetes.io/name: outbox-relay
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
