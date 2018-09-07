variable "sku_tier" {
  description = "App service SKU"
  default     = "Basic"
}

variable "sku_size" {
  description = "App service SKU"
  default     = "B1"
}

variable "resource_group_name" {
  description = "Resource group name."
}

variable "app_service_name" {
  description = "App service name"
}

variable "app_service_plan_id" {
  description = "App service plan id"
  default     = ""
}

variable "app_service_plan_name" {
  description = "App service plan name"
  default     = "App_service_plan"
}

variable "app_settings" {
  type    = "map"
  default = {}
}
