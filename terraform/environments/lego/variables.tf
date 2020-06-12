variable "google_region" {
  description = "Google region to dpeloy Terraform resources to"
  default     = "europe-west1"
}

variable "google_zone" {
  description = "Google zone to deploy Terraform resources to"
  default     = "europe-west1-b"
}

variable "environment" {
  description = "environment to deploy onto e.g npd, ppd or prd"
}

variable "google_project_id" {
  description = "Google project id. Needed for the provider"
}