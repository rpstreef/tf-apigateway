# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "namespace" {
  description = "AWS resource namespace/prefix"
}

variable "region" {
  description = "AWS region"
}

variable "resource_tag_name" {
  description = "Resource name for billing purposes"
}

# -----------------------------------------------------------------------------
# Variables: API Gateway
# -----------------------------------------------------------------------------
variable "api_name" {
  description = "API Gateway endpoint name"
}

variable "api_template" {
  description = "API Gateway OpenAPI 3 template file"
}

variable "api_template_vars" {
  description = "Variables required in the OpenAPI template file"
  type        = map
}

variable "api_throttling_rate_limit" {
  description = "API Gateway total requests across all API's within a REST endpoint"
}

variable "api_throttling_burst_limit" {
  description = "API Gateway total concurrent connections allowed for all API's within a REST endpoint"
}

variable "api_metrics_enabled" {
  description = "Enables detailed API Gateway metrics"
  type        = bool
  default     = false
}

variable "api_logging_level" {
  description = " (Optional) Specifies the logging level for this method, which effects the log entries pushed to Amazon CloudWatch Logs. The available levels are OFF, ERROR, and INFO."
  type        = string
  default     = "OFF"
}

variable "api_data_trace_enabled" {
  description = "(Optional) Specifies whether data trace logging is enabled for this method, which effects the log entries pushed to Amazon CloudWatch Logs."
  type        = bool
  default     = false
}

variable "xray_tracing_enabled" {
  description = "Enables the XRay tracing and will create the necessary IAM permissions "
  type        = bool
  default     = false
}



# -----------------------------------------------------------------------------
# Variables: Misc.
# -----------------------------------------------------------------------------
variable "lambda_zip_name" {
  description = "Lambda ZIP source code filename"
}

variable "dist_file_path" {
  description = "File path to the Lambda ZIP source code"
}
