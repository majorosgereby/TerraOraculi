#!/bin/bash
# toggle or copy commands you need

# to connect kubectl to the created eks
aws eks update-kubeconfig --region $(terraform output -raw region) --name $(terraform output -raw eks_cluster_name)

# test the connection to eks
kubectl cluster-info

# test nodes
kubectl get nodes

# get AMIs
aws ssm get-parameter --name /aws/service/eks/optimized-ami/<K8S_VERSION>/amazon-linux-2/recommended/image_id --region <your-region>
aws ssm get-parameter --name /aws/service/eks/optimized-ami/1.31/amazon-linux-2/recommended/image_id --region eu-west-2