variable "project" {
  description = "google project to deploy Terraform resources to"
}

variable "google_region" {
  description = "Google region to dpeloy Terraform resources to"
  default     = "europe-west1"
}

variable "google_zone" {
  description = "Google zone to deploy Terraform resources to"
  default     = "europe-west1-b"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
}

variable "node_pool_name" {
  description = "Name of the node pool to deploy kubernetes resources to"
}

variable "google_subnetwork_vpc_name" {
  description = "Name of the the vpc"
}

variable "google_vpc_network" {
  description = "Name of the the subnet"
}
