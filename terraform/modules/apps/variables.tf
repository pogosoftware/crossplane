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