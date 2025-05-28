<!-- BEGIN_TF_DOCS -->

# Azure Resource Group Module

This example demonstrates how to use the `terraform-azure-resource-group` module. It deploys an Azure Resource Group with default or custom configurations using the specified input variables.

---

## ✅ Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.6.6  |
| Azurerm   | >= 3.116.0|

---

## 🔌 Providers

No additional providers are explicitly used in this example.

---

## 📦 Modules

| Name              | Source   | Version |
|-------------------|----------|---------|
| resource_group    | ../../    | n/a     |

---

## 🏗️ Resources

No additional resources are directly defined in this example.

---

## 🔧 Inputs

_No input variables are required for this example._

---

## 📤 Outputs

| Name                          | Description                                                                 |
|-------------------------------|-----------------------------------------------------------------------------|
| `resource_group_id`           | The ID of the Resource Group.                                               |
| `resource_group_location`     | The Azure Region where the Resource Group exists. Changing this forces a new Resource Group to be created. |
| `resource_group_name`         | The name of the Resource Group. Changing this forces a new Resource Group to be created. |
| `tags`                        | A mapping of tags assigned to the Resource Group.                          |

<!-- END_TF_DOCS -->
