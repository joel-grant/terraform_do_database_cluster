# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-07-17

### Added

- Initial release of the Terraform DigitalOcean Database Cluster module
- Support for creating PostgreSQL database clusters on DigitalOcean
- Database and user creation within the cluster
- Connection pool configuration
- Firewall rules for Kubernetes clusters and IP addresses
- Comprehensive variable validation
- Multiple examples (basic and high-availability)
- Complete documentation and README

### Features

- PostgreSQL versions 13, 14, 15, 16, and 17 support
- Configurable cluster sizes and node counts (1-3 nodes)
- Resource tagging support
- Sensitive output handling for URIs and connection strings
- Input validation for all variables
- Support for both public and private networking

### Examples

- Basic single-node setup example
- High-availability 3-node cluster example

### Documentation

- Comprehensive README with usage examples
- Variable validation and descriptions
- Output documentation
- Contributing guidelines
- MIT License
