# kismatic-charts

## To install these charts
```console
helm repo add kismatic https://apprenda.github.io/kismatic-charts/
helm install kismatic/<chart>
```

## To create a new chart
```
cd charts/
helm create $NAME
```

When creating a chart with dependencies, create a new `requirements.yaml` file and follow these [instructions](https://github.com/kubernetes/helm/blob/master/docs/charts.md#managing-dependencies-with-requirementsyaml).

**If the dependency is a chart from this repo use `repository: http://127.0.0.1:8879`, the newest packages will be used during build time**

To override any values in the child chart, modify the `values.yaml` file, ex:  
Assuming the `requirements.yaml` looks like:
```
dependencies:
  - name: chart1
    ...
  - name: chart2
    ...
```
And `chart1` contains a `foo` value, and `chart2` contains a `bar` value.  
Then in the `values.yaml` write:
```
chart1:
  foo:
chart:
  bar:
```
Read more about [how charts work](https://github.com/kubernetes/helm/blob/master/docs/charts.md)