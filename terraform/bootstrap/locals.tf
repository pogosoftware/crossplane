locals {
  name_preffix = split("-", terraform.workspace)[0]
  region       = split("-", terraform.workspace)[2]
  environment  = split("-", terraform.workspace)[3]

  vault_secret_app_name = format("%s-%s-%s-%s", local.name_preffix, lower(var.project), local.region, local.environment)

  network_workspace_name    = format("%s-digitalocean-network-%s", local.name_preffix, local.environment)
  kubernetes_workspace_name = format("%s-digitalocean-kubernetes-%s", local.name_preffix, local.environment)
  apps_workspace_name       = format("%s-digitalocean-apps-%s", local.name_preffix, local.environment)
}