resource aws_cognito_user_group admins {
  name         = "admins"
  user_pool_id = aws_cognito_user_pool.concourse.id
}

resource aws_cognito_user_group dataworks {
  name         = "dataworks"
  user_pool_id = aws_cognito_user_pool.concourse.id
}
