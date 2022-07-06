# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-079b5e5b3971bd10d" # Amazon Linux
  instance_type     = "t2.micro"
  key_name          = "vamsimumbai"
  #availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"
  tags = {
    "Name" = "uncommentnow"
  }

  lifecycle {
    create_before_destroy = true
  }

}
