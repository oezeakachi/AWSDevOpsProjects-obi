aws_region = "eu-west-1"
aws_account_id = "921851802130"
backend_jenkins_bucket = "jenkins-terraform-state-7001-obi2"
backend_jenkins_bucket_key = "jenkins/terraform.tfstate"
vpc_name       = "jenkins-vpc"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"] # <--- ADD THIS LINE (use your desired private CIDR ranges)
instance_type  = "t2.large"
aws_auth_users = [
  {
    userarn  = "arn:aws:iam::921851802130:user/open-environment-sg9r7-admin"
    username = "open-environment-sg9r7-admin"
    groups   = ["system:masters"]
  }
]