{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart
*/}}
{{- define "kismatic-logging-efk.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for ElasticSearch client
*/}}
{{- define "elasticsearch.client.fullname" -}}
{{- printf "%s-%s" .Release.Name "es-client" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for ElasticSearch master
*/}}
{{- define "elasticsearch.master.fullname" -}}
{{- printf "%s-%s" .Release.Name "es-master" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for ElasticSearch data
*/}}
{{- define "elasticsearch.data.fullname" -}}
{{- printf "%s-%s" .Release.Name "es-data" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for ElasticSearch stateful set headless service
*/}}
{{- define "elasticsearch.data.service.fullname" -}}
{{- printf "%s-%s" .Release.Name "es-data" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Fully qualified name for ElasticSearch service
*/}}
{{- define "elasticsearch.service.fullname" -}}
{{- printf "%s-%s" .Release.Name "elasticsearch" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for ElasticSearch discovery service
*/}}
{{- define "elasticsearch.discovery.fullname" -}}
{{- printf "%s-%s" .Release.Name "elasticsearch-discovery" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for Fluentd
*/}}
{{- define "fluentd.fullname" -}}
{{- printf "%s-%s" .Release.Name "fluentd" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for Fluentd ConfigMap
*/}}
{{- define "fluentd.configmap.fullname" -}}
{{- printf "%s-%s" .Release.Name "fluentd-config" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for Kibana
*/}}
{{- define "kibana.fullname" -}}
{{- printf "%s-%s" .Release.Name "kibana" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for Kibana Service
*/}}
{{- define "kibana.service.fullname" -}}
{{- printf "%s-%s" .Release.Name "kibana" | trunc 63 | trimSuffix "-" -}}
{{- end -}}