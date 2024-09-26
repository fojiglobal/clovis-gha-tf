terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3" {
  #   bucket = "foji-lab-tf"
  #   key    = "lab/terraform.tfstate"
  #   region = "us-east-1"
  #   dynamodb_table = "foji-lab-tf"
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

