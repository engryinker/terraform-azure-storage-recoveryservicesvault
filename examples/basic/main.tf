terraform {
  required_version = ">= 1.7.0"
}

module "storage-recoveryservicesvault" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  recovery_services_vaults = {} # see README Inputs table / upstream module docs for the per-entry schema
}
