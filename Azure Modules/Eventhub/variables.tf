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

