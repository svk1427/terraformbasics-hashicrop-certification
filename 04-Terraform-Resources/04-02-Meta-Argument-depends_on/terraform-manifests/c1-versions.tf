# Terraform Block
terraform {
  required_version = "1.2.5" # which means >= 0.14.6 and < 0.15
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "4.16.0"
#     }
#   }
# }

# # provider "aws" {
# #   region = "us-east-1"
# #   profile = "default"
# # }