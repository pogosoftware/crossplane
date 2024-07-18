####################################################################################################
### COMMON
####################################################################################################
variable "region" {
  description = "The name of the region"
  type        = string
}

variable "name_preffix" {
  description = "The preffix of the name"
  type = string
}

variable "environment" {
  description = "The name of the environment"
  type = string
}

variable "project" {
  description = "The name of the project"
  type = string
}

####################################################################################################
### VPC
####################################################################################################
variable "vpc_ip_range" {
  default     = "10.10.10.0/24"
  description = "The VPC CIDR block"
  type        = string
}
