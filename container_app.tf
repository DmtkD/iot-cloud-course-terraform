resource "azurerm_container_app" "spring-boot-app" {
  name                         = "spring-boot-app"
  container_app_environment_id = azurerm_container_app_environment.containers_env_lab4.id
  resource_group_name          = azurerm_resource_group.my_folder.name
  revision_mode                = "Single"

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "spring-boot-app"
      image  = "docker.io/dmtkd/iot-cloud-course-lab2:latest"
      cpu    = 1
      memory = "2Gi"
    }

    http_scale_rule {
      name                = "my-http-rule"
      concurrent_requests = 50

    }

    min_replicas = 1
    max_replicas = 15
  }
}


resource "azurerm_container_app" "load-test-locust" {
  name                         = "load-test-locust"
  container_app_environment_id = azurerm_container_app_environment.containers_env_lab4.id
  resource_group_name          = azurerm_resource_group.my_folder.name
  revision_mode                = "Single"

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8089
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "spring-boot-app"
      image  = "docker.io/dmtkd/iot-cloud-course-locust:latest"
      cpu    = 0.5
      memory = "1Gi"
    }

    min_replicas = 1
    max_replicas = 5
  }

}