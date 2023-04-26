# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# definition for the "root" organization

resource "aws_organizations_organization" "root" {
  aws_service_access_principals = [
    "cloudfront.amazonaws.com",
    # Not every EKS needs to be enabled but I'm assuming we're gonna be using these.
    "eks-fargate-pods.amazonaws.com",
    "eks-fargate.amazonaws.com",
    "eks-nodegroup.amazonaws.com",
    "eks.amazonaws.com",
    "redshift.amazonaws.com",
    # Cost alerts for when some engies want to spin up 1000 ethereum miners.
    "costalerts.amazonaws.com",
    "billingconsole.amazonaws.com",
    "cloudformation.amazonaws.com",
    # We might not use all the codebuild stuff but since we're using cloudformation we may.
    "codebuild.amazonaws.com",
    "codecommit.amazonaws.com",
    "codepipeline.amazonaws.com",
    "codedeploy.amazonaws.com",
    "codestar-notifications.amazonaws.com",
    "codestar.amazonaws.com",
    "securityhub.amazonaws.com",
    # Logs
    "cloudtrail.amazonaws.com",
    "cloudwatch.amazonaws.com",
    # Some people may use this.
    "datapipeline.amazonaws.com",
    # We'll probably want to stream metrics
    "streams.metrics.cloudwatch.amazonaws.com",
    # Cross account visibility? Why not!
    "cloudwatch-crossaccount.amazonaws.com"
  ]

  feature_set = "ALL"
}