variable "env" {
  type        = string
  description = "Environment name. Official env can be one of dev, stg, prod"
}

variable "external_env" {
  type        = string
  description = "Environment name. Official env can be one of dev, stg, prod"
  default = "ppe"
}

variable "group" {
  type        = string
  description = "Service group name: MTN"
  default     = "mtn"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "region" {
  description = "The region for all of the services to be deployed to"
  type        = string
  default     = "us-east-1"
}

variable "lambda_log_level" {
  description = "Log level for lambda"
  type        = string
  default     = "info"
}

variable "lambda_server_handler_filepath" {
  type    = string
  default = "../../../dist/build.zip"
}

variable "lambda_dependencies_filepath" {
  type    = string
  default = "../../../dist-layers/layers.zip"
}

variable "common_service_env"{
  description = "Environment for common services such as VPC, ACM, R53 zone,etc."
  type        = string
}

variable "domain_name_cloud" {
  description = "base domain name"
  type        = string
  default     = "amdocs-dbs.cloud"
}

variable "domain_name" {
  description = "base domain name"
  type        = string
  default     = "dbx.digital"
}

variable "remote_microservice_env" {
  description = "remote microservice"
  type        = string
}

variable "account_id" {
  description = "AWS account Id "
  type        = string
}

variable "pool_type" {
  type        = string
  description = "Pool type for auth lambda"
  default     = "user"
}

variable "client_name" {
  type        = string
  description = "App client name for auth lambda"
  default     = "ohf"
}
