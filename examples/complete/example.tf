provider "azurerm" {
  features {}
  subscription_id = "123456---0000000000000-789456"
}

##-----------------------------------------------------------------------------
## Resource Group module call.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "../../"
  custom_name = "example"
  environment = "test"
  location    = "North Europe"

  #resource lock
  resource_lock_enabled = true
  lock_level            = "CanNotDelete"
}
