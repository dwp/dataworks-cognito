locals {

  management_workspace = {
    management-dev = "default"
    management     = "management"
  }

  common_tags = {
    DWX_Environment  = terraform.workspace == "default" ? "development" : terraform.workspace
    DWX_Application  = "concourse"
  }

  env_prefix = {
    management-dev = "mgt-dev."
    management     = "mgt."
  }

  deploy_ithc_infra = {
    management-dev = false
    management     = false
  }

  kali_users = jsondecode(data.aws_secretsmanager_secret_version.internet_ingress.secret_binary)["ssh_bastion_users"]

  no_proxy_list = [
    "169.254.169.254",
    "application-autoscaling.eu-west-2.amazonaws.com",
    "athena.eu-west-2.amazonaws.com",
    "autoscaling.eu-west-2.amazonaws.com",
    "cloudformation.eu-west-2.amazonaws.com",
    "codecommit.eu-west-2.amazonaws.com",
    "config.eu-west-2.amazonaws.com",
    "dynamodb.eu-west-2.amazonaws.com",
    "ec2.eu-west-2.amazonaws.com",
    "ec2messages.eu-west-2.amazonaws.com",
    "ecr.api.eu-west-2.amazonaws.com",
    "ecr.dkr.eu-west-2.amazonaws.com",
    "ecs.eu-west-2.amazonaws.com",
    "elasticfilesystem.eu-west-2.amazonaws.com",
    "elasticloadbalancing.eu-west-2.amazonaws.com",
    "elasticmapreduce.eu-west-2.amazonaws.com",
    "events.eu-west-2.amazonaws.com",
    "git-codecommit.eu-west-2.amazonaws.com",
    "glue.eu-west-2.amazonaws.com",
    "kinesis-firehose.eu-west-2.amazonaws.com",
    "kms.eu-west-2.amazonaws.com",
    "logs.eu-west-2.amazonaws.com",
    "monitoring.eu-west-2.amazonaws.com",
    "rds.eu-west-2.amazonaws.com",
    "rds-data.eu-west-2.amazonaws.com",
    "s3.eu-west-2.amazonaws.com",
    "secretsmanager.eu-west-2.amazonaws.com",
    "sns.eu-west-2.amazonaws.com",
    "sqs.eu-west-2.amazonaws.com",
    "ssm.eu-west-2.amazonaws.com",
    "ssmmessages.eu-west-2.amazonaws.com",
    ".s3.eu-west-2.amazonaws.com",
    "api.ecr.eu-west-2.amazonaws.com",
    ".dkr.ecr.eu-west-2.amazonaws.com",
    "eu-west-2.elasticmapreduce.amazonaws.com",
  ]


}
