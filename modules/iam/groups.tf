# Groups

resource "aws_iam_group" "groups" {
  for_each = { for group in var.groups : "${group.name}" => group }
  name     = each.value.name
  path     = each.value.path
}
