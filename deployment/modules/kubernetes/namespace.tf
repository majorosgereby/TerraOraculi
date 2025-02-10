resource "kubernetes_namespace_v1" "app_namespace" {
  metadata {
    name = "my-app-namespace"
  }
}
