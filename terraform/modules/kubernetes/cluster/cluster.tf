resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  location   = var.google_region
  project    = var.project
  network    = var.google_vpc_network
  subnetwork = var.google_subnetwork_vpc_name

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}