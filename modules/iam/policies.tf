# Policies

resource "aws_iam_policy" "policy" {
  for_each = { for policy in var.policies : "${policy.name}" => policy }
  name        = each.value.name
  path        = each.value.path
  description = each.value.description

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(each.value.policy)
}

# Policy attachments must match the number of groups and number of policies
# in the same order BUT, doesn't have to match if we don't do a for_each
# In this particular case the first policy in the list will match the first group (Frontend)
resource "aws_iam_group_policy_attachment" "policy-attach" {
  for_each = { for index, group in var.groups: "${group.name}" => group}
  group      = each.value.name
  policy_arn = aws_iam_policy.policy[index]
}