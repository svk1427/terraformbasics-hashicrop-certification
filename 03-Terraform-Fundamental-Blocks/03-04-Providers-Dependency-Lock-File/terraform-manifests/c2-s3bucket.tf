# Resource Block: Create Random Pet Name 
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id
  acl    = "public-read"
  region = "us-east-1"  # Comment this if we are going to use AWS Provider v3.x version
}

#this dependancy lock file primarly using for provider version locking
# e DL endukantey version constraints vundadam valla, mana config ki ea version correct ani edhi deceide chesthundi
#once edhi create ayyaka manam ah code repo lo peditey future lo appudu use chesina same version vuntundi
#it curently works for provider dependnecies not for module
#when you setup a version then it will download a specofic version constraint and check the errors in future with checksums
#e lock file lekapotey manam oka verison ni default ga provide chestey adhi latest version thiseskuntadi ala kakunda -
#manam lock file tho chestey specific version create avutadi mana confug ki thaggattuga
