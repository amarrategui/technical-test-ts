module "technical-test-ts" {
  source             = "../../technical-test-ts"
  env                = "dbs-dev"
  project            = "technical-test-ts"
  common_service_env = "dbs-dev"
  external_env       = "ppe"
  domain_name_cloud = "amdocs-dbs.cloud"
  remote_microservice_env = "ppe"
  account_id = "549993999176"
}

output "module_outputs" {
  value = module.technical-test-ts
}
