# cert-manager

## Introduction

This is a terraform module for cert-manager for building main resources.

## Features

- Comfortable management structure
- Supported integration with kube-prometheus-stack
- Supported create ClusterIssuer

## Settings

| Option | Type | Required | Default value |Description |
| --- | ---  | --- | --- | --- |
| `cert_manager_namespace`            | String | No | "cert-manager"    | The Cert Manager namespace.                     |
| `cert_manager_chart_version`        | String | No | "1.15.2"          | The Helm-chart version for Cert Manager.        |
| `nxs_universal_chart_version`       | String | No | "2.8.0"           | The Helm-chart version for nxs-universal-chart. |
| `cluster_issuer_name`               | String | No | "letsencrypt"     | The ClusterIssuer resource.                     |
| `cluster_issuer_email`              | Stribg | No | "test@gmail.com"  | The ClusterIssuer email.                        |
| `cluster_issuer_ingress_class_name` | String | No | "nginx"           | The ClusterIssuer IngressClassName.             |
| `metrics_enable`                    | String | No | "true"            | Enable or disable metrics in cert-manager.      |
| `monitoring_ns`                     | String | No | "monitoring"      | The namespace for monitoring tools deployment.  |
| `project_name`                      | String | No | "kubernetes-prod" | The project name for k8s cluster.               |

## Example

Usage example located in this [directory](docs/example).