output "host" {
  description = "The Kubernetes endpoint URL"
  value       = digitalocean_kubernetes_cluster.crossplane.endpoint
}

output "token" {
  description = "The Kubernetes token"
  value       = digitalocean_kubernetes_cluster.crossplane.kube_config[0].token
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The Kubernetes cluster CA certificate"
  value       = base64decode(digitalocean_kubernetes_cluster.crossplane.kube_config[0].cluster_ca_certificate)
  sensitive   = true
}
