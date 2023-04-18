# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "~> 0.14.6"
  required_providers {
    # AWS Provider 
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0"  #this is our version constraint
    }
    # Random Provider
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
  profile = "default" # Defining it for default profile is Optional
}

#mana config ni future lo eadaina change cheyali antey manam latest version esthey present mana config previous version ki related ga vuntadi
#suddenga manam new version echestey aws provider lo config lo diff errors ochestai ela rakunda vundadaniki e depend lock file use chestam
