resource "digitalocean_project" "crossplane" {
  name        = var.project
  description = "Ths project contains resources that belong to Crossplane project"
  purpose     = "Web Application"
  environment = "Development"
  resources = [
    digitalocean_kubernetes_cluster.crossplane.urn
  ]
}

resource "digitalocean_kubernetes_cluster" "crossplane" {
  name         = var.k8s_cluster_name
  version      = var.k8s_version
  auto_upgrade = var.k8s_auto_upgrade

  region   = var.region
  vpc_uuid = local.vpc_uuid

  node_pool {
    name       = "default"
    size       = var.k8s_node_pool_size
    node_count = var.k8s_node_pool_count
  }
}

