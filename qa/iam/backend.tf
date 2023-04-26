terraform {
  backend "s3" {
    bucket = "brightwheel-terraform"
    key    = "qa/iam"
    region = "us-east-1"
  }
}

