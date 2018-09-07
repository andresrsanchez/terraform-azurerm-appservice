resource "azurerm_app_service" "app_service" {
  name                = "${var.app_service_name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  app_service_plan_id = "${local.plan_id}"

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = "${var.app_settings}"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  count               = "${var.app_service_plan_id != "" ? 0 : 1}"
  name                = "${var.app_service_plan_name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"

  sku {
    tier = "${var.sku_tier}"
    size = "${var.sku_size}"
  }
}

resource "azurerm_public_ip" "test" {
  name                         = "${var.app_service_plan_name}PublicIp"
  location                     = "${data.azurerm_resource_group.rg.location}"
  resource_group_name          = "${data.azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "static"
}

data "azurerm_public_ip" "test" {
  name = "${var.app_service_plan_name}DataPublicIp"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
}

output "domain_name_label" {
  value = "${data.azurerm_public_ip.test.domain_name_label}"
}

locals {
  plan_id = "${var.app_service_plan_id != "" ? var.app_service_plan_id : length(azurerm_app_service_plan.app_service_plan.*.id) > 0 ? element(concat(azurerm_app_service_plan.app_service_plan.*.id, list("")), 0) : ""}"
}

data "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
}
