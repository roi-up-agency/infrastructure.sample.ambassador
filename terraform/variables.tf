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
  default = "n1-highcpu-2"
}

variable "number_nodes" {
  type = number
  default = 2
}

variable "cluster_name" {
  default = "ambassador"
}