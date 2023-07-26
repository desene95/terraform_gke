locals {
    env_config = yamldecode(file("${get_terragrunt_dir()}/../config_env_sampleapp.yaml"))
    network = yamldecode(file("${get_terragrunt_dir()}/../core-prod-networks.yaml"))
    
}

terraform {
    source = "/Users/damianesene/terraform_gke/modules/network"
}

inputs = {
    owner = local.env_config.global.owner
    billing_account = local.env_config.global.billing_account
    parent = local.env_config.global.host_project.parent
    network = local.network.internal.network.network_name
    region = local.env_config.global.region
    project = local.env_config.global.host_project.id
    #mtu = local.network.internal.network.mtu
}