# Contains the organization definition for prod

module "org_parent" {
  source = "../../organization"
}

resource "aws_organizations_account" "brightwheel-prod" {
  name      = "brightwheel-prod"
  email     = "brightwheel-prod@brightwheel.com"
  parent_id = module.org_parent.org_parent
}