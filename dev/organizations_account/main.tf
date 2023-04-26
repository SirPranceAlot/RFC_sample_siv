# Contains the organization definition for dev

module "org_parent" {
  source = "../../organization"
}

resource "aws_organizations_account" "brightwheel-dev" {
  name      = "brightwheel-dev"
  email     = "brightwheel-dev@brightwheel.com"
  parent_id = module.org_parent.org_parent
}