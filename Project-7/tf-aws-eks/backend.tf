terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-7001-obi2"
    key    = "eks/terraform.tfstate"
    region = "eu-west-1"
  }
}