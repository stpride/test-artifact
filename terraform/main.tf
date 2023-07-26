terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

#resource "aws_ssm_parameter" "secret" {
#  name        = "/temp/data"
#  description = "The parameter description"
#  type        = "SecureString"
#  value       = "supersecret"
#}
