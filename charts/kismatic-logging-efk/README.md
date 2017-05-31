# Kismatic Centralized Logging (EFK)

Centralized logging for Kubernetes clusters based on Elasticsearch, Fluentd 
and Kibana.

## Details
This chart will do the following:
* Deploy an elasticsearch cluster for storing logs
* Deploy Fluentd as a daemonset on all cluster nodes
* Deploy Kibana for viewing, searching and dashboarding

## Prerequisites
* At least two Kubernetes worker nodes

## Installing the chart

## Configuration

## Acknowledgment

The Elasticsearch deployment that is part of this repo is heavily-based on Paulo Pires' [kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) repo. Thanks @pires.