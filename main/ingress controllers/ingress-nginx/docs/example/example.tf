terraform {
  backend "gcs" {
    bucket      = "name-your-bucket-1"
    prefix      = "terraform/apps/ingress-controller-nginx/state"
    credentials = "project-credentials.json"
  }
}

data "terraform_remote_state" "kube-prometheus-stack" {
  backend = "gcs"
  config = {
    bucket      = "name-your-bucket-1"
    prefix      = "terraform/apps/kube-prometheus-stack/state"
    credentials = "project-credentials.json"
  }
}

module "ingress-controller-nginx" {
  source = "github.com/nixys/nxs-marketplace-k8s-apps/main/controllers/ingress-nginx"

  ingress_nginx_chart_version = "4.11.1"
  ingress_nginx_namespace     = "ingress-nginx"
  ingress_nginx_class         = "nginx"
  ingress_controller_replicas = "3"
  healthcheck_node_port       = "32000"
  http_node_port              = "32000"
  https_node_port             = "32443"
  metrics_enable              = "true"
  use_proxy_protocol_yc       = "false"
  use_proxy_protocol_gcp      = "true"
  proxy_real_ip_cidr          = "10.0.0.1/32"
  monitoring_ns               = data.terraform_remote_state.kube-prometheus-stack.outputs.monitoring_ns
  project_name                = data.terraform_remote_state.kube-prometheus-stack.outputs.project_name
}
