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

module test {
  source = "git@github.com:stpride/module-aws-test1@main"
  subs = [
    {
      p = "/alt/test"
      v = "mystring"
    }
  ]
}
