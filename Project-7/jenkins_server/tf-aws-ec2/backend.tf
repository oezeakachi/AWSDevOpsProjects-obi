terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-7001-obi4"
    key    = "jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}