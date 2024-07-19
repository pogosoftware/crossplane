locals {
  vpc_uuid = data.terraform_remote_state.network.outputs.vpc_uuid
}