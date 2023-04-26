# Contains the organization definition for qa

module "org_parent" {
  source = "../../organization"
}

resource "aws_organizations_account" "brightwheel-qa" {
  name      = "brightwheel-qa"
  email     = "brightwheel-qa@brightwheel.com"
  parent_id = module.org_parent.org_parent
}