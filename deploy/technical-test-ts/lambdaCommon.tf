resource "aws_lambda_layer_version" "lambda_layer_dependencies" {
  filename   = var.lambda_dependencies_filepath
  layer_name = "${local.project_name}-dependencies"

  compatible_runtimes = [
    "nodejs16.x"
  ]
  source_code_hash = filebase64sha256(var.lambda_dependencies_filepath)
}

resource "aws_iam_role" "lambda_exec" {
  name = "${local.project_name}-lambda-exec-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "service" {
  name = "${local.project_name}-lambda-service-role"
  role = aws_iam_role.lambda_exec.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:*",
        "cloudwatch:*",
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds",
        "lambda:InvokeFunction"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "basic-exec-role" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_policy" "cognito-policy" {
  name = "${local.project_name}-cognito-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
          {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cognito-idp:DescribeUserPool",
                "cognito-idp:ListUserPoolClients",
                "cognito-idp:DescribeUserPoolClient"
            ],
            "Resource": "*"
      }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cognito-policy-attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.cognito-policy.arn
}
