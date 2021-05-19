variable "parent_domain_name" {
  description = "parent domain name for CI"
  type        = string
  default     = "dataworks.dwp.gov.uk"
}

variable "enterprise_github_url" {
  description = "URL for enterprise github"
  type        = string
  default     = "github.ucds.io"
}

variable "costcode" {
  type    = string
  default = ""
}

variable "loadbalancer" {
  type    = string
  default = ""
}
