variable "google_region" {
  description = "Google region to dpeloy Terraform resources to"
  default     = "europe-west1"
}

variable "subnetwork_name" {
  description = "The name of the subnetwork"
}

variable "network" {
  description = "The network name or resource link to the parent network of this subnetwork."
}
variable "ip_cidr_range" {
  description = "The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork."
}