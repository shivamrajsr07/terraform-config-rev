# Terraform GCP Configuration

This repository contains the root Terraform configuration
that consumes reusable modules from terraform-mod-rev.

## Infrastructure

- Custom VPC
- Subnet
- Firewall rules
- IAM service account
- Compute Engine VM
- Google Cloud Storage bucket

## Repositories

Module Repository:
https://github.com/shivamrajsr07/terraform-mod-rev

Configuration Repository:
https://github.com/shivamrajsr07/terraform-config-rev

## Prerequisites

- Terraform
- Google Cloud SDK
- GCP project
- Appropriate IAM permissions

## Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply