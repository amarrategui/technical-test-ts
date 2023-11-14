resource "aws_lambda_function" "newLambda" {
  function_name    = "ohf-tasks-${var.env}-technical-test-ts"
  handler          = "aws/lambda/newLambda.handler"
  runtime          = "nodejs16.x"
  role             = aws_iam_role.lambda_exec.arn
  filename         = var.lambda_server_handler_filepath
  source_code_hash = filebase64sha256(var.lambda_server_handler_filepath)
  publish          = true
  vpc_config {
    subnet_ids         = data.aws_subnets.private.ids
    security_group_ids = [data.aws_security_group.secgrp.id]
  }

  layers = [
    aws_lambda_layer_version.lambda_layer_dependencies.arn
  ]

  timeout     = 30
  memory_size = 512

  environment {
    variables = {

      REGION            = "us-east-1"
      LOG_LEVEL         = "debug"
      MAX_RETRY         = 2
      POOL_TYPE         = var.pool_type
      CLIENT_NAME       = var.client_name
    }
  }
}

resource "aws_lambda_alias" "newLambdav1" {
  function_name    = aws_lambda_function.newLambda.function_name
  function_version = aws_lambda_function.newLambda.version
  name             = "v1"

  lifecycle {
    ignore_changes = [
      function_version
    ]
  }
}