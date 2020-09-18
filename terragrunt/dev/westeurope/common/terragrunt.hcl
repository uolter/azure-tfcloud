generate "tfvars" {
  path      = "common.auto.tfvars"
  if_exists = "overwrite"
  contents  = <<-EOF
# common variables:
region = "westeurope"
environment_short = "d"
environment = "dev"
global_prefix = "io"
EOF
}
