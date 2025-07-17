# Terraform DigitalOcean Database Cluster Module

This Terraform module creates a DigitalOcean PostgreSQL database cluster with associated resources including:

- Database cluster
- Database
- Database user
- Connection pool
- Firewall rules (for Kubernetes clusters and IP addresses)

## Features

- ✅ PostgreSQL database cluster on DigitalOcean
- ✅ Configurable cluster size and node count
- ✅ Database and user creation
- ✅ Connection pool configuration
- ✅ Firewall rules for Kubernetes and IP-based access
- ✅ Comprehensive outputs for integration
- ✅ Configurable resource tagging

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.12.0 |
| digitalocean | >= 2.51.0 |

## Usage

### Basic Example

```hcl
module "database" {
  source = "github.com/yourusername/terraform-do-database-cluster"

  database_cluster_name        = "my-app-db"
  db_cluster_size             = "db-s-1vcpu-1gb"
  digitalocean_database_region = "nyc2"
  db_cluster_node_count       = 1
  database_name               = "myapp"
  backend_database_user_name  = "myapp_user"
  kubernetes_cluster_id       = "your-k8s-cluster-id"
  
  tags = ["production", "database"]
}
```

### Advanced Example

```hcl
module "database" {
  source = "github.com/yourusername/terraform-do-database-cluster"

  database_cluster_name        = "production-db-cluster"
  postgresql_version          = "17"
  db_cluster_size            = "db-s-2vcpu-4gb"
  digitalocean_database_region = "nyc2"
  db_cluster_node_count      = 3
  database_name              = "myapp_production"
  backend_database_user_name = "app_user"
  kubernetes_cluster_id      = module.k8s_cluster.cluster_id
  connection_pool_size       = 25
  
  allowed_ip_addresses = [
    "203.0.113.1",
    "203.0.113.2"
  ]
  
  tags = ["production", "database", "high-availability"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| database_cluster_name | The name of the database cluster | `string` | n/a | yes |
| postgresql_version | The PostgreSQL version | `string` | `"17"` | no |
| db_cluster_size | The size of the database cluster | `string` | n/a | yes |
| digitalocean_database_region | The DigitalOcean region where the database will be created | `string` | n/a | yes |
| db_cluster_node_count | The number of database nodes | `number` | n/a | yes |
| tags | Tags to apply to resources | `list(string)` | `[]` | no |
| database_name | The name of the database | `string` | n/a | yes |
| backend_database_user_name | The name of the database user | `string` | n/a | yes |
| kubernetes_cluster_id | The ID of the Kubernetes cluster for firewall rules | `string` | n/a | yes |
| allowed_ip_addresses | List of IP addresses allowed to access the database | `list(string)` | `[]` | no |
| connection_pool_size | Size of the database connection pool | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_id | The ID of the database cluster |
| cluster_name | The name of the database cluster |
| cluster_host | The host of the database cluster |
| cluster_port | The port of the database cluster |
| cluster_private_host | The private host of the database cluster |
| cluster_uri | The URI of the database cluster (sensitive) |
| cluster_private_uri | The private URI of the database cluster (sensitive) |
| database_name | The name of the database |
| user_name | The name of the database user |
| connection_pool_name | The name of the connection pool |
| connection_pool_host | The host for the connection pool |
| connection_pool_port | The port for the connection pool |
| connection_pool_uri | The URI for the connection pool (sensitive) |
| connection_pool_private_host | The private host for the connection pool |
| connection_pool_private_uri | The private URI for the connection pool (sensitive) |

## Examples

See the [examples](./examples/) directory for complete usage examples:

- [Basic](./examples/basic/) - Simple single-node setup
- [High Availability](./examples/high-availability/) - Production-ready 3-node cluster

## Database Sizes

Common DigitalOcean database cluster sizes:

| Size | vCPUs | RAM | Storage | Price Range |
|------|-------|-----|---------|-------------|
| `db-s-1vcpu-1gb` | 1 | 1 GB | 10 GB | $ |
| `db-s-1vcpu-2gb` | 1 | 2 GB | 25 GB | $ |
| `db-s-2vcpu-4gb` | 2 | 4 GB | 38 GB | $$ |
| `db-s-4vcpu-8gb` | 4 | 8 GB | 115 GB | $$$ |
| `db-s-6vcpu-16gb` | 6 | 16 GB | 270 GB | $$$$ |

## Security Considerations

- **Firewall Rules**: This module creates firewall rules for Kubernetes clusters and specific IP addresses
- **Network Access**: Use private networking when possible
- **Credentials**: Database passwords are managed by DigitalOcean and accessible via the cluster URI
- **Connection Pooling**: Use connection pools to optimize database connections

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This module is released under the MIT License. See [LICENSE](LICENSE) for details.
