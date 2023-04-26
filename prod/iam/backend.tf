terraform {
  backend "s3" {
    bucket = "brightwheel-terraform"
    key    = "prod/iam"
    region = "us-east-1"
  }
}

