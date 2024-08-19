# Create dashboards for gitlab-runner
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

# Create Prometheus Rules for gitlab-runner
resource "kubernetes_manifest" "prometheusrules" {
  count = var.metrics_enable == "true" ? 1 : 0

  manifest = {
    "apiVersion" = "monitoring.coreos.com/v1"
    "kind" = "PrometheusRule"
    "metadata" = {
      "labels" = {
        "release" = "kube-prometheus-stack"
      }
      "name" = "gitlab-runner-alert"
      "namespace" = var.monitoring_ns
    }
    "spec" = {
      "groups" = [
        {
          "interval" = "1m"
          "name" = "gitlab_runner_rules"
          "rules" = yamldecode(replace(file("${path.module}/monitoring/prometheus-rules/gitlab-runner.yaml"), "$${project_name}", var.project_name))
        },
      ]
    }
  }
}