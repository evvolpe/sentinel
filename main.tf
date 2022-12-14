terraform {
  cloud {
    organization = "Winterfox"

    workspaces {
      name = "sentinel"
    }
  }
}

variable "gcp_credentials_key" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.43.0"
    }
  }
}

provider "google" {
  credentials = var.gcp_credentials_key  
}
provider "google-beta" {
  credentials = var.gcp_credentials_key   
}

module "network_example_multi_vpc" {
  source  = "terraform-google-modules/network/google//examples/multi_vpc"
  version = "5.2.0"
  network_01_name = "rede1"
  network_02_name = "rede2"
  project_id = "tf-sentinel-366917"
}
