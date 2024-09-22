resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.region
  tags     = local.tags
}

data "azurerm_container_app_environment" "app_environment" {
  name                = local.container_environment_name
  resource_group_name = local.container_environment_resource_group_name
}

resource "azurerm_container_app" "web" {
  name                         = local.container_app_web_name
  container_app_environment_id = data.azurerm_container_app_environment.app_environment.id
  resource_group_name          = azurerm_resource_group.rg.name
  tags                         = local.tags
  revision_mode                = "Single"
  template {
    container {
      name   = local.container_web_name
      image  = local.container_web_image_name
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  ingress {
    external_enabled = true
    target_port      = var.port_web
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  lifecycle {
    ignore_changes = [
      ingress[0].custom_domain // TODO: Ignore changes to the custom domain until terraform can manage it - https://github.com/hashicorp/terraform-provider-azurerm/issues/21866
    ]
  }
}