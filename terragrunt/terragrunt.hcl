# Configure common remote state

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io" # Change this to your hostname for TFE
    organization = "uolter"
    workspaces {
      name = "${replace(path_relative_to_include(), "/", "-")}"
    }
  }
}
EOF
}

locals {
  default_yaml_path = find_in_parent_folders("empty.yaml")
}

/*
inputs = merge(
  yamldecode(
    file(find_in_parent_folders("global.yaml", local.default_yaml_path)),
  ),
  yamldecode(
    file(find_in_parent_folders("env.yaml", local.default_yaml_path)),
  ),
  yamldecode(
    file(find_in_parent_folders("region.yaml", local.default_yaml_path)),
  )
)
*/
