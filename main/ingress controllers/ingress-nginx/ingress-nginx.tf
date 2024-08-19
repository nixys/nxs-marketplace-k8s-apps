# External LB
resource "helm_release" "ingress-nginx-controller" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.ingress_nginx_chart_version

  namespace        = var.ingress_nginx_namespace
  atomic           = true
  create_namespace = true

  values = [templatefile("${path.module}/ingress-nginx-input.tpl", {
    ingress_nginx_namespace          = var.ingress_nginx_namespace
    ingress_nginx_class              = var.ingress_nginx_class
    lb_external_ip                   = try(var.lb_external_ip, "")
    http_node_port                   = var.http_node_port
    https_node_port                  = var.https_node_port
    healthcheck_node_port            = var.healthcheck_node_port
    metrics_enable                   = var.metrics_enable
    ingress_controller_replicas      = var.ingress_controller_replicas
    use_proxy_protocol_gcp           = var.use_proxy_protocol_gcp
    use_proxy_protocol_yc            = var.use_proxy_protocol_yc
    proxy_real_ip_cidr_list          = var.use_proxy_protocol_yc == "true" ? join(", ", concat(split(",", var.proxy_real_ip_cidr), split(",", var.lb_external_ip))) : ""
    monitoring_ns                    = var.monitoring_ns
    project_name                     = var.project_name
    path                             = "${path.module}"
  })]
}
