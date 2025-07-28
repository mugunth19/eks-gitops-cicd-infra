# GitOps CI/CD on AWS EKS with Terraform, Helm, and ArgoCD

## Overview
This project demonstrates how to deploy a containerized Python application to AWS EKS using a GitOps workflow powered by ArgoCD. The infrastructure is provisioned using Terraform and application deployments are handled by Helm charts.

## Stack
- AWS (EKS, IAM, VPC, S3)
- Terraform
- ArgoCD
- Helm
- Kubernetes
- GitHub Actions
- Python (demo app)

## Architecture
1. Infrastructure is provisioned using Terraform modules:
   - VPC
   - IAM roles
   - EKS cluster
2. ArgoCD is installed in the cluster using Helm
3. ArgoCD watches the GitHub repo for app deployment configs
4. A Python app is deployed using a custom Helm chart
5. CI workflow in GitHub Actions lints code and tests Docker image build

## Setup Instructions
### 1. Provision EKS
```bash
cd terraform
terraform init && terraform apply
