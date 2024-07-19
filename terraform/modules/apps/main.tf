resource "helm_release" "crossplane" {
  name             = local.crossplane_release
  namespace        = "crossplane-system"
  create_namespace = true
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  version          = "1.16.0"
}

resource "helm_release" "argocd" {
  name             = local.argocd_release
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.3.7"

  values = [
    file("templates/argocd.values.yaml")
  ]
}
