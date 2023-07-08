variable "location" {
  type = string
  default = "Central India"
}

variable "resource_group_name" {
  type = string
  default = "test-rg"
}

variable "security_group_name" {
  type = string
  default = "my-nsg"
}

variable "tags" {
  type = map(string)
  default = {
    "deprtment" = "hr"
  }
}