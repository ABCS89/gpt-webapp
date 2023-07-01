variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}

variable "worker_groups" {
  description = "Worker groups configuration"
  type        = list(object({
    instance_type = string
    asg_max_size  = number
    asg_min_size  = number
  }))
}
