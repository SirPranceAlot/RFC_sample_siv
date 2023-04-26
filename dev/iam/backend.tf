terraform {
  backend "s3" {
    bucket = "brightwheel-terraform"
    key    = "dev/iam"
    region = "us-east-1"
  }
}

