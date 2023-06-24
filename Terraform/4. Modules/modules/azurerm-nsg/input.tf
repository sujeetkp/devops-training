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