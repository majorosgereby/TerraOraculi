resource "kubernetes_ingress_v1" "app_ingress" {
  wait_for_load_balancer = true
  metadata {
    name      = "my-app-ingress"
    namespace = kubernetes_namespace_v1.app_namespace.metadata[0].name
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/*"
          backend {
            service {
              name = kubernetes_service_v1.app_service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
  depends_on = [kubernetes_service_v1.app_service]
}
