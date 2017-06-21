# Prometheus-Grafana Helm Chart

* Intalls Prometheus and Grafana monitoring stack
* Automatically configures Prometheus as a datasource in Grafana
* Deploys a few useful dashboards to monitor your kuberntes cluster and the resources deployed

## To install
```
helm install kismatic/prometheus-grafana --name monitoring --namespace monitoring --set server.adminPassword=$GRAFANA_ADMIN_PASSWORD
```

This will deploy all the kuberntes resources for this chart and print out the details. 

**If you modify the values for `prometheus.nameOverride` or `prometheus.server.name` you must `--set` the same values in `grafana.server.setDatasource.datasource.url` as `http://<name>-<prometheus.nameOverride>-<prometheus.server.name>` for the Prometheus datasource configuration to work correctly.**

To view all avaible options in the chart see [values.yaml](https://github.com/apprenda/kismatic-charts/blob/master/charts/prometheus/values.yaml)

To override 

## To upgrade
```
helm upgrade monitoring kismatic/prometheus-grafana --reuse-values
```

## To uninstall
```
helm delete monitoring --purge
```

## Components
### Grafana
#### Components
* [Grafana](http://grafana.org/) - web dashboarding system 
* [grafana-watcher](https://github.com/coreos/prometheus-operator/tree/master/contrib/grafana-watcher) - resposible for loading dashboards into Grafana from a ConfigMap
#### Configuration
| Parameter                                      | Description                               | Default                                           |
|------------------------------------------------|-------------------------------------------|---------------------------------------------------|
| `grafana.server.image`                         | Container image to run                    | grafana/grafana:4.3.2                             |
| `grafana.server.adminUser`                     | Admin user username                       | admin                                             |
| `grafana.server.adminPassword`                 | Admin user password                       | admin                                             |
| `grafana.server.persistentVolume.enabled`      | Create a volume to store data             | false                                             |
| `grafana.server.persistentVolume.size`         | Size of persistent volume claim           | 1Gi RW                                            |
| `grafana.server.persistentVolume.storageClass` | Type of persistent volume claim           | null                                              |
| `grafana.server.persistentVolume.accessMode`   | ReadWriteOnce or ReadOnly                 | [ReadWriteOnce]                                   |
| `grafana.server.persistentVolume.existingClaim`| Existing persistent volume claim          | null                                              |
| `grafana.server.persistentVolume.subPath`      | Subdirectory of pvc to mount              | null                                              |
| `grafana.server.resources`                     | Server resource requests and limits       | requests: {cpu: 100m, memory: 100Mi}              |
| `grafana.server.serviceType`                   | ClusterIP, NodePort, or LoadBalancer      | NodePort                                          |
| `grafana.server.ingress.enabled`							 | Enable with an ingress controller running | false                                             |
| `grafana.server.ingress.hosts`							   | Domain name for the ingress resource      | null                                              |

### Prometheus
#### Components
* [Prometheus](https://github.com/prometheus/prometheus) - is a systems and service monitoring system
* [alertmanager](https://github.com/prometheus/alertmanager) - handles alerts sent by Prometheus server
* [node-exporter](https://github.com/prometheus/node_exporter) - a Prometheus exporter for hardware and OS metrics exposed by *NIX kernels
* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics) -  a simple service that listens to the Kubernetes API server and generates metrics about the state of the objects runnning on the Kuberntes cluster, such as deployments, nodes and pods.
#### Configuration
| Parameter                         | Description                  | Default |
|---------------------------------- | ---------------------------- | --------|
| `prometheus.alertmanager.enabled` | If true, create alertmanager | `true` |
| `prometheus.alertmanager.name` | alertmanager container name | `alertmanager` |
| `prometheus.alertmanager.image.repository` | alertmanager container image repository | `prom/alertmanager` |
| `prometheus.alertmanager.image.tag` | alertmanager container image tag | `v0.5.1` |
| `prometheus.alertmanager.image.pullPolicy` | alertmanager container image pull policy | `IfNotPresent` |
| `prometheus.alertmanager.extraArgs` | Additional alertmanager container arguments | `{}` |
| `prometheus.alertmanager.ingress.enabled` | If true, alertmanager Ingress will be created | `false` |
| `prometheus.alertmanager.ingress.annotations` | alertmanager Ingress annotations | `{}` |
| `prometheus.alertmanager.ingress.hosts` | alertmanager Ingress hostnames | `[]` |
| `prometheus.alertmanager.ingress.tls` | alertmanager Ingress TLS configuration (YAML) | `[]` |
| `prometheus.alertmanager.nodeSelector` | node labels for alertmanager pod assignment | `{}` |
| `prometheus.alertmanager.persistentVolume.enabled` | If true, alertmanager will create a Persistent Volume Claim | `false` |
| `prometheus.alertmanager.persistentVolume.accessModes` | alertmanager data Persistent Volume access modes | `[ReadWriteOnce]` |
| `prometheus.alertmanager.persistentVolume.annotations` | Annotations for alertmanager Persistent Volume Claim` | `{}` |
| `prometheus.alertmanager.persistentVolume.existingClaim` | alertmanager data Persistent Volume existing claim name | `""` |
| `prometheus.alertmanager.persistentVolume.mountPath` | alertmanager data Persistent Volume mount root path | `/data` |
| `prometheus.alertmanager.persistentVolume.size` | alertmanager data Persistent Volume size | `2Gi` |
| `prometheus.alertmanager.persistentVolume.storageClass` | alertmanager data Persistent Volume Storage Class | `volume.alpha.kubernetes.io/storage-class: default` |
| `prometheus.alertmanager.persistentVolume.subPath` | Subdirectory of alertmanager data Persistent Volume to mount | `""` |
| `prometheus.alertmanager.podAnnotations` | annotations to be added to alertmanager pods | `{}` |
| `prometheus.alertmanager.replicaCount` | desired number of alertmanager pods | `1` |
| `prometheus.alertmanager.resources` | alertmanager pod resource requests & limits | `{}` |
| `prometheus.alertmanager.service.annotations` | annotations for alertmanager service | `{}` |
| `prometheus.alertmanager.service.clusterIP` | internal alertmanager cluster service IP | `""` |
| `prometheus.alertmanager.service.externalIPs` | alertmanager service external IP addresses | `[]` |
| `prometheus.alertmanager.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""` |
| `prometheus.alertmanager.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]` |
| `prometheus.alertmanager.service.servicePort` | alertmanager service port | `80` |
| `prometheus.alertmanager.service.type` | type of alertmanager service to create | `NodePort` |
| `prometheus.alertmanagerFiles` | alertmanager ConfigMap entries | `alertmanager.yml` |
| `prometheus.configmapReload.name` | configmap-reload container name | `configmap-reload` |
| `prometheus.configmapReload.image.repository` | configmap-reload container image repository | `jimmidyson/configmap-reload` |
| `prometheus.configmapReload.image.tag` | configmap-reload container image tag | `v0.1` |
| `prometheus.configmapReload.image.pullPolicy` | configmap-reload container image pull policy | `IfNotPresent` |
| `prometheus.configmapReload.resources` | configmap-reload pod resource requests & limits | `{}` |
| `prometheus.kubeStateMetrics.enabled` | If true, create kube-state-metrics | `true` |
| `prometheus.kubeStateMetrics.name` | kube-state-metrics container name | `kube-state-metrics` |
| `prometheus.kubeStateMetrics.image.repository` | kube-state-metrics container image repository| `gcr.io/google_containers/kube-state-metrics` |
| `prometheus.kubeStateMetrics.image.tag` | kube-state-metrics container image tag | `v0.4.1` |
| `prometheus.kubeStateMetrics.image.pullPolicy` | kube-state-metrics container image pull policy | `IfNotPresent` |
| `prometheus.kubeStateMetrics.nodeSelector` | node labels for kube-state-metrics pod assignment | `{}` |
| `prometheus.kubeStateMetrics.podAnnotations` | annotations to be added to kube-state-metrics pods | `{}` |
| `prometheus.kubeStateMetrics.replicaCount` | desired number of kube-state-metrics pods | `1` |
| `prometheus.kubeStateMetrics.resources` | kube-state-metrics resource requests and limits (YAML) | `{}` |
| `prometheus.kubeStateMetrics.service.annotations` | annotations for kube-state-metrics service | `{prometheus.io/scrape: "true"}` |
| `prometheus.kubeStateMetrics.service.clusterIP` | internal kube-state-metrics cluster service IP | `None` |
| `prometheus.kubeStateMetrics.service.externalIPs` | kube-state-metrics service external IP addresses | `[]` |
| `prometheus.kubeStateMetrics.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""` |
| `prometheus.kubeStateMetrics.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]` |
| `prometheus.kubeStateMetrics.service.servicePort` | kube-state-metrics service port | `80` |
| `prometheus.kubeStateMetrics.service.type` | type of kube-state-metrics service to create | `ClusterIP` |
| `prometheus.nodeExporter.enabled` | If true, create node-exporter | `true` |
| `prometheus.nodeExporter.name` | node-exporter container name | `node-exporter` |
| `prometheus.nodeExporter.image.repository` | node-exporter container image repository| `prom/node-exporter` |
| `prometheus.nodeExporter.image.tag` | node-exporter container image tag | `v0.13.0` |
| `prometheus.nodeExporter.image.pullPolicy` | node-exporter container image pull policy | `IfNotPresent` |
| `prometheus.nodeExporter.extraArgs` | Additional node-exporter container arguments | `{}` |
| `prometheus.nodeExporter.extraHostPathMounts` | Additional node-exporter hostPath mounts | `[]` |
| `prometheus.nodeExporter.nodeSelector` | node labels for node-exporter pod assignment | `{}` |
| `prometheus.nodeExporter.podAnnotations` | annotations to be added to node-exporter pods | `{}` |
| `prometheus.nodeExporter.resources` | node-exporter resource requests and limits (YAML) | `{}` |
| `prometheus.nodeExporter.service.annotations` | annotations for node-exporter service | `{prometheus.io/scrape: "true"}` |
| `prometheus.nodeExporter.service.clusterIP` | internal node-exporter cluster service IP | `None` |
| `prometheus.nodeExporter.service.externalIPs` | node-exporter service external IP addresses | `[]` |
| `prometheus.nodeExporter.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""` |
| `prometheus.nodeExporter.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]` |
| `prometheus.nodeExporter.service.servicePort` | node-exporter service port | `9100` |
| `prometheus.nodeExporter.service.type` | type of node-exporter service to create | `ClusterIP` |
| `prometheus.server.name` | Prometheus server container name | `server` |
| `prometheus.server.image.repository` | Prometheus server container image repository | `prom/prometheus` |
| `prometheus.server.image.tag` | Prometheus server container image tag | `v1.5.1` |
| `prometheus.server.image.pullPolicy` | Prometheus server container image pull policy | `IfNotPresent` |
| `prometheus.server.alertmanagerURL` | (optional) alertmanager URL; only used if alertmanager.enabled = false | `""` |
| `prometheus.server.extraArgs` | Additional Prometheus server container arguments | `{}` |
| `prometheus.server.extraHostPathMounts` | Additional Prometheus server hostPath mounts | `[]` |
| `prometheus.server.ingress.enabled` | If true, Prometheus server Ingress will be created | `false` |
| `prometheus.server.ingress.annotations` | Prometheus server Ingress annotations | `[]` |
| `prometheus.server.ingress.hosts` | Prometheus server Ingress hostnames | `[]` |
| `prometheus.server.ingress.tls` | Prometheus server Ingress TLS configuration (YAML) | `[]` |
| `prometheus.server.nodeSelector` | node labels for Prometheus server pod assignment | `{}` |
| `prometheus.server.persistentVolume.enabled` | If true, Prometheus server will create a Persistent Volume Claim | `false` |
| `prometheus.server.persistentVolume.accessModes` | Prometheus server data Persistent Volume access modes | `[ReadWriteOnce]` |
| `prometheus.server.persistentVolume.annotations` | Prometheus server data Persistent Volume annotations | `{}` |
| `prometheus.server.persistentVolume.existingClaim` | Prometheus server data Persistent Volume existing claim name | `""` |
| `prometheus.server.persistentVolume.mountPath` | Prometheus server data Persistent Volume mount root path | `/data` |
| `prometheus.server.persistentVolume.size` | Prometheus server data Persistent Volume size | `8Gi` |
| `prometheus.server.persistentVolume.storageClass` | Prometheus server data Persistent Volume Storage Class | `volume.alpha.kubernetes.io/storage-class: default` |
| `prometheus.server.persistentVolume.subPath` | Subdirectory of Prometheus server data Persistent Volume to mount | `""` |
| `prometheus.server.podAnnotations` | annotations to be added to Prometheus server pods | `{}` |
| `prometheus.server.replicaCount` | desired number of Prometheus server pods | `1` |
| `prometheus.server.resources` | Prometheus server resource requests and limits | `{}` |
| `prometheus.server.service.annotations` | annotations for Prometheus server service | `{}` |
| `prometheus.server.service.clusterIP` | internal Prometheus server cluster service IP | `""` |
| `prometheus.server.service.externalIPs` | Prometheus server service external IP addresses | `[]` |
| `prometheus.server.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""` |
| `prometheus.server.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]` |
| `prometheus.server.service.servicePort` | Prometheus server service port | `80` |
| `prometheus.server.service.type` | type of Prometheus server service to create | `NodePort` |
| `prometheus.server.terminationGracePeriodSeconds` | Prometheus server Pod termination grace period | `300` |
| `prometheus.serverFiles.alerts` | Prometheus server alerts configuration | `""` |
| `prometheus.serverFiles.rules` | Prometheus server rules configuration | `""` |
| `prometheus.serverFiles.prometheus.yml` | Prometheus server scrape configuration | example configuration |