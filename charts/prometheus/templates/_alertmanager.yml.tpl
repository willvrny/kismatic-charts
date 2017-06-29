
{{ define "alertmanager.yml.tpl" }}
global:
  # slack_api_url: ''

receivers:
  - name: default-receiver
    # slack_configs:
    #  - channel: '@you'
    #    send_resolved: true

route:
  group_wait: 10s
  group_interval: 5m
  receiver: default-receiver
  repeat_interval: 3h
{{ end }}
