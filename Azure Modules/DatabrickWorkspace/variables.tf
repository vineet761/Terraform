variable "resource_group" {
  description = "Resource group name to generate environment variables for"
  default     = "rgpazewddamcpltfmeng001"
}


variable "name" {
  description = "(Required) Specifies the name of the Databricks Workspace resource. Changing this forces a new resource to be created."
  default = "vinbrick"
}

variable "sku" {
  description = "(Required) The sku to use for the Databricks Workspace. Possible values are standard or premium. Changing this forces a new resource to be created."
  default = "standard"
}

variable "managed_resource_group_name" {
  description = "(Optional) The name of the resource group where Azure should place the managed Databricks resources. Changing this forces a new resource to be created."
  type = string
  default = "null"
}

variable "custom_tags" {
  description = "A mapping of tags to assign to the resource.Values should be a key = value pair"
  default = {}
}