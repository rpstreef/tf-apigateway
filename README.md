# Terraform API Gateway Module

## About:

Supports basic setup of API Gateway with an OpenAPI 3 YML document:

These parameters configure the use of the OpenAPI 3 document:
- __api_template__: API Gateway OpenAPI 3 template file
- __api_template_vars__: Variables required in the OpenAPI template file

Added support for CloudWatch Alarms in __v1.2__, use the ```var.resources``` parameter to specify which endpoints you want to monitor.

## How to use:

Call the module with the specific version you want using the ```ref``` query parameter:

```terraform
# -----------------------------------------------------------------------------
# API Gateway
# -----------------------------------------------------------------------------
module "apigateway" {
  source            = "github.com/rpstreef/tf-apigateway?ref=v1.0"
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
  }

  lambda_zip_name = local.lambda_zip_name
  dist_file_path  = local.dist_file_path

  resources = {
    "/identity/authenticate" = "POST",
    "/identity/register"     = "POST",
    "/identity/reset"        = "POST",
    "/identity/verify"       = "POST",
    "/user"                  = "GET"
  }
}
```

## Changelog

### v1.2
Use the resources parameter ```var.resources``` to specify which API endpoints you want the following Alarms to be enabled:

- latency P95
- latency P99
- 400 Errors
- 500 Errors

### v1.1

- added data trace variable
- added X-Ray tracing variable
- 
