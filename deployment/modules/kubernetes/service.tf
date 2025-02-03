resource "kubernetes_service" "app_service" {
  metadata {
    name      = "my-app-service"
    namespace = var.namespace
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
