# Terraform AWS Demo

Infrastructure as Code pipeline using Terraform and GitHub Actions to automatically provision AWS infrastructure.

## Architecture
## Infrastructure Provisioned

- **VPC** — 10.0.0.0/16 with DNS enabled
- **Public Subnet** — 10.0.1.0/24
- **Private Subnet** — 10.0.2.0/24
- **Internet Gateway** — public internet access
- **Route Table** — public subnet routing
- **Security Group** — SSH (22) and HTTP (80) inbound
- **EC2 Instance** — Amazon Linux 2023, Apache web server
- **S3 Bucket** — demo storage
- **Remote State** — stored in S3 for shared state between local and pipeline

## Pipeline Stages

| Stage | Description |
|---|---|
| Validate | Checks Terraform syntax |
| Plan | Previews infrastructure changes |
| Apply | Creates/updates infrastructure (main branch only) |

## Prerequisites

GitHub Secrets required:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

## Usage

```bash
# Initialize
terraform init

# Preview changes
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy
```

## Key Concepts Demonstrated

- Infrastructure as Code with Terraform
- Remote state management in S3
- Automated pipeline with GitHub Actions
- Variables for reusable configuration
- Resource tagging best practices
- EC2 user_data for automated server configuration

## Author

Sang Nguyen — [github.com/realsangnguyen](https://github.com/realsangnguyen)
