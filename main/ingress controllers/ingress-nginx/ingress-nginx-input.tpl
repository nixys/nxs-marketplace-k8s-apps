controller:
  kind: Deployment
  replicaCount: ${ingress_controller_replicas}
  %{~ if use_proxy_protocol_yc == "true" ~}
  config:
    proxy-real-ip-cidr: ${proxy_real_ip_cidr_list}
    use-proxy-protocol: ${use_proxy_protocol_yc}
  %{~ endif ~}
  %{~ if use_proxy_protocol_gcp == "true" ~}
  config:
    enable-real-ip: "true"
    use-forwarded-headers: "true"
  %{~ endif ~}
  ingressClassResource:
    name: ${ingress_nginx_class}
    enabled: true
    default: false
    controllerValue: "k8s.io/ingress-nginx"
  podLabels:
    app: balancer
  service:
    loadBalancerIP: ${lb_external_ip}
    externalTrafficPolicy: Local
    nodePorts:
      http: "${http_node_port}"
      https: "${https_node_port}"
      tcp: {}
      udp: {}
  publishService:
    enabled: true
  metrics:
    port: 10254
    enabled: ${metrics_enable}
    serviceMonitor:
      enabled: ${metrics_enable}
      additionalLabels:
        release: "kube-prometheus-stack"
      namespace: ${monitoring_ns}
    prometheusRule:
      enabled: ${metrics_enable}
      additionalLabels:
        release: "kube-prometheus-stack"
      namespace: ${monitoring_ns}
    %{~ if metrics_enable == "true" ~}
      rules:
      ${ indent(6, replace(file("${path}/monitoring/prometheus-rules/ingress-nginx.yaml"), "$${project_name}", project_name)) ~}
    %{~ endif ~}
