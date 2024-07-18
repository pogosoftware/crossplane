resource "digitalocean_vpc" "this" {
  name     = local.vpc_name
  region   = var.region
  ip_range = var.vpc_ip_range
}
