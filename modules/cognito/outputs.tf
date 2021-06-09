output outputs {
  value = {
    name = aws_cognito_user_pool_client.app_client.name
    app_client = {
      id            = aws_cognito_user_pool_client.app_client.id
      client_secret = aws_cognito_user_pool_client.app_client.client_secret
      user_pool_id  = aws_cognito_user_pool_client.app_client.user_pool_id
    }
    user_pool_domain = "https://${aws_cognito_user_pool_domain.main.domain}.auth.${local.region}.amazoncognito.com"
    user_pool = {
      id = aws_cognito_user_pool.concourse.id
    }
    user_pool_main_domain = aws_cognito_user_pool_domain.main
    issuer                = "https://cognito-idp.${local.region}.amazonaws.com/${aws_cognito_user_pool.concourse.id}"
  }
}
