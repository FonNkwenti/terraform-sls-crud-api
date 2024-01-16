
resource "aws_api_gateway_rest_api" "my_api" {
  name        = var.api_name
  description = var.api_description
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = var.resource_path
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "POST"
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "lambda_post_integration" {
  rest_api_id             = aws_api_gateway_rest_api.my_api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.post_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"

  uri = var.create_lambda_invoke_arn
}

resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "lambda_get_integration" {
  rest_api_id             = aws_api_gateway_rest_api.my_api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.get_method.http_method
  integration_http_method = "POST"  # Change to "GET" if you use Lambda Proxy Integration
  type                    = "AWS_PROXY"

  uri = var.read_lambda_invoke_arn
}

# Additional CRUD methods can be added similarly

# ... (resources for other CRUD methods)

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_post_integration,
    aws_api_gateway_integration.lambda_get_integration,
    # Include dependencies for other CRUD methods
  ]

  rest_api_id = aws_api_gateway_rest_api.my_api.id
  stage_name  = "dev"
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${module.lambda.create_lambda_function_name}"
  retention_in_days = var.log_group_retention_days
}

resource "aws_cloudwatch_log_group" "lambda_read_log_group" {
  name              = "/aws/lambda/${module.lambda.read_lambda_function_name}"
  retention_in_days = var.log_group_retention_days
}

resource "aws_lambda_permission" "api_gateway_invoke_lambda_create" {
  statement_id  = "AllowExecutionFromAPIGatewayCreate"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.create_lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/${aws_api_gateway_method.post_method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_lambda_permission" "api_gateway_invoke_lambda_read" {
  statement_id  = "AllowExecutionFromAPIGatewayRead"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.read_lambda_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/${aws_api_gateway_method.get_method.http_method}${aws_api_gateway_resource.resource.path}"
}


