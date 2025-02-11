# TerraOraculi

A complete terraform solution to overview the deployment of an application from pushing a docker image to ECR, provisioning the cluster in EKS and deploying the application with kubernetes. 

## Usage

A `terraform.tfvars` needs to be created in the the deployment folder. The 3 neccesery variables are: `aws_region`, `ecr_repository_name` and `cluster_name`.

Example:

```tfvars
aws_region          = "eu-west-2"
ecr_repository_name = "practice/express-example"
cluster_name        = "my-eks-cluster"
```

The repository defaults to the image found in the `app` folder.

After setting the variables, navigate to deployment and initialize & apply the terraform configuration.

```bash
cd deployment
terraform init
terraform apply
```

The configuration will provide the following outputs:

```
ecr_repository_url = "<<ECR URI>>"
eks_cluster_arn = "<<AWS CLUSTER ARN>>"
eks_cluster_endpoint = "<<CLUSSTER API ENDPOINT>>"
eks_cluster_name = "<<CLUSTER NAME>>"
eks_cluster_security_group_id = "<<AWS SECURITY GROUP ID OF CLUSTER>>"
eks_subnet_ids = [
  "<<SUBNET 1 ID>>",
  "<<SUBNET 2 ID>>",
]
eks_vpc_id = "<<VPC ID>>"
load_balancer_hostname = "<<LOAD BALANCER HOST NAME>>"
region = "<<AWS REGION CODE>>"
```

The application is accessible through the link provided in the outputs `load_balancer_hostname = "<<LOAD BALANCER HOST NAME>>"`.

All resources could be deleted with terraform.

```bash
terraform destroy
```

