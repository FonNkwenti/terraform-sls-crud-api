
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../src/functions"
  output_path = "${path.module}/../../path/to/lambda-functions.zip"
}

resource "aws_iam_role" "lambda_execution_role" {
  name = var.lambda_execution_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name        = var.lambda_execution_policy_name
  description = "Policy for Lambda execution"

  # Define policy document as needed
  # Example:
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution_attachment" {
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
  role       = aws_iam_role.lambda_execution_role.name
}

resource "aws_lambda_function" "lambda_create" {
  function_name = var.create_lambda_function_name
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.lambda_execution_role.arn

}

resource "aws_lambda_function" "lambda_read" {
  function_name = var.read_lambda_function_name
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.lambda_execution_role.arn

}

# Additional Lambda configurations can be added based on your specific requirements
