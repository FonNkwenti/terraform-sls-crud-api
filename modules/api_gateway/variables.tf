variable "api_name" {
  description = "Name of the API Gateway"
}

variable "api_description" {
  description = "Description of the API Gateway"
}

variable "resource_path" {
  description = "Path for the API Gateway resource"
}

variable "authorization" {
  description = "Authorization mechanism for the API Gateway"
}

variable "log_group_retention_days" {
  description = "Retention period (in days) for CloudWatch Log Group"
  default     = 7
}

variable "create_lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function for create operation"
  type        = string
}

variable "read_lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function for read operation"
  type        = string
}

variable "lambda_functions_module_path" {
  description = "Path to the Lambda module"
  type        = string
  default     = "../modules/lambda"  # Adjust the path accordingly
}