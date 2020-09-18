# Include all settings from the root terragrunt.hcl file
dependency "resource_group" {
  config_path = "../resource_group"
}


include {
  path = find_in_parent_folders()
}



terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_virtual_network?ref=ftcloud"
}
