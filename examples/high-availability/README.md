# High Availability Example

This example shows how to use the DigitalOcean Database Cluster module to create a production-ready, high-availability PostgreSQL database cluster.

## Features

- **High Availability**: 3-node cluster for redundancy and failover
- **Performance**: 2 vCPU, 4GB RAM instances
- **Security**: Firewall rules for Kubernetes and specific IP addresses
- **Connection Pooling**: 25 connections for production workloads

## Usage

1. Set your DigitalOcean API token:
   ```bash
   export DIGITALOCEAN_TOKEN="your-api-token-here"
   ```

2. Update the `kubernetes_cluster_id` in `main.tf` with your actual Kubernetes cluster ID.

3. Update the `allowed_ip_addresses` with your production IP addresses:
   - Office/VPN IP addresses
   - CI/CD server IPs
   - Monitoring server IPs
   - Bastion host IPs

4. Run Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## What this creates

- A 3-node PostgreSQL 17 database cluster (high availability)
- Each node: 2 vCPU, 4GB RAM
- A database named `production_app`
- A database user named `app_user`
- A connection pool with 25 connections
- Firewall rules for your Kubernetes cluster and allowed IPs

## Production Considerations

- **Backups**: DigitalOcean automatically creates daily backups
- **Monitoring**: Consider setting up alerts for CPU, memory, and disk usage
- **Scaling**: You can upgrade the cluster size as needed
- **Security**: Regularly rotate database passwords
- **Network**: Use private networking when possible

## Clean up

```bash
terraform destroy
```

**Note**: Be very careful with destroy in production environments!
