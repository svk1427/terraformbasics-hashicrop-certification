resource "aws_instance" "myec2vm" {
  
  ami = "ami-0889a44b331db0194"
  instance_type = "t2.micro"
  #instance_type = "t2.small" # Enabling it as part of Step-06
  availability_zone = "us-east-1a"
  key_name = "newkey"
  tags = {
    "Name" = "tf-managing-or-not"
  }  
}
