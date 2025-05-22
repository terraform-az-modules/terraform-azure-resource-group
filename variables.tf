##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = null
  description = "Define your custom name to override default naming convention"
}

variable "resource_position_prefix" {
  type        = bool
  default     = true
  description = <<EOT
Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.

- If true, the keyword is prepended: "vnet-core-dev".
- If false, the keyword is appended: "core-dev-vnet".

This helps maintain naming consistency based on organizational preferences.
EOT
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
  description = "The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']."
}

variable "managedby" {
  type        = string
  default     = "terraform-az-modules"
  description = "ManagedBy, eg 'terraform-az-modules'."
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "location" {
  type        = string
  default     = null
  description = "Azure region (e.g. `eastus`, `westus`)."
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
  description = "Enable or disable lock resource"
}

variable "lock_level" {
  type        = string
  default     = "CanNotDelete"
  description = "Specifies the lock level for the resource group to prevent accidental changes."
}

variable "notes" {
  type        = string
  default     = "This Resource Group is locked by terrafrom"
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
}
