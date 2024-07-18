####################################################################################################
### TFC
####################################################################################################
variable "project" {
  default     = "Crossplane"
  description = "The name of HCP project"
  type        = string
}

variable "vcs_repo" {
  default = {
    identifier = "pogosoftware/crossplane"
    branch     = "develop"
  }
  description = "The repository where modules are"
  type = object({
    identifier = string
    branch     = string
  })
}

variable "allow_destroy_plan" {
  default     = true
  description = "Determinate to allow query plan or not"
  type        = bool
}

variable "auto_apply" {
  default     = false
  description = "Determinate to auto apply changes or not"
  type        = bool
}

variable "terraform_reqiured_version" {
  default     = "~>1.9.0"
  description = "The version of terraform required to run tasks. Defaults to `~>1.9.0`"
  type        = string
}