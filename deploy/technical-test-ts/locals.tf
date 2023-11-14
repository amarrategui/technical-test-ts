locals {
  project_name = "${var.group}-${var.env}-technical-test-ts"
  internal_endpoint = var.env == "prod" ? "${var.domain_name_cloud}" : "ppe.${var.domain_name_cloud}"
  external_endpoint = var.env == "prod" ? "${var.domain_name_cloud}" : "ppe.${var.domain_name_cloud}"
}
