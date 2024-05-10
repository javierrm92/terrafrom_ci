# Configuración del proveedor de Azure
provider "azurerm" {
  features {}
}

# Recurso de grupo de recursos
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Recurso de cuenta de almacenamiento
resource "azurerm_storage_account" "example" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Contenedor en la cuenta de almacenamiento para el estado de Terraform
resource "azurerm_storage_container" "example" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

# Generar token SAS para la cuenta de almacenamiento
resource "azurerm_storage_account_sas" "example" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  https_only        = true
  start             = "2024-05-09"
  expiry            = "2024-12-31"
}

output "sas_token" {
  value = azurerm_storage_account_sas.example.sas
}
