locals {
  host                   = data.terraform_remote_state.kubernetes.outputs.host
  token                  = data.terraform_remote_state.kubernetes.outputs.token
  cluster_ca_certificate = data.terraform_remote_state.kubernetes.outputs.cluster_ca_certificate

  crossplane_release = format("%s-crossplane-%s-%s", var.name_preffix, var.region, var.environment)
  argocd_release     = format("%s-argocd-%s-%s", var.name_preffix, var.region, var.environment)
}