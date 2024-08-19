# Ingress controller Nginx

## Introduction

This is a terraform module for ingress-nginx for building controllers resources.

## Features

- Comfortable management structure
- Supported integration with kube-prometheus-stack
- Supported user proxy protocol for Google Cloud and Yandex Cloud

## Settings

| Option | Type | Required | Default value |Description |
| --- | ---  | --- | --- | --- |
| `ingress_nginx_chart_version` | String | No | "4.11.1" | The Helm-chart version for Nginx Ingress controller. |
| `project_name`                | String | No | "kubernetes-prod" | The project name for k8s cluster. |
| `ingress_nginx_namespace`     | String | No | "ingress-nginx" | The namespace for Nginx Ingress controller. |
| `ingress_nginx_class`         | String | No | "nginx"         | The class for Nginx Ingress controller. |
| `healthcheck_node_port`       | Stribg | No | "32000"         | Node port for /healthz query. |
| `http_node_port`              | String | No | "32080"         | Node port for none http traffic. |
| `https_node_port`             | String | No | "32443"         | Node port for https traffic. |
| `lb_external_ip`              | String | No | ""              | External ip address of load_balancer. Required if use_proxy_protocol_yc enabled. |
| `metrics_enable`              | String | No | "true"          | Enable or disable metrics in ingress-controller. |
| `ingress_controller_replicas` | String | Yes | -              | Number of replicas ingress controller. |
| `use_proxy_protocol_gcp`      | String | No | "false"         | Enable or disable use proxy protocol in ingress-controller in GCP GKE. |
| `use_proxy_protocol_yc`       | String | No | "false"         | Enable or disable use proxy protocol in ingress-controller in Yandex Cloud Managed-Kubernetes. |
| `proxy_real_ip_cidr`          | String | Yes | -              | The string ips cidr list for proxy. Required if use_proxy_protocol_yc enabled. |
| `monitoring_ns`               | String | No | "monitoring"    | The namespace for monitoring tools deployment. |

## Example

Usage example located in this [directory](docs/example).