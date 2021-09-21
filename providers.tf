terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-west-1"
#  access_key = "AKIAIOSFODNN7EXAMPLE"
#  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}
