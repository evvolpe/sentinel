terraform {
  cloud {
    organization = "Winterfox"

    workspaces {
      name = "sentinel"
    }
  }
}
