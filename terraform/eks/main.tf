
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
