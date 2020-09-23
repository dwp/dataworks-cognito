resource aws_cognito_user_pool_client app_client {

  name                                 = local.name
  user_pool_id                         = aws_cognito_user_pool.dataworks.id
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  callback_urls                        = formatlist("https://%s/sky/issuer/callback", local.cognito_domain)
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
