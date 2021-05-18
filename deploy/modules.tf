module "cognito" {
  source = "../modules/cognito"

  clients = [
    "dataworks",
    "admins",
  ]

  root_dns_names = values(local.root_dns_name)
  domain         = local.cognito_domain
  loadbalancer   = "ci.wip.dataworks.dwp.gov.uk"
}