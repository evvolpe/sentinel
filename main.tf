terraform {
  required_version = ">= 0.13.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0, >= 4.40"
      project = "tf-sentinel-366917"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 5.0, >= 3.45"
      project = "tf-sentinel-366917"
    }
  }

# [START vpc_custom_create]
module "test-vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 4.0.1"
  project_id   = "tf-sentinel-366917"
  network_name = "my-custom-network"
  mtu          = 1460

  subnets = [
    {
      subnet_name   = "subnet-001"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "subnet-002"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name               = "subnet-003"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = "us-west1"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_filter   = "false"
    }
  ]
}
# [END vpc_custom_create]
