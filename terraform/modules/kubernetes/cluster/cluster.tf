resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.google_region
  project  = var.project

  network    = var.google_vpc_network
  subnetwork = var.google_subnetwork_vpc_name

  remove_default_node_pool = true
  initial_node_count       = 1


//  # Enable ip alias
//  ip_allocation_policy {
//    // needs existing range names assigned to the project
//    cluster_secondary_range_name  = var.google_container_cluster_pods_secondary_range_name
//    services_secondary_range_name = var.google_container_cluster_services_secondary_range_name
//  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}