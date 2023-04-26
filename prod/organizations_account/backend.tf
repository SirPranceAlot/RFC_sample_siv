terraform {
  backend "s3" {
    bucket = "brightwheel-terraform"
    key    = "prod/organizations_account"
    region = "us-east-1"
  }
}
