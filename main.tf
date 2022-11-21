terraform {
  cloud {
    organization = "Winterfox"

    workspaces {
      name = "sentinel"
    }
  }
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
  project_id = "tf-sentinel-366917"
  credentials = ${{ secrets.GCP_CREDENTIALS }}
}
provider "google-beta" {
  project_id = "tf-sentinel-366917"
  credentials = ${{ secrets.GCP_CREDENTIALS }}
}

module "network_example_multi_vpc" {
  source  = "terraform-google-modules/network/google//examples/multi_vpc"
  version = "5.2.0"
  network_01_name = "rede1"
  network_02_name = "rede2"
}
