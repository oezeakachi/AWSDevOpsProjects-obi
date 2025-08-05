terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-7001-obi5"
    key    = "jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}