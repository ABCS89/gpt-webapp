terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "eks-vpc"
  cidr                 = var.vpc_block
  azs                  = var.availability_zones
  private_subnets      = var.private_subnet_cidr_blocks
  public_subnets       = var.public_subnet_cidr_blocks
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Environment = "eks"
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  worker_groups   = var.worker_groups

  tags = {
    Environment = "eks"
  }
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "my-app"
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name      = "my-app"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
    labels = {
      app = "my-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          image = "your-container-image"
          name  = "my-app"
        }
      }
    }
  }
}
