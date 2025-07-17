variable "database_cluster_name" {
  description = "The name of the database cluster"
  type        = string

  validation {
    condition     = length(var.database_cluster_name) >= 3 && length(var.database_cluster_name) <= 63
    error_message = "Database cluster name must be between 3 and 63 characters long."
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.database_cluster_name))
    error_message = "Database cluster name can only contain lowercase letters, numbers, and hyphens."
  }
}

variable "postgresql_version" {
  description = "The PostgreSQL version"
  type        = string
  default     = "17"

  validation {
    condition     = contains(["13", "14", "15", "16", "17"], var.postgresql_version)
    error_message = "PostgreSQL version must be one of: 13, 14, 15, 16, 17."
  }
}

variable "db_cluster_size" {
  description = "The size of the database cluster (e.g., db-s-1vcpu-1gb, db-s-2vcpu-4gb)"
  type        = string

  validation {
    condition = can(regex("^db-s-[0-9]+vcpu-[0-9]+gb$", var.db_cluster_size))
    error_message = "Database cluster size must follow the format 'db-s-XvcpuY-Zgb' (e.g., 'db-s-1vcpu-1gb')."
  }
}

variable "digitalocean_database_region" {
  description = "The DigitalOcean region where the database will be created"
  type        = string

  validation {
    condition = contains([
      "nyc1", "nyc2", "nyc3", "ams2", "ams3", "sfo1", "sfo2", "sfo3", 
      "sgp1", "lon1", "fra1", "tor1", "blr1", "syd1"
    ], var.digitalocean_database_region)
    error_message = "Region must be a valid DigitalOcean region that supports databases."
  }
}

variable "db_cluster_node_count" {
  description = "The number of database nodes (1-3 for single node or HA setup)"
  type        = number

  validation {
    condition     = var.db_cluster_node_count >= 1 && var.db_cluster_node_count <= 3
    error_message = "Database cluster node count must be between 1 and 3."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = list(string)
  default     = []
}

variable "database_name" {
  description = "The name of the database to create"
  type        = string

  validation {
    condition     = length(var.database_name) >= 1 && length(var.database_name) <= 63
    error_message = "Database name must be between 1 and 63 characters long."
  }

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9_]*$", var.database_name))
    error_message = "Database name must start with a letter and can only contain letters, numbers, and underscores."
  }
}

variable "backend_database_user_name" {
  description = "The name of the database user to create"
  type        = string

  validation {
    condition     = length(var.backend_database_user_name) >= 1 && length(var.backend_database_user_name) <= 63
    error_message = "Database user name must be between 1 and 63 characters long."
  }

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9_]*$", var.backend_database_user_name))
    error_message = "Database user name must start with a letter and can only contain letters, numbers, and underscores."
  }
}

variable "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes cluster for firewall rules"
  type        = string
}

variable "allowed_ip_addresses" {
  description = "List of IP addresses allowed to access the database"
  type        = list(string)
  default     = []
}

variable "connection_pool_size" {
  description = "Size of the database connection pool (number of connections)"
  type        = number
  default     = 5

  validation {
    condition     = var.connection_pool_size >= 1 && var.connection_pool_size <= 100
    error_message = "Connection pool size must be between 1 and 100."
  }
}
