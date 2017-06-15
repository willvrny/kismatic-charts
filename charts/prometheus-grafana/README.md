# Prometheus-Grafana Helm Chart

* Intalls Prometheus and Grafana monitoring stack

## To install
```
helm install kismatic/prometheus-grafana --name monitoring --namespace monitoring --set server.adminPassword=$GRAFANA_ADMIN_PASSWORD
```

This will deploy all the kuberntes resources for this chart and print out the details. 

**If you modify the values for `prometheus.nameOverride` or `prometheus.server.name` you must `--set` the same values in `grafana.server.setDatasource.datasource.url` as `http://<name>-<prometheus.nameOverride>-<prometheus.server.name>` for the Prometheus datasource configuration to work correctly.**

To view all avaible options in the chart see [values.yaml](https://github.com/apprenda/kismatic-charts/blob/master/charts/prometheus/values.yaml)

## To upgrade
```
helm upgrade monitoring kismatic/prometheus-grafana --reuse-values
```

## To uninstall
```
helm delete monitoring --purge
```