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
  source = "github.com/stpride/module-aws-test1"
  subs = [
    {
      p = "/alt/test"
      v = "mystring"
    }
  ]
}
