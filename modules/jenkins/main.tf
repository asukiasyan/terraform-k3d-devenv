resource "kubernetes_namespace" "jenkins" {
  count = var.create_namespace ? 1 : 0
  metadata {
    annotations = {
      name = var.namespace
    }
    name = var.namespace
  }
}


data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}


resource "helm_release" "jenkins" {
  name       = var.release_name
  namespace  = var.namespace
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "jenkins"
  wait       = false
  version    = var.chart_version

  values = [
    file("./values.yaml"),
    file("./defaults.yaml"),
  ]
}

