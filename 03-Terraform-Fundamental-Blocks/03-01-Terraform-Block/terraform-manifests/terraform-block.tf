# Terraform Block
terraform {
  required_version = "= 1.2" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source = "hashicorp/random"
      version = "= 3.0.1"
    }    
  }
}

/*
Play with Terraform Version - operators
required_version = "~> 1.2" 
  ela tild operator tho echinappudu upto 1.2 latest version varuku antey 1.2.9 version varuku
  allow chestadi 1.1.0 or 1.3.0 ala eadaina allow cheydu
required_version = "= 0.14.4"  
  equal-to antey only local pc lo install aiena version matrame tiskuntadi
required_version = ">= 0.13"  
  greatertan-equal to antey echina value kantey ekkuva or equal a local version vuntey 
  allow chestadi lekapotey ledhu
required_version = "= 0.13" same e version vunteyene tiskuntadi 0.13.4 aiiena tiskodu 


Play with Provider Version
      version = "~> 3.0"            
      version = ">= 3.0.0, < 3.1.0" e 2 versions madyalo vunna ea versions aiena allow chestadi
      version = ">= 3.0.0, <= 3.1.0" e 2 versions madyalo vunna ea versions aiena allow chestadi
      version = "~> 2.0"
      version = "~> 3.0"            
*/

