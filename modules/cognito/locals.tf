locals {
  name   = "Cognito"
  region = data.aws_region.current.name
}

data "aws_region" "current" {}
