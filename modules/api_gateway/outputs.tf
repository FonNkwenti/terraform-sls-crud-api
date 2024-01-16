

output "api_gateway_url" {
  description = "The URL for invoking the API Gateway"
  value       = aws_api_gateway_rest_api.my_api.id
}


output "api_gateway_id" {
  description = "ID of the created API Gateway"
  value       = aws_api_gateway_rest_api.my_api.id
}

output "lambda_post_integration_uri" {
  description = "URI of the Lambda integration for the POST method"
  value       = aws_api_gateway_integration.lambda_post_integration.uri
}

output "lambda_get_integration_uri" {
  description = "URI of the Lambda integration for the GET method"
  value       = aws_api_gateway_integration.lambda_get_integration.uri
}

