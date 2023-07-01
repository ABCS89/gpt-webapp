aws_region = "us-east-1"

vpc_block = "192.168.0.0/16"

availability_zones = ["us-east-1a", "us-east-1b"]

public_subnet_cidr_blocks = ["192.168.0.0/18", "192.168.64.0/18"]

private_subnet_cidr_blocks = ["192.168.128.0/18", "192.168.192.0/18"]

eks_cluster_name    = "my-eks-cluster"
eks_cluster_version = "1.21"

worker_groups = [
  {
    instance_type = "t3.medium"
    asg_min_size  = 1
    asg_max_size  = 3
  }
]
