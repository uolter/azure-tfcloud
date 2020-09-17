variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
    default = "westeurope"
}

variable "storage_account_mame" {
    type = string
    defaulr = "uolter-cloud-example"
}

variable "environment" {
    type = string
    default = "dev"
}
