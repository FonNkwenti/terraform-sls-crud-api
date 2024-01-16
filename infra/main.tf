module "lambda" {
  source = "../modules/lambda"

  create_lambda_function_name  = "create"
  read_lambda_function_name    = "read"
  lambda_runtime               = "nodejs18.x"
  lambda_handler               = "index.handler"
  lambda_execution_role_name   = "lambda_execution_role"
  lambda_execution_policy_name = "lambda_execution_policy"
  lambda_environment           = {}  

  # Adjust the path accordingly
  lambda_functions_module_path = "../modules/lambda"
}

module "api_gateway" {
  source = "../modules/api_gateway"
  api_name               = "my-api"
  api_description        = "My API Gateway for CRUD operations"
  resource_path          = "my-resource"
  authorization          = "NONE"  
  log_group_retention_days = 7  
  create_lambda_invoke_arn = module.lambda.create_lambda_invoke_arn
  read_lambda_invoke_arn   = module.lambda.read_lambda_invoke_arn
}
