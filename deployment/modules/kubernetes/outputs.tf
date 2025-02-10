# output "load_balancer_name" {
#   value = kubernetes_service_v1.app_service.metadata[0].name
# }

# output "load_balancer_hostname" {
#   value = kubernetes_service_v1.app_service.status.0.load_balancer.0.ingress.0.hostname
# }

output "load_balancer_hostname" {
  value = kubernetes_ingress_v1.app_ingress.status.0.load_balancer.0.ingress.0.hostname
}

# Display load balancer IP (typically present in GCP, or using Nginx ingress controller)
output "load_balancer_ip" {
  value = kubernetes_ingress_v1.app_ingress.status.0.load_balancer.0.ingress.0.ip
}
