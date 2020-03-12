##
## Change these values to fit your needs.
##
variable "credentials_file" {
  default = "key.json"
}

variable "project" {
  type = string
  default = "daas-security"
}

variable "region" {
  default = "europe-west4"
}

variable "zone" {
  default = "europe-west4-a"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "number_nodes" {
  type = number
  default = 2
}

variable "cluster_name" {
  default = "ambassador-test"
}

variable "newtork" {
  default = "projects/daas-vpc-master/global/networks/daas-suite-test-network"
}

variable "subnewtork" {
  default = "projects/daas-vpc-master/regions/europe-west1/subnetworks/main-subnet-nodes-test-daas-security-eu-west-1"
}

variable "pods_subnewtork" {
  default = "secundary-subnet-pods-test-daas-security-eu-west-1"
}

variable "services_subnewtork" {
  default = "secundary-subnet-services-test-daas-security-eu-west-1"
}
