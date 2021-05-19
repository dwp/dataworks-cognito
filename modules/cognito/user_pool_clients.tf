resource aws_cognito_user_pool_client app_client {

  name                                 = local.name
  user_pool_id                         = aws_cognito_user_pool.concourse.id
  allowed_oauth_flows_user_pool_client = true
  callback_urls                        = formatlist("https://%s/sky/issuer/callback", var.loadbalancer)
  supported_identity_providers         = ["COGNITO"]

  allowed_oauth_flows = [
    "code",
    "implicit"
  ]

  allowed_oauth_scopes = [
    "email",
    "openid",
    "profile",
  ]

}

resource "aws_cognito_user_pool_client" "grafana" {
  name                                 = "grafana"
  user_pool_id                         = aws_cognito_user_pool.concourse.id
  generate_secret                      = true
  callback_urls                        = ["https://${data.terraform_remote_state.metrics_infrastructure.outputs.grafana_fqdn}/login/generic_oauth"]
  logout_urls                          = ["https://${data.terraform_remote_state.metrics_infrastructure.outputs.grafana_fqdn}"]
  explicit_auth_flows                  = ["ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code", "implicit"]
  allowed_oauth_scopes                 = ["phone", "aws.cognito.signin.user.admin", "email", "openid", "profile"]
  supported_identity_providers         = ["COGNITO"]
}
