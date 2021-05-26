output outputs {
  value = {
    name                  = aws_cognito_user_pool_client.app_client.name
    app_client            = aws_cognito_user_pool_client.app_client
    grafana_client        = aws_cognito_user_pool_client.grafana
    user_pool_domain      = "https://${aws_cognito_user_pool_domain.main.domain}.auth.${local.region}.amazoncognito.com"
    user_pool             = aws_cognito_user_pool.concourse
    user_pool_main_domain = aws_cognito_user_pool_domain.main
    issuer                = "https://cognito-idp.${local.region}.amazonaws.com/${aws_cognito_user_pool.concourse.id}"
    concourse_pool        = aws_cognito_user_pool.concourse
  }
}
