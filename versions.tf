terraform {
  required_version = ">= 1.12.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.51.0"
    }
  }
}
