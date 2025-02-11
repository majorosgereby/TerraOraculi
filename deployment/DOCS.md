## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.47.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_namespace"></a> [application\_namespace](#input\_application\_namespace) | The name of the namespace where the application runs in the cluster. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources in. | `string` | `"eu-west-2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster. | `string` | `"my-eks-cluster"` | no |
| <a name="input_ecr_repository_name"></a> [ecr\_repository\_name](#input\_ecr\_repository\_name) | The name of the ECR repository. | `string` | `"practice/express-example"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The name of the docker image to push. | `string` | `"express-example"` | no |
| <a name="input_image_version_tag"></a> [image\_version\_tag](#input\_image\_version\_tag) | The version tag of the docker iamge | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the ECR repository. |
| <a name="output_eks_cluster_arn"></a> [eks\_cluster\_arn](#output\_eks\_cluster\_arn) | The Amazon Resource Name (ARN) of the EKS cluster. |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | The endpoint URL for the EKS cluster API server. |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | The name of the EKS cluster. |
| <a name="output_eks_cluster_security_group_id"></a> [eks\_cluster\_security\_group\_id](#output\_eks\_cluster\_security\_group\_id) | The security group ID associated with the EKS cluster. |
| <a name="output_eks_subnet_ids"></a> [eks\_subnet\_ids](#output\_eks\_subnet\_ids) | The IDs of the subnets created for the EKS cluster. |
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | The ID of the VPC created for the EKS cluster. |
| <a name="output_load_balancer_hostname"></a> [load\_balancer\_hostname](#output\_load\_balancer\_hostname) | The host name of the load balancer that makes the application visible. |
| <a name="output_region"></a> [region](#output\_region) | The amazon region declared in variables. |
