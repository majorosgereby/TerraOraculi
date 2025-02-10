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

The application is accessible through the link provided in the outputs.

All resources could be deleted with terraform.

```bash
terraform destroy
```

