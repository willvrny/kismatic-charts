{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "grafana.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "grafana.fullname" -}}
{{- $name := default "grafana" .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "grafana.server.fullname" -}}
{{- printf "%s-%s" .Release.Name "grafana" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the prometheus datasource name. Will be the same as the prometheus-server service name
*/}}
{{- define "datasource.defaul.url" -}}
{{- printf "%s%s-%s-%s" "http://" .Release.Name "prometheus" "server" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
