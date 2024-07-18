output "vpc_uuid" {
  description = "The ID of VPC"
  value = digitalocean_vpc.this.id
}
