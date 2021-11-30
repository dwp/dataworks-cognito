resource aws_cognito_user_group admins {
  name         = "admins"
  user_pool_id = aws_cognito_user_pool.concourse.id
}

resource aws_cognito_user_group dataworks {
  name         = "dataworks"
  user_pool_id = aws_cognito_user_pool.concourse.id
}

resource "aws_cognito_user_group" "grafana_editor" {
  name         = "grafana-editor"
  user_pool_id = aws_cognito_user_pool.concourse.id
  description  = "Grafana Editors"
}

resource aws_cognito_user_group pipeline_operator {
  name         = "pipeline-operator"
  user_pool_id = aws_cognito_user_pool.concourse.id
  description  = "Concourse pipeline operators from the SRE team"
}
