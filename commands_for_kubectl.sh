#!/bin/bash
# toggle or copy commands you need

# to connect kubectl to the created eks
aws eks update-kubeconfig --region $(terraform output -raw region) --name $(terraform output -raw eks_cluster_name)

# test the connection to eks
kubectl cluster-info

# test nodes
kubectl get nodes