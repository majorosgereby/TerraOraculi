resource "kubernetes_service_v1" "app_service" {
  metadata {
    name      = "my-app-service"
    namespace = kubernetes_namespace_v1.app_namespace.metadata[0].name
    labels = {
      app = "my-app"
    }
  }

  spec {
    selector = {
      app = "my-app"
    }

    port {
      port        = 80
      target_port = var.container_port
    }

    type = var.service_type
  }
}
