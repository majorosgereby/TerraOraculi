resource "kubernetes_deployment_v1" "app" {

  metadata {
    name = "my-app"
    # namespace = var.namespace
    namespace = kubernetes_namespace_v1.app_namespace.metadata[0].name
  }

  spec {
    replicas = var.replica_count

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          name  = "my-app"
          image = "${var.ecr_repository}:${var.image_tag}"

          port {
            container_port = var.container_port
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
