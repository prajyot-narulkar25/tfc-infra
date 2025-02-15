terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.50"  # Ensure latest provider version
    }
  }
}

provider "tfe" {
  token = var.TFC_TOKEN  # Uses API token for authentication
}

variable "TFC_TOKEN" {
  description = "Terraform Cloud API Token"
  type        = string
  sensitive   = true
}

variable "org_name" {
  default     = "org-tfc"  # Change this to your Terraform Cloud organization name
  description = "Terraform Cloud Organization Name"
}

resource "tfe_workspace" "example" {
  name         = "buckets-s3-bucket"
  organization = var.org_name
#   execution_mode = "remote"  # Options: remote, local, agent
}

output "workspace_id" {
  value = tfe_workspace.example.id
}
