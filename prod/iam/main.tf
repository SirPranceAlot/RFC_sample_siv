# Remember the first policy is all for frontend, the second is backend, and so on.
# I'm only defining one group policy here because doing the rest will take awhile.

module "iam" {
  source   = "../../modules/iam"
  # We can list more policies in this list as needed per group.
  policies = [
    {
      policy = {
        Version   = "2012-10-17",
        Statement = [
        {
            "Effect": "Allow",
          # This is prod, so I'm not comfortable with direct write access
          # for frontende-engineers.
          # there should be a review process and an escalation process for write perms
          # in prod.
          # Only read/list perms here.
            "Action": [
                "cloudformation:DetectStackSetDrift",
                "cloudformation:ListExports",
                "cloudformation:DescribeStackDriftDetectionStatus",
                "cloudformation:DetectStackDrift",
                "cloudformation:ListStackSetOperations",
                "cloudformation:ListStackInstances",
                "cloudformation:ListTypes",
                "cloudformation:DescribeChangeSetHooks",
                "cloudformation:DescribeStackResource",
                "cloudformation:ListTypeRegistrations",
                "cloudformation:ListStackSetOperationResults",
                "cloudformation:DetectStackResourceDrift",
                "cloudformation:EstimateTemplateCost",
                "cloudformation:DescribeStackEvents",
                "cloudformation:DescribeStackSetOperation",
                "cloudformation:DescribeAccountLimits",
                "cloudformation:BatchDescribeTypeConfigurations",
                "cloudformation:DescribeChangeSet",
                "cloudformation:ListStackResources",
                "cloudformation:ListStacks",
                "cloudformation:DescribeType",
                "cloudformation:ListImports",
                "cloudformation:DescribeStackInstance",
                "cloudformation:DescribeStackResources",
                "cloudformation:DescribePublisher",
                "cloudformation:DescribeTypeRegistration",
                "cloudformation:GetTemplateSummary",
                "cloudformation:DescribeStacks",
                "cloudformation:DescribeStackResourceDrifts",
                "cloudformation:GetStackPolicy",
                "cloudformation:DescribeStackSet",
                "cloudformation:ListStackSets",
                "cloudformation:GetTemplate",
                "cloudformation:ValidateTemplate",
                "cloudformation:ListChangeSets",
                "cloudformation:ListTypeVersions"
            ],
          # again we can get more granular with this one
            "Resource": "*"
        }
        ]
      }
    }
  ]
}

