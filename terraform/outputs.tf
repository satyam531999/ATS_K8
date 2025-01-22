# outputs.tf

# Output the EKS cluster name
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.web_app_cluster.name
}

# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# Output the EKS cluster endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.web_app_cluster.endpoint
}

# Output the LoadBalancer URL for the web app service
output "load_balancer_url" {
  description = "The URL of the load balancer for the web app service"
  value       = aws_lb.web_app_lb.dns_name
}

# Output the IAM Role ARN for EKS
output "eks_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  value       = aws_iam_role.eks_role.arn
}
