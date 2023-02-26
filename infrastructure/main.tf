provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket  = "film-tf-state"
    key     = "film-tf-state.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

locals {
  myprefix = "${var.prefix}--${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Amy"
  }
}