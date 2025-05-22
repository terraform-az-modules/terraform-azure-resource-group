##-----------------------------------------------------------------------------
## Tagging Module – Applies standard tags to all resources
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/tags/azure"
  version         = "1.0.0"
  name            = var.custom_name == "" ? var.name : var.custom_name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

##-----------------------------------------------------------------------------
## Resource Group – Creates a resource group.
##-----------------------------------------------------------------------------
resource "azurerm_resource_group" "default" {
  count    = var.enabled ? 1 : 0
  name     = var.resource_position_prefix ? format("rg-%s", local.name) : format("%s-rg", local.name)
  location = var.location
  tags     = module.labels.tags

  timeouts {
    create = var.create
    read   = var.read
    update = var.update
    delete = var.delete
  }
}

##---------------------------------------------------------------------------------------------------------------
## Management Lock - Manages a Management Lock which is scoped to a Subscription, Resource Group or Resource.
##---------------------------------------------------------------------------------------------------------------
resource "azurerm_management_lock" "resource-group-level" {
  count      = var.enabled && var.resource_lock_enabled ? 1 : 0
  name       = var.resource_position_prefix ? format("rg-lock-%s", local.name) : format("%s-rg-lock", local.name)
  scope      = azurerm_resource_group.default[0].id
  lock_level = var.lock_level
  notes      = var.notes
}
