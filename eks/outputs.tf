output "subnet_ids" {
  description = "Subnets IDs in the VPC"
  value       = join(",", [module.vpc.public_subnets, module.vpc.private_subnets])
}

output "security_groups" {
  description = "Security group for the cluster control plane communication with worker nodes"
  value       = [module.eks.cluster_security_group_id]
}

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}
