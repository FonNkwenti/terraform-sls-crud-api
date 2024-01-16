output "create_lambda_arn" {
  description = "The ARN of the Lambda function for create operation"
  value       = aws_lambda_function.lambda_create.arn
}

output "read_lambda_arn" {
  description = "The ARN of the Lambda function for read operation"
  value       = aws_lambda_function.lambda_read.arn
}

output "create_lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function for create operation"
  value       = aws_lambda_function.lambda_create.invoke_arn
}

output "read_lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function for read operation"
  value       = aws_lambda_function.lambda_read.invoke_arn
}

output "create_lambda_function_name" {
  description = "The name of the Lambda function for create operation"
  value       = aws_lambda_function.lambda_create.function_name
}

output "read_lambda_function_name" {
  description = "The name of the Lambda function for read operation"
  value       = aws_lambda_function.lambda_read.function_name
}
