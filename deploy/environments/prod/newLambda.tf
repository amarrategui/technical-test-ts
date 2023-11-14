module "technical-test-ts" {
  source             = "../../technical-test-ts"
  env                = "prod"
  project            = "technical-test-ts"
  domain_name_cloud = "amdocs-dbs.com"
  common_service_env = "prod"
  external_env       = "prod"
  remote_microservice_env = "prod"
  account_id = "174941398104"
}

output "module_outputs" {
  value = module.technical-test-ts
}
