
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = "gitops-demo"
  cluster_version = "1.33"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }

  cluster_endpoint_public_access = true #this is to allow public access. Use this only for testing/POC. remove it for real deployments

  access_entries = {
    admin-user = {
      principal_arn = var.admin_user_arn
      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 1   

      instance_types = ["t3.micro"]
      capacity_type  = "ON_DEMAND"
      subnet_ids      = var.subnet_ids
    }
  }
  tags = {
    Project = "gitops-demo"
  }
}

