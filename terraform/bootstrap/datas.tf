data "hcp_organization" "this" {}

data "tfe_project" "this" {
  name         = var.project
  organization = data.hcp_organization.this.name
}

data "hcp_vault_secrets_secret" "digitalocean_token" {
  app_name    = local.vault_secret_app_name
  secret_name = "digitalocean_token"
}
