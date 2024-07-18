locals {
  vpc_name = format("%s-%s-%s", var.name_preffix, lower(var.project), var.environment)
}
