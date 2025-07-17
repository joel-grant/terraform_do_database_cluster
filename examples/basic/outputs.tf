output "database_cluster_id" {
  description = "The ID of the created database cluster"
  value       = module.database.cluster_id
}

output "database_cluster_host" {
  description = "The host of the database cluster"
  value       = module.database.cluster_host
}

output "database_cluster_port" {
  description = "The port of the database cluster"
  value       = module.database.cluster_port
}

output "database_name" {
  description = "The name of the created database"
  value       = module.database.database_name
}

output "database_user" {
  description = "The name of the created database user"
  value       = module.database.user_name
}

output "connection_pool_name" {
  description = "The name of the connection pool"
  value       = module.database.connection_pool_name
}
