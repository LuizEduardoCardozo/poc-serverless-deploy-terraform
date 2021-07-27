provider "aws" {
    access_key                  = "mock_access_key"
    region                      = "us-east-1"
    s3_force_path_style         = true
    secret_key                  = "mock_secret_key"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    endpoints {
        apigateway     = "http://localhost:4566"
        cloudformation = "http://localhost:4566"
        cloudwatch     = "http://localhost:4566"
        dynamodb       = "http://localhost:4566"
        es             = "http://localhost:4566"
        firehose       = "http://localhost:4566"
        iam            = "http://localhost:4566"
        kinesis        = "http://localhost:4566"
        lambda         = "http://localhost:4566"
        route53        = "http://localhost:4566"
        redshift       = "http://localhost:4566"
        s3             = "http://localhost:4566"
        secretsmanager = "http://localhost:4566"
        ses            = "http://localhost:4566"
        sns            = "http://localhost:4566"
        sqs            = "http://localhost:4566"
        ssm            = "http://localhost:4566"
        stepfunctions  = "http://localhost:4566"
        sts            = "http://localhost:4566"
    }
}

resource "aws_iam_role" "lambdas_iam" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "api_lambda" {
  filename      = "../api/build/api.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.lambdas_iam.arn
  handler       = "handler.handler"

  source_code_hash = filebase64sha256("../api/build/api.zip")

  runtime = "nodejs12.x"

}