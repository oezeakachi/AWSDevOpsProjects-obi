terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-7001-obi"
    key    = "jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}