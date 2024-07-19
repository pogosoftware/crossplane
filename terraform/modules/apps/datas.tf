data "hcp_organization" "this" {}

####################################################################################################
### REMOTE STATES
####################################################################################################
data "terraform_remote_state" "bootstrap" {
  backend = "remote"

  config = {
    organization = data.hcp_organization.this.name
    workspaces = {
      name = var.bootstrap_workspace
    }
  }
}

data "terraform_remote_state" "kubernetes" {
  backend = "remote"

  config = {
    organization = data.hcp_organization.this.name
    workspaces = {
      name = data.terraform_remote_state.bootstrap.outputs.workspaces["kubernetes"].name
    }
  }
}