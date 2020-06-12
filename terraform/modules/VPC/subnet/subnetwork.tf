resource "google_compute_subnetwork" "subnetwork" {
  name   = var.subnetwork_name
  region = var.google_region
  network = var.network
  ip_cidr_range = var.ip_cidr_range
}