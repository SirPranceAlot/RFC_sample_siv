# Remember the first policy is all for frontend, the second is backend, and so on.
# I'm only defining one group policy here because doing the rest will take awhile.

module "iam" {
  source = "../../modules/iam"
  # We can list more policies in this list as needed per group.
  policies = [
    {
      policy = {
        Version = "2012-10-17",
        Statement = [
          {
            "Effect" : "Allow",
            # QA is usually on a very similar level to prod, since QA is from my experience used to
            # be as similar to prod as possible before deployment.
            # It can vary but I'm gonna just leave the write perms off until there is a process for QA.
            # Preferable the write perms will be in CICD so groups/individuals don't really need to directly modify
            # cloudformation.
            "Action" : [
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
            "Resource" : "*"
          }
        ]
      }
    }
  ]
}

