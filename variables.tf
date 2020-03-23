##
## Change these values to fit your needs.
##
variable "credentials_file" {
  default = "key.json"
}

variable "project" {
  type = string
  default = "daas-security-270814"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "number_nodes" {
  type = number
  default = 2
}

variable "cloudShellIP" {
  default = "188.26.196.145/32"
}

variable "cluster_name" {
  default = "ambassador-test"
}

variable "masterIpv4Cidr" {
  default = "172.31.156.16/28"
}

variable "nodeTags" {
  default = ["cluster-ambassador-test"]
}

variable "network" {
  default = "projects/daas-vpc-master/global/networks/daas-suite-test-network"
}

variable "subnewtork" {
  default = "projects/daas-vpc-master/regions/europe-west1/subnetworks/main-subnet-nodes-test-ambassador-eu-west-1"
}

variable "pods_subnewtork" {
  default = "secundary-subnet-pods-test-ambassador-eu-west-1"
}

variable "services_subnewtork" {
  default = "secundary-subnet-services-test-ambassador-eu-west-1"
}
