variable "costcode" {
  type    = string
  default = ""
}

variable "assume_role" {
  type        = string
  default     = "ci"
  description = "IAM role assumed by Concourse when running Terraform"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "clients" {
  type        = list(string)
  default     = ["dataworks", ]
  description = "List of named client/group pairs"
}
