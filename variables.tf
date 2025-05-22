##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = ""
  description = "Override default naming convention"
}

##-----------------------------------------------------------------------------
## Labels
##-----------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = null
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/terraform-az-modules/terraform-azure-resource-group"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment", "location"]
  description = "Label order, e.g. `name`,`application`,`centralus`."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy"
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the module creation."
}

variable "location" {
  type        = string
  default     = null
  description = "Location where resource should be created."
}

variable "create" {
  type        = string
  default     = "90m"
  description = "Used when creating the Resource Group."
}

variable "read" {
  type        = string
  default     = "5m"
  description = "Used when retrieving the Resource Group."
}

variable "update" {
  type        = string
  default     = "90m"
  description = "Used when updating the Resource Group."
}

variable "delete" {
  type        = string
  default     = "90m"
  description = "Used when deleting the Resource Group."
}

variable "resource_lock_enabled" {
  type        = bool
  default     = false
  description = "enable or disable lock resource"
}

variable "lock_level" {
  type    = string
  default = "CanNotDelete"
}

variable "notes" {
  type        = string
  default     = "This Resource Group is locked by terrafrom"
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
}
