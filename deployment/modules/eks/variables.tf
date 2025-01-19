variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}


variable "availability_zones" {
  description = "List of availability zones for the EKS subnets."
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group."
  type        = string
  default     = "default-node-group"
}

variable "desired_size" {
  description = "Desired number of nodes in the node group."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of nodes in the node group."
  type        = number
  default     = 5
}

variable "min_size" {
  description = "Minimum number of nodes in the node group."
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "List of instance types for the node group."
  type        = list(string)
  default     = ["t3.micro"]
}

variable "disk_size" {
  description = "Disk size in GB for the nodes."
  type        = number
  default     = 20
}
