#variable "invoke_functions" {
#  type    = list(string)
#  default = []
#}

#data "aws_iam_policy_document" "invoke_functions" {
#  statement {
#    sid = "InvokeFunctions"
#    actions = ["lambda:InvokeFunction"]
#    effect = "Allow"
#    resources = flatten([for v in var.invoke_functions : "arn:aws:lambda:us-west-2:123456:function:${v}"])
#  }
#}

#resource "aws_iam_policy" "invoke_functions" {
#  count = length(var.invoke_functions) > 0 ? 1 : 0
#  name   = "invoke-functions"
#  policy = data.aws_iam_policy_document.invoke_functions.json
#}

variable "s3_buckets" {
  type = map
  default = {}
}
