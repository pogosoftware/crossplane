module "network_workspace" {
  source  = "pogosoftware/tfe/tfe//modules/workspace"
  version = "3.0.2"

  create_workspace           = true
  name                       = local.network_workspace_name
  project_id                 = data.tfe_project.this.id
  working_directory          = "./terraform/modules/network"
  trigger_patterns           = ["./terraform/modules/network/*.tf"]
  vcs_repos                  = var.vcs_repo
  tags                       = [local.environment]
  allow_destroy_plan         = var.allow_destroy_plan
  auto_apply                 = var.auto_apply
  terraform_reqiured_version = var.terraform_reqiured_version

  share_state_with_workspace_ids = [
    module.kubernetes_workspace.id
  ]
}

module "kubernetes_workspace" {
  source  = "pogosoftware/tfe/tfe//modules/workspace"
  version = "3.0.2"

  create_workspace           = true
  name                       = local.kubernetes_workspace_name
  project_id                 = data.tfe_project.this.id
  working_directory          = "./terraform/modules/kubernetes"
  trigger_patterns           = ["./terraform/modules/kubernetes/*.tf"]
  vcs_repos                  = var.vcs_repo
  tags                       = [local.environment]
  allow_destroy_plan         = var.allow_destroy_plan
  auto_apply                 = var.auto_apply
  terraform_reqiured_version = var.terraform_reqiured_version

  share_state_with_workspace_ids = [
    module.apps_workspace.id
  ]

  variable_set_ids = [
    data.tfe_variable_set.hcp_credentials.id
  ]
}

module "apps_workspace" {
  source  = "pogosoftware/tfe/tfe//modules/workspace"
  version = "3.0.2"

  create_workspace           = true
  name                       = local.apps_workspace_name
  project_id                 = data.tfe_project.this.id
  working_directory          = "./terraform/modules/apps"
  trigger_patterns           = ["./terraform/modules/apps/*.tf"]
  vcs_repos                  = var.vcs_repo
  tags                       = [local.environment]
  allow_destroy_plan         = var.allow_destroy_plan
  auto_apply                 = var.auto_apply
  terraform_reqiured_version = var.terraform_reqiured_version

  variable_set_ids = [
    data.tfe_variable_set.hcp_credentials.id
  ]
}

####################################################################################################
### TFE VARIABLE SETS
####################################################################################################
module "digitalocean_variable_set" {
  source  = "pogosoftware/tfe/tfe//modules/variable-set"
  version = "3.0.2"

  name = format("%s - %s - DigitalOcean credentials", var.project, local.environment)

  variables = {
    DIGITALOCEAN_TOKEN = {
      value     = data.hcp_vault_secrets_secret.digitalocean_token.secret_value
      category  = "env"
      sensitive = true
    }
  }

  workspace_ids = [
    module.network_workspace.id,
    module.kubernetes_workspace.id
  ]
}

module "bootstrap_variable_set" {
  source  = "pogosoftware/tfe/tfe//modules/variable-set"
  version = "3.0.2"

  name = format("%s - %s - Bootstrap workspace name", var.project, local.environment)

  variables = {
    bootstrap_workspace = {
      value    = terraform.workspace
      category = "terraform"
    },
    HCP_PROJECT_ID = {
      value    = var.hcp_project_id
      category = "env"
    }
  }

  workspace_ids = [
    module.kubernetes_workspace.id,
    module.apps_workspace.id
  ]
}

module "common_variable_set" {
  source  = "pogosoftware/tfe/tfe//modules/variable-set"
  version = "3.0.2"

  name = format("%s - %s - common", var.project, local.environment)

  variables = {
    region = {
      value    = local.region
      category = "terraform"
    },
    environment = {
      value    = local.environment
      category = "terraform"
    },
    name_preffix = {
      value    = local.name_preffix
      category = "terraform"
    },
    project = {
      value    = lower(var.project)
      category = "terraform"
    }
  }

  workspace_ids = [
    module.network_workspace.id,
    module.kubernetes_workspace.id,
    module.apps_workspace.id
  ]
}