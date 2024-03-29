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

  access_token_validity = 60
  id_token_validity = 60

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}
