output "azurerm_container_app_url" {
  value = azurerm_container_app.spring-boot-app.latest_revision_fqdn
}