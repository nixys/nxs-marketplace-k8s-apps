resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_chart_version

  namespace        = var.cert_manager_namespace
  atomic           = true
  create_namespace = true

  values = [templatefile("${path.module}/cert-manager-input.tpl", {
    metrics_enable                    = var.metrics_enable
    monitoring_ns                     = var.monitoring_ns
  })]
}
