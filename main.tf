resource "azurerm_resource_group" "my_folder" {
  name     = "iot-cloud-course-terraform-lab4"
  location = var.region
}

resource "azurerm_log_analytics_workspace" "my_first_app" {
  name                = "log-aca"
  location            = azurerm_resource_group.my_folder.location
  resource_group_name = azurerm_resource_group.my_folder.name
}

resource "azurerm_container_app_environment" "containers_env_lab4" {
  name                       = var.app
  location                   = azurerm_resource_group.my_folder.location
  resource_group_name        = azurerm_resource_group.my_folder.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_first_app.id
}