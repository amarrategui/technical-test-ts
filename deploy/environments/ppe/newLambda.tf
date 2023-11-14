module "technical-test-ts" {
  source             = "../../technical-test-ts"
  env                = "ppe"
  project            = "technical-test-ts"
  common_service_env = "ppe"
  external_env       = "ppe"
  domain_name_cloud = "amdocs-dbs.cloud"
  remote_microservice_env = "ppe"
  account_id = "222020678067"
}

output "module_outputs" {
  value = module.technical-test-ts
}
