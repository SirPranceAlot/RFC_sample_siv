terraform {
  backend "s3" {
    bucket = "brightwheel-terraform"
    key    = "dev/organizations_account"
    region = "us-east-1"
  }
}
