locals {
  google_project_name = "lego-${var.environment}"
  image_name          = "nginx"
  image_tag           = "1.19"
}

provider "google" {
  project = var.google_project_id
  region  = var.google_region
  zone    = var.google_zone
}

provider "kubernetes" {
  host                   = module.kubernetes-cluster.endpoint
  client_certificate     = base64decode(module.kubernetes-cluster.client_certificate)
  client_key             = base64decode(module.kubernetes-cluster.client_key)
  cluster_ca_certificate = base64decode(module.kubernetes-cluster.cluster_ca_certificate)
}

resource "google_project_service" "service" {
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com"
  ])
  disable_on_destroy = false
  service            = each.key
}

module "kubernetes-cluster" {
  source                     = "../../modules/kubernetes/cluster"
  cluster_name               = "lego-kubernetes-cluster"
  project                    = var.google_project_id
  node_pool_name             = "lego-node-pool-name"
  google_vpc_network         = module.network.self_link
  google_subnetwork_vpc_name = module.subnetwork-1.self_link
}

module "nginx" {
  source   = "../../modules/kubernetes/deployment"
  image    = "${local.image_name}:${local.image_tag}"
  app_name = local.image_name
}

module "network" {
  source       = "../../modules/VPC/network"
  network_name = "network"
}

module "subnetwork-1" {
  source          = "../../modules/VPC/subnet"
  subnetwork_name = "subnetwork-1"
  network         = module.network.self_link
  ip_cidr_range   = "10.101.161.80/28" # 16 ip addresses
}

module "subnetwork-2" {
  source          = "../../modules/VPC/subnet"
  subnetwork_name = "subnetwork-2"
  network         = module.network.self_link
  ip_cidr_range   = "10.101.195.48/28" # 16 ip addresses
}