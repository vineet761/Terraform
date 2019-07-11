variable "resource_group" {
  description = "Resource group name to generate environment variables for"
  default     = ""
}

variable "name" {
  description = "Name of the EventHub resource"
  default     = "VVV3Eventhub"
}

variable "name2" {
  description = "Name of the EventHub resource"
  default     = "VVV3Eventhub"
}

variable "namespaceName" {
  description = "Specifies a new Namespace of existing Namespace name"
  default     = "VVVE3Vhubnamespace"
}

variable "eventHubSku" {
  description = "Specifies the SKU value for the event hub to be deployed"
  default     = "Basic"
}

variable "messageRetentionInDays" {
  description = "Specifies the Message Retention value for the event hub messages"
  default     = 1
}

variable "consumer_group_name" {
  description = "(Required) Specifies the name of the EventHub Consumer Group resource. Changing this forces a new resource to be created."
  default     = "consumer1"
  
}

variable "consumer_group_user_metadata" {
  description = "(Optional) Specifies the consumer group user metadata."
  default     = "Metadata"
}

variable "account_replication_type" {
    default = "ZRS"
  
}
variable "sa_name" {
  default= "vinstorage"
}

variable "account_kind" { 
    default = "StorageV2"
}  

variable "account_tier" {
    default = "Standard"
}


variable "capture_description" {
  description = " The properties to configure capture description for eventhub"
  type = list( object({
    enabled             = bool,
    encoding            = string,
    interval_in_seconds = number,
    size_limit_in_bytes = number,
    skip_empty_archives = bool,

    destination = object({
      name                = string,
      archive_name_format = string,
      blob_container_name = string,
      storage_account_id  = string,
    })
  }))
  default = []
}