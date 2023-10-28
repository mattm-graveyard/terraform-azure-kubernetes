variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "rglocation" {
  description = "Location of Resource Group"
  type = string
}

variable "vnet_name" {
  description = "Name of Virtual Network"
  type = string
}

variable "subnet_name" {
  description = "Name of Subnet"
  type = string
}

variable "kube_cluster_name" {
  description = "Name of Kubernetes Cluster"
  type = string
}

variable "dns_prefix" {
  description = "Prefix of DNS"
  type = string
}

variable "default_npool_name" {
  description = "Name of the Default Node Pool"
  type = string
}

variable "secondary_npool_name" {
  description = "Name of the Secondary Node Pool"
  type = string
}

variable "workspace_log_name" {
  description = "Name of the Log Analytic Workspace"
  type = string
}