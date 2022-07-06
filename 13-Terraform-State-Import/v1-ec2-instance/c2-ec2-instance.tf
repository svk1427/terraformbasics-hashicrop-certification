# Create EC2 Instnace Resource
resource "aws_instance" "myec2vm" {
  
  ami = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  #instance_type = "t2.small" # Enabling it as part of Step-06
  availability_zone = "ap-south-1"
  key_name = "vamsimumbai"
  tags = {
    "Name" = "State-Import-Demo"
  }  
}
