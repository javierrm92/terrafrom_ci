terraform {
  backend "azurerm" {
    storage_account_name = "examplestorageaccount109"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    sas_token            = var.sas_token
  }
}

variable "sas_token" {
  type        = string
  description = "SAS Token for Azure Storage Account"
}
