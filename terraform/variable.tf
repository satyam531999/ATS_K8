# variables.tf

# Define the AWS region
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

# Define the CIDR block for the VPC
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Define the EKS cluster name
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "web-app-cluster"
}

# Define the number of worker nodes
variable "worker_nodes_count" {
  description = "Number of worker nodes in the EKS cluster"
  type        = number
  default     = 2
}

# Define the instance type for worker nodes
variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}
