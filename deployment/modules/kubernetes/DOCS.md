## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.nginx_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_deployment_v1.app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment_v1) | resource |
| [kubernetes_ingress_v1.app_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace_v1.app_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_service_v1.app_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | The certificate for authenticating the cluster in the module. | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | The endpoint to the cluster | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS cluster name | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | The token for authenticating the cluster in the module. | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Container port to expose | `number` | `8080` | no |
| <a name="input_ecr_repository"></a> [ecr\_repository](#input\_ecr\_repository) | ECR repository URL | `string` | n/a | yes |
| <a name="input_image_version_tag"></a> [image\_version\_tag](#input\_image\_version\_tag) | Docker image tag to deploy | `string` | `"latest"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the deployment | `string` | `"default"` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | Number of replicas for the deployment | `number` | `2` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Kubernetes service type (LoadBalancer, ClusterIP, etc.) | `string` | `"LoadBalancer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_hostname"></a> [load\_balancer\_hostname](#output\_load\_balancer\_hostname) | n/a |
| <a name="output_load_balancer_ip"></a> [load\_balancer\_ip](#output\_load\_balancer\_ip) | Display load balancer IP (typically present in GCP, or using Nginx ingress controller) |
