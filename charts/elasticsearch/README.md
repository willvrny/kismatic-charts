# Elasticsearch

Elasticsearch deployment on Kubernetes, following best practices as recommended
by the elastic team in their Reference documentation.

This chart is heavily-based on Paulo Pires' [kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) repo. Thanks @pires.

# Requirements
* Kubernetes cluster with at least two worker nodes

# Details
## Nodes
This chart will deploy the following elasticsearch nodes:
* Master nodes
* Client nodes
* Data nodes

## Privileged init-container
Elasticsearch uses memory-mapped files (mmap) to store the shard index. The default
operating system limits on mmap are usually too low. For this reason, an init-container
is used to increase the limit in the underlying machine. This requires privileged access.

## Data nodes
Data nodes are deployed using a StatefulSet.

# Configuration
