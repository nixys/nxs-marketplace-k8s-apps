# nxs-marketplace-k8s-apps

![Terraform git](https://github.com/user-attachments/assets/99088e5d-9f33-4597-8388-ef22e272513a)

## Introduction
This repository contains [Terraform](https://www.terraform.io/) modules for easy deployment resources into Kubernetes/OpenShift.

## Features

* Basic charts for the initial setup of a project
* Support charts with any stack
* Best practices from more then 100 projects

## Who can use the tool

* Developers
* System administrators
* DevOps engineers

## Quickstart

For use this module you need to installed Terraform package. Set up the Terraform file, then init, plan and run module:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Module Variables
The available variables are listed in each modules's README file, along with their default values.

### Modules:

<details><summary>pipeline</summary>

1. [gitlab-runner](https://github.com/nixys/nxs-marketplace-k8s-apps/blob/main/pipelines/gitlab-runner/README.md) - create resources for pipeline

</details>

<details><summary>main</summary>

1. [ingress controllers/ingress-nginx](https://github.com/nixys/nxs-marketplace-k8s-apps/blob/main/main/controllers/ingress-nginx/README.md) - create resources for ingress-nginx controller
2. [main/ssl](https://github.com/nixys/nxs-marketplace-k8s-apps/blob/main/main/ssl/cert-manager/README.md) - create resources for cert-manager

</details>

## Roadmap

Following features are already in backlog for our development team and will be released soon:

* hashicorp (modules: vault)
* logging (modules: Loki)

## Feedback

For support and feedback please contact me:
* telegram: [@Gacblk](https://t.me/gacblk)
* e-mail: a.gacenko@nixys.io

For news and discussions subscribe the channels:

* Telegram community (news): [@nxs_marketplace_k8s_apps](https://t.me/nxs_marketplace_k8s_apps)
* Telegram community (chat): [@nxs_marketplace_k8s_apps_chat](https://t.me/nxs_marketplace_k8s_apps_chat)

## License
nxs-marketplace-k8s-apps is released under the [Apache License 2.0](https://github.com/nixys/nxs-marketplace-k8s-apps/blob/main/LICENSE).
