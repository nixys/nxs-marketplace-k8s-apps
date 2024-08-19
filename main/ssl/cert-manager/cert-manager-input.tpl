crds:
  enabled: true

prometheus:
  enabled: ${metrics_enable}
  servicemonitor:
    enabled: ${metrics_enable}
    labels:
      release: "kube-prometheus-stack"
    namespace: ${monitoring_ns}
