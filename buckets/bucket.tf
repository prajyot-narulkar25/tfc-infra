terraform {
  cloud {
    organization = "org-tfc"  # Change to your Terraform Cloud organization

    workspaces {
      name = "buckets-s3-bucket"  # Change to your Terraform Cloud workspace name
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Change as needed
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-demo-bucket-name-54321"  # Must be globally unique
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
