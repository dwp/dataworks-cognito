resource aws_cognito_user_pool_domain main {
  domain       = local.cognito_domain
  user_pool_id = aws_cognito_user_pool.dataworks.id
}
