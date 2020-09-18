# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_resource_group?ref=ftcloud"
}

/*
inputs = {
  name = "common"
}
*/

/*
generate "tfvars" {
  path      = "terragrunt.auto.tfvars"
  if_exists = "overwrite"
  contents  = <<-EOF
# defined at terraform cloud workspace level
# common variables:
# environment_short = "d"
# environment = "dev"
# global_prefix = "io"
# end common variables:
name   = "commonme"

EOF
}
*/
