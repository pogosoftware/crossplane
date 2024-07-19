####################################################################################################
### COMMON
####################################################################################################
variable "region" {
  description = "The name of the region"
  type        = string
}

variable "name_preffix" {
  description = "The preffix of the name"
  type        = string
}

variable "environment" {
  description = "The name of the environment"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
}

####################################################################################################
### REMOTE STATE
####################################################################################################
variable "bootstrap_workspace" {
  description = "The name of bootstrap workspace"
  type        = string
}

####################################################################################################
### KUBERNETES
####################################################################################################
variable "k8s_cluster_name" {
  default     = "crossplane"
  description = "The name of kubernetes cluster"
  type        = string
}

variable "k8s_version" {
  default     = "1.30.2-do.0"
  description = "The version of kubernetes cluster"
  type        = string
}

variable "k8s_auto_upgrade" {
  default     = false
  description = "Determinate to auto update kubernetes cluster or not"
  type        = bool
}

variable "k8s_node_pool_size" {
  default     = "s-2vcpu-2gb"
  description = "The sieze of VM nodes inside a Kubernetes cluster"
  type        = string
}

variable "k8s_node_pool_count" {
  default     = 3
  description = "The number of Kubernetes nodes"
  type        = number
}