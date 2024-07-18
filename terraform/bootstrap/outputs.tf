####################################################################################################
### WORKSPACES
####################################################################################################
output "workspaces" {
  description = "The id and name of existing TFC workspaces"
  value = {
    network = {
      id   = module.network_workspace.id
      name = module.network_workspace.name
    },
    kubernetes = {
      id   = module.kubernetes_workspace.id
      name = module.kubernetes_workspace.name
    },
    apps = {
      id   = module.apps_workspace.id
      name = module.apps_workspace.name
    }
  }
}

output "project" {
  description = "The name of the project"
  value       = var.project
}