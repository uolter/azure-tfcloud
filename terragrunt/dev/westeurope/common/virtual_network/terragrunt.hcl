# Include all settings from the root terragrunt.hcl file
dependency "resource_group" {
  config_path = "../resource_group"
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_virtual_network?ref=tfcloud"
}


locals {
  # Automatically load environment-level variables
  global_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}


generate "tfvars" {
  path      = "terragrunt.auto.tfvars"
  if_exists = "overwrite"
  contents = <<-EOF
region                = "${local.global_vars.locals.region}"
environment_short     = "${local.global_vars.locals.environment_short}"
environment           = "${local.global_vars.locals.environment}"
global_prefix         = "${local.global_vars.locals.global_prefix}"
global_tenant_id      = "${local.global_vars.locals.global_tenant_id}"

name                = "common"
resource_group_name = "${dependency.resource_group.outputs.resource_name}"
address_space       = ["10.1.0.0/16"]
EOF
}
