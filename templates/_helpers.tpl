{{/* torchserve-chart/templates/_helpers.tpl */}}
{{- define "torchserve-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "torchserve-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "torchserve-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "torchserve-chart.labels" -}}
helm.sh/chart: {{ include "torchserve-chart.chart" . }}
{{ include "torchserve-chart.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "torchserve-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "torchserve-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}