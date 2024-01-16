variable "create_lambda_function_name" {
  description = "The name of the Lambda function for create operation"
  type        = string
}

variable "read_lambda_function_name" {
  description = "The name of the Lambda function for read operation"
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "The name of the Lambda function handler"
  type        = string
}

variable "lambda_execution_role_name" {
  description = "Name of the IAM role for Lambda execution"
  type        = string
}

variable "lambda_execution_policy_name" {
  description = "Name of the IAM policy for Lambda execution"
  type        = string
}

variable "lambda_environment" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
}

variable "lambda_functions_module_path" {
  description = "Path to the Lambda module"
  type        = string
  default     = "../modules/lambda"  # Adjust the path accordingly
}
