# 1. Define the EKS Cluster IAM Role
# This resource explicitly creates the IAM role for the EKS cluster control plane.
resource "aws_iam_role" "eks_cluster_role" {
  name = "my-eks-cluster-control-plane-role" # Choose a descriptive name for your cluster role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# 2. Attach the AmazonEKSClusterPolicy to the cluster role
# This attaches the AWS managed policy that grants necessary permissions for EKS
# to interact with other AWS services like ELB (for Load Balancers and Target Groups).
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}


# Ref - https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.1"
  #map_users = var.aws_auth_users
  # Pass the ARN of the newly created IAM role here
  cluster_role_arn = aws_iam_role.eks_cluster_role.arn
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets


  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.small"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}