# TerraOraculi

A complete terraform solution to overview the deployment of an application from pushing a docker image to ECR, provisioning the cluster in EKS and deploying the application with kubernetes. 

## Costs notice

**Running an EKS cluster costs around $0.10 per hour, and instances cost around the same, make sure to be prepared before running the script! Refer to [Amazon pricing](https://aws.amazon.com/eks/pricing/)!**

## Usage

A `terraform.tfvars` needs to be created in the the deployment folder. The 3 neccesery variables are: `aws_region`, `ecr_repository_name` and `cluster_name`.

Example:

```tfvars
aws_region          = "eu-west-2"
ecr_repository_name = "practice/express-example"
cluster_name        = "my-eks-cluster"
```

By default, the repository will use the image that can be built from the `app` folder as an example. Other existing docker images could be supported by giving their name and version tag in `terrafrm.tfvars`.

```tfvars
image_name          = "express-example"
image_version_tag   = "latest"
```

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

## Deletion

All resources could be deleted with terraform.

```bash
terraform destroy
```

## Documentation

Each modul and main has a DOCS.md file where you can find more about the variables, versions, outputs etc.

Also you can access them here:
- [The main DOCS](DOCS.md)
- [The ECR module DOCS](deployment/modules/ecr/DOCS.md)
- [The EKS module DOCS](deployment/modules/eks/DOCS.md)
- [The KUBERNETES module DOCS](deployment/modules/kubernetes/DOCS.md)