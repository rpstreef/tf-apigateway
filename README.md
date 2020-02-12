# Terraform API Gateway Module

## About:

Supports basic setup of API Gateway with an OpenAPI 3 YML document:

These parameters configure the use of the OpenAPI 3 document:
- __api_template__: API Gateway OpenAPI 3 template file
- __api_template_vars__: Variables required in the OpenAPI template file

## How to use:

Call the module:

```terraform
# -----------------------------------------------------------------------------
# API Gateway
# -----------------------------------------------------------------------------
module "apigateway" {
  source            = "github.com/rpstreef/tf-apigateway"
  resource_tag_name = var.resource_tag_name
  namespace         = var.namespace
  region            = var.region

  api_name                   = local.api_name
  api_throttling_rate_limit  = var.api_throttling_rate_limit
  api_throttling_burst_limit = var.api_throttling_burst_limit
  api_metrics_enabled        = var.api_metrics_enabled
  api_logging_level          = var.api_logging_level
  api_template               = file("../../services/api/${local.api_name}.yml")
  api_template_vars = {
    region = var.region

    cognito_user_pool_arn = module.cognito.cognito_user_pool_arn

    lambda_identity_arn     = module.identity.lambda_arn
    lambda_identity_timeout = var.lambda_identity_api_timeout

    lambda_user_arn     = module.user.lambda_arn
    lambda_user_timeout = var.lambda_user_api_timeout
  }

  lambda_zip_name = local.lambda_zip_name
  dist_file_path  = local.dist_file_path
}
```