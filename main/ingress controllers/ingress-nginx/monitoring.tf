# Create dashboards for ingress-controller-nginx

resource "kubernetes_config_map" "grafana-monitoring-dashboards" {
  for_each = var.metrics_enable == "true" ? fileset("${path.module}/monitoring/dashboards", "*") : []

  metadata {
    name      = "grafana-dashboard-${trimsuffix(each.key, ".json")}"
    namespace = var.monitoring_ns
    labels = {
      "grafana_dashboard" = "monitoring-dashboard"
    }
    annotations = {
      "grafana-dashboard-folder" = "/tmp/dashboards/services"
    }
  }

  data = {
    "${each.key}" = file("${path.module}/monitoring/dashboards/${each.key}")
  }
}
