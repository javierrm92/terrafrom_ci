# Configuración del proveedor de Azure
provider "azurerm" {
  features {}
}

# Recurso de grupo de recursos
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Plan de servicio de aplicación (App Service Plan)
resource "azurerm_app_service_plan" "example" {
  name                = "example-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Recurso de servicio de aplicación (App Service)
resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    # Configuraciones del servicio de aplicación (opcional)
  }
}
