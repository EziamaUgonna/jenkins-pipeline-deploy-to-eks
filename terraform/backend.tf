terraform {
  backend "s3" {
    bucket = "ugonnabucket"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}