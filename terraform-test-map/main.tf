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

variable subs {
  type = list(object({
    p = string,
    v = string
  })
  default = []
}

resource "aws_ssm_parameter" "secret" {
  for_each    = { for s in subs: s.path => s }
  name        = each.value.p
  description = "The parameter description"
  type        = "SecureString"
  value       = each.value.v
}
