# Basic Example

This example shows how to use the DigitalOcean Database Cluster module to create a basic PostgreSQL database cluster.

## Usage

1. Set your DigitalOcean API token:
   ```bash
   export DIGITALOCEAN_TOKEN="your-api-token-here"
   ```

2. Update the `kubernetes_cluster_id` in `main.tf` with your actual Kubernetes cluster ID.

3. Optionally, uncomment and update the `allowed_ip_addresses` with your IP addresses.

4. Run Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## What this creates

- A single-node PostgreSQL 17 database cluster
- A database named `example_app`
- A database user named `app_user`
- A connection pool with 10 connections
- Firewall rules for your Kubernetes cluster

## Clean up

```bash
terraform destroy
```
