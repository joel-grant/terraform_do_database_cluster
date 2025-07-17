terraform {
  required_version = ">= 1.12.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.51.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  # token is set via DIGITALOCEAN_TOKEN environment variable
}

module "database" {
  source = "../../"

  database_cluster_name        = "example-db-cluster"
  postgresql_version          = "17"
  db_cluster_size            = "db-s-1vcpu-1gb"
  digitalocean_database_region = "nyc2"
  db_cluster_node_count      = 1
  
  database_name              = "example_app"
  backend_database_user_name = "app_user"
  
  # Replace with your actual Kubernetes cluster ID
  kubernetes_cluster_id = "your-k8s-cluster-id-here"
  
  # Optional: Add allowed IP addresses
  allowed_ip_addresses = [
    # "203.0.113.1",  # Replace with your actual IP
  ]
  
  connection_pool_size = 10
  
  tags = ["example", "terraform", "database"]
}
