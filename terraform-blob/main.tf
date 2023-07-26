variable "invoke_functions" {
  type    = list(string)
  default = []
}

locals {
  lambdas = flatten([for v in var.invoke_functions : "arn:aws:lambda:us-west-2:123456::function:${v}"])
}

resource aws_iam_policy lambda {
  count       = length(var.invoke_functions) > 0 ? 1 : 0
  name        = "blob-invoke-functions-policy"
  description = "blob-invoke-functions-policy"

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "lambda:InvokeFunctions"
        ],
        "Resource": [${local.lambdas}]
      }
    ]
  }
  EOF
}
