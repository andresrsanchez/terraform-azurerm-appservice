Create an Azure App Service
==============================================================================

This Terraform module creates a basic App Service.

Usage
-----

```hcl
module "app-service" {
  source              = "github.com/andresrsanchez/terraform-azurerm-appservice"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  app_service_name      = "terraformappservice"
  app_service_plan_name = "myappservice_plan"
  sku_tier              = "Basic"
  sku_size              = "B1"

  app_settings {
    "ConnectionString" = "blabla"
  }
  
}
```

Authors
=======
Originally created by [Andrés](http://github.com/andresrsanchez)  
Credits to James Earle for the README
