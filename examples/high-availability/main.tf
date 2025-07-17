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

module "production_database" {
  source = "../../"

  database_cluster_name        = "production-app-db"
  postgresql_version          = "17"
  db_cluster_size            = "db-s-2vcpu-4gb"
  digitalocean_database_region = "nyc2"
  db_cluster_node_count      = 3  # High availability setup
  
  database_name              = "production_app"
  backend_database_user_name = "app_user"
  
  # Replace with your actual Kubernetes cluster ID
  kubernetes_cluster_id = "your-k8s-cluster-id-here"
  
  # Production IP allowlist
  allowed_ip_addresses = [
    # "203.0.113.1",    # Office IP
    # "203.0.113.10",   # CI/CD server
    # "198.51.100.5",   # Monitoring server
  ]
  
  connection_pool_size = 25  # Higher connection pool for production
  
  tags = ["production", "high-availability", "terraform"]
}
