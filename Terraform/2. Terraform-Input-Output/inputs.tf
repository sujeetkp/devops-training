variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "location" {
  description = "Resource location"
  type = string
  default = "East US"
}

variable "tags" {
  description = "Resource location"
  type = map(string)
  #sensitive = true
}

/*
variable "departments" {
  description = "Resource departments"
  type = list(string)
}

variable "count" {
  description = "Resource count"
  type = number
}

variable "enable_rg" {
  description = "Enabling Resource Group (true/false)"
  type = bool
}

variable "location" {
  description = "Resource location"
  type = string
  default = "East US"

  validation {
    condition = "<Condition>"
    error_message = "%s is not"
  }
}
*/

/*
variable "resource_group_details" {
  description = "resource group details"
  type = object({
    resource_group_name = string
    location = string
    tags = map(string)
  })
}
*/