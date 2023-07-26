locals {
    env_config = yamldecode(file("${get_terragrunt_dir()}/../config_env_sampleapp.yaml"))
    app_engine = yamldecode(file("${get_terragrunt_dir()}/../core-prod-networks.yaml"))
    
}

terraform {
    source = "/Users/damianesene/terraform_gke/modules/app_engine"
}

inputs = {
    owner = local.env_config.global.owner
    billing_account = local.env_config.global.billing_account
    #parent = local.env_config.global.service_project.app_engine.project_name
    app_engine = local.app_engine.internal.app_engine.name
    region = local.env_config.global.service_project.app_engine.region
    project = local.env_config.global.service_project.app_engine.project_name
    #mtu = local.network.internal.network.mtu
}