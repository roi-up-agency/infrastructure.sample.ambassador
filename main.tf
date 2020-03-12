provider "google" {
  version = "3.5.0"

  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_address" "ambassador_static_ip" {
  name = "ambassador-test-static-ip"
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  network = var.newtork
  subnetwork = var.subnewtork
  ip_allocation_policy {
    # usar directamente el nombre de subredes ya creadas
    cluster_secondary_range_name = var.pods_subnewtork
    services_secondary_range_name = var.services_subnewtork
//    cluster_ipv4_cidr_block = "10.4.0.0/14"
//    services_ipv4_cidr_block = "10.0.32.0/20"
  }

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
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

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.cluster_name
  # it will only create 2 nodes in the zone: europe-west4-a
  # if I use region, it will create 2 nodes for each zone available in the region
  location = var.zone

  cluster    = google_container_cluster.primary.name
  node_count = var.number_nodes

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
